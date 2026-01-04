// Monster of the Day (MOTD) System
// Provides drop rate bonuses for featured monsters

#include "motd.hpp"

#include <stdlib.h>

#include "../common/showmsg.hpp"
#include "../common/sql.hpp"
#include "../common/timer.hpp"

#include "map.hpp"  // For mmysql_handle

// Cache settings - refresh every 60 seconds to avoid DB spam
#define MOTD_CACHE_DURATION 60000

// Cached MOTD data
static int32 motd_cached_mob_id = 0;
static t_tick motd_cache_time = 0;
static bool motd_cache_initialized = false;

/**
 * Query the database for the current MOTD monster
 * @return Monster ID of current MOTD, or 0 if none/disabled
 */
static int32 motd_query_current_monster(void) {
	int32 mob_id = 0;
	char* data;

	// First check if MOTD is enabled
	if (SQL_ERROR == Sql_Query(mmysql_handle,
		"SELECT `config_value` FROM `event_config` WHERE `config_key` = 'motd_enabled'"))
	{
		Sql_ShowDebug(mmysql_handle);
		return 0;
	}

	if (SQL_SUCCESS == Sql_NextRow(mmysql_handle)) {
		Sql_GetData(mmysql_handle, 0, &data, nullptr);
		if (data && atoi(data) == 0) {
			Sql_FreeResult(mmysql_handle);
			return 0;  // MOTD is disabled
		}
	}
	Sql_FreeResult(mmysql_handle);

	// Query current MOTD monster from schedule
	if (SQL_ERROR == Sql_Query(mmysql_handle,
		"SELECT `mob_id` FROM `motd_schedule` "
		"WHERE NOW() BETWEEN `start_time` AND `end_time` "
		"LIMIT 1"))
	{
		Sql_ShowDebug(mmysql_handle);
		return 0;
	}

	if (SQL_SUCCESS == Sql_NextRow(mmysql_handle)) {
		Sql_GetData(mmysql_handle, 0, &data, nullptr);
		if (data) {
			mob_id = atoi(data);
		}
	}

	Sql_FreeResult(mmysql_handle);
	return mob_id;
}

/**
 * Get the current MOTD monster ID with caching
 */
int32 motd_get_current_monster(void) {
	t_tick current_tick = gettick();

	// Check if cache is still valid
	if (motd_cache_initialized && DIFF_TICK(current_tick, motd_cache_time) < MOTD_CACHE_DURATION) {
		return motd_cached_mob_id;
	}

	// Cache expired or not initialized, query database
	motd_cached_mob_id = motd_query_current_monster();
	motd_cache_time = current_tick;
	motd_cache_initialized = true;

	if (motd_cached_mob_id > 0) {
		ShowDebug("[MOTD] Current monster: %d (cached for %d ms)\n", motd_cached_mob_id, MOTD_CACHE_DURATION);
	}

	return motd_cached_mob_id;
}

/**
 * Check if a monster is the current MOTD
 */
bool motd_is_current_monster(int32 mob_id) {
	if (mob_id <= 0)
		return false;

	int32 current_motd = motd_get_current_monster();
	return (current_motd > 0 && current_motd == mob_id);
}

/**
 * Get the drop rate multiplier for MOTD monsters
 */
int motd_get_drop_multiplier(void) {
	return MOTD_DROP_MULTIPLIER;
}

/**
 * Force refresh of the MOTD cache
 */
void motd_refresh_cache(void) {
	motd_cache_initialized = false;
	motd_get_current_monster();
}
