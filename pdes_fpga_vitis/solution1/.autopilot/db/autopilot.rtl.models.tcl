set SynModuleInfo {
  {SRCNAME rollback_Pipeline_VITIS_LOOP_35_1 MODELNAME rollback_Pipeline_VITIS_LOOP_35_1 RTLNAME event_history_kernel_rollback_Pipeline_VITIS_LOOP_35_1}
  {SRCNAME rollback MODELNAME rollback RTLNAME event_history_kernel_rollback
    SUBMODULES {
      {MODELNAME event_history_kernel_rollback_event_queue_heap_send_time_V_RAM_AUTO_1R1W RTLNAME event_history_kernel_rollback_event_queue_heap_send_time_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME event_history_kernel_rollback_event_queue_heap_sender_id_V_RAM_AUTO_1R1W RTLNAME event_history_kernel_rollback_event_queue_heap_sender_id_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME event_history_kernel_rollback_event_queue_heap_is_anti_message_V_RAM_AUTO_1R1W RTLNAME event_history_kernel_rollback_event_queue_heap_is_anti_message_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME event_history_kernel_Pipeline_VITIS_LOOP_94_2 MODELNAME event_history_kernel_Pipeline_VITIS_LOOP_94_2 RTLNAME event_history_kernel_event_history_kernel_Pipeline_VITIS_LOOP_94_2
    SUBMODULES {
      {MODELNAME event_history_kernel_flow_control_loop_pipe_sequential_init RTLNAME event_history_kernel_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME event_history_kernel_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME event_history_kernel MODELNAME event_history_kernel RTLNAME event_history_kernel IS_TOP 1
    SUBMODULES {
      {MODELNAME event_history_kernel_history_buffer_next_V_RAM_AUTO_1R1W RTLNAME event_history_kernel_history_buffer_next_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME event_history_kernel_history_buffer_event_send_time_V_RAM_AUTO_1R1W RTLNAME event_history_kernel_history_buffer_event_send_time_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME event_history_kernel_history_buffer_event_sender_id_V_RAM_AUTO_1R1W RTLNAME event_history_kernel_history_buffer_event_sender_id_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME event_history_kernel_history_buffer_event_is_anti_message_V_RAM_AUTO_1R1W RTLNAME event_history_kernel_history_buffer_event_is_anti_message_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME event_history_kernel_history_lp_heads_V_RAM_AUTO_1R1W RTLNAME event_history_kernel_history_lp_heads_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
}
