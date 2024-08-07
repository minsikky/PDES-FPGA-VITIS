#ifndef VIRTUAL_LP_HPP
#define VIRTUAL_LP_HPP

#include <ap_int.h>
#include <hls_stream.h>
#include <vector>
#include <queue>
#include "EventQueue.hpp"
#include "StateBuffer.hpp"
#include "CancellationUnit.hpp"

// Forward declaration
class LPCore;

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
    int lp_id;
    int lvt;
    LPState state;
    LPCore *lpcore;

    VirtualLP() {
        lp_id = 0;
        lvt = 0;
        state = {0, 0, 0};
        lpcore = nullptr;
    }

    VirtualLP(int lp_id, uint32_t initial_rng_state) {
        lp_id = lp_id;
        lvt = 0;
        state = {lp_id, 0, initial_rng_state};
    }

    bool process_event(TimeWarpEvent &event) {
        lvt = event.recv_time;
    }

    bool assign_lpcore(LPCore *lpcore) {
        this->lpcore = lpcore;
        return true;
    }

    void commit(int32_t gvt) // Probably bad idea to put commit in VirtualLP. Should put it in LPCore.
    {
        lpcore->state_buffer.commit(gvt);
        lpcore->event_history.commit(gvt);
        lpcore->cancellation_unit.commit(gvt);
    }

    bool save_state(StateBuffer &state_buffer)
    {
        return state_buffer.push(state);
    }

    bool rollback(int32_t to_time) {
        lpcore->state_buffer.rollback(state.lp_id, to_time);
        state = lpcore->state_buffer.peek(state.lp_id);
        lpcore->event_history.rollback(state.lp_id, to_time, lpcore->event_queue);
        lpcore->cancellation_unit.rollback(state.lp_id, to_time);
    }
};

#endif