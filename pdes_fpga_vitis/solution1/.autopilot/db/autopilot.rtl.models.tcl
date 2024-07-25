set SynModuleInfo {
  {SRCNAME test_state_buffer_Pipeline_VITIS_LOOP_34_1 MODELNAME test_state_buffer_Pipeline_VITIS_LOOP_34_1 RTLNAME test_state_buffer_test_state_buffer_Pipeline_VITIS_LOOP_34_1
    SUBMODULES {
      {MODELNAME test_state_buffer_flow_control_loop_pipe_sequential_init RTLNAME test_state_buffer_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME test_state_buffer_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME test_state_buffer_Pipeline_VITIS_LOOP_39_2 MODELNAME test_state_buffer_Pipeline_VITIS_LOOP_39_2 RTLNAME test_state_buffer_test_state_buffer_Pipeline_VITIS_LOOP_39_2}
  {SRCNAME test_state_buffer_Pipeline_VITIS_LOOP_43_3 MODELNAME test_state_buffer_Pipeline_VITIS_LOOP_43_3 RTLNAME test_state_buffer_test_state_buffer_Pipeline_VITIS_LOOP_43_3}
  {SRCNAME test_state_buffer MODELNAME test_state_buffer RTLNAME test_state_buffer IS_TOP 1
    SUBMODULES {
      {MODELNAME test_state_buffer_mux_21_32_1_1 RTLNAME test_state_buffer_mux_21_32_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME test_state_buffer_buffer_buffer_state_lvt_V_RAM_1WNR_AUTO_1R1W RTLNAME test_state_buffer_buffer_buffer_state_lvt_V_RAM_1WNR_AUTO_1R1W BINDTYPE storage TYPE ram_1wnr IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME test_state_buffer_buffer_buffer_next_RAM_AUTO_1R1W RTLNAME test_state_buffer_buffer_buffer_next_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME test_state_buffer_buffer_lp_heads_RAM_AUTO_1R1W RTLNAME test_state_buffer_buffer_lp_heads_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME test_state_buffer_control_s_axi RTLNAME test_state_buffer_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
      {MODELNAME test_state_buffer_regslice_both RTLNAME test_state_buffer_regslice_both BINDTYPE interface TYPE interface_regslice INSTNAME test_state_buffer_regslice_both_U}
    }
  }
}
