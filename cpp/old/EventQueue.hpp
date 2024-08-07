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

class EventQueue
{
private:
    TimeWarpEvent heap[EVENT_QUEUE_CAPACITY];
    ap_uint<16> size;

public:
    EventQueue() : size(0) {}

    void siftUp(ap_uint<16> index)
    {
#pragma HLS INLINE
        TimeWarpEvent temp = heap[index];
        for (int i = 0; i < EVENT_QUEUE_CAPACITY; i++)
        {
            if (index == 0)
                break;
            ap_uint<16> parent = (index - 1) / 2;
            if (temp < heap[parent])
            {
                heap[index] = heap[parent];
                index = parent;
            }
            else
            {
                break;
            }
        }
        heap[index] = temp;
    }

    void siftDown(ap_uint<16> index)
    {
#pragma HLS INLINE
        TimeWarpEvent temp = heap[index];
        while (true)
        {
            ap_uint<16> child = 2 * index + 1;
            if (child >= size)
                break;
            if (child + 1 < size && heap[child + 1] < heap[child])
            {
                child++;
            }
            if (heap[child] < temp)
            {
                heap[index] = heap[child];
                index = child;
            }
            else
            {
                break;
            }
        }
        heap[index] = temp;
    }

    bool enqueue(const TimeWarpEvent &event)
    {
#pragma HLS INLINE
        if (is_full())
            return false;

        heap[size] = event;
        siftUp(size);
        size++;
        return true;
    }

    TimeWarpEvent dequeue()
    {
#pragma HLS INLINE
        if (empty())
            return TimeWarpEvent{INT32_MAX, 0, 0, 0, 0, 0}; // Sentinel

        TimeWarpEvent top = heap[0];
        size--;
        if (size > 0)
        {
            heap[0] = heap[size];
            siftDown(0);
        }
        return top;
    }

    TimeWarpEvent peek() const
    {
#pragma HLS INLINE
        return heap[0];
    }

    bool empty() const
    {
#pragma HLS INLINE
        return size == 0;
    }

    bool is_full() const
    {
#pragma HLS INLINE
        return size == EVENT_QUEUE_CAPACITY;
    }

    bool remove_matching_event(const TimeWarpEvent &anti_msg)
    {
#pragma HLS INLINE
        for (ap_uint<16> i = 0; i < size; i++)
        {
            if (heap[i].is_matching_anti_message(anti_msg))
            {
                size--;
                if (size > 0)
                {
                    heap[i] = heap[size];
                    siftDown(i);
                }
                return true;
            }
        }
        return false;
    }
};

struct EventQueueInput
{
    bool is_enqueue;
    TimeWarpEvent event;
};

void event_queue_kernel(EventQueueInput &input, TimeWarpEvent &output_event, bool &success);

void run_event_queue_kernel(const TimeWarpEvent input_events[NUM_EVENTS], TimeWarpEvent output_events[NUM_EVENTS], int &output_size);

int test_event_queue();

#endif // EVENT_QUEUE_HPP
