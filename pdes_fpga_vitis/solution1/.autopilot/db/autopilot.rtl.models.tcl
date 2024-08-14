set SynModuleInfo {
  {SRCNAME commit_Pipeline_VITIS_LOOP_237_2 MODELNAME commit_Pipeline_VITIS_LOOP_237_2 RTLNAME lpcore_top_commit_Pipeline_VITIS_LOOP_237_2
    SUBMODULES {
      {MODELNAME lpcore_top_flow_control_loop_pipe_sequential_init RTLNAME lpcore_top_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME lpcore_top_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME commit_Pipeline_VITIS_LOOP_237_21 MODELNAME commit_Pipeline_VITIS_LOOP_237_21 RTLNAME lpcore_top_commit_Pipeline_VITIS_LOOP_237_21}
  {SRCNAME commit_Pipeline_VITIS_LOOP_237_22 MODELNAME commit_Pipeline_VITIS_LOOP_237_22 RTLNAME lpcore_top_commit_Pipeline_VITIS_LOOP_237_22}
  {SRCNAME commit_Pipeline_VITIS_LOOP_237_23 MODELNAME commit_Pipeline_VITIS_LOOP_237_23 RTLNAME lpcore_top_commit_Pipeline_VITIS_LOOP_237_23}
  {SRCNAME commit MODELNAME commit RTLNAME lpcore_top_commit}
  {SRCNAME event_queue_top<0>_Pipeline_VITIS_LOOP_205_1 MODELNAME event_queue_top_0_Pipeline_VITIS_LOOP_205_1 RTLNAME lpcore_top_event_queue_top_0_Pipeline_VITIS_LOOP_205_1}
  {SRCNAME enqueue MODELNAME enqueue RTLNAME lpcore_top_enqueue}
  {SRCNAME event_queue_top<0>_Pipeline_VITIS_LOOP_271_1 MODELNAME event_queue_top_0_Pipeline_VITIS_LOOP_271_1 RTLNAME lpcore_top_event_queue_top_0_Pipeline_VITIS_LOOP_271_1}
  {SRCNAME event_queue_top<0> MODELNAME event_queue_top_0_s RTLNAME lpcore_top_event_queue_top_0_s
    SUBMODULES {
      {MODELNAME lpcore_top_event_queue_top_0_s_event_queue_buffer_event_data_V_RAM_AUTO_1R1W RTLNAME lpcore_top_event_queue_top_0_s_event_queue_buffer_event_data_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME lpcore_top_event_queue_top_0_s_event_queue_buffer_event_is_anti_message_V_RAM_AUTO_1R1W RTLNAME lpcore_top_event_queue_top_0_s_event_queue_buffer_event_is_anti_message_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME lpcore_top_event_queue_top_0_s_event_queue_buffer_event_receiver_id_V_RAM_AUTO_1R1W RTLNAME lpcore_top_event_queue_top_0_s_event_queue_buffer_event_receiver_id_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME lpcore_top_event_queue_top_0_s_event_queue_buffer_event_recv_time_V_RAM_AUTO_1R1W RTLNAME lpcore_top_event_queue_top_0_s_event_queue_buffer_event_recv_time_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME lpcore_top_event_queue_top_0_s_event_queue_buffer_next_V_RAM_AUTO_1R1W RTLNAME lpcore_top_event_queue_top_0_s_event_queue_buffer_next_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME lpcore_top_event_queue_top_0_s_event_queue_lp_heads_V_RAM_AUTO_1R1W RTLNAME lpcore_top_event_queue_top_0_s_event_queue_lp_heads_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME lpcore_top_event_queue_top_0_s_event_queue_lp_oldest_unissued_V_RAM_AUTO_1R1W RTLNAME lpcore_top_event_queue_top_0_s_event_queue_lp_oldest_unissued_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME lpcore_top_event_queue_top_0_s_event_queue_lvt_V_RAM_AUTO_1R1W RTLNAME lpcore_top_event_queue_top_0_s_event_queue_lvt_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME state_buffer_top<0>_Pipeline_VITIS_LOOP_131_1 MODELNAME state_buffer_top_0_Pipeline_VITIS_LOOP_131_1 RTLNAME lpcore_top_state_buffer_top_0_Pipeline_VITIS_LOOP_131_1}
  {SRCNAME state_buffer_top<0> MODELNAME state_buffer_top_0_s RTLNAME lpcore_top_state_buffer_top_0_s
    SUBMODULES {
      {MODELNAME lpcore_top_state_buffer_top_0_s_state_buffer_lp_sizes_V_RAM_AUTO_1R1W RTLNAME lpcore_top_state_buffer_top_0_s_state_buffer_lp_sizes_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME process_event MODELNAME process_event RTLNAME lpcore_top_process_event
    SUBMODULES {
      {MODELNAME lpcore_top_process_event_event_processor_prng_ROM_AUTO_1R RTLNAME lpcore_top_process_event_event_processor_prng_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME lpcore_top_process_event_g_multi_prng_generators_state_V_RAM_AUTO_1R1W RTLNAME lpcore_top_process_event_g_multi_prng_generators_state_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME event_processor_top<0> MODELNAME event_processor_top_0_s RTLNAME lpcore_top_event_processor_top_0_s}
  {SRCNAME cancellation_unit_top<0>_Pipeline_VITIS_LOOP_58_1 MODELNAME cancellation_unit_top_0_Pipeline_VITIS_LOOP_58_1 RTLNAME lpcore_top_cancellation_unit_top_0_Pipeline_VITIS_LOOP_58_1}
  {SRCNAME cancellation_unit_top<0> MODELNAME cancellation_unit_top_0_s RTLNAME lpcore_top_cancellation_unit_top_0_s
    SUBMODULES {
      {MODELNAME lpcore_top_cancellation_unit_top_0_s_cancellation_unit_buffer_event_recv_time_V_RAM_AUTObkb RTLNAME lpcore_top_cancellation_unit_top_0_s_cancellation_unit_buffer_event_recv_time_V_RAM_AUTObkb BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME lpcore_top_cancellation_unit_top_0_s_cancellation_unit_buffer_event_data_V_RAM_AUTO_1R1W RTLNAME lpcore_top_cancellation_unit_top_0_s_cancellation_unit_buffer_event_data_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME lpcore_top_cancellation_unit_top_0_s_cancellation_unit_buffer_event_sender_id_V_RAM_AUTOcud RTLNAME lpcore_top_cancellation_unit_top_0_s_cancellation_unit_buffer_event_sender_id_V_RAM_AUTOcud BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME lpcore_top_cancellation_unit_top_0_s_cancellation_unit_buffer_next_V_RAM_AUTO_1R1W RTLNAME lpcore_top_cancellation_unit_top_0_s_cancellation_unit_buffer_next_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME rollback_control_top MODELNAME rollback_control_top RTLNAME lpcore_top_rollback_control_top}
  {SRCNAME lpcore_kernel<0> MODELNAME lpcore_kernel_0_s RTLNAME lpcore_top_lpcore_kernel_0_s
    SUBMODULES {
      {MODELNAME lpcore_top_fifo_w48_d2_S RTLNAME lpcore_top_fifo_w48_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME lpcore_top_fifo_w129_d2_S RTLNAME lpcore_top_fifo_w129_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME lpcore_top_fifo_w80_d2_S RTLNAME lpcore_top_fifo_w80_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME lpcore_top_fifo_w209_d2_S RTLNAME lpcore_top_fifo_w209_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME {$InstName}}
    }
  }
  {SRCNAME lpcore_top MODELNAME lpcore_top RTLNAME lpcore_top IS_TOP 1}
}
