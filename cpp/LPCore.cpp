#include "LPCore.hpp"
#include "TimeWarpSimulation.hpp"

LPCore::LPCore(ap_uint<8> lpcore_id) : lpcore_id(lpcore_id), event_processor(EventProcessor(lpcore_id))
{
    current_lp_index = -1;
    event_queue = EventQueue();
    state_buffer = StateBuffer();
    cancellation_unit = CancellationUnit();
    event_processor = EventProcessor(lpcore_id);
    // event_router = EventRouter(simulation);

    constexpr int LPS_PER_CORE = NUM_LPS / NUM_LPCORE;

    for (int i = 0; i < LPS_PER_CORE; ++i)
    {
        int global_lp_id = lpcore_id + NUM_LPCORE * i;
        virtual_lps[i] = VirtualLP(global_lp_id, global_lp_id + 1);
    }

    // stall_signal.write(false);
}

// void LPCore::init()
// {
//     current_lp_index = -1;
//     event_queue = EventQueue();
//     state_buffer = StateBuffer();
//     cancellation_unit = CancellationUnit(anti_message_stream[lpcore_id]);
//     event_processor = EventProcessor(lpcore_id);
//     // event_router = EventRouter(simulation);

//     constexpr int LPS_PER_CORE = NUM_LPS / NUM_LPCORE;

//     for (int i = 0; i < LPS_PER_CORE; ++i)
//     {
//         int global_lp_id = lpcore_id + NUM_LPCORE * i;
//         virtual_lps[i] = VirtualLP(global_lp_id, global_lp_id + 1);
//     }

//     stall_signal.write(false);
// }

bool LPCore::recv_event(const TimeWarpEvent &event)
{
    if (event.is_anti_message)
    {
        return process_anti_message(event);
    }
    else
    {
        if (event.recv_time < virtual_lps[event.receiver_id % NUM_LPCORE].lvt)
        {
            RollbackInfo rollback_info = {event.receiver_id, event.recv_time};
            trigger_rollback(rollback_info);
        }

        if (!event_queue.enqueue(event, causality_violation_stream))
        {
            // stall_signal.write(true);
            return false;
        }
        return true;
    }
}

void LPCore::trigger_rollback(RollbackInfo &rollback_info)
{
    state_buffer.rollback(rollback_info);
    event_queue.rollback(rollback_info);
    cancellation_unit.rollback(rollback_info, cancellation_unit_output_stream);
    int idx = LPMapping::get_core_id(rollback_info.lp_id);
    virtual_lps[idx].lvt = rollback_info.to_time;
}

bool LPCore::process_anti_message(const TimeWarpEvent &anti_msg)
{
    if (!event_queue.process_anti_message(anti_msg))
    {
        RollbackInfo rollback_info = {anti_msg.receiver_id, anti_msg.recv_time};
        trigger_rollback(rollback_info);
    }
    return true;
}

bool LPCore::enqueue_event(const TimeWarpEvent &event)
{
    return event_queue.enqueue(event, causality_violation_stream);
}

bool LPCore::is_assigned_lp(ap_uint<16> lp_id) const
{
    return lp_id % NUM_LPCORE == lpcore_id;
}

void lpcore_top(
    // INITIALIZATION
    hls::stream<TimeWarpEvent> &init_event_stream,
    // TO SIGNAL EVENT QUEUE FULL
    hls::stream<bool> &event_queue_full_stream,
    // INPUTS TO EVENT QUEUE
    hls::stream<TimeWarpEvent> &anti_message_stream,
    hls::stream<TimeWarpEvent> &enqueue_event_stream,
    // OUTPUT OF THE LPCORE
    hls::stream<TimeWarpEvent> &output_event_stream,
    hls::stream<TimeWarpEvent> &cancellation_unit_output_stream,
    // COMMIT SIGNAL FROM GLOBAL CONTROLLER
    hls::stream<ap_int<32>> &lpcore_commit_time_stream)
{
    lpcore_kernel<0>(
        init_event_stream,
        event_queue_full_stream,
        anti_message_stream,
        enqueue_event_stream,
        output_event_stream,
        cancellation_unit_output_stream,
        lpcore_commit_time_stream);
}

void test_lpcore()
{
    hls::stream<bool> success_stream;
    // lpcore_kernel(0, success_stream);
}
