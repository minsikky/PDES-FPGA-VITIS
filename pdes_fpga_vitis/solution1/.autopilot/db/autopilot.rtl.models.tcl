set SynModuleInfo {
  {SRCNAME state_buffer_kernel_Pipeline_VITIS_LOOP_101_2 MODELNAME state_buffer_kernel_Pipeline_VITIS_LOOP_101_2 RTLNAME state_buffer_kernel_state_buffer_kernel_Pipeline_VITIS_LOOP_101_2
    SUBMODULES {
      {MODELNAME state_buffer_kernel_flow_control_loop_pipe_sequential_init RTLNAME state_buffer_kernel_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME state_buffer_kernel_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME state_buffer_kernel_Pipeline_VITIS_LOOP_154_1 MODELNAME state_buffer_kernel_Pipeline_VITIS_LOOP_154_1 RTLNAME state_buffer_kernel_state_buffer_kernel_Pipeline_VITIS_LOOP_154_1}
  {SRCNAME state_buffer_kernel MODELNAME state_buffer_kernel RTLNAME state_buffer_kernel IS_TOP 1
    SUBMODULES {
      {MODELNAME state_buffer_kernel_list_nodes_next_V_RAM_AUTO_1R1W RTLNAME state_buffer_kernel_list_nodes_next_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME state_buffer_kernel_list_nodes_state_lp_id_V_RAM_AUTO_1R1W RTLNAME state_buffer_kernel_list_nodes_state_lp_id_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME state_buffer_kernel_list_nodes_state_lvt_V_RAM_AUTO_1R1W RTLNAME state_buffer_kernel_list_nodes_state_lvt_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME state_buffer_kernel_list_lp_heads_V_RAM_AUTO_1R1W RTLNAME state_buffer_kernel_list_lp_heads_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME state_buffer_kernel_list_lp_sizes_V_RAM_AUTO_1R1W RTLNAME state_buffer_kernel_list_lp_sizes_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
}
