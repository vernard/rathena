// Copyright (c) rAthena Dev Teams - Licensed under GNU GPL
// For more information, see LICENCE in the main folder

// CUSTOM: Maintenance mode for graceful shutdown with force-save
// Prevents item duplication exploit during server shutdown

#ifndef MAINTENANCE_HPP
#define MAINTENANCE_HPP

#include "../common/cbasetypes.hpp"

// Global flag indicating server is in maintenance mode
extern bool server_maintenance_mode;

/**
 * Enter maintenance mode:
 * 1. Force-save all connected players (inventory + cart)
 * 2. Kick all connected players
 * 3. Block new connections
 * 4. Keep server process alive (waiting for container replacement)
 */
void do_maintenance(void);

/**
 * Check if server is in maintenance mode
 * @return true if maintenance mode is active
 */
bool is_maintenance_mode(void);

#endif /* MAINTENANCE_HPP */
