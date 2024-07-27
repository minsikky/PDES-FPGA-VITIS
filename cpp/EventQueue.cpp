#include "EventQueue.hpp"

// Global EventQueue instance
EventQueue g_event_queue;

struct EventQueueInput {
    bool is_enqueue;
    TimeWarpEvent event;
};

void event_queue_kernel(
    EventQueueInput& input,
    TimeWarpEvent& output_event,
    bool& success
) {
    #pragma HLS INTERFACE ap_vld port=input
    #pragma HLS INTERFACE ap_vld port=output_event
    #pragma HLS INTERFACE ap_vld port=success

    if (input.is_enqueue) {
        success = g_event_queue.enqueue(input.event);
    } else {
        output_event = g_event_queue.dequeue();
        success = (output_event.recv_time != INT32_MAX);  // Check if a valid event was dequeued
    }
}

void run_event_queue_kernel(
    const TimeWarpEvent input_events[NUM_EVENTS],
    TimeWarpEvent output_events[NUM_EVENTS],
    int& output_size
) {
    EventQueueInput input;
    TimeWarpEvent output_event;
    bool success;

    // Enqueue phase
    input.is_enqueue = true;
    for (int i = 0; i < NUM_EVENTS; ++i) {
        input.event = input_events[i];
        event_queue_kernel(input, output_event, success);
        if (!success) {
            std::cout << "Failed to enqueue event" << std::endl;
        }
    }

    // Dequeue phase
    input.is_enqueue = false;
    output_size = 0;
    for (int i = 0; i < NUM_EVENTS; ++i) {
        event_queue_kernel(input, output_event, success);
        if (success) {
            output_events[output_size++] = output_event;
        } else {
            std::cout << "Failed to dequeue event" << std::endl;
            break;
        }
    }
}

int test_event_queue() {
    // Prepare input data
    TimeWarpEvent input_events[NUM_EVENTS];
    TimeWarpEvent output_events[NUM_EVENTS];
    int output_size;

    // Generate random events
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> time_dis(1, 10000);
    std::uniform_int_distribution<> id_dis(0, 255);  // Assuming 8-bit IDs
    std::uniform_int_distribution<> anti_msg_dis(0, 1);

    for (int i = 0; i < NUM_EVENTS; ++i) {
        input_events[i] = TimeWarpEvent{
            time_dis(gen),      // send_time
            time_dis(gen),      // recv_time
            i,                  // data
            id_dis(gen),        // sender_id
            id_dis(gen),        // receiver_id
            (ap_uint<1>)anti_msg_dis(gen)  // is_anti_message
        };
    }

    // Run the event queue kernel
    run_event_queue_kernel(input_events, output_events, output_size);

    // Check if the dequeued events are sorted
    bool is_sorted = true;
    for (int i = 1; i < output_size; ++i) {
        if (output_events[i].recv_time < output_events[i-1].recv_time) {
            is_sorted = false;
            std::cout << "Sorting error at index " << i << ":\n";
            std::cout << "Event[" << i-1 << "]: "
                      << "{send_time: " << output_events[i-1].send_time
                      << ", recv_time: " << output_events[i-1].recv_time
                      << ", data: " << output_events[i-1].data
                      << ", sender_id: " << output_events[i-1].sender_id
                      << ", receiver_id: " << output_events[i-1].receiver_id
                      << ", is_anti_message: " << output_events[i-1].is_anti_message << "}\n";
            std::cout << "Event[" << i << "]: "
                      << "{send_time: " << output_events[i].send_time
                      << ", recv_time: " << output_events[i].recv_time
                      << ", data: " << output_events[i].data
                      << ", sender_id: " << output_events[i].sender_id
                      << ", receiver_id: " << output_events[i].receiver_id
                      << ", is_anti_message: " << output_events[i].is_anti_message << "}\n";
            break;
        }
    }

    if (is_sorted) {
        std::cout << "All dequeued events are correctly sorted by receive time!\n";
    } else {
        std::cout << "Dequeued events are not correctly sorted.\n";
    }

    // Print first few events to verify sorting
    std::cout << "\nFirst 10 events after sorting:\n";
    for (int i = 0; i < std::min(10, NUM_EVENTS); ++i) {
        std::cout << "Event[" << i << "]: "
                  << "{send_time: " << output_events[i].send_time
                  << ", recv_time: " << output_events[i].recv_time
                  << ", data: " << output_events[i].data
                  << ", sender_id: " << output_events[i].sender_id
                  << ", receiver_id: " << output_events[i].receiver_id
                  << ", is_anti_message: " << output_events[i].is_anti_message << "}\n";
    }

    // Print last few events
    std::cout << "\nLast 10 events after sorting:\n";
    for (int i = std::max(0, NUM_EVENTS - 10); i < NUM_EVENTS; ++i) {
        std::cout << "Event[" << i << "]: "
                  << "{send_time: " << output_events[i].send_time
                  << ", recv_time: " << output_events[i].recv_time
                  << ", data: " << output_events[i].data
                  << ", sender_id: " << output_events[i].sender_id
                  << ", receiver_id: " << output_events[i].receiver_id
                  << ", is_anti_message: " << output_events[i].is_anti_message << "}\n";
    }

    return 0;
}
