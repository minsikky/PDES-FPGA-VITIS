#ifndef TIME_WARP_SIMULATION_HPP
#define TIME_WARP_SIMULATION_HPP

#include <sycl/sycl.hpp>
#include <sycl/ext/intel/fpga_extensions.hpp>
#include <vector>
#include <queue>
#include "constants.hpp"
#include "LPCore.hpp"
#include "EventQueue.hpp"

using namespace sycl;

class TimeWarpSimulation {
private:
    std::arrayr<LPCore, NUM_LPCORE> lp_cores;
    int32_t gvt;
    int stall_count;
    static constexpr int MAX_STALL_COUNT = 1000;

public:
    // ... existing code ...

    void run(queue& q) {
        stall_count = 0;
        while (!is_simulation_complete()) {
            bool any_progress = false;
            for (auto& core : lp_cores) {
                bool core_progress = core.process_events(q);
                any_progress |= core_progress;
            }

            if (!any_progress) {
                stall_count++;
                if (stall_count >= MAX_STALL_COUNT) {
                    handle_persistent_stall();
                }
            } else {
                stall_count = 0;
            }

            if (/* time to calculate GVT */) {
                calculate_gvt();
                fossil_collection();
            }

            // ... rest of the simulation loop ...
        }
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