// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module simulation_top_lpcore_control_top_0_s (
        causality_violation_stream_dout,
        causality_violation_stream_empty_n,
        causality_violation_stream_read,
        event_queue_rollback_info_stream_din,
        event_queue_rollback_info_stream_full_n,
        event_queue_rollback_info_stream_write,
        state_buffer_rollback_info_stream_din,
        state_buffer_rollback_info_stream_full_n,
        state_buffer_rollback_info_stream_write,
        cancellation_unit_rollback_info_stream_din,
        cancellation_unit_rollback_info_stream_full_n,
        cancellation_unit_rollback_info_stream_write,
        lpcore_commit_time_stream_0_dout,
        lpcore_commit_time_stream_0_empty_n,
        lpcore_commit_time_stream_0_read,
        event_queue_commit_time_stream15_din,
        event_queue_commit_time_stream15_full_n,
        event_queue_commit_time_stream15_write,
        state_buffer_commit_time_stream16_din,
        state_buffer_commit_time_stream16_full_n,
        state_buffer_commit_time_stream16_write,
        cancellation_unit_commit_time_stream17_din,
        cancellation_unit_commit_time_stream17_full_n,
        cancellation_unit_commit_time_stream17_write,
        ap_clk,
        ap_rst,
        ap_ready
);


input  [47:0] causality_violation_stream_dout;
input   causality_violation_stream_empty_n;
output   causality_violation_stream_read;
output  [47:0] event_queue_rollback_info_stream_din;
input   event_queue_rollback_info_stream_full_n;
output   event_queue_rollback_info_stream_write;
output  [47:0] state_buffer_rollback_info_stream_din;
input   state_buffer_rollback_info_stream_full_n;
output   state_buffer_rollback_info_stream_write;
output  [47:0] cancellation_unit_rollback_info_stream_din;
input   cancellation_unit_rollback_info_stream_full_n;
output   cancellation_unit_rollback_info_stream_write;
input  [31:0] lpcore_commit_time_stream_0_dout;
input   lpcore_commit_time_stream_0_empty_n;
output   lpcore_commit_time_stream_0_read;
output  [31:0] event_queue_commit_time_stream15_din;
input   event_queue_commit_time_stream15_full_n;
output   event_queue_commit_time_stream15_write;
output  [31:0] state_buffer_commit_time_stream16_din;
input   state_buffer_commit_time_stream16_full_n;
output   state_buffer_commit_time_stream16_write;
output  [31:0] cancellation_unit_commit_time_stream17_din;
input   cancellation_unit_commit_time_stream17_full_n;
output   cancellation_unit_commit_time_stream17_write;
input   ap_clk;
input   ap_rst;
output   ap_ready;

wire    lpcore_rollback_control_U0_ap_start;
wire    lpcore_rollback_control_U0_ap_done;
wire    lpcore_rollback_control_U0_ap_continue;
wire    lpcore_rollback_control_U0_ap_idle;
wire    lpcore_rollback_control_U0_ap_ready;
wire    lpcore_rollback_control_U0_causality_violation_stream_read;
wire   [47:0] lpcore_rollback_control_U0_event_queue_rollback_info_stream_din;
wire    lpcore_rollback_control_U0_event_queue_rollback_info_stream_write;
wire   [47:0] lpcore_rollback_control_U0_state_buffer_rollback_info_stream_din;
wire    lpcore_rollback_control_U0_state_buffer_rollback_info_stream_write;
wire   [47:0] lpcore_rollback_control_U0_cancellation_unit_rollback_info_stream_din;
wire    lpcore_rollback_control_U0_cancellation_unit_rollback_info_stream_write;
wire    lpcore_commit_control_U0_ap_start;
wire    lpcore_commit_control_U0_ap_done;
wire    lpcore_commit_control_U0_ap_continue;
wire    lpcore_commit_control_U0_ap_idle;
wire    lpcore_commit_control_U0_ap_ready;
wire    lpcore_commit_control_U0_lpcore_commit_time_stream_0_read;
wire   [31:0] lpcore_commit_control_U0_event_queue_commit_time_stream15_din;
wire    lpcore_commit_control_U0_event_queue_commit_time_stream15_write;
wire   [31:0] lpcore_commit_control_U0_state_buffer_commit_time_stream16_din;
wire    lpcore_commit_control_U0_state_buffer_commit_time_stream16_write;
wire   [31:0] lpcore_commit_control_U0_cancellation_unit_commit_time_stream17_din;
wire    lpcore_commit_control_U0_cancellation_unit_commit_time_stream17_write;

simulation_top_lpcore_rollback_control lpcore_rollback_control_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(lpcore_rollback_control_U0_ap_start),
    .ap_done(lpcore_rollback_control_U0_ap_done),
    .ap_continue(lpcore_rollback_control_U0_ap_continue),
    .ap_idle(lpcore_rollback_control_U0_ap_idle),
    .ap_ready(lpcore_rollback_control_U0_ap_ready),
    .causality_violation_stream_dout(causality_violation_stream_dout),
    .causality_violation_stream_num_data_valid(2'd0),
    .causality_violation_stream_fifo_cap(2'd0),
    .causality_violation_stream_empty_n(causality_violation_stream_empty_n),
    .causality_violation_stream_read(lpcore_rollback_control_U0_causality_violation_stream_read),
    .event_queue_rollback_info_stream_din(lpcore_rollback_control_U0_event_queue_rollback_info_stream_din),
    .event_queue_rollback_info_stream_num_data_valid(2'd0),
    .event_queue_rollback_info_stream_fifo_cap(2'd0),
    .event_queue_rollback_info_stream_full_n(event_queue_rollback_info_stream_full_n),
    .event_queue_rollback_info_stream_write(lpcore_rollback_control_U0_event_queue_rollback_info_stream_write),
    .state_buffer_rollback_info_stream_din(lpcore_rollback_control_U0_state_buffer_rollback_info_stream_din),
    .state_buffer_rollback_info_stream_num_data_valid(2'd0),
    .state_buffer_rollback_info_stream_fifo_cap(2'd0),
    .state_buffer_rollback_info_stream_full_n(state_buffer_rollback_info_stream_full_n),
    .state_buffer_rollback_info_stream_write(lpcore_rollback_control_U0_state_buffer_rollback_info_stream_write),
    .cancellation_unit_rollback_info_stream_din(lpcore_rollback_control_U0_cancellation_unit_rollback_info_stream_din),
    .cancellation_unit_rollback_info_stream_num_data_valid(2'd0),
    .cancellation_unit_rollback_info_stream_fifo_cap(2'd0),
    .cancellation_unit_rollback_info_stream_full_n(cancellation_unit_rollback_info_stream_full_n),
    .cancellation_unit_rollback_info_stream_write(lpcore_rollback_control_U0_cancellation_unit_rollback_info_stream_write)
);

simulation_top_lpcore_commit_control lpcore_commit_control_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(lpcore_commit_control_U0_ap_start),
    .ap_done(lpcore_commit_control_U0_ap_done),
    .ap_continue(lpcore_commit_control_U0_ap_continue),
    .ap_idle(lpcore_commit_control_U0_ap_idle),
    .ap_ready(lpcore_commit_control_U0_ap_ready),
    .lpcore_commit_time_stream_0_dout(lpcore_commit_time_stream_0_dout),
    .lpcore_commit_time_stream_0_empty_n(lpcore_commit_time_stream_0_empty_n),
    .lpcore_commit_time_stream_0_read(lpcore_commit_control_U0_lpcore_commit_time_stream_0_read),
    .event_queue_commit_time_stream15_din(lpcore_commit_control_U0_event_queue_commit_time_stream15_din),
    .event_queue_commit_time_stream15_num_data_valid(2'd0),
    .event_queue_commit_time_stream15_fifo_cap(2'd0),
    .event_queue_commit_time_stream15_full_n(event_queue_commit_time_stream15_full_n),
    .event_queue_commit_time_stream15_write(lpcore_commit_control_U0_event_queue_commit_time_stream15_write),
    .state_buffer_commit_time_stream16_din(lpcore_commit_control_U0_state_buffer_commit_time_stream16_din),
    .state_buffer_commit_time_stream16_num_data_valid(2'd0),
    .state_buffer_commit_time_stream16_fifo_cap(2'd0),
    .state_buffer_commit_time_stream16_full_n(state_buffer_commit_time_stream16_full_n),
    .state_buffer_commit_time_stream16_write(lpcore_commit_control_U0_state_buffer_commit_time_stream16_write),
    .cancellation_unit_commit_time_stream17_din(lpcore_commit_control_U0_cancellation_unit_commit_time_stream17_din),
    .cancellation_unit_commit_time_stream17_num_data_valid(2'd0),
    .cancellation_unit_commit_time_stream17_fifo_cap(2'd0),
    .cancellation_unit_commit_time_stream17_full_n(cancellation_unit_commit_time_stream17_full_n),
    .cancellation_unit_commit_time_stream17_write(lpcore_commit_control_U0_cancellation_unit_commit_time_stream17_write)
);

assign ap_ready = 1'b1;

assign cancellation_unit_commit_time_stream17_din = lpcore_commit_control_U0_cancellation_unit_commit_time_stream17_din;

assign cancellation_unit_commit_time_stream17_write = lpcore_commit_control_U0_cancellation_unit_commit_time_stream17_write;

assign cancellation_unit_rollback_info_stream_din = lpcore_rollback_control_U0_cancellation_unit_rollback_info_stream_din;

assign cancellation_unit_rollback_info_stream_write = lpcore_rollback_control_U0_cancellation_unit_rollback_info_stream_write;

assign causality_violation_stream_read = lpcore_rollback_control_U0_causality_violation_stream_read;

assign event_queue_commit_time_stream15_din = lpcore_commit_control_U0_event_queue_commit_time_stream15_din;

assign event_queue_commit_time_stream15_write = lpcore_commit_control_U0_event_queue_commit_time_stream15_write;

assign event_queue_rollback_info_stream_din = lpcore_rollback_control_U0_event_queue_rollback_info_stream_din;

assign event_queue_rollback_info_stream_write = lpcore_rollback_control_U0_event_queue_rollback_info_stream_write;

assign lpcore_commit_control_U0_ap_continue = 1'b1;

assign lpcore_commit_control_U0_ap_start = 1'b1;

assign lpcore_commit_time_stream_0_read = lpcore_commit_control_U0_lpcore_commit_time_stream_0_read;

assign lpcore_rollback_control_U0_ap_continue = 1'b1;

assign lpcore_rollback_control_U0_ap_start = 1'b1;

assign state_buffer_commit_time_stream16_din = lpcore_commit_control_U0_state_buffer_commit_time_stream16_din;

assign state_buffer_commit_time_stream16_write = lpcore_commit_control_U0_state_buffer_commit_time_stream16_write;

assign state_buffer_rollback_info_stream_din = lpcore_rollback_control_U0_state_buffer_rollback_info_stream_din;

assign state_buffer_rollback_info_stream_write = lpcore_rollback_control_U0_state_buffer_rollback_info_stream_write;

endmodule //simulation_top_lpcore_control_top_0_s
