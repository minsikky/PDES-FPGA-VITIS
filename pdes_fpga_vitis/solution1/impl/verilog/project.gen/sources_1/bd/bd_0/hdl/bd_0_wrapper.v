//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
//Date        : Thu Aug 15 18:01:14 2024
//Host        : i1z running 64-bit Red Hat Enterprise Linux Server release 7.9 (Maipo)
//Command     : generate_target bd_0_wrapper.bd
//Design      : bd_0_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module bd_0_wrapper
   (ap_clk,
    ap_rst,
    lpcore_anti_message_stream_0_empty_n,
    lpcore_anti_message_stream_0_rd_data,
    lpcore_anti_message_stream_0_rd_en,
    lpcore_anti_message_stream_1_empty_n,
    lpcore_anti_message_stream_1_rd_data,
    lpcore_anti_message_stream_1_rd_en,
    lpcore_cancellation_unit_output_stream_0_full_n,
    lpcore_cancellation_unit_output_stream_0_wr_data,
    lpcore_cancellation_unit_output_stream_0_wr_en,
    lpcore_cancellation_unit_output_stream_1_full_n,
    lpcore_cancellation_unit_output_stream_1_wr_data,
    lpcore_cancellation_unit_output_stream_1_wr_en,
    lpcore_commit_time_stream_0_empty_n,
    lpcore_commit_time_stream_0_rd_data,
    lpcore_commit_time_stream_0_rd_en,
    lpcore_commit_time_stream_1_empty_n,
    lpcore_commit_time_stream_1_rd_data,
    lpcore_commit_time_stream_1_rd_en,
    lpcore_enqueue_event_stream_0_empty_n,
    lpcore_enqueue_event_stream_0_rd_data,
    lpcore_enqueue_event_stream_0_rd_en,
    lpcore_enqueue_event_stream_1_empty_n,
    lpcore_enqueue_event_stream_1_rd_data,
    lpcore_enqueue_event_stream_1_rd_en,
    lpcore_event_queue_full_stream_0_full_n,
    lpcore_event_queue_full_stream_0_wr_data,
    lpcore_event_queue_full_stream_0_wr_en,
    lpcore_event_queue_full_stream_1_full_n,
    lpcore_event_queue_full_stream_1_wr_data,
    lpcore_event_queue_full_stream_1_wr_en,
    lpcore_init_event_stream_0_empty_n,
    lpcore_init_event_stream_0_rd_data,
    lpcore_init_event_stream_0_rd_en,
    lpcore_init_event_stream_1_empty_n,
    lpcore_init_event_stream_1_rd_data,
    lpcore_init_event_stream_1_rd_en,
    lpcore_output_event_stream_0_full_n,
    lpcore_output_event_stream_0_wr_data,
    lpcore_output_event_stream_0_wr_en,
    lpcore_output_event_stream_1_full_n,
    lpcore_output_event_stream_1_wr_data,
    lpcore_output_event_stream_1_wr_en);
  input ap_clk;
  input ap_rst;
  input lpcore_anti_message_stream_0_empty_n;
  input [128:0]lpcore_anti_message_stream_0_rd_data;
  output lpcore_anti_message_stream_0_rd_en;
  input lpcore_anti_message_stream_1_empty_n;
  input [128:0]lpcore_anti_message_stream_1_rd_data;
  output lpcore_anti_message_stream_1_rd_en;
  input lpcore_cancellation_unit_output_stream_0_full_n;
  output [128:0]lpcore_cancellation_unit_output_stream_0_wr_data;
  output lpcore_cancellation_unit_output_stream_0_wr_en;
  input lpcore_cancellation_unit_output_stream_1_full_n;
  output [128:0]lpcore_cancellation_unit_output_stream_1_wr_data;
  output lpcore_cancellation_unit_output_stream_1_wr_en;
  input lpcore_commit_time_stream_0_empty_n;
  input [31:0]lpcore_commit_time_stream_0_rd_data;
  output lpcore_commit_time_stream_0_rd_en;
  input lpcore_commit_time_stream_1_empty_n;
  input [31:0]lpcore_commit_time_stream_1_rd_data;
  output lpcore_commit_time_stream_1_rd_en;
  input lpcore_enqueue_event_stream_0_empty_n;
  input [128:0]lpcore_enqueue_event_stream_0_rd_data;
  output lpcore_enqueue_event_stream_0_rd_en;
  input lpcore_enqueue_event_stream_1_empty_n;
  input [128:0]lpcore_enqueue_event_stream_1_rd_data;
  output lpcore_enqueue_event_stream_1_rd_en;
  input lpcore_event_queue_full_stream_0_full_n;
  output [0:0]lpcore_event_queue_full_stream_0_wr_data;
  output lpcore_event_queue_full_stream_0_wr_en;
  input lpcore_event_queue_full_stream_1_full_n;
  output [0:0]lpcore_event_queue_full_stream_1_wr_data;
  output lpcore_event_queue_full_stream_1_wr_en;
  input lpcore_init_event_stream_0_empty_n;
  input [128:0]lpcore_init_event_stream_0_rd_data;
  output lpcore_init_event_stream_0_rd_en;
  input lpcore_init_event_stream_1_empty_n;
  input [128:0]lpcore_init_event_stream_1_rd_data;
  output lpcore_init_event_stream_1_rd_en;
  input lpcore_output_event_stream_0_full_n;
  output [128:0]lpcore_output_event_stream_0_wr_data;
  output lpcore_output_event_stream_0_wr_en;
  input lpcore_output_event_stream_1_full_n;
  output [128:0]lpcore_output_event_stream_1_wr_data;
  output lpcore_output_event_stream_1_wr_en;

  wire ap_clk;
  wire ap_rst;
  wire lpcore_anti_message_stream_0_empty_n;
  wire [128:0]lpcore_anti_message_stream_0_rd_data;
  wire lpcore_anti_message_stream_0_rd_en;
  wire lpcore_anti_message_stream_1_empty_n;
  wire [128:0]lpcore_anti_message_stream_1_rd_data;
  wire lpcore_anti_message_stream_1_rd_en;
  wire lpcore_cancellation_unit_output_stream_0_full_n;
  wire [128:0]lpcore_cancellation_unit_output_stream_0_wr_data;
  wire lpcore_cancellation_unit_output_stream_0_wr_en;
  wire lpcore_cancellation_unit_output_stream_1_full_n;
  wire [128:0]lpcore_cancellation_unit_output_stream_1_wr_data;
  wire lpcore_cancellation_unit_output_stream_1_wr_en;
  wire lpcore_commit_time_stream_0_empty_n;
  wire [31:0]lpcore_commit_time_stream_0_rd_data;
  wire lpcore_commit_time_stream_0_rd_en;
  wire lpcore_commit_time_stream_1_empty_n;
  wire [31:0]lpcore_commit_time_stream_1_rd_data;
  wire lpcore_commit_time_stream_1_rd_en;
  wire lpcore_enqueue_event_stream_0_empty_n;
  wire [128:0]lpcore_enqueue_event_stream_0_rd_data;
  wire lpcore_enqueue_event_stream_0_rd_en;
  wire lpcore_enqueue_event_stream_1_empty_n;
  wire [128:0]lpcore_enqueue_event_stream_1_rd_data;
  wire lpcore_enqueue_event_stream_1_rd_en;
  wire lpcore_event_queue_full_stream_0_full_n;
  wire [0:0]lpcore_event_queue_full_stream_0_wr_data;
  wire lpcore_event_queue_full_stream_0_wr_en;
  wire lpcore_event_queue_full_stream_1_full_n;
  wire [0:0]lpcore_event_queue_full_stream_1_wr_data;
  wire lpcore_event_queue_full_stream_1_wr_en;
  wire lpcore_init_event_stream_0_empty_n;
  wire [128:0]lpcore_init_event_stream_0_rd_data;
  wire lpcore_init_event_stream_0_rd_en;
  wire lpcore_init_event_stream_1_empty_n;
  wire [128:0]lpcore_init_event_stream_1_rd_data;
  wire lpcore_init_event_stream_1_rd_en;
  wire lpcore_output_event_stream_0_full_n;
  wire [128:0]lpcore_output_event_stream_0_wr_data;
  wire lpcore_output_event_stream_0_wr_en;
  wire lpcore_output_event_stream_1_full_n;
  wire [128:0]lpcore_output_event_stream_1_wr_data;
  wire lpcore_output_event_stream_1_wr_en;

  bd_0 bd_0_i
       (.ap_clk(ap_clk),
        .ap_rst(ap_rst),
        .lpcore_anti_message_stream_0_empty_n(lpcore_anti_message_stream_0_empty_n),
        .lpcore_anti_message_stream_0_rd_data(lpcore_anti_message_stream_0_rd_data),
        .lpcore_anti_message_stream_0_rd_en(lpcore_anti_message_stream_0_rd_en),
        .lpcore_anti_message_stream_1_empty_n(lpcore_anti_message_stream_1_empty_n),
        .lpcore_anti_message_stream_1_rd_data(lpcore_anti_message_stream_1_rd_data),
        .lpcore_anti_message_stream_1_rd_en(lpcore_anti_message_stream_1_rd_en),
        .lpcore_cancellation_unit_output_stream_0_full_n(lpcore_cancellation_unit_output_stream_0_full_n),
        .lpcore_cancellation_unit_output_stream_0_wr_data(lpcore_cancellation_unit_output_stream_0_wr_data),
        .lpcore_cancellation_unit_output_stream_0_wr_en(lpcore_cancellation_unit_output_stream_0_wr_en),
        .lpcore_cancellation_unit_output_stream_1_full_n(lpcore_cancellation_unit_output_stream_1_full_n),
        .lpcore_cancellation_unit_output_stream_1_wr_data(lpcore_cancellation_unit_output_stream_1_wr_data),
        .lpcore_cancellation_unit_output_stream_1_wr_en(lpcore_cancellation_unit_output_stream_1_wr_en),
        .lpcore_commit_time_stream_0_empty_n(lpcore_commit_time_stream_0_empty_n),
        .lpcore_commit_time_stream_0_rd_data(lpcore_commit_time_stream_0_rd_data),
        .lpcore_commit_time_stream_0_rd_en(lpcore_commit_time_stream_0_rd_en),
        .lpcore_commit_time_stream_1_empty_n(lpcore_commit_time_stream_1_empty_n),
        .lpcore_commit_time_stream_1_rd_data(lpcore_commit_time_stream_1_rd_data),
        .lpcore_commit_time_stream_1_rd_en(lpcore_commit_time_stream_1_rd_en),
        .lpcore_enqueue_event_stream_0_empty_n(lpcore_enqueue_event_stream_0_empty_n),
        .lpcore_enqueue_event_stream_0_rd_data(lpcore_enqueue_event_stream_0_rd_data),
        .lpcore_enqueue_event_stream_0_rd_en(lpcore_enqueue_event_stream_0_rd_en),
        .lpcore_enqueue_event_stream_1_empty_n(lpcore_enqueue_event_stream_1_empty_n),
        .lpcore_enqueue_event_stream_1_rd_data(lpcore_enqueue_event_stream_1_rd_data),
        .lpcore_enqueue_event_stream_1_rd_en(lpcore_enqueue_event_stream_1_rd_en),
        .lpcore_event_queue_full_stream_0_full_n(lpcore_event_queue_full_stream_0_full_n),
        .lpcore_event_queue_full_stream_0_wr_data(lpcore_event_queue_full_stream_0_wr_data),
        .lpcore_event_queue_full_stream_0_wr_en(lpcore_event_queue_full_stream_0_wr_en),
        .lpcore_event_queue_full_stream_1_full_n(lpcore_event_queue_full_stream_1_full_n),
        .lpcore_event_queue_full_stream_1_wr_data(lpcore_event_queue_full_stream_1_wr_data),
        .lpcore_event_queue_full_stream_1_wr_en(lpcore_event_queue_full_stream_1_wr_en),
        .lpcore_init_event_stream_0_empty_n(lpcore_init_event_stream_0_empty_n),
        .lpcore_init_event_stream_0_rd_data(lpcore_init_event_stream_0_rd_data),
        .lpcore_init_event_stream_0_rd_en(lpcore_init_event_stream_0_rd_en),
        .lpcore_init_event_stream_1_empty_n(lpcore_init_event_stream_1_empty_n),
        .lpcore_init_event_stream_1_rd_data(lpcore_init_event_stream_1_rd_data),
        .lpcore_init_event_stream_1_rd_en(lpcore_init_event_stream_1_rd_en),
        .lpcore_output_event_stream_0_full_n(lpcore_output_event_stream_0_full_n),
        .lpcore_output_event_stream_0_wr_data(lpcore_output_event_stream_0_wr_data),
        .lpcore_output_event_stream_0_wr_en(lpcore_output_event_stream_0_wr_en),
        .lpcore_output_event_stream_1_full_n(lpcore_output_event_stream_1_full_n),
        .lpcore_output_event_stream_1_wr_data(lpcore_output_event_stream_1_wr_data),
        .lpcore_output_event_stream_1_wr_en(lpcore_output_event_stream_1_wr_en));
endmodule
