#include "CommitControlDummy.hpp"

void commit_control_dummy_top(
    hls::stream<bool> &event_queue_full_stream,
    hls::stream<ap_int<32>> &commit_time_stream)
{
    int i = 0;
    bool event_queue_full = event_queue_full_stream.read();
    if (event_queue_full)
    {
        commit_time_stream.write(i);
        i += 1000;
    }
}