// Monster of the Day (MOTD) System
// Provides drop rate bonuses for featured monsters

#ifndef MOTD_HPP
#define MOTD_HPP

#include "../common/cbasetypes.hpp"

// MOTD multipliers (300 = 3x)
#define MOTD_DROP_MULTIPLIER 300
#define MOTD_EXP_MULTIPLIER 300

/**
 * Check if a monster is the current Monster of the Day
 * @param mob_id Monster ID to check
 * @return true if this monster is the current MOTD
 */
bool motd_is_current_monster(int32 mob_id);

/**
 * Get the current MOTD monster ID
 * Uses caching to avoid frequent database queries
 * @return Monster ID of current MOTD, or 0 if none active
 */
int32 motd_get_current_monster(void);

/**
 * Get the drop rate multiplier for MOTD monsters
 * @return Multiplier as percentage (300 = 3x)
 */
int motd_get_drop_multiplier(void);

/**
 * Force refresh of the MOTD cache
 * Call this when MOTD changes mid-session
 */
void motd_refresh_cache(void);

#endif /* MOTD_HPP */
