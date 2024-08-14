#ifndef VIRTUAL_LP_HPP
#define VIRTUAL_LP_HPP

#include <ap_int.h>
#include <hls_task.h>
#include <vector>
#include <queue>
#include "EventQueue.hpp"
#include "StateBuffer.hpp"
#include "CancellationUnit.hpp"

// Declaration of xorshift32 function
uint32_t xorshift32(uint32_t &state);

class VirtualLP
{
public:
    int lp_id;
    int lvt;
    LPState state;

    VirtualLP();
    VirtualLP(int lp_id, uint32_t initial_rng_state);
    bool save_state(StateBuffer &state_buffer);

    // Commented out methods are left as comments in the header
    // bool process_event(TimeWarpEvent &event);
    // bool assign_lpcore(LPCore *lpcore);
    // void commit(int32_t gvt);
    // bool rollback(int32_t to_time);
};

#endif // VIRTUAL_LP_HPP