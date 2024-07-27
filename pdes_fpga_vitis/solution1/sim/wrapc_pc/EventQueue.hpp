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
};

class EventQueue {
private:
    TimeWarpEvent heap[EVENT_QUEUE_CAPACITY];
    ap_uint<16> size;

public:
    EventQueue() : size(0) {}

    void siftUp(ap_uint<16> index) {
        #pragma HLS INLINE
        TimeWarpEvent temp = heap[index];
        for (int i = 0; i < EVENT_QUEUE_CAPACITY; i++) {
            if (index == 0) break;
            ap_uint<16> parent = (index - 1) / 2;
            if (temp.recv_time < heap[parent].recv_time) {
                heap[index] = heap[parent];
                index = parent;
            } else {
                break;
            }
        }
        heap[index] = temp;
    }

    void siftDown(ap_uint<16> index) {
        #pragma HLS INLINE
        TimeWarpEvent temp = heap[index];
        while (true) {
            ap_uint<16> child = 2 * index + 1;
            if (child >= size) break;
            if (child + 1 < size && heap[child + 1].recv_time < heap[child].recv_time) {
                child++;
            }
            if (heap[child].recv_time < temp.recv_time) {
                heap[index] = heap[child];
                index = child;
            } else {
                break;
            }
        }
        heap[index] = temp;
    }

    bool enqueue(const TimeWarpEvent& event) {
        #pragma HLS INLINE
        if (is_full(event.is_anti_message)) return false;
        
        heap[size] = event;
        siftUp(size);
        size++;
        return true;
    }

    TimeWarpEvent dequeue() {
        #pragma HLS INLINE
        if (empty()) return TimeWarpEvent{INT32_MAX, 0, 0, 0, 0, 0};  // Sentinel
        
        TimeWarpEvent top = heap[0];
        size--;
        if (size > 0) {
            heap[0] = heap[size];
            siftDown(0);
        }
        return top;
    }

    TimeWarpEvent peek() const {
        #pragma HLS INLINE
        return heap[0];
    }

    bool empty() const {
        #pragma HLS INLINE
        return size == 0;
    }
    
    bool is_full(ap_uint<1> is_anti_message) const {
        #pragma HLS INLINE
        return size >= (EVENT_QUEUE_CAPACITY - (ANTI_MSG_RESERVE & ~is_anti_message));
    }
};

void event_queue_kernel(
    hls::stream<TimeWarpEvent>& input_stream,
    hls::stream<TimeWarpEvent>& output_stream,
    ap_uint<16> num_events
);

void run_event_queue_kernel(
    const std::vector<TimeWarpEvent>& input_events,
    std::vector<TimeWarpEvent>& output_events
);

int test_event_queue();

#endif // EVENT_QUEUE_HPP
