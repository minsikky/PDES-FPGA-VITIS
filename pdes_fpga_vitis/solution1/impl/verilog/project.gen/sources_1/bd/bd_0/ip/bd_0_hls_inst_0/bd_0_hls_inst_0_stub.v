// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
// Date        : Sun Jul 28 03:52:21 2024
// Host        : i1z running 64-bit Red Hat Enterprise Linux Server release 7.9 (Maipo)
// Command     : write_verilog -force -mode synth_stub
//               /n/higgins/z/minsikky/PDES-FPGA-VITIS/pdes_fpga_vitis/solution1/impl/verilog/project.gen/sources_1/bd/bd_0/ip/bd_0_hls_inst_0/bd_0_hls_inst_0_stub.v
// Design      : bd_0_hls_inst_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu7ev-ffvf1517-3-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "event_queue_kernel,Vivado 2022.1" *)
module bd_0_hls_inst_0(input_r_ap_vld, output_event_ap_vld, 
  success_ap_vld, ap_clk, ap_rst, ap_start, ap_done, ap_idle, ap_ready, input_r, output_event, 
  success)
/* synthesis syn_black_box black_box_pad_pin="input_r_ap_vld,output_event_ap_vld,success_ap_vld,ap_clk,ap_rst,ap_start,ap_done,ap_idle,ap_ready,input_r[129:0],output_event[128:0],success" */;
  input input_r_ap_vld;
  output output_event_ap_vld;
  output success_ap_vld;
  input ap_clk;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  input [129:0]input_r;
  output [128:0]output_event;
  output success;
endmodule
