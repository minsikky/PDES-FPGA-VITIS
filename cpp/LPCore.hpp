#ifndef LPCORE_HPP
#define LPCORE_HPP

#include <vector>
#include <queue>
#include "VirtualLP.hpp"
#include "EventQueue.hpp"
#include "EventHistory.hpp"
#include "StateBuffer.hpp"
#include "CancellationUnit.hpp"
#include "EventProcessor.hpp"
#include "LPMapping.hpp"

// Forward declaration
class TimeWarpSimulation;

class LPCore
{
public:
    TimeWarpSimulation *simulation;
    int lpcore_id;
    std::array<VirtualLP, (int)(NUM_LPS / NUM_LPCORE)> virtual_lps; // Virtual LPs managed by this core
    EventQueue event_queue;                                         // Event queue for this core
    StateBuffer state_buffer;                                       // State buffer for this core
    CancellationUnit cancellation_unit;                             // Cancellation unit for this core
    EventProcessor event_processor;                                 // Event processor for this core
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

    bool recv_event(const TimeWarpEvent &event) {
        // Check if event is an anti-message
        if (event.is_anti_message) {
            return process_anti_message(event);
        } else {
            // Check causality violation
            if (event.recv_time < virtual_lps[event.receiver_id % NUM_LPCORE].lvt) {
                // Trigger rollback
                trigger_rollback(virtual_lps[event.receiver_id % NUM_LPCORE], event.recv_time);
            }
            return event_queue.enqueue(event);
        }
    }

    void trigger_rollback(VirtualLP &lp, int32_t rollback_time) {
        // Rollback state buffer
        state_buffer.rollback(lp.lp_id, rollback_time);
        // Rollback event queue
        event_queue.rollback(lp.lp_id, rollback_time);
        // Rollback cancellation unit
        cancellation_unit.rollback(lp.lp_id, rollback_time);
        // Rollback virtual LP
        lp.lvt = rollback_time;
    };

    bool process_anti_message(const TimeWarpEvent &anti_msg) {
        // Find matches in event queue, and eliminate it.
        if (event_queue.remove_matching_event(anti_msg)) {
            // If match is found, then the event has not been processed yet. Must trigger rollback.
            trigger_rollback(virtual_lps[anti_msg.receiver_id % NUM_LPCORE], anti_msg.recv_time);
        }
        return true;
    }

    bool enqueue_event(const TimeWarpEvent &event)
    {
        return event_queue.enqueue(event);
    }

    bool process_events() {
        TimeWarpEvent event;
        if ((event = event_queue.dequeue()) != TimeWarpEvent{INT32_MAX, 0, 0, 0, 0, 0}) {
            LPState state = state_buffer.peek(event.receiver_id);
            event_processor.process_event(event, state);
        }
    }

    bool is_core_stalled() const { return is_stalled; }
};

#endif // LPCORE_HPP