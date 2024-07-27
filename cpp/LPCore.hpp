#ifndef LPCORE_HPP
#define LPCORE_HPP

#include <sycl/sycl.hpp>
#include <sycl/ext/intel/fpga_extensions.hpp>
#include <vector>
#include <queue>
#include "VirtualLP.hpp"
#include "EventQueue.hpp"
#include "EventHistory.hpp"
#include "StateBuffer.hpp"
#include "OutputBuffer.hpp"

using namespace sycl;

class LPCore
{
private:
    int lpcore_id;
    std::array<VirtualLP, (int)(NUM_LPS / NUM_LPCORE)> virtual_lps;   // Virtual LPs managed by this core
    StateBuffer state_buffer;                                         // State buffer for this core
    OutputBuffer output_buffer;                                       // Output buffer for this core
    EventHistory event_history;                                       // Event history for this core
    int current_lp_index;
    int total_lps;
    bool is_stalled;

public:
    LPCore(int lpcore_id)
        : lpcore_id(lpcore_id), current_lp_index(-1), is_stalled(false)
    {
        constexpr int LPS_PER_CORE = NUM_LPS / NUM_LPCORE;

        for (int i = 0; i < LPS_PER_CORE; ++i)
        {
            int global_lp_id = lpcore_id + NUM_LPCORE * i;
            virtual_lps[i] = VirtualLP(global_lp_id, global_lp_id + 1); // Initialize with global LP ID and RNG seed
        }
    }

    void trigger_rollback(VirtualLP &lp, int32_t rollback_time);

    bool is_matching_event(const TimeWarpEvent &e1, const TimeWarpEvent &e2);

    void process_anti_message(const TimeWarpEvent &anti_msg);

    bool enqueue_event(const TimeWarpEvent &event)
    {
        int index = (event.receiver_id - lpcore_id) / NUM_LPCORE;
        return virtual_lps[index].enqueue_event(event);
    }

    bool process_events(queue &q);

    bool is_core_stalled() const { return is_stalled; }
};

#endif // LPCORE_HPP