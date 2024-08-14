#include "StateBuffer.hpp"
#include "EventProcessor.hpp"
#include <iostream>

static StateBuffer state_buffer;

StateBuffer::StateBuffer()
{
    reset();
}

void StateBuffer::reset()
{
    free_head = 0;
    total_size = 0;
    current_gvt = 0;

    for (ap_uint<16> i = 0; i < STATE_BUFFER_CAPACITY - 1; ++i)
    {
        buffer[i].next = i + 1;
    }
    buffer[STATE_BUFFER_CAPACITY - 1].next = 0xFFFF; // End of free list

    for (ap_uint<16> i = 0; i < NUM_LPS / NUM_LPCORE; ++i)
    {
        lp_heads[i] = 0xFFFF; // Invalid index
        lp_sizes[i] = 0;
    }
}

bool StateBuffer::push(const LPState &state)
{
    if (total_size >= STATE_BUFFER_CAPACITY)
        return false;

    ap_uint<16> new_StateEntry = free_head;
    free_head = buffer[free_head].next;

    buffer[new_StateEntry].state = state;
    buffer[new_StateEntry].next = lp_heads[state.lp_id];
    lp_heads[state.lp_id] = new_StateEntry;

    lp_sizes[state.lp_id]++;
    total_size++;
    return true;
}

bool StateBuffer::pop(ap_int<16> lp_id, LPState &state)
{
    if (lp_sizes[lp_id] == 0)
        return false;

    ap_uint<16> popped = lp_heads[lp_id];
    state = buffer[popped].state;
    lp_heads[lp_id] = buffer[popped].next;

    buffer[popped].next = free_head;
    free_head = popped;

    lp_sizes[lp_id]--;
    total_size--;
    return true;
}

LPState StateBuffer::peek(ap_int<16> lp_id) const
{
    return buffer[lp_heads[lp_id]].state;
}

bool StateBuffer::commit(ap_int<32> commit_time)
{
    current_gvt = commit_time;
    ap_uint<16> removed = 0;

    for (ap_uint<16> lp_id = 0; lp_id < NUM_LPS / NUM_LPCORE; ++lp_id)
    {
        ap_uint<16> current = lp_heads[lp_id];
        ap_uint<16> prev = 0xFFFF;
        bool keep_next = true;

        while (current != 0xFFFF)
        {
            ap_uint<16> next = buffer[current].next;

            if (buffer[current].state.lvt <= commit_time)
            {
                if (keep_next)
                {
                    keep_next = false;
                    prev = current;
                    current = next;
                }
                else
                {
                    if (prev == 0xFFFF)
                    {
                        lp_heads[lp_id] = next;
                    }
                    else
                    {
                        buffer[prev].next = next;
                    }

                    buffer[current].next = free_head;
                    free_head = current;

                    removed++;
                    lp_sizes[lp_id]--;
                    current = next;
                }
            }
            else
            {
                prev = current;
                current = next;
            }
        }
    }

    total_size -= removed;
    return true;
}

bool StateBuffer::rollback(RollbackInfo &rollback_info)
{
    ap_int<16> lp_id = rollback_info.lp_id;
    ap_int<32> to_time = rollback_info.to_time;
    ap_uint<16> current = lp_heads[lp_id];
    ap_uint<16> removed = 0;

    while (current != 0xFFFF && buffer[current].state.lvt > to_time)
    {
        ap_uint<16> next = buffer[current].next;

        lp_heads[lp_id] = next;

        buffer[current].next = free_head;
        free_head = current;

        removed++;
        current = next;
    }

    if (removed > 0)
    {
        lp_sizes[lp_id] -= removed;
        total_size -= removed;
        return true;
    }
    return true;
}

ap_uint<16> StateBuffer::get_lp_size(ap_int<16> lp_id) const
{
    return lp_sizes[lp_id];
}

ap_uint<16> StateBuffer::get_total_size() const
{
    return total_size;
}

bool StateBuffer::is_full()
{
    return total_size == STATE_BUFFER_CAPACITY;
}

ap_int<32> StateBuffer::get_gvt() const
{
    return current_gvt;
}

void state_buffer_kernel(ap_uint<2> op, LPState state, LPState &result, bool &success)
{
#pragma HLS INTERFACE ap_ctrl_hs port = return
#pragma HLS INTERFACE ap_none port = op
#pragma HLS INTERFACE ap_none port = state
#pragma HLS INTERFACE ap_vld port = result
#pragma HLS INTERFACE ap_vld port = success

    switch (op)
    {
    case 0: // Push operation
        success = state_buffer.push(state);
        result = state;
        break;
    case 1: // Pop operation
        success = state_buffer.pop(state.lp_id, result);
        break;
    case 2: // Commit operation
        success = state_buffer.commit(state.lvt);
        result.lvt = state_buffer.get_gvt();
        break;
    case 3: // Rollback operation
        RollbackInfo rollback_info = {state.lp_id, state.lvt};
        success = state_buffer.rollback(rollback_info);
        result.lvt = state.lvt;
        break;
    }
}

void state_buffer_top_test(
    hls::stream<RollbackInfo> &state_buffer_rollback_info_stream,
    hls::stream<ap_int<32>> &state_buffer_commit_time_stream,
    hls::stream<LPState> &state_buffer_input_stream,
    hls::stream<TimeWarpEvent> &issued_event_stream,
    hls::stream<EventProcessorInput> &event_processor_input_stream)
{
    state_buffer_top<0>(
        state_buffer_rollback_info_stream,
        state_buffer_commit_time_stream,
        state_buffer_input_stream,
        issued_event_stream,
        event_processor_input_stream);
}

int test_state_buffer()
{
    ap_uint<2> op;
    LPState state, result;
    bool success;

    // Test push operations
    std::cout << "Pushing states:" << std::endl;
    for (int i = 0; i < 20; ++i)
    {
        op = 0;              // Push
        state.lp_id = i % 4; // Use 4 different LPs
        state.lvt = i * 10;
        state.rng_state = i * 100;
        state_buffer_kernel(op, state, result, success);
        if (success)
        {
            std::cout << "Pushed: LP " << state.lp_id << ", LVT " << state.lvt << ", RNG " << state.rng_state << std::endl;
        }
        else
        {
            std::cout << "Push failed for LP " << state.lp_id << std::endl;
        }
    }

    // Test rollback operation
    std::cout << "\nRolling back LP 2 to LVT 70:" << std::endl;
    op = 3; // Rollback
    state.lp_id = 2;
    state.lvt = 70;
    state_buffer_kernel(op, state, result, success);
    if (success)
    {
        std::cout << "Rollback successful for LP 2 to LVT " << result.lvt << std::endl;
    }
    else
    {
        std::cout << "Rollback failed for LP 2" << std::endl;
    }

    // Test commit operation
    std::cout << "\nCommitting up to LVT 100:" << std::endl;
    op = 2; // Commit
    state.lvt = 100;
    state_buffer_kernel(op, state, result, success);
    if (success)
    {
        std::cout << "Commit successful, new GVT: " << result.lvt << std::endl;
    }
    else
    {
        std::cout << "Commit failed" << std::endl;
    }

    // Test pop operations after rollback and commit
    std::cout << "\nPopping states after rollback and commit:" << std::endl;
    for (int lp = 0; lp < 4; ++lp)
    {
        std::cout << "LP " << lp << ": ";
        while (true)
        {
            op = 1; // Pop
            state.lp_id = lp;
            state_buffer_kernel(op, state, result, success);
            if (success)
            {
                std::cout << "(" << result.lvt << "," << result.rng_state << ") ";
            }
            else
            {
                std::cout << "(empty)";
                break;
            }
        }
        std::cout << std::endl;
    }

    return 0;
}
