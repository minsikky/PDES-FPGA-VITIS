#ifndef STATE_BUFFER_HPP
#define STATE_BUFFER_HPP

#include <ap_int.h>
#include <hls_task.h>
#include "sys_defs.hpp"
#include "constants.hpp"

class StateBuffer
{
private:
    StateEntry buffer[STATE_BUFFER_CAPACITY];
    ap_uint<16> lp_heads[NUM_LPS / NUM_LPCORE];
    ap_uint<16> lp_sizes[NUM_LPS / NUM_LPCORE];
    ap_uint<16> free_head;
    ap_uint<16> total_size;
    ap_int<32> current_gvt;

public:
    StateBuffer();
    void reset();
    bool push(const LPState &state);
    bool pop(ap_int<16> lp_id, LPState &state);
    LPState peek(ap_int<16> lp_id) const;
    bool commit(ap_int<32> commit_time);
    bool rollback(RollbackInfo &rollback_info);
    ap_uint<16> get_lp_size(ap_int<16> lp_id) const;
    ap_uint<16> get_total_size() const;
    bool is_full();
    ap_int<32> get_gvt() const;
};

// Kernel function declaration
void state_buffer_kernel(ap_uint<2> op, LPState state, LPState &result, bool &success);

template <int ID>
void state_buffer_top(
    hls::stream<RollbackInfo> &state_buffer_rollback_info_stream,
    hls::stream<ap_int<32>> &state_buffer_commit_time_stream,
    hls::stream<LPState> &state_buffer_input_stream,
    hls::stream<TimeWarpEvent> &issued_event_stream,
    hls::stream<EventProcessorInput> &event_processor_input_stream)
{
    StateBuffer state_buffer;
    // Priority: rollback > push > issue > commit
    if (!state_buffer_rollback_info_stream.empty()) // Rollback
    {
        RollbackInfo rollback_info = state_buffer_rollback_info_stream.read();
        state_buffer.rollback(rollback_info);
    }
    else if (!state_buffer_input_stream.empty() && !state_buffer.is_full()) // Enqueue
    {
        LPState state = state_buffer_input_stream.read();
        state_buffer.push(state);
    }
    else if (!issued_event_stream.empty()) {
        TimeWarpEvent event = issued_event_stream.read();
        LPState state = state_buffer.peek(event.receiver_id);
        EventProcessorInput input = {event, state};
        event_processor_input_stream.write(input);
    }
    else if (!state_buffer_commit_time_stream.empty()) // Can't enqueue or issue, so try to commit
    {
        ap_int<32> commit_time = state_buffer_commit_time_stream.read();
        state_buffer.commit(commit_time);
    }
}

void state_buffer_top_test(
    hls::stream<RollbackInfo> &state_buffer_rollback_info_stream,
    hls::stream<LPState> &state_buffer_input_stream,
    hls::stream<TimeWarpEvent> &issued_event_stream,
    hls::stream<EventProcessorInput> &event_processor_input_stream);

int test_state_buffer();

#endif // STATE_BUFFER_HPP