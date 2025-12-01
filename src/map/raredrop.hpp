// Rare Drop Tracking Module
// Custom module for enhanced rare drop announcements

#ifndef _RAREDROP_HPP_
#define _RAREDROP_HPP_

#include "../common/cbasetypes.hpp"
#include "../common/mmo.hpp"

struct map_session_data;

// Source type for rare drops
enum e_raredrop_source {
	RAREDROP_SOURCE_MOB = 0,  // Monster drop
	RAREDROP_SOURCE_ITEM = 1  // Item box (Old Blue Box, etc.)
};

// Function declarations
void raredrop_record_kill(map_session_data* sd, int32 mob_id);
uint32 raredrop_get_kill_count(uint32 char_id, int32 mob_id);
const char* raredrop_ordinal_suffix(uint32 n);

void raredrop_record_and_announce(map_session_data* sd, t_itemid item_id,
                                   const char* item_name, e_raredrop_source source_type,
                                   uint32 source_id, const char* source_name,
                                   int32 drop_rate, int32 announce_threshold);

#endif /* _RAREDROP_HPP_ */