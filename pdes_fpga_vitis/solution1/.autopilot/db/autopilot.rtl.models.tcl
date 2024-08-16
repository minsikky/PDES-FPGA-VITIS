set SynModuleInfo {
  {SRCNAME lpcore_rollback_control MODELNAME lpcore_rollback_control RTLNAME simulation_top_lpcore_rollback_control}
  {SRCNAME lpcore_commit_control MODELNAME lpcore_commit_control RTLNAME simulation_top_lpcore_commit_control}
  {SRCNAME lpcore_control_top<0> MODELNAME lpcore_control_top_0_s RTLNAME simulation_top_lpcore_control_top_0_s}
  {SRCNAME commit_Pipeline_VITIS_LOOP_237_2 MODELNAME commit_Pipeline_VITIS_LOOP_237_2 RTLNAME simulation_top_commit_Pipeline_VITIS_LOOP_237_2
    SUBMODULES {
      {MODELNAME simulation_top_flow_control_loop_pipe_sequential_init RTLNAME simulation_top_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME simulation_top_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME commit_Pipeline_VITIS_LOOP_237_21 MODELNAME commit_Pipeline_VITIS_LOOP_237_21 RTLNAME simulation_top_commit_Pipeline_VITIS_LOOP_237_21}
  {SRCNAME commit_Pipeline_VITIS_LOOP_237_22 MODELNAME commit_Pipeline_VITIS_LOOP_237_22 RTLNAME simulation_top_commit_Pipeline_VITIS_LOOP_237_22}
  {SRCNAME commit_Pipeline_VITIS_LOOP_237_23 MODELNAME commit_Pipeline_VITIS_LOOP_237_23 RTLNAME simulation_top_commit_Pipeline_VITIS_LOOP_237_23}
  {SRCNAME commit MODELNAME commit RTLNAME simulation_top_commit}
  {SRCNAME event_queue_top<0>_Pipeline_VITIS_LOOP_205_1 MODELNAME event_queue_top_0_Pipeline_VITIS_LOOP_205_1 RTLNAME simulation_top_event_queue_top_0_Pipeline_VITIS_LOOP_205_1}
  {SRCNAME enqueue MODELNAME enqueue RTLNAME simulation_top_enqueue}
  {SRCNAME event_queue_top<0>_Pipeline_VITIS_LOOP_271_1 MODELNAME event_queue_top_0_Pipeline_VITIS_LOOP_271_1 RTLNAME simulation_top_event_queue_top_0_Pipeline_VITIS_LOOP_271_1}
  {SRCNAME event_queue_top<0> MODELNAME event_queue_top_0_s RTLNAME simulation_top_event_queue_top_0_s
    SUBMODULES {
      {MODELNAME simulation_top_event_queue_top_0_s_event_queue_buffer_event_send_time_V_1_RAM_AUTO_1R1W RTLNAME simulation_top_event_queue_top_0_s_event_queue_buffer_event_send_time_V_1_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME simulation_top_event_queue_top_0_s_event_queue_buffer_event_recv_time_V_1_RAM_AUTO_1R1W RTLNAME simulation_top_event_queue_top_0_s_event_queue_buffer_event_recv_time_V_1_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME simulation_top_event_queue_top_0_s_event_queue_buffer_event_sender_id_V_1_RAM_AUTO_1R1W RTLNAME simulation_top_event_queue_top_0_s_event_queue_buffer_event_sender_id_V_1_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME simulation_top_event_queue_top_0_s_event_queue_buffer_event_is_anti_message_V_1_RAM_AUTO_1R1W RTLNAME simulation_top_event_queue_top_0_s_event_queue_buffer_event_is_anti_message_V_1_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME simulation_top_event_queue_top_0_s_event_queue_buffer_next_V_1_RAM_AUTO_1R1W RTLNAME simulation_top_event_queue_top_0_s_event_queue_buffer_next_V_1_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME simulation_top_event_queue_top_0_s_event_queue_lp_heads_V_1_RAM_AUTO_1R1W RTLNAME simulation_top_event_queue_top_0_s_event_queue_lp_heads_V_1_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME simulation_top_event_queue_top_0_s_event_queue_lp_tails_V_1_RAM_AUTO_1R1W RTLNAME simulation_top_event_queue_top_0_s_event_queue_lp_tails_V_1_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME simulation_top_event_queue_top_0_s_event_queue_lvt_V_1_RAM_AUTO_1R1W RTLNAME simulation_top_event_queue_top_0_s_event_queue_lvt_V_1_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME state_buffer_top<0>_Pipeline_VITIS_LOOP_81_2 MODELNAME state_buffer_top_0_Pipeline_VITIS_LOOP_81_2 RTLNAME simulation_top_state_buffer_top_0_Pipeline_VITIS_LOOP_81_2}
  {SRCNAME state_buffer_top<0>_Pipeline_VITIS_LOOP_131_1 MODELNAME state_buffer_top_0_Pipeline_VITIS_LOOP_131_1 RTLNAME simulation_top_state_buffer_top_0_Pipeline_VITIS_LOOP_131_1}
  {SRCNAME state_buffer_top<0> MODELNAME state_buffer_top_0_s RTLNAME simulation_top_state_buffer_top_0_s
    SUBMODULES {
      {MODELNAME simulation_top_state_buffer_top_0_s_state_buffer_lp_heads_V_1_RAM_AUTO_1R1W RTLNAME simulation_top_state_buffer_top_0_s_state_buffer_lp_heads_V_1_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME simulation_top_state_buffer_top_0_s_state_buffer_lp_sizes_V_1_RAM_AUTO_1R1W RTLNAME simulation_top_state_buffer_top_0_s_state_buffer_lp_sizes_V_1_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME process_event MODELNAME process_event RTLNAME simulation_top_process_event}
  {SRCNAME event_processor_top<0> MODELNAME event_processor_top_0_s RTLNAME simulation_top_event_processor_top_0_s
    SUBMODULES {
      {MODELNAME simulation_top_event_processor_top_0_s_event_processor_prng_generators_state_V_1_RAM_AUTO_1R1W RTLNAME simulation_top_event_processor_top_0_s_event_processor_prng_generators_state_V_1_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME cancellation_unit_top<0>_Pipeline_VITIS_LOOP_93_2 MODELNAME cancellation_unit_top_0_Pipeline_VITIS_LOOP_93_2 RTLNAME simulation_top_cancellation_unit_top_0_Pipeline_VITIS_LOOP_93_2}
  {SRCNAME cancellation_unit_top<0>_Pipeline_VITIS_LOOP_58_1 MODELNAME cancellation_unit_top_0_Pipeline_VITIS_LOOP_58_1 RTLNAME simulation_top_cancellation_unit_top_0_Pipeline_VITIS_LOOP_58_1}
  {SRCNAME cancellation_unit_top<0> MODELNAME cancellation_unit_top_0_s RTLNAME simulation_top_cancellation_unit_top_0_s
    SUBMODULES {
      {MODELNAME simulation_top_cancellation_unit_top_0_s_cancellation_unit_buffer_event_recv_time_V_1_RAM_AUbkb RTLNAME simulation_top_cancellation_unit_top_0_s_cancellation_unit_buffer_event_recv_time_V_1_RAM_AUbkb BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME simulation_top_cancellation_unit_top_0_s_cancellation_unit_buffer_event_data_V_1_RAM_AUTO_1R1W RTLNAME simulation_top_cancellation_unit_top_0_s_cancellation_unit_buffer_event_data_V_1_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME simulation_top_cancellation_unit_top_0_s_cancellation_unit_buffer_event_sender_id_V_1_RAM_AUcud RTLNAME simulation_top_cancellation_unit_top_0_s_cancellation_unit_buffer_event_sender_id_V_1_RAM_AUcud BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME simulation_top_cancellation_unit_top_0_s_cancellation_unit_buffer_next_V_1_RAM_AUTO_1R1W RTLNAME simulation_top_cancellation_unit_top_0_s_cancellation_unit_buffer_next_V_1_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME simulation_top_cancellation_unit_top_0_s_cancellation_unit_lp_sizes_V_1_RAM_AUTO_1R1W RTLNAME simulation_top_cancellation_unit_top_0_s_cancellation_unit_lp_sizes_V_1_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME lpcore_kernel<0> MODELNAME lpcore_kernel_0_s RTLNAME simulation_top_lpcore_kernel_0_s
    SUBMODULES {
      {MODELNAME simulation_top_fifo_w48_d2_S RTLNAME simulation_top_fifo_w48_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME simulation_top_fifo_w32_d2_S RTLNAME simulation_top_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME simulation_top_fifo_w129_d2_S RTLNAME simulation_top_fifo_w129_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME simulation_top_fifo_w80_d2_S RTLNAME simulation_top_fifo_w80_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME simulation_top_fifo_w209_d2_S RTLNAME simulation_top_fifo_w209_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME {$InstName}}
    }
  }
  {SRCNAME lpcore_rollback_control.1 MODELNAME lpcore_rollback_control_1 RTLNAME simulation_top_lpcore_rollback_control_1}
  {SRCNAME lpcore_commit_control.2 MODELNAME lpcore_commit_control_2 RTLNAME simulation_top_lpcore_commit_control_2}
  {SRCNAME lpcore_control_top<1> MODELNAME lpcore_control_top_1_s RTLNAME simulation_top_lpcore_control_top_1_s}
  {SRCNAME event_queue_top<1>_Pipeline_VITIS_LOOP_205_1 MODELNAME event_queue_top_1_Pipeline_VITIS_LOOP_205_1 RTLNAME simulation_top_event_queue_top_1_Pipeline_VITIS_LOOP_205_1}
  {SRCNAME event_queue_top<1>_Pipeline_VITIS_LOOP_271_1 MODELNAME event_queue_top_1_Pipeline_VITIS_LOOP_271_1 RTLNAME simulation_top_event_queue_top_1_Pipeline_VITIS_LOOP_271_1}
  {SRCNAME event_queue_top<1> MODELNAME event_queue_top_1_s RTLNAME simulation_top_event_queue_top_1_s}
  {SRCNAME state_buffer_top<1>_Pipeline_VITIS_LOOP_81_2 MODELNAME state_buffer_top_1_Pipeline_VITIS_LOOP_81_2 RTLNAME simulation_top_state_buffer_top_1_Pipeline_VITIS_LOOP_81_2}
  {SRCNAME state_buffer_top<1>_Pipeline_VITIS_LOOP_131_1 MODELNAME state_buffer_top_1_Pipeline_VITIS_LOOP_131_1 RTLNAME simulation_top_state_buffer_top_1_Pipeline_VITIS_LOOP_131_1}
  {SRCNAME state_buffer_top<1> MODELNAME state_buffer_top_1_s RTLNAME simulation_top_state_buffer_top_1_s}
  {SRCNAME event_processor_top<1> MODELNAME event_processor_top_1_s RTLNAME simulation_top_event_processor_top_1_s
    SUBMODULES {
      {MODELNAME simulation_top_event_processor_top_1_s_event_processor_prng_generators_state_V_RAM_AUTO_1R1W RTLNAME simulation_top_event_processor_top_1_s_event_processor_prng_generators_state_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME cancellation_unit_top<1>_Pipeline_VITIS_LOOP_93_2 MODELNAME cancellation_unit_top_1_Pipeline_VITIS_LOOP_93_2 RTLNAME simulation_top_cancellation_unit_top_1_Pipeline_VITIS_LOOP_93_2}
  {SRCNAME cancellation_unit_top<1>_Pipeline_VITIS_LOOP_58_1 MODELNAME cancellation_unit_top_1_Pipeline_VITIS_LOOP_58_1 RTLNAME simulation_top_cancellation_unit_top_1_Pipeline_VITIS_LOOP_58_1}
  {SRCNAME cancellation_unit_top<1> MODELNAME cancellation_unit_top_1_s RTLNAME simulation_top_cancellation_unit_top_1_s}
  {SRCNAME lpcore_kernel<1> MODELNAME lpcore_kernel_1_s RTLNAME simulation_top_lpcore_kernel_1_s
    SUBMODULES {
      {MODELNAME simulation_top_fifo_w48_d2_S_x RTLNAME simulation_top_fifo_w48_d2_S_x BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME simulation_top_fifo_w32_d2_S_x RTLNAME simulation_top_fifo_w32_d2_S_x BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME simulation_top_fifo_w129_d2_S_x RTLNAME simulation_top_fifo_w129_d2_S_x BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME simulation_top_fifo_w80_d2_S_x RTLNAME simulation_top_fifo_w80_d2_S_x BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME simulation_top_fifo_w209_d2_S_x RTLNAME simulation_top_fifo_w209_d2_S_x BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME {$InstName}}
    }
  }
  {SRCNAME simulation_top MODELNAME simulation_top RTLNAME simulation_top IS_TOP 1}
}
