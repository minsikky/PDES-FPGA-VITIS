#ifndef VIRTUAL_LP_HPP
#define VIRTUAL_LP_HPP

#include <sycl/sycl.hpp>
#include <sycl/ext/intel/fpga_extensions.hpp>
#include <vector>
#include <queue>
#include "EventQueue.hpp"
#include "StateBuffer.hpp"
#include "OutputBuffer.hpp"

// Simple xorshift random number generator
uint32_t xorshift32(uint32_t &state)
{
    uint32_t x = state;
    x ^= x << 13;
    x ^= x >> 17;
    x ^= x << 5;
    state = x;
    return x;
}

class VirtualLP
{
public:
    LPState state;
    EventQueue event_queue; // Event queue for this LP

    VirtualLP(int lp_id, uint32_t initial_rng_state) {
        state = {lp_id, 0, initial_rng_state};
    }

    bool enqueue_event(const TimeWarpEvent &event) {
        return event_queue.enqueue(event);
    }

    bool process_events() {
        
    }

    void commit(int32_t gvt, StateBuffer &state_buffer, OutputBuffer &output_buffer, EventHistory &event_history)
    {
        state_buffer.commit(gvt);
        output_buffer.commit(gvt);
        event_history.commit(gvt);
    }

    bool save_state(StateBuffer &state_buffer)
    {
        return state_buffer.push(state);
    }

    bool rollback(int32_t to_time, StateBuffer &state_buffer, OutputBuffer &output_buffer, EventHistory &event_history, EventQueue &event_queue) {
        state_buffer.rollback(state.lp_id, to_time);
        state = state_buffer.peek(state.lp_id);
        output_buffer.rollback(state.lp_id, to_time);
        event_history.rollback(state.lp_id, to_time, event_queue);
    }
};

#endif