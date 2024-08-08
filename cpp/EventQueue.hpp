#ifndef EVENT_QUEUE_HPP
#define EVENT_QUEUE_HPP

#include <ap_int.h>
#include <hls_stream.h>
#include <iostream>
#include <vector>
#include <random>
#include <algorithm>
#include "constants.hpp"

struct TimeWarpEvent
{
    ap_int<32> send_time;
    ap_int<32> recv_time;
    ap_int<32> data;
    ap_int<16> sender_id;
    ap_int<16> receiver_id;
    ap_uint<1> is_anti_message;

    // Default constructor
    TimeWarpEvent() : send_time(0), recv_time(INT32_MAX), data(0), sender_id(0), receiver_id(0), is_anti_message(0) {}

    // Constructor with parameters (optional, but can be useful)
    TimeWarpEvent(ap_int<32> st, ap_int<32> rt, ap_int<32> d, ap_int<16> sid, ap_int<16> rid, ap_uint<1> iam)
        : send_time(st), recv_time(rt), data(d), sender_id(sid), receiver_id(rid), is_anti_message(iam) {}

    // Overload the < operator
    bool operator<(const TimeWarpEvent &other) const
    {
        // First, compare by receive time
        if (recv_time != other.recv_time)
        {
            return recv_time < other.recv_time;
        }

        // If receive times are equal, compare by send time
        if (send_time != other.send_time)
        {
            return send_time < other.send_time;
        }

        // If send times are also equal, compare by sender ID
        if (sender_id != other.sender_id)
        {
            return sender_id < other.sender_id;
        }

        // If sender IDs are equal, compare by receiver ID
        if (receiver_id != other.receiver_id)
        {
            return receiver_id < other.receiver_id;
        }

        // If all above are equal, compare by data
        if (data != other.data)
        {
            return data < other.data;
        }

        // If everything else is equal, anti-messages come last
        return !is_anti_message && other.is_anti_message;
    }

    // Overload the == operator
    bool operator==(const TimeWarpEvent &other) const
    {
        return (send_time == other.send_time &&
                recv_time == other.recv_time &&
                data == other.data &&
                sender_id == other.sender_id &&
                receiver_id == other.receiver_id &&
                is_anti_message == other.is_anti_message);
    }

    // Overload the != operator
    bool operator!=(const TimeWarpEvent &other) const
    {
        return (send_time != other.send_time ||
                recv_time != other.recv_time ||
                data != other.data ||
                sender_id != other.sender_id ||
                receiver_id != other.receiver_id ||
                is_anti_message != other.is_anti_message);
    }

    bool is_matching_anti_message(const TimeWarpEvent &other) const
    {
        return (send_time == other.recv_time &&
                recv_time == other.send_time &&
                data == other.data &&
                sender_id == other.receiver_id &&
                receiver_id == other.sender_id &&
                is_anti_message != other.is_anti_message);
    }
};

struct EventQueueEntry
{
    TimeWarpEvent event;
    ap_uint<1> is_issued;
    ap_uint<16> next; // Pointer to the next event for the same LP
};

// struct DebugInfo
// {
//     ap_uint<16> size;
//     ap_uint<16> unissued_size;
//     ap_int<32> current_gvt;
//     ap_uint<16> free_head;
//     ap_uint<16> lp_heads[NUM_LPS];
//     ap_uint<16> lp_tails[NUM_LPS];
//     ap_uint<16> lp_oldest_unissued[NUM_LPS];
//     ap_uint<16> lp_youngest_issued[NUM_LPS];
// };

class EventQueue
{
public:
    EventQueueEntry buffer[EVENT_QUEUE_CAPACITY];
    ap_uint<16> lp_heads[NUM_LPS];
    ap_uint<16> lp_tails[NUM_LPS];
    ap_uint<16> lp_oldest_unissued[NUM_LPS];
    ap_uint<16> lp_youngest_issued[NUM_LPS];
    ap_uint<16> free_head;
    ap_uint<16> unissued_size;
    ap_uint<16> size;
    ap_int<32> current_gvt;

public:
    EventQueue() : size(0), unissued_size(0), current_gvt(0), free_head(0)
    {
        for (ap_uint<16> i = 0; i < NUM_LPS; ++i)
        {
            lp_heads[i] = 0xFFFF;
            lp_tails[i] = 0xFFFF;
            lp_oldest_unissued[i] = 0xFFFF;
            lp_youngest_issued[i] = 0xFFFF;
        }
        reset();
    }

    void reset()
    {
        size = 0;
        unissued_size = 0;
        current_gvt = 0;
        free_head = 0;

        for (ap_uint<16> i = 0; i < EVENT_QUEUE_CAPACITY - 1; ++i)
        {
            buffer[i].next = i + 1;
        }
        buffer[EVENT_QUEUE_CAPACITY - 1].next = 0xFFFF;

        for (ap_uint<16> i = 0; i < NUM_LPS; ++i)
        {
            lp_heads[i] = 0xFFFF;
            lp_tails[i] = 0xFFFF;
            lp_oldest_unissued[i] = 0xFFFF;
            lp_youngest_issued[i] = 0xFFFF;
        }
    }

    bool enqueue(const TimeWarpEvent &event)
    {
        if (size >= EVENT_QUEUE_CAPACITY)
            return false;

        ap_uint<16> new_entry = free_head;
        free_head = buffer[free_head].next;

        buffer[new_entry].event = event;
        buffer[new_entry].is_issued = 0;
        buffer[new_entry].next = 0xFFFF;

        ap_uint<16> lp_id = event.receiver_id;

        if (lp_oldest_unissued[lp_id] == 0xFFFF ||
            buffer[new_entry].event.recv_time < buffer[lp_oldest_unissued[lp_id]].event.recv_time)
        {
            lp_oldest_unissued[lp_id] = new_entry;
        }

        if (lp_heads[lp_id] == 0xFFFF)
        {
            lp_heads[lp_id] = new_entry;
            lp_tails[lp_id] = new_entry;
        }
        else
        {
            ap_uint<16> current = lp_heads[lp_id];
            ap_uint<16> prev = 0xFFFF;

            while (current != 0xFFFF && buffer[current].event.recv_time <= event.recv_time)
            {
#pragma HLS PIPELINE off
                prev = current;
                current = buffer[current].next;
            }

            if (prev == 0xFFFF)
            {
                buffer[new_entry].next = lp_heads[lp_id];
                lp_heads[lp_id] = new_entry;
            }
            else
            {
                buffer[new_entry].next = buffer[prev].next;
                buffer[prev].next = new_entry;

                if (prev == lp_tails[lp_id])
                {
                    lp_tails[lp_id] = new_entry;
                }
            }
        }

        unissued_size++;
        size++;

        return true;
    }

    EventQueueEntry dequeue()
    {
        if (size == 0)
            return EventQueueEntry{TimeWarpEvent(), 0, 0xFFFF}; // Sentinel

        ap_uint<16> earliest_lp = 0;
        ap_int<32> earliest_time = INT32_MAX;

        for (ap_uint<16> i = 0; i < NUM_LPS; ++i)
        {
            if (lp_heads[i] != 0xFFFF && buffer[lp_heads[i]].event.recv_time < earliest_time)
            {
                earliest_lp = i;
                earliest_time = buffer[lp_heads[i]].event.recv_time;
            }
        }

        ap_uint<16> dequeue_entry = lp_heads[earliest_lp];
        EventQueueEntry result = buffer[dequeue_entry];

        lp_heads[earliest_lp] = buffer[dequeue_entry].next;
        if (lp_heads[earliest_lp] == 0xFFFF)
        {
            lp_tails[earliest_lp] = 0xFFFF;
        }

        if (!buffer[dequeue_entry].is_issued)
        {
            lp_oldest_unissued[earliest_lp] = buffer[dequeue_entry].next;
            unissued_size--;
        }

        if (dequeue_entry == lp_youngest_issued[earliest_lp])
        {
            lp_youngest_issued[earliest_lp] = 0xFFFF;
        }

        buffer[dequeue_entry].next = free_head;
        free_head = dequeue_entry;

        size--;

        return result;
    }

    bool issue(TimeWarpEvent &event)
    {
        if (unissued_size == 0)
            return false;

        ap_uint<16> earliest_lp = 0;
        ap_int<32> earliest_time = INT32_MAX;

        for (ap_uint<16> i = 0; i < NUM_LPS; ++i)
        {
            if (lp_oldest_unissued[i] == 0xFFFF)
            {
                continue;
            }
            else
            {
                if (buffer[lp_oldest_unissued[i]].event.recv_time < earliest_time)
                {
                    earliest_lp = i;
                    earliest_time = buffer[lp_oldest_unissued[i]].event.recv_time;
                }
            }
        }

        ap_uint<16> issue_entry = lp_oldest_unissued[earliest_lp];
        event = buffer[issue_entry].event;
        EventQueueEntry &entry = buffer[issue_entry];
        buffer[issue_entry].is_issued = 1;
        
        // Update oldest_unissued
        lp_oldest_unissued[earliest_lp] = buffer[issue_entry].next;

        // Update youngest_issued
        lp_youngest_issued[earliest_lp] = issue_entry;

        unissued_size--;

        return true;
    }

    bool commit(ap_int<32> commit_time)
    {
        current_gvt = commit_time;

        for (ap_uint<16> lp_id = 0; lp_id < NUM_LPS; ++lp_id)
        {
#pragma HLS UNROLL
            while (lp_heads[lp_id] != 0xFFFF &&
                   buffer[lp_heads[lp_id]].event.recv_time <= commit_time)
            {
                // Update lp_heads
                ap_uint<16> commit_entry = lp_heads[lp_id];
                lp_heads[lp_id] = buffer[commit_entry].next;

                // Removed_entry should point to the previous free_head. New free_head should be the removed entry.
                buffer[commit_entry].next = free_head;
                free_head = commit_entry;

                // IMPORTANT: all commit entries should be already issued. Current testbench doesn't enforce this.
                // Update lp_youngest_issued
                if (commit_entry == lp_youngest_issued[lp_id])
                {
                    lp_youngest_issued[lp_id] = 0xFFFF;
                }

                // Update lp_tails
                if (lp_heads[lp_id] == 0xFFFF)
                {
                    lp_tails[lp_id] = 0xFFFF;
                }

                size--;
            }
        }

        return true;
    }

    bool rollback(ap_int<16> lp_id, ap_int<32> to_time)
    {
        ap_uint<16> current = lp_heads[lp_id];

        while (current != 0xFFFF)
        {
#pragma HLS DEPENDENCE variable = buffer inter false
            if (buffer[current].event.recv_time > to_time && buffer[current].is_issued)
            {
                buffer[current].is_issued = 0;
                unissued_size++;
                if (lp_oldest_unissued[lp_id] == 0xFFFF || buffer[lp_oldest_unissued[lp_id]].event.recv_time > buffer[current].event.recv_time)
                {
                    lp_oldest_unissued[lp_id] = current;
                }
            }
            current = buffer[current].next;
        }

        return true;
    }

    bool remove_matching_event(const TimeWarpEvent &anti_msg)
    {
        ap_uint<16> lp_id = anti_msg.receiver_id;
        ap_uint<16> current = lp_oldest_unissued[lp_id];
        ap_uint<16> prev = lp_youngest_issued[lp_id];
        while (current != 0xFFFF)
        {
#pragma HLS PIPELINE off
            if (buffer[current].event.is_matching_anti_message(anti_msg))
            {
                // Found the matching event. Remove this event
                if (prev != 0xFFFF) {
                    buffer[prev].next = buffer[current].next;
                } else {
                    lp_heads[lp_id] = buffer[current].next;
                }
                if (current == lp_tails[lp_id]) {
                    lp_tails[lp_id] = prev;
                }
                buffer[current].next = free_head;
                free_head = current;
                // Update lp_oldest_unissued
                if (lp_oldest_unissued[lp_id] == current)
                {
                    lp_oldest_unissued[lp_id] = buffer[current].next;
                }
                // Update size
                unissued_size--;
                size--;
                return true;
            }
            current = buffer[current].next;
        }
        return false;
    }

    ap_uint<16> get_size() const
    {
        return size;
    }

    ap_int<32> get_gvt() const
    {
        return current_gvt;
    }

    void print_event_queue() const
    {
        std::cout << "Event Queue State:" << std::endl;
        std::cout << "Total size: " << size << std::endl;
        std::cout << "Current GVT: " << current_gvt << std::endl;

        for (ap_uint<16> lp = 0; lp < NUM_LPS; ++lp)
        {
            std::cout << "\nLP " << lp << " (Head: " << lp_heads[lp]
                      << ", Tail: " << lp_tails[lp]
                      << ", Oldest Unissued: " << lp_oldest_unissued[lp] << "):" << std::endl;

            if (lp_heads[lp] == 0xFFFF)
            {
                std::cout << "  Empty" << std::endl;
                continue;
            }

            ap_uint<16> current = lp_heads[lp];
            ap_uint<16> count = 0;
            while (current != 0xFFFF)
            {
                const EventQueueEntry &entry = buffer[current];
                std::cout << "  [" << count << "] Index: " << current << "; ";
                std::cout << "      Event: "
                          << "recv_time=" << entry.event.recv_time << ", "
                          << "receiver_id=" << entry.event.receiver_id << "; ";
                std::cout << "      is_issued: " << entry.is_issued << "; ";
                std::cout << "      next: " << entry.next << std::endl;

                current = entry.next;
                count++;
            }
        }

        std::cout << "\nFree list head: " << free_head << std::endl
                  << std::endl;
        ;
    }
};

void event_queue_kernel(ap_uint<3> op, TimeWarpEvent event, ap_int<16> lp_id, ap_int<32> time, TimeWarpEvent &result_event, bool &success);

int test_event_queue();

#endif // EVENT_QUEUE_HPP
