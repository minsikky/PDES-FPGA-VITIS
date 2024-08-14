#include "CancellationUnit.hpp"
#include "LPCore.hpp"
#include <iostream>

// CancellationUnit::CancellationUnit() : simulation()
// {
//     reset();
// }

CancellationUnit::CancellationUnit()
{
    reset();
}

void CancellationUnit::reset()
{
    free_head = 0;
    total_size = 0;
    current_gvt = 0;

    for (ap_uint<16> i = 0; i < CANCELLATION_UNIT_CAPACITY - 1; ++i)
    {
        buffer[i].next = i + 1;
    }
    buffer[CANCELLATION_UNIT_CAPACITY - 1].next = 0xFFFF; // End of free list

    for (ap_uint<16> i = 0; i < NUM_LPS; ++i)
    {
        lp_heads[i] = 0xFFFF; // Invalid index
        lp_sizes[i] = 0;
    }
}

bool CancellationUnit::push(const TimeWarpEvent &event)
{
    if (total_size >= CANCELLATION_UNIT_CAPACITY)
        return false;

    ap_uint<16> new_entry = free_head;
    free_head = buffer[free_head].next;

    buffer[new_entry].event = event;
    buffer[new_entry].next = lp_heads[event.sender_id];
    lp_heads[event.sender_id] = new_entry;

    lp_sizes[event.sender_id]++;
    total_size++;
    return true;
}

bool CancellationUnit::rollback(RollbackInfo &rollback_info, hls::stream<TimeWarpEvent> &cancellation_unit_output_stream)
{
    ap_uint<16> lp_id = rollback_info.lp_id;
    ap_int<32> to_time = rollback_info.to_time;
    ap_uint<16> current = lp_heads[lp_id];
    ap_uint<16> prev = 0xFFFF;

    while (current != 0xFFFF && buffer[current].event.send_time > to_time)
    {
        TimeWarpEvent anti_message = buffer[current].event;
        anti_message.is_anti_message = 1; // Set anti-message flag

        cancellation_unit_output_stream.write(anti_message);
        ap_uint<16> next = buffer[current].next;
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
        lp_sizes[lp_id]--;
        total_size--;
        current = next;
    }

    return true;
}

bool CancellationUnit::commit(ap_int<32> commit_time)
{
    current_gvt = commit_time;
    ap_uint<16> removed = 0;

    for (ap_uint<16> lp_id = 0; lp_id < NUM_LPS; ++lp_id)
    {
        ap_uint<16> current = lp_heads[lp_id];
        ap_uint<16> prev = 0xFFFF;

        while (current != 0xFFFF)
        {
            ap_uint<16> next = buffer[current].next;

            if (buffer[current].event.send_time <= commit_time)
            {
                // Remove this event
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
            else
            {
                // This event is younger than commit_time, keep it
                prev = current;
                current = next;
            }
        }
    }

    total_size -= removed;
    return true;
}

ap_uint<16> CancellationUnit::get_lp_size(ap_int<16> lp_id) const
{
    return lp_sizes[lp_id];
}

ap_uint<16> CancellationUnit::get_total_size() const
{
    return total_size;
}

ap_int<32> CancellationUnit::get_gvt() const
{
    return current_gvt;
}

LPCore g_lpcore(0);

void cancellation_unit_kernel(ap_uint<2> op, TimeWarpEvent event, TimeWarpEvent &result, bool &success)
{
#pragma HLS INTERFACE ap_ctrl_hs port = return
#pragma HLS INTERFACE ap_none port = op
#pragma HLS INTERFACE ap_none port = event
#pragma HLS INTERFACE ap_vld port = result
#pragma HLS INTERFACE ap_vld port = success

    static CancellationUnit cancellation_unit;
    static EventQueue event_queue; // You might need to initialize this properly

    switch (op)
    {
    case 0: // Push operation
    {
        success = cancellation_unit.push(event);
        result = event;
        break;
    }
    case 1: // Rollback operation
    {
        RollbackInfo rollback_info = {event.sender_id, event.send_time};
        success = cancellation_unit.rollback(rollback_info, g_lpcore.cancellation_unit_output_stream);
        result = event;
        break;
    }
    case 2: // Commit operation
    {
        success = cancellation_unit.commit(event.send_time);
        result.send_time = cancellation_unit.get_gvt();
        break;
    }
    default:
    {
        success = false;
    }
    }
}

// template <int ID>
// void cancellation_unit_top( // TODO: revise. This is just a placeholder
//     hls::stream<RollbackInfo> &cancellation_unit_rollback_info_stream,
//     hls::stream<TimeWarpEvent> &cancellation_unit_input_stream,
//     hls::stream<TimeWarpEvent> &anti_message_stream)
// {
//     static CancellationUnit cancellation_unit;

//     if (!cancellation_unit_rollback_info_stream.empty())
//     {
//         RollbackInfo rollback_info = cancellation_unit_rollback_info_stream.read();
//         cancellation_unit.rollback(rollback_info, anti_message_stream);
//     }
//     else if (!cancellation_unit_input_stream.empty())
//     {
//         cancellation_unit.push(cancellation_unit_input_stream.read());
//     }
// }

int test_cancellation_unit()
{
    ap_uint<2> op;
    TimeWarpEvent event, result;
    bool success;

    // Test push operations
    std::cout << "Pushing events:" << std::endl;
    for (int i = 0; i < 20; ++i)
    {
        op = 0; // Push
        event.sender_id = i % 4;
        event.receiver_id = (i + 1) % 4;
        event.send_time = i * 5;
        event.recv_time = i * 10;
        event.data = i * 100;
        event.is_anti_message = 0;

        cancellation_unit_kernel(op, event, result, success);

        if (success)
        {
            std::cout << "Pushed: LP " << event.sender_id << ", Send Time " << event.send_time
                      << ", Recv Time " << event.recv_time << ", Data " << event.data << std::endl;
        }
        else
        {
            std::cout << "Push failed for LP " << event.sender_id << std::endl;
        }
    }

    // Test rollback operation
    std::cout << "\nRolling back LP 2 to send time 70:" << std::endl;
    op = 1; // Rollback
    event.sender_id = 2;
    event.send_time = 70;
    cancellation_unit_kernel(op, event, result, success);
    if (success)
    {
        std::cout << "Rollback successful for LP 2 to send time " << event.send_time << std::endl;
    }
    else
    {
        std::cout << "Rollback failed for LP 2" << std::endl;
    }

    // Test commit operation
    std::cout << "\nCommitting up to send time 100:" << std::endl;
    op = 2; // Commit
    event.send_time = 100;
    cancellation_unit_kernel(op, event, result, success);
    if (success)
    {
        std::cout << "Commit successful, new GVT: " << result.send_time << std::endl;
    }
    else
    {
        std::cout << "Commit failed" << std::endl;
    }

    return 0;
}
