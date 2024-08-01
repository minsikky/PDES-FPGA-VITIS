#ifndef EVENT_HISTORY_HPP
#define EVENT_HISTORY_HPP

#include <ap_int.h>
#include <hls_stream.h>
#include "constants.hpp"
#include "EventQueue.hpp"

struct HistoryEntry
{
    TimeWarpEvent event;
    ap_uint<16> next; // Index of next event for this LP, or 0xFFFF if none
};

class EventHistory
{
private:
    HistoryEntry buffer[EVENT_HISTORY_CAPACITY];
    ap_uint<16> lp_heads[NUM_LPS];
    ap_uint<16> lp_sizes[NUM_LPS];
    ap_uint<16> free_head;
    ap_uint<16> total_size;
    ap_int<32> current_gvt;

public:
    EventHistory()
    {
        reset();
    }

    void reset()
    {
        free_head = 0;
        total_size = 0;
        current_gvt = 0;

        for (ap_uint<16> i = 0; i < EVENT_HISTORY_CAPACITY - 1; ++i)
        {
            buffer[i].next = i + 1;
        }
        buffer[EVENT_HISTORY_CAPACITY - 1].next = 0xFFFF; // End of free list

        for (ap_uint<16> i = 0; i < NUM_LPS / NUM_LPCORE; ++i)
        {
            lp_heads[i] = 0xFFFF; // Invalid index
            lp_sizes[i] = 0;
        }
    }

    bool push(const TimeWarpEvent &event)
    {
        if (total_size >= STATE_BUFFER_CAPACITY)
            return false;

        ap_uint<16> new_HistoryEntry = free_head;
        free_head = buffer[free_head].next;

        buffer[new_HistoryEntry].event = event;
        buffer[new_HistoryEntry].next = lp_heads[event.receiver_id];
        lp_heads[event.receiver_id] = new_HistoryEntry;

        lp_sizes[event.receiver_id]++;
        total_size++;
        return true;
    }

    bool pop(ap_int<16> lp_id, TimeWarpEvent &event)
    {
        if (lp_sizes[lp_id] == 0)
            return false;

        ap_uint<16> popped = lp_heads[lp_id];
        event = buffer[popped].event;
        lp_heads[lp_id] = buffer[popped].next;

        buffer[popped].next = free_head;
        free_head = popped;

        lp_sizes[lp_id]--;
        total_size--;
        return true;
    }

    bool commit(ap_int<32> commit_time)
    {
        current_gvt = commit_time;
        ap_uint<16> removed = 0;

        for (ap_uint<16> lp_id = 0; lp_id < NUM_LPS / NUM_LPCORE; ++lp_id)
        {
            ap_uint<16> current = lp_heads[lp_id];
            ap_uint<16> prev = 0xFFFF;

            while (current != 0xFFFF)
            {
                ap_uint<16> next = buffer[current].next;

                if (buffer[current].event.recv_time <= commit_time)
                {
                    // Remove this state
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
                    // This state is younger than commit_time, keep it
                    prev = current;
                    current = next;
                }
            }
        }

        total_size -= removed;
        return true;
    }

    bool rollback(ap_uint<16> lp_id, ap_int<32> to_time, EventQueue &event_queue)
    {
        ap_uint<16> current = lp_heads[lp_id];

        while (current != 0xFFFF && buffer[current].event.recv_time > to_time)
        {
            if (event_queue.enqueue(buffer[current].event))
            {
                ap_uint<16> next = buffer[current].next;
                lp_heads[lp_id] = next;
                buffer[current].next = free_head;
                free_head = current;
                lp_sizes[lp_id] --;
                total_size --;
                current = next;
            }
            else
            {
                return false;
            }
        }

        return true;
    }

    ap_uint<16> get_lp_size(ap_int<16> lp_id) const
    {
        return lp_sizes[lp_id];
    }

    ap_uint<16> get_total_size() const
    {
        return total_size;
    }

    ap_int<32> get_gvt() const
    {
        return current_gvt;
    }
};

// Kernel function declaration
void event_history_kernel(ap_uint<2> op, TimeWarpEvent event, TimeWarpEvent &result, bool &success);

int test_event_history();

#endif // EVENT_HISTORY_HPP