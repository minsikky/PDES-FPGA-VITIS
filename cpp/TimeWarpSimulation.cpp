#include "TimeWarpSimulation.hpp"
#include "LPMapping.hpp"
#include "EventQueue.hpp"

TimeWarpSimulation::TimeWarpSimulation() : gvt(0), stall_count(0) {
    for (int i = 0; i < NUM_LPCORE; i++) {
        lpcores[i] = LPCore(i);
    }
}

bool TimeWarpSimulation::route_event(const TimeWarpEvent &event) {
    int dest_lp_id = event.receiver_id;
    int dest_core_id = LPMapping::get_core_id(dest_lp_id);
    return lpcores[dest_core_id].recv_event(event);
}

void TimeWarpSimulation::handle_persistent_stall() {
    // Implement logic to handle persistent stalls
    // This could involve:
    // 1. Forcing a GVT calculation and fossil collection
    // 2. Adjusting load balancing
    // 3. Increasing event queue or state buffer sizes if possible
    // 4. Logging a warning or error
    // calculate_gvt();
    // fossil_collection();
    // balance_load();
    // If stall persists, you might need to abort the simulation or take more drastic measures
}