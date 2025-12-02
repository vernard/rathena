// Copyright (c) rAthena Dev Teams - Licensed under GNU GPL
// For more information, see LICENCE in the main folder

// CUSTOM: Maintenance mode for graceful shutdown with force-save
// Prevents item duplication exploit during server shutdown

#include "maintenance.hpp"

#include "../common/showmsg.hpp"
#include "../common/socket.hpp"

#include "chrif.hpp"
#include "clif.hpp"
#include "map.hpp"
#include "pc.hpp"

// Global flag indicating server is in maintenance mode
bool server_maintenance_mode = false;

/**
 * Check if server is in maintenance mode
 */
bool is_maintenance_mode(void)
{
    return server_maintenance_mode;
}

/**
 * Enter maintenance mode:
 * 1. Force-save all connected players (inventory + cart)
 * 2. Kick all connected players
 * 3. Block new connections
 * 4. Keep server process alive (waiting for container replacement)
 */
void do_maintenance(void)
{
    if (server_maintenance_mode) {
        ShowWarning("do_maintenance: Already in maintenance mode.\n");
        return;
    }

    server_maintenance_mode = true;
    ShowWarning("[Maintenance] Entering maintenance mode...\n");

    int player_count = 0;
    struct s_mapiterator* iter = mapit_getallusers();

    for (struct map_session_data* sd = (TBL_PC*)mapit_first(iter);
         mapit_exists(iter);
         sd = (TBL_PC*)mapit_next(iter))
    {
        if (sd == NULL)
            continue;

        player_count++;

        // Force save inventory and cart to database
        // This ensures the player's current inventory state is persisted
        // CSAVE_INVENTORY | CSAVE_CART = 0x08 | 0x10 = 0x18
        chrif_save(sd, CSAVE_INVENTORY | CSAVE_CART);

        ShowWarning("[Maintenance] Saved player: %s (AID: %d, CID: %d)\n",
                 sd->status.name, sd->status.account_id, sd->status.char_id);

        // Kick the player - this sends disconnect packet to client
        clif_GM_kick(NULL, sd);
    }

    mapit_free(iter);

    // Flush all pending network data to ensure saves reach char-server
    flush_fifos();

    ShowWarning("[Maintenance] Maintenance mode active. Saved and disconnected %d player(s).\n", player_count);
    ShowWarning("[Maintenance] Server will reject new connections until container is replaced.\n");

    // Note: We do NOT call do_shutdown() or set runflag = CORE_ST_STOP
    // The process stays alive, just blocking new connections
    // Docker will replace the container when the new build is ready
}
