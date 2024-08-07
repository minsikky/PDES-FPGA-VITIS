#include "LPCore.hpp"
#include "TimeWarpSimulation.hpp"

bool LPCore::send_event(const TimeWarpEvent &event) {
    return simulation->route_event(event);
}

TimeWarpEvent generate_new_event(VirtualLP &current_lp)
{
    // Wait for a random number of cycles
    uint32_t wait_cycles = xorshift32(current_lp.rng_state) % 100 + 1; // 1 to 100 cycles
    for (uint32_t i = 0; i < wait_cycles; ++i)
    {
        // In hardware, this would be implemented as a wait state
        sycl::ext::intel::fpga_reg(i);
    }

    // Generate a new event
    TimeWarpEvent new_event;
    new_event.time = current_lp.lvt + wait_cycles;
    new_event.data = xorshift32(current_lp.rng_state); // Random data
    new_event.sender_id = current_lp.id;
    new_event.receiver_id = xorshift32(current_lp.rng_state) % total_lps;
    new_event.is_anti_message = false;

    return new_event;
}

bool LPCore::process_events(queue &q)
{
    bool made_progress = false;
    q.submit([&](handler &h)
             { h.single_task<class ProcessEventsKernel>([=, &made_progress]()
                                                        {
                if (is_stalled) {
                    // Check if we can unstall
                    if (!lp_event_queues[current_lp_index].is_full() && 
                        !virtual_lps[current_lp_index].is_state_buffer_full()) {
                        is_stalled = false;
                    } else {
                        return;  // Still stalled, can't make progress
                    }
                }

                if (lp_event_queues[current_lp_index].empty()) {
                    // Move to next LP if current one has no events
                    current_lp_index = (current_lp_index + 1) % virtual_lps.size();
                    return;
                }

                TimeWarpEvent event = lp_event_queues[current_lp_index].dequeue();
                VirtualLP& current_lp = virtual_lps[current_lp_index];

                // Check if we can process this event
                if (current_lp.is_state_buffer_full()) {
                    // Can't save state, so we can't process the event
                    lp_event_queues[current_lp_index].enqueue(event);  // Put the event back
                    is_stalled = true;
                    return;
                }

                if (event.is_anti_message) {
                    process_anti_message(event);
                } else {
                    if (event.recv_time < current_lp.lvt) {
                        // Straggler event, initiate rollback
                        current_lp.rollback(event.recv_time);
                    }
                }

                // Process the event (existing logic)
                LPState new_state;
                new_state.id = current_lp.id;
                new_state.lvt = event.recv_time;
                
                // Wait for a random number of cycles
                uint32_t wait_cycles = xorshift32(current_lp.rng_state) % 100 + 1;  // 1 to 100 cycles
                for (uint32_t i = 0; i < wait_cycles; ++i) {
                    // In hardware, this would be implemented as a wait state
                    sycl::ext::intel::fpga_reg(i);
                }

                // Generate new event
                TimeWarpEvent new_event = generate_new_event(current_lp);

                // Try to enqueue the new event to the receiver's queue
                if (!enqueue_event(new_event)) {
                    // Receiver's queue is full, we need to stall
                    is_stalled = true;
                    // Rollback the current LP to undo the event processing
                    current_lp.rollback(current_lp.lvt);
                    // Put the original event back in the queue
                    lp_event_queues[current_lp_index].enqueue(event);
                    return;
                }

                // Save the new state
                current_lp.save_state();

                // Move to next LP
                current_lp_index = (current_lp_index + 1) % virtual_lps.size();

                made_progress = true; }); });
    q.wait();
    return made_progress;
}

bool LPCore::is_matching_event(const TimeWarpEvent& e1, const TimeWarpEvent& e2) {
    return e1.time == e2.time && 
           e1.data == e2.data && 
           e1.sender_id == e2.sender_id && 
           e1.receiver_id == e2.receiver_id && 
           e1.is_anti_message != e2.is_anti_message;
}

void LPCore::trigger_rollback(VirtualLP& lp, int32_t rollback_time) {
    // Store the current LVT before rollback
    int32_t old_lvt = lp.lvt;

    // Perform the rollback on the VirtualLP
    lp.rollback(rollback_time);

    // Generate and process anti-messages for events sent after the rollback point
    for (auto it = lp.output_queue.rbegin(); it != lp.output_queue.rend(); ++it) {
        if (it->time > rollback_time && it->time <= old_lvt) {
            TimeWarpEvent anti_msg = *it;
            anti_msg.is_anti_message = true;
            
            // Enqueue the anti-message to the appropriate LP's queue
            int receiver_lp_index = anti_msg.receiver_id % virtual_lps.size();
            if (!lp_event_queues[receiver_lp_index].enqueue(anti_msg)) {
                // Handle queue full scenario
                // For now, we'll just print an error message
                // In a real implementation, you might want to implement a more robust strategy
                std::cerr << "Error: Unable to enqueue anti-message due to full queue" << std::endl;
            }
        } else if (it->time <= rollback_time) {
            // We've reached events that don't need to be rolled back
            break;
        }
    }

    // Clear the output queue of events after the rollback point
    lp.output_queue.erase(
        std::remove_if(lp.output_queue.begin(), lp.output_queue.end(),
            [rollback_time](const TimeWarpEvent& e) { return e.time > rollback_time; }),
        lp.output_queue.end()
    );

    // Reprocess events in the input queue that are after the rollback time
    std::vector<TimeWarpEvent> events_to_reprocess;
    while (!lp_event_queues[lp.id % virtual_lps.size()].empty()) {
        TimeWarpEvent event = lp_event_queues[lp.id % virtual_lps.size()].dequeue();
        if (event.time >= rollback_time) {
            events_to_reprocess.push_back(event);
        }
    }

    // Re-enqueue events to be reprocessed
    for (const auto& event : events_to_reprocess) {
        lp_event_queues[lp.id % virtual_lps.size()].enqueue(event);
    }
}

void LPCore::process_anti_message(const TimeWarpEvent& anti_msg) {
    int lp_index = anti_msg.receiver_id % virtual_lps.size();
    VirtualLP& target_lp = virtual_lps[lp_index];
    FPGAPriorityQueue& target_queue = lp_event_queues[lp_index];

    // Search for the matching event in the heap
    int match_index = -1;
    for (int i = 0; i < target_queue.size; ++i) {
        if (is_matching_event(target_queue.heap[i], anti_msg)) {
            match_index = i;
            break;
        }
    }

    if (match_index != -1) {
        // Found a matching event, remove it and maintain heap property
        target_queue.size--;
        if (match_index < target_queue.size) {
            // Replace the removed event with the last event in the heap
            target_queue.heap[match_index] = target_queue.heap[target_queue.size];
            // Sift down to maintain heap property
            target_queue.siftDown(match_index);
        }
    } else {
        // If the message wasn't found, it means it was already processed
        // We need to trigger a rollback
        trigger_rollback(target_lp, anti_msg.time);
    }
}

void LPCore::optimize_event_queue()
{
    // Implement logic to optimize the event queue
    // This could involve reordering, pruning, or other FPGA-specific optimizations
}

void LPCore::configure_fpga_optimizations()
{
    // Set up FPGA-specific optimizations
    // This could involve pipelining, parallelization, or custom hardware structures
}