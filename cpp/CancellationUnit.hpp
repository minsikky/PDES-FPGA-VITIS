#ifndef CANCELLATION_UNIT_HPP
#define CANCELLATION_UNIT_HPP

#include <ap_int.h>
#include <hls_stream.h>
#include "constants.hpp"
#include "EventQueue.hpp"

// Forward declaration
class TimeWarpSimulation;

struct CancellationEntry
{
    TimeWarpEvent event;
    ap_uint<16> next; // Index of next event for this LP, or 0xFFFF if none
};

class CancellationUnit
{
public:
    TimeWarpSimulation *simulation;
    CancellationEntry buffer[CANCELLATION_UNIT_CAPACITY];
    ap_uint<16> lp_heads[NUM_LPS];
    ap_uint<16> lp_sizes[NUM_LPS];
    ap_uint<16> free_head;
    ap_uint<16> total_size;
    ap_int<32> current_gvt;

public:
CancellationUnit();
    CancellationUnit(TimeWarpSimulation *simulation);
    void reset();
    bool push(const TimeWarpEvent &event);
    bool rollback(ap_uint<16> lp_id, ap_int<32> to_time);
    bool commit(ap_int<32> commit_time);
    ap_uint<16> get_lp_size(ap_int<16> lp_id) const;
    ap_uint<16> get_total_size() const;
    ap_int<32> get_gvt() const;
};

// Kernel function declaration
void cancellation_unit_kernel(ap_uint<2> op, TimeWarpEvent event, TimeWarpEvent &result, bool &success);

int test_cancellation_unit();

#endif // CANCELLATION_UNIT_HPP