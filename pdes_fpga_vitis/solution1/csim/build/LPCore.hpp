#ifndef LPCORE_HPP
#define LPCORE_HPP

#include <hls_task.h>
#include <ap_int.h>
#include <array>
#include "sys_defs.hpp"
#include "VirtualLP.hpp"
#include "EventQueue.hpp"
#include "StateBuffer.hpp"
#include "CancellationUnit.hpp"
#include "EventProcessor.hpp"
#include "EventRouter.hpp"
#include "LPMapping.hpp"
#include "RollbackControl.hpp"
#include "CommitControlDummy.hpp"

// Forward declaration
// class TimeWarpSimulation;

class LPCore
{
public:
    // TimeWarpSimulation &simulation;
    ap_uint<8> lpcore_id;
    VirtualLP virtual_lps[NUM_LPS / NUM_LPCORE];
    // std::array<VirtualLP, (int)(NUM_LPS / NUM_LPCORE)> virtual_lps;
    EventQueue event_queue;
    StateBuffer state_buffer;
    CancellationUnit cancellation_unit;
    EventProcessor event_processor;
    // EventRouter event_router;
    int current_lp_index;
    int total_lps;
    // hls::stream<bool> fossil_signal;
    // hls::stream<bool> stall_signal;

    hls::stream<bool> event_queue_full_stream;
    hls::stream<TimeWarpEvent> anti_message_stream[NUM_LPCORE];
    hls::stream<TimeWarpEvent> enqueue_event_stream[NUM_LPCORE];
    hls::stream<ap_int<32>> commit_time_stream;
    hls::stream<TimeWarpEvent> issued_event_stream;
    hls::stream<LPState> state_buffer_input_stream;
    hls::stream<EventProcessorInput> event_processor_input_stream;
    hls::stream<RollbackInfo> causality_violation_stream;
    hls::stream<TimeWarpEvent> output_event_stream;
    hls::stream<TimeWarpEvent> cancellation_unit_input_stream;
    hls::stream<TimeWarpEvent> cancellation_unit_output_stream;

    hls::stream<RollbackInfo> event_queue_rollback_info_stream;
    hls::stream<RollbackInfo> state_buffer_rollback_info_stream;
    hls::stream<RollbackInfo> cancellation_unit_rollback_info_stream;

public:
    // LPCore(TimeWarpSimulation &simulation, ap_uint<8> lpcore_id);
    // LPCore();
    LPCore(ap_uint<8> lpcore_id);
    // void init();
    bool recv_event(const TimeWarpEvent &event);
    void trigger_rollback(RollbackInfo &rollback_info);
    bool process_anti_message(const TimeWarpEvent &anti_msg);
    bool enqueue_event(const TimeWarpEvent &event);
    void run();
    bool is_assigned_lp(ap_uint<16> lp_id) const;
};

void lpcore_kernel(hls::stream<int> &in, hls::stream<bool> &out);

void test_lpcore();

#endif // LPCORE_HPP