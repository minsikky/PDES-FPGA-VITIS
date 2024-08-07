#ifndef TIME_WARP_SIMULATION_HPP
#define TIME_WARP_SIMULATION_HPP

#include <vector>
#include <queue>
#include "constants.hpp"
#include "LPCore.hpp"
#include "EventQueue.hpp"

// Forward declaration
class LPCore;

class TimeWarpSimulation {
private:
    std::array<LPCore, NUM_LPCORE> lp_cores;
    int32_t gvt;
    int stall_count;
    static constexpr int MAX_STALL_COUNT = 1000;

public:
    TimeWarpSimulation();
    bool route_event(const TimeWarpEvent &event) {
        int dest_lp_id = event.receiver_id;
        int dest_core_id = LPMapping::get_core_id(dest_lp_id);
        return lp_cores[dest_core_id].recv_event(event);
    }

private:
    void handle_persistent_stall() {
        // Implement logic to handle persistent stalls
        // This could involve:
        // 1. Forcing a GVT calculation and fossil collection
        // 2. Adjusting load balancing
        // 3. Increasing event queue or state buffer sizes if possible
        // 4. Logging a warning or error
        calculate_gvt();
        fossil_collection();
        balance_load();
        // If stall persists, you might need to abort the simulation or take more drastic measures
    }
};

#endif // TIME_WARP_SIMULATION_HPP