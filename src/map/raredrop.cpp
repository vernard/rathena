
// Rare Drop Tracking Module
// Custom module for enhanced rare drop announcements

#include "raredrop.hpp"

#include "../common/nullpo.hpp"
#include "../common/showmsg.hpp"
#include "../common/sql.hpp"

#include "intif.hpp"
#include "itemdb.hpp"
#include "map.hpp"
#include "mob.hpp"
#include "pc.hpp"

// Boss/MVP card lookup set
std::unordered_set<t_itemid> boss_card_ids;


/**
 * Increment the kill count for a character killing a specific mob
 */
void raredrop_record_kill(map_session_data* sd, int32 mob_id) {
	nullpo_retv(sd);

	if (SQL_ERROR == Sql_Query(mmysql_handle,
		"INSERT INTO `char_mob_kills` (`char_id`, `mob_id`, `kill_count`) "
		"VALUES ('%u', '%d', 1) "
		"ON DUPLICATE KEY UPDATE `kill_count` = `kill_count` + 1, `last_kill` = NOW()",
		sd->status.char_id, mob_id))
	{
		Sql_ShowDebug(mmysql_handle);
	}
}

/**
 * Get the kill count for a character against a specific mob
 */
uint32 raredrop_get_kill_count(uint32 char_id, int32 mob_id) {
	uint32 count = 0;
	char* data;

	if (SQL_ERROR == Sql_Query(mmysql_handle,
		"SELECT `kill_count` FROM `char_mob_kills` WHERE `char_id` = '%u' AND `mob_id` = '%d'",
		char_id, mob_id))
	{
		Sql_ShowDebug(mmysql_handle);
		return 0;
	}

	if (SQL_SUCCESS == Sql_NextRow(mmysql_handle)) {
		Sql_GetData(mmysql_handle, 0, &data, nullptr);
		count = (uint32)strtoul(data, nullptr, 10);
	}

	Sql_FreeResult(mmysql_handle);
	return count;
}

/**
 * Log a rare drop to the unified rare_drop_log table
 * @param kill_count Mob kill count at time of drop (0 for item boxes, will be stored as NULL)
 */
static void raredrop_log_drop(map_session_data* sd, t_itemid item_id, e_raredrop_source source_type, uint32 source_id, int32 drop_rate, uint32 kill_count) {
	const char* map_name = mapindex_id2name(sd->mapindex);

	if (SQL_ERROR == Sql_Query(mmysql_handle,
		"INSERT INTO `rare_drop_log` (`char_id`, `item_id`, `source_type`, `source_id`, `drop_rate`, `kill_count`, `map_name`) "
		"VALUES ('%u', '%u', '%d', '%u', '%d', NULLIF('%u', 0), '%s')",
		sd->status.char_id, item_id, (int)source_type, source_id, drop_rate, kill_count, map_name))
	{
		Sql_ShowDebug(mmysql_handle);
	}
}

/**
 * Get the drop count for a character's item from the unified log table
 */
static uint32 raredrop_get_drop_count(uint32 char_id, t_itemid item_id) {
	uint32 count = 0;
	char* data;

	if (SQL_ERROR == Sql_Query(mmysql_handle,
		"SELECT COUNT(*) FROM `rare_drop_log` WHERE `char_id` = '%u' AND `item_id` = '%u'",
		char_id, item_id))
	{
		Sql_ShowDebug(mmysql_handle);
		return 1;
	}

	if (SQL_SUCCESS == Sql_NextRow(mmysql_handle)) {
		Sql_GetData(mmysql_handle, 0, &data, nullptr);
		count = (uint32)strtoul(data, nullptr, 10);
	}

	Sql_FreeResult(mmysql_handle);
	return count > 0 ? count : 1;
}

/**
 * Get ordinal suffix for a number
 */
const char* raredrop_ordinal_suffix(uint32 n) {
	// Special cases for 11, 12, 13
	if (n % 100 >= 11 && n % 100 <= 13) {
		return "th";
	}

	switch (n % 10) {
		case 1: return "st";
		case 2: return "nd";
		case 3: return "rd";
		default: return "th";
	}
}

/**
 * Format a number with comma separators
 */
static void raredrop_format_number(uint32 n, char* buf, size_t buf_size) {
	if (n >= 1000000) {
		snprintf(buf, buf_size, "%u,%03u,%03u",
			n / 1000000,
			(n / 1000) % 1000,
			n % 1000);
	} else if (n >= 1000) {
		snprintf(buf, buf_size, "%u,%03u",
			n / 1000,
			n % 1000);
	} else {
		snprintf(buf, buf_size, "%u", n);
	}
}

/**
 * Record a rare drop and announce it
 * @param drop_rate The effective/modified drop rate (for logging and display, e.g. with Bubblegum)
 * @param base_rate The base drop rate without modifiers (for threshold comparison)
 * @param announce_threshold The threshold below which drops are considered "rare"
 */
void raredrop_record_and_announce(map_session_data* sd, t_itemid item_id,
                                   const char* item_name, e_raredrop_source source_type,
                                   uint32 source_id, const char* source_name,
                                   int32 drop_rate, int32 base_rate, int32 announce_threshold)
{
	nullpo_retv(sd);

	// Skip if base rate is above announce threshold
	// Use base_rate so items with intrinsic rarity are still tracked even with Bubblegum
	if (base_rate > announce_threshold) {
		return;
	}

	// Get kill count first (only relevant for mob sources)
	// Record the kill so the count includes this kill for the announcement
	uint32 kill_count = 0;
	if (source_type == RAREDROP_SOURCE_MOB) {
		raredrop_record_kill(sd, source_id);
		kill_count = raredrop_get_kill_count(sd->status.char_id, source_id);
	}

	// Log the drop to the unified table (includes kill_count snapshot)
	raredrop_log_drop(sd, item_id, source_type, source_id, drop_rate, kill_count);

	// Get drop count from log table for the "Nth drop" message
	uint32 drop_count = raredrop_get_drop_count(sd->status.char_id, item_id);

	// Queue for Discord webhook notification
	// The PHP worker will poll this table and send rich embeds to Discord
	{
		const char* map_name = mapindex_id2name(sd->mapindex);
		char escaped_player[NAME_LENGTH * 2 + 1];
		char escaped_item[ITEM_NAME_LENGTH * 2 + 1];
		char escaped_source[NAME_LENGTH * 2 + 1];
		char escaped_map[MAP_NAME_LENGTH_EXT * 2 + 1];

		Sql_EscapeString(mmysql_handle, escaped_player, sd->status.name);
		Sql_EscapeString(mmysql_handle, escaped_item, item_name);
		Sql_EscapeString(mmysql_handle, escaped_source, source_name);
		Sql_EscapeString(mmysql_handle, escaped_map, map_name ? map_name : "unknown");

		if (SQL_ERROR == Sql_Query(mmysql_handle,
			"INSERT INTO `discord_webhook_queue` (`webhook_type`, `payload`) VALUES ('rare_drop', "
			"JSON_OBJECT("
			"'player_name', '%s', "
			"'item_name', '%s', "
			"'item_id', %u, "
			"'source_name', '%s', "
			"'source_type', %d, "
			"'source_id', %u, "
			"'drop_rate', %d, "
			"'kill_count', %u, "
			"'drop_count', %u, "
			"'map_name', '%s'"
			"))",
			escaped_player, escaped_item, item_id,
			escaped_source, (int)source_type, source_id,
			drop_rate, kill_count, drop_count, escaped_map))
		{
			Sql_ShowDebug(mmysql_handle);
		}
	}

	// Prepare the announcement message
	char message[256];
	char count_str[32];

	if (source_type == RAREDROP_SOURCE_MOB) {
		// Monster drop format:
		// "Player got their 3rd Item Name (0.01%) after hunting Monster Name 1,234 times."
		raredrop_format_number(kill_count, count_str, sizeof(count_str));
		snprintf(message, sizeof(message),
			"%s got their %u%s %s (%0.02f%%) after hunting %s %s times.",
			sd->status.name,
			drop_count,
			raredrop_ordinal_suffix(drop_count),
			item_name,
			(float)drop_rate / 100.0f,
			source_name,
			count_str);
	} else {
		// Item box format:
		// "Player got their 3rd Item Name (0.01%) from Old Blue Box."
		snprintf(message, sizeof(message),
			"%s got their %u%s %s (%0.02f%%) from %s.",
			sd->status.name,
			drop_count,
			raredrop_ordinal_suffix(drop_count),
			item_name,
			(float)drop_rate / 100.0f,
			source_name);
	}

	intif_broadcast(message, (int)strlen(message) + 1, BC_DEFAULT);
}

/**
 * Initialize boss card lookup table
 * Scans all mobs and collects card drops from boss/MVP monsters
 * Should be called after mob_db is loaded
 */
void raredrop_init_boss_cards() {
	boss_card_ids.clear();

	ShowStatus("Rare drop tracking: Loading boss/MVP cards...\n");

	for (const auto& pair : mob_db) {
		std::shared_ptr<s_mob_db> mob = pair.second;
		if (mob == nullptr)
			continue;

		// Skip non-boss monsters
		if (mob->get_bosstype() == BOSSTYPE_NONE)
			continue;

		// Skip event/quest boss variants of regular monsters (1968-1972)
		// These are: Strouf, Marc, Obeaune, Vadon, Marina boss variants
		if (mob->id >= 1968 && mob->id <= 1972)
			continue;

		const char* boss_type_str = (mob->get_bosstype() == BOSSTYPE_MVP) ? "MVP" : "Miniboss";

		// Check all drops for cards
		for (int i = 0; i < MAX_MOB_DROP_TOTAL; i++) {
			if (mob->dropitem[i].nameid == 0)
				continue;

			std::shared_ptr<item_data> item = item_db.find(mob->dropitem[i].nameid);
			if (item != nullptr && item->type == IT_CARD) {
				// Log each card being added
				ShowStatus("  [%s] %s (ID:%u) from %s (ID:%d)\n",
					boss_type_str,
					item->ename.c_str(),
					mob->dropitem[i].nameid,
					mob->jname.c_str(),
					mob->id);
				boss_card_ids.insert(mob->dropitem[i].nameid);
			}
		}
	}

	ShowStatus("Rare drop tracking: Loaded %zu boss/MVP cards.\n", boss_card_ids.size());
}

/**
 * Check if an item is a boss/MVP card
 * @param item_id Item ID to check
 * @return true if the item is a card dropped by a boss/MVP monster
 */
bool raredrop_is_boss_card(t_itemid item_id) {
	return boss_card_ids.find(item_id) != boss_card_ids.end();
}