#ifndef EVENT_HISTORY_HPP
#define EVENT_HISTORY_HPP

#include <sycl/sycl.hpp>
#include <sycl/ext/intel/fpga_extensions.hpp>
#include <array>
#include <cstdint>
#include "constants.hpp"
#include "EventQueue.hpp"

struct HistoryEntry
{
    TimeWarpEvent event;
    int next; // Index of next state for this LP, or -1 if none
};

class EventHistory
{
private:
    std::array<HistoryEntry, EVENT_HISTORY_CAPACITY> buffer;
    std::array<int, (int)(NUM_LPS / NUM_LPCORE)> lp_heads; // Index of most recent output event for each LP
    std::array<int, (int)(NUM_LPS / NUM_LPCORE)> lp_sizes; // Number of output events for each LP
    int free_list_head;                                    // Index of first free slot
    int32_t current_gvt;

public:
    EventHistory() : current_gvt(0)
    {
        // Initialize free list
        for (int i = 0; i < EVENT_HISTORY_CAPACITY - 1; ++i)
        {
            buffer[i].next = i + 1;
        }
        buffer[EVENT_HISTORY_CAPACITY - 1].next = -1;
        free_list_head = 0;

        // Initialize LP heads
        std::fill(lp_heads.begin(), lp_heads.end(), -1);
        std::fill(lp_sizes.begin(), lp_sizes.end(), 0);
    }

    bool push(const TimeWarpEvent &event)
    {
        if (free_list_head == -1)
            return false; // Buffer is full

        int new_index = free_list_head;
        free_list_head = buffer[free_list_head].next;

        buffer[new_index].event = event;
        buffer[new_index].next = lp_heads[event.lp_id];
        lp_heads[event.lp_id] = new_index;
        lp_sizes[event.lp_id]++;

        return true;
    }

    bool rollback(int lp_id, int32_t to_time, EventQueue &event_queue)
    {
        int current = lp_heads[lp_id];
        int prev = -1;
        while (current != -1 && buffer[current].event.recv_time > to_time)
        {
            event_queue.enqueue(buffer[current]);
            prev = current;
            current = buffer[current].next;
            lp_sizes[lp_id]--;
        }

        if (current == -1)
            return false; // No event found

        // Update head if necessary
        if (prev == -1)
        {
            lp_heads[lp_id] = current;
        }
        else
        {
            buffer[prev].next = -1;
        }

        // Return freed events to free list
        if (prev != -1)
        {
            int last = prev;
            while (buffer[last].next != -1)
                last = buffer[last].next;
            buffer[last].next = free_list_head;
            free_list_head = lp_heads[lp_id];
            lp_heads[lp_id] = current;
        }

        return true;
    }

    void commit(int32_t new_gvt)
    {
        if (new_gvt <= current_gvt)
            return; // GVT must increase

        current_gvt = new_gvt;

        for (int lp_id = 0; lp_id < NUM_LPS; ++lp_id)
        {
            int current = lp_heads[lp_id];
            int prev = -1;
            while (current != -1 && buffer[current].event.recv_time > new_gvt)
            {
                prev = current;
                current = buffer[current].next;
            }

            if (current != -1)
            {
                // Found an event to keep
                if (prev == -1)
                {
                    // The head event is the one to keep
                    continue;
                }

                // Free events older than GVT
                buffer[prev].next = -1;
                int last = current;
                while (buffer[last].next != -1)
                    last = buffer[last].next;
                buffer[last].next = free_list_head;
                free_list_head = current;

                // Update LP size
                int freed_events = 0;
                while (current != -1)
                {
                    freed_events++;
                    current = buffer[current].next;
                }
                lp_sizes[lp_id] -= freed_events;
            }
            else if (prev != -1)
            {
                // All events are older than GVT, keep only the most recent
                buffer[prev].next = free_list_head;
                free_list_head = current;
                buffer[prev].next = -1;
                lp_sizes[lp_id] = 1;
            }
            // If prev == -1 and current == -1, the LP has no events, so do nothing
        }
    }

    bool is_full() const
    {
        return free_list_head == -1;
    }

    int32_t get_gvt() const
    {
        return current_gvt;
    }
};

#endif // EVENT_HISTORY_HPP