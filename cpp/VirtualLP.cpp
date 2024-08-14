#include "VirtualLP.hpp"

uint32_t xorshift32(uint32_t &state)
{
    uint32_t x = state;
    x ^= x << 13;
    x ^= x >> 17;
    x ^= x << 5;
    state = x;
    return x;
}

VirtualLP::VirtualLP()
{
    lp_id = 0;
    lvt = 0;
    state = {0, 0, 0};
}

VirtualLP::VirtualLP(int lp_id, uint32_t initial_rng_state) : lp_id(lp_id)
{
    lvt = 0;
    state = {static_cast<ap_int<16>>(lp_id), 0, initial_rng_state};
}

bool VirtualLP::save_state(StateBuffer &state_buffer)
{
    return state_buffer.push(state);
}

// Definitions for commented out methods, if you decide to implement them later:
/*
bool VirtualLP::process_event(TimeWarpEvent &event)
{
    lvt = event.recv_time;
    return true;
}

bool VirtualLP::assign_lpcore(LPCore *lpcore)
{
    this->lpcore = lpcore;
    return true;
}

void VirtualLP::commit(int32_t gvt)
{
    // Implementation
}

bool VirtualLP::rollback(int32_t to_time)
{
    // Implementation
    return true;
}
*/