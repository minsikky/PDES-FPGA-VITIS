#ifndef COMMIT_CONTROL_DUMMY_HPP
#define COMMIT_CONTROL_DUMMY_HPP

#include <ap_int.h>
#include <hls_task.h>

void commit_control_dummy_top(
    hls::stream<bool> &event_queue_full_stream,
    hls::stream<ap_int<32>> &commit_time_stream);

#endif // COMMIT_CONTROL_DUMMY_HPP