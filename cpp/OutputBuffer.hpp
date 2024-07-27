#ifndef OUTPUT_BUFFER_HPP
#define OUTPUT_BUFFER_HPP

#include <sycl/sycl.hpp>
#include <sycl/ext/intel/fpga_extensions.hpp>
#include <array>
#include "constants.hpp"
#include "EventQueue.hpp"

using namespace sycl;

struct OutputEntry
{
    TimeWarpEvent event;
    int next; // Index of next outpuut event for this LP, or -1 if none
};

// A linked-list implementation of output buffer
class OutputBuffer : public TimeWarpSimulation
{
private:
    std::array<OutputEntry, OUTPUT_BUFFER_CAPACITY> buffer;
    std::array<int, (int)(NUM_LPS / NUM_LPCORE)> lp_heads; // Index of most recent output event for each LP
    std::array<int, (int)(NUM_LPS / NUM_LPCORE)> lp_sizes; // Number of output events for each LP
    int free_list_head;                                    // Index of first free slot
    int32_t current_gvt;

    bool remove_events(int lp_id, std::function<bool(const TimeWarpEvent &)> condition, bool is_rollback)
    {
        int current = lp_heads[lp_id];
        int prev = -1;
        while (current != -1 && condition(buffer[current].event))
        {
            if (is_rollback) { // Send anti-message
                TimeWarpEvent anti_msg = current.event;
                anti_msg.is_anti_message = true;
                int receiver_lpcore_index = anti_msg.receiver_id % NUM_LPCORE;
                if (!lpcores[receiver_lpcore_index].enqueue_event(anti_msg))
                {
                    // Handle queue full scenario
                    // For now, we'll just print an error message
                    // In a real implementation, you might want to implement a more robust strategy
                    std::cerr << "Error: Unable to enqueue anti-message due to full queue" << std::endl;
                }
            }
            prev = current;
            current = buffer[current].next;
            lp_sizes[lp_id]--;
        }

        if (current == -1 && prev == -1)
            return false; // No events to remove

        // Update head if necessary
        if (prev == -1)
        {
            lp_heads[lp_id] = current;
        }
        else
        {
            buffer[prev].next = -1;
        }

        // Return freed outputs to free list
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

public:
    OutputBuffer() : current_gvt(0)
    {
        // Initialize free list
        for (int i = 0; i < OUTPUT_BUFFER_CAPACITY - 1; ++i)
        {
            buffer[i].next = i + 1;
        }
        buffer[OUTPUT_BUFFER_CAPACITY - 1].next = -1;
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
        buffer[new_index].next = lp_heads[event.sender_id];
        lp_heads[event.sender_id] = new_index;
        lp_sizes[event.sender_id]++;

        return true;
    }

    bool rollback(int lp_id, int32_t to_time)
    {
        for (auto it = lp.output_queue.rbegin(); it != lp.output_queue.rend(); ++it)
        {
            if (it->time > rollback_time && it->time <= old_lvt)
            {
                TimeWarpEvent anti_msg = *it;
                anti_msg.is_anti_message = true;

                // Enqueue the anti-message to the appropriate LP's queue
                int receiver_lp_index = anti_msg.receiver_id % virtual_lps.size();
                if (!lp_event_queues[receiver_lp_index].enqueue(anti_msg))
                {
                    // Handle queue full scenario
                    // For now, we'll just print an error message
                    // In a real implementation, you might want to implement a more robust strategy
                    std::cerr << "Error: Unable to enqueue anti-message due to full queue" << std::endl;
                }
            }
            else if (it->time <= rollback_time)
            {
                // We've reached events that don't need to be rolled back
                break;
            }
        }

        return remove_events(lp_id, [to_time](const TimeWarpEvent &event)
                             { return event.send_time > to_time; });
    }

    void commit(int32_t new_gvt)
    {
        if (new_gvt <= current_gvt)
            return; // GVT must increase

        current_gvt = new_gvt;

        for (int lp_id = 0; lp_id < NUM_LPS; ++lp_id)
        {
            remove_events(lp_id, [new_gvt](const TimeWarpEvent &event)
                          { return event.send_time > new_gvt; });
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

#endif // OUTPUT_BUFFER_HPP