// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
// Date        : Thu Aug 15 18:03:21 2024
// Host        : i1z running 64-bit Red Hat Enterprise Linux Server release 7.9 (Maipo)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ bd_0_hls_inst_0_stub.v
// Design      : bd_0_hls_inst_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu7ev-ffvc1156-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "simulation_top,Vivado 2022.1" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(lpcore_init_event_stream_0_dout, 
  lpcore_init_event_stream_0_empty_n, lpcore_init_event_stream_0_read, 
  lpcore_init_event_stream_1_dout, lpcore_init_event_stream_1_empty_n, 
  lpcore_init_event_stream_1_read, lpcore_event_queue_full_stream_0_din, 
  lpcore_event_queue_full_stream_0_full_n, lpcore_event_queue_full_stream_0_write, 
  lpcore_event_queue_full_stream_1_din, lpcore_event_queue_full_stream_1_full_n, 
  lpcore_event_queue_full_stream_1_write, lpcore_anti_message_stream_0_dout, 
  lpcore_anti_message_stream_0_empty_n, lpcore_anti_message_stream_0_read, 
  lpcore_anti_message_stream_1_dout, lpcore_anti_message_stream_1_empty_n, 
  lpcore_anti_message_stream_1_read, lpcore_enqueue_event_stream_0_dout, 
  lpcore_enqueue_event_stream_0_empty_n, lpcore_enqueue_event_stream_0_read, 
  lpcore_enqueue_event_stream_1_dout, lpcore_enqueue_event_stream_1_empty_n, 
  lpcore_enqueue_event_stream_1_read, lpcore_output_event_stream_0_din, 
  lpcore_output_event_stream_0_full_n, lpcore_output_event_stream_0_write, 
  lpcore_output_event_stream_1_din, lpcore_output_event_stream_1_full_n, 
  lpcore_output_event_stream_1_write, lpcore_cancellation_unit_output_stream_0_din, 
  lpcore_cancellation_unit_output_stream_0_full_n, 
  lpcore_cancellation_unit_output_stream_0_write, 
  lpcore_cancellation_unit_output_stream_1_din, 
  lpcore_cancellation_unit_output_stream_1_full_n, 
  lpcore_cancellation_unit_output_stream_1_write, lpcore_commit_time_stream_0_dout, 
  lpcore_commit_time_stream_0_empty_n, lpcore_commit_time_stream_0_read, 
  lpcore_commit_time_stream_1_dout, lpcore_commit_time_stream_1_empty_n, 
  lpcore_commit_time_stream_1_read, ap_clk, ap_rst)
/* synthesis syn_black_box black_box_pad_pin="lpcore_init_event_stream_0_dout[128:0],lpcore_init_event_stream_0_empty_n,lpcore_init_event_stream_0_read,lpcore_init_event_stream_1_dout[128:0],lpcore_init_event_stream_1_empty_n,lpcore_init_event_stream_1_read,lpcore_event_queue_full_stream_0_din[0:0],lpcore_event_queue_full_stream_0_full_n,lpcore_event_queue_full_stream_0_write,lpcore_event_queue_full_stream_1_din[0:0],lpcore_event_queue_full_stream_1_full_n,lpcore_event_queue_full_stream_1_write,lpcore_anti_message_stream_0_dout[128:0],lpcore_anti_message_stream_0_empty_n,lpcore_anti_message_stream_0_read,lpcore_anti_message_stream_1_dout[128:0],lpcore_anti_message_stream_1_empty_n,lpcore_anti_message_stream_1_read,lpcore_enqueue_event_stream_0_dout[128:0],lpcore_enqueue_event_stream_0_empty_n,lpcore_enqueue_event_stream_0_read,lpcore_enqueue_event_stream_1_dout[128:0],lpcore_enqueue_event_stream_1_empty_n,lpcore_enqueue_event_stream_1_read,lpcore_output_event_stream_0_din[128:0],lpcore_output_event_stream_0_full_n,lpcore_output_event_stream_0_write,lpcore_output_event_stream_1_din[128:0],lpcore_output_event_stream_1_full_n,lpcore_output_event_stream_1_write,lpcore_cancellation_unit_output_stream_0_din[128:0],lpcore_cancellation_unit_output_stream_0_full_n,lpcore_cancellation_unit_output_stream_0_write,lpcore_cancellation_unit_output_stream_1_din[128:0],lpcore_cancellation_unit_output_stream_1_full_n,lpcore_cancellation_unit_output_stream_1_write,lpcore_commit_time_stream_0_dout[31:0],lpcore_commit_time_stream_0_empty_n,lpcore_commit_time_stream_0_read,lpcore_commit_time_stream_1_dout[31:0],lpcore_commit_time_stream_1_empty_n,lpcore_commit_time_stream_1_read,ap_clk,ap_rst" */;
  input [128:0]lpcore_init_event_stream_0_dout;
  input lpcore_init_event_stream_0_empty_n;
  output lpcore_init_event_stream_0_read;
  input [128:0]lpcore_init_event_stream_1_dout;
  input lpcore_init_event_stream_1_empty_n;
  output lpcore_init_event_stream_1_read;
  output [0:0]lpcore_event_queue_full_stream_0_din;
  input lpcore_event_queue_full_stream_0_full_n;
  output lpcore_event_queue_full_stream_0_write;
  output [0:0]lpcore_event_queue_full_stream_1_din;
  input lpcore_event_queue_full_stream_1_full_n;
  output lpcore_event_queue_full_stream_1_write;
  input [128:0]lpcore_anti_message_stream_0_dout;
  input lpcore_anti_message_stream_0_empty_n;
  output lpcore_anti_message_stream_0_read;
  input [128:0]lpcore_anti_message_stream_1_dout;
  input lpcore_anti_message_stream_1_empty_n;
  output lpcore_anti_message_stream_1_read;
  input [128:0]lpcore_enqueue_event_stream_0_dout;
  input lpcore_enqueue_event_stream_0_empty_n;
  output lpcore_enqueue_event_stream_0_read;
  input [128:0]lpcore_enqueue_event_stream_1_dout;
  input lpcore_enqueue_event_stream_1_empty_n;
  output lpcore_enqueue_event_stream_1_read;
  output [128:0]lpcore_output_event_stream_0_din;
  input lpcore_output_event_stream_0_full_n;
  output lpcore_output_event_stream_0_write;
  output [128:0]lpcore_output_event_stream_1_din;
  input lpcore_output_event_stream_1_full_n;
  output lpcore_output_event_stream_1_write;
  output [128:0]lpcore_cancellation_unit_output_stream_0_din;
  input lpcore_cancellation_unit_output_stream_0_full_n;
  output lpcore_cancellation_unit_output_stream_0_write;
  output [128:0]lpcore_cancellation_unit_output_stream_1_din;
  input lpcore_cancellation_unit_output_stream_1_full_n;
  output lpcore_cancellation_unit_output_stream_1_write;
  input [31:0]lpcore_commit_time_stream_0_dout;
  input lpcore_commit_time_stream_0_empty_n;
  output lpcore_commit_time_stream_0_read;
  input [31:0]lpcore_commit_time_stream_1_dout;
  input lpcore_commit_time_stream_1_empty_n;
  output lpcore_commit_time_stream_1_read;
  input ap_clk;
  input ap_rst;
endmodule
