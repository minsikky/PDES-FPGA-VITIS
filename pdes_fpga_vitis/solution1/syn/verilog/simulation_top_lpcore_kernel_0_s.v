// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module simulation_top_lpcore_kernel_0_s (
        lpcore_init_event_stream_0_dout,
        lpcore_init_event_stream_0_empty_n,
        lpcore_init_event_stream_0_read,
        lpcore_event_queue_full_stream_0_din,
        lpcore_event_queue_full_stream_0_full_n,
        lpcore_event_queue_full_stream_0_write,
        lpcore_anti_message_stream_0_dout,
        lpcore_anti_message_stream_0_empty_n,
        lpcore_anti_message_stream_0_read,
        lpcore_enqueue_event_stream_0_dout,
        lpcore_enqueue_event_stream_0_empty_n,
        lpcore_enqueue_event_stream_0_read,
        lpcore_lvt_stream_0_din,
        lpcore_lvt_stream_0_full_n,
        lpcore_lvt_stream_0_write,
        lpcore_output_event_stream_0_din,
        lpcore_output_event_stream_0_full_n,
        lpcore_output_event_stream_0_write,
        lpcore_cancellation_unit_output_stream_0_din,
        lpcore_cancellation_unit_output_stream_0_full_n,
        lpcore_cancellation_unit_output_stream_0_write,
        lpcore_commit_time_stream_0_dout,
        lpcore_commit_time_stream_0_empty_n,
        lpcore_commit_time_stream_0_read,
        ap_clk,
        ap_rst,
        ap_ready
);


input  [128:0] lpcore_init_event_stream_0_dout;
input   lpcore_init_event_stream_0_empty_n;
output   lpcore_init_event_stream_0_read;
output  [0:0] lpcore_event_queue_full_stream_0_din;
input   lpcore_event_queue_full_stream_0_full_n;
output   lpcore_event_queue_full_stream_0_write;
input  [128:0] lpcore_anti_message_stream_0_dout;
input   lpcore_anti_message_stream_0_empty_n;
output   lpcore_anti_message_stream_0_read;
input  [128:0] lpcore_enqueue_event_stream_0_dout;
input   lpcore_enqueue_event_stream_0_empty_n;
output   lpcore_enqueue_event_stream_0_read;
output  [47:0] lpcore_lvt_stream_0_din;
input   lpcore_lvt_stream_0_full_n;
output   lpcore_lvt_stream_0_write;
output  [128:0] lpcore_output_event_stream_0_din;
input   lpcore_output_event_stream_0_full_n;
output   lpcore_output_event_stream_0_write;
output  [128:0] lpcore_cancellation_unit_output_stream_0_din;
input   lpcore_cancellation_unit_output_stream_0_full_n;
output   lpcore_cancellation_unit_output_stream_0_write;
input  [31:0] lpcore_commit_time_stream_0_dout;
input   lpcore_commit_time_stream_0_empty_n;
output   lpcore_commit_time_stream_0_read;
input   ap_clk;
input   ap_rst;
output   ap_ready;

wire    lpcore_control_top_0_U0_causality_violation_stream_read;
wire   [47:0] lpcore_control_top_0_U0_event_queue_rollback_info_stream_din;
wire    lpcore_control_top_0_U0_event_queue_rollback_info_stream_write;
wire   [47:0] lpcore_control_top_0_U0_state_buffer_rollback_info_stream_din;
wire    lpcore_control_top_0_U0_state_buffer_rollback_info_stream_write;
wire   [47:0] lpcore_control_top_0_U0_cancellation_unit_rollback_info_stream_din;
wire    lpcore_control_top_0_U0_cancellation_unit_rollback_info_stream_write;
wire    lpcore_control_top_0_U0_lpcore_commit_time_stream_0_read;
wire   [31:0] lpcore_control_top_0_U0_event_queue_commit_time_stream15_din;
wire    lpcore_control_top_0_U0_event_queue_commit_time_stream15_write;
wire   [31:0] lpcore_control_top_0_U0_state_buffer_commit_time_stream16_din;
wire    lpcore_control_top_0_U0_state_buffer_commit_time_stream16_write;
wire   [31:0] lpcore_control_top_0_U0_cancellation_unit_commit_time_stream17_din;
wire    lpcore_control_top_0_U0_cancellation_unit_commit_time_stream17_write;
wire    lpcore_control_top_0_U0_ap_ready;
wire    event_queue_top_0_U0_ap_start;
wire    event_queue_top_0_U0_ap_done;
wire    event_queue_top_0_U0_ap_continue;
wire    event_queue_top_0_U0_ap_idle;
wire    event_queue_top_0_U0_ap_ready;
wire    event_queue_top_0_U0_lpcore_init_event_stream_0_read;
wire   [0:0] event_queue_top_0_U0_lpcore_event_queue_full_stream_0_din;
wire    event_queue_top_0_U0_lpcore_event_queue_full_stream_0_write;
wire    event_queue_top_0_U0_event_queue_rollback_info_stream_read;
wire    event_queue_top_0_U0_lpcore_anti_message_stream_0_read;
wire    event_queue_top_0_U0_lpcore_enqueue_event_stream_0_read;
wire    event_queue_top_0_U0_event_queue_commit_time_stream15_read;
wire   [128:0] event_queue_top_0_U0_issued_event_stream_din;
wire    event_queue_top_0_U0_issued_event_stream_write;
wire   [47:0] event_queue_top_0_U0_causality_violation_stream_din;
wire    event_queue_top_0_U0_causality_violation_stream_write;
wire    state_buffer_top_0_U0_ap_start;
wire    state_buffer_top_0_U0_ap_done;
wire    state_buffer_top_0_U0_ap_continue;
wire    state_buffer_top_0_U0_ap_idle;
wire    state_buffer_top_0_U0_ap_ready;
wire    state_buffer_top_0_U0_state_buffer_rollback_info_stream_read;
wire    state_buffer_top_0_U0_state_buffer_commit_time_stream16_read;
wire    state_buffer_top_0_U0_state_buffer_input_stream_read;
wire    state_buffer_top_0_U0_issued_event_stream_read;
wire   [208:0] state_buffer_top_0_U0_event_processor_input_stream_din;
wire    state_buffer_top_0_U0_event_processor_input_stream_write;
wire    event_processor_top_0_U0_ap_start;
wire    event_processor_top_0_U0_ap_done;
wire    event_processor_top_0_U0_ap_continue;
wire    event_processor_top_0_U0_ap_idle;
wire    event_processor_top_0_U0_ap_ready;
wire    event_processor_top_0_U0_event_processor_input_stream_read;
wire   [79:0] event_processor_top_0_U0_state_buffer_input_stream_din;
wire    event_processor_top_0_U0_state_buffer_input_stream_write;
wire   [47:0] event_processor_top_0_U0_lpcore_lvt_stream_0_din;
wire    event_processor_top_0_U0_lpcore_lvt_stream_0_write;
wire   [128:0] event_processor_top_0_U0_lpcore_output_event_stream_0_din;
wire    event_processor_top_0_U0_lpcore_output_event_stream_0_write;
wire   [128:0] event_processor_top_0_U0_cancellation_unit_input_stream_din;
wire    event_processor_top_0_U0_cancellation_unit_input_stream_write;
wire    cancellation_unit_top_0_U0_ap_start;
wire    cancellation_unit_top_0_U0_ap_done;
wire    cancellation_unit_top_0_U0_ap_continue;
wire    cancellation_unit_top_0_U0_ap_idle;
wire    cancellation_unit_top_0_U0_ap_ready;
wire    cancellation_unit_top_0_U0_cancellation_unit_rollback_info_stream_read;
wire    cancellation_unit_top_0_U0_cancellation_unit_commit_time_stream17_read;
wire    cancellation_unit_top_0_U0_cancellation_unit_input_stream_read;
wire   [128:0] cancellation_unit_top_0_U0_lpcore_cancellation_unit_output_stream_0_din;
wire    cancellation_unit_top_0_U0_lpcore_cancellation_unit_output_stream_0_write;
wire    causality_violation_stream_full_n;
wire   [47:0] causality_violation_stream_dout;
wire   [1:0] causality_violation_stream_num_data_valid;
wire   [1:0] causality_violation_stream_fifo_cap;
wire    causality_violation_stream_empty_n;
wire    event_queue_rollback_info_stream_full_n;
wire   [47:0] event_queue_rollback_info_stream_dout;
wire   [1:0] event_queue_rollback_info_stream_num_data_valid;
wire   [1:0] event_queue_rollback_info_stream_fifo_cap;
wire    event_queue_rollback_info_stream_empty_n;
wire    state_buffer_rollback_info_stream_full_n;
wire   [47:0] state_buffer_rollback_info_stream_dout;
wire   [1:0] state_buffer_rollback_info_stream_num_data_valid;
wire   [1:0] state_buffer_rollback_info_stream_fifo_cap;
wire    state_buffer_rollback_info_stream_empty_n;
wire    cancellation_unit_rollback_info_stream_full_n;
wire   [47:0] cancellation_unit_rollback_info_stream_dout;
wire   [1:0] cancellation_unit_rollback_info_stream_num_data_valid;
wire   [1:0] cancellation_unit_rollback_info_stream_fifo_cap;
wire    cancellation_unit_rollback_info_stream_empty_n;
wire    event_queue_commit_time_stream_full_n;
wire   [31:0] event_queue_commit_time_stream_dout;
wire   [1:0] event_queue_commit_time_stream_num_data_valid;
wire   [1:0] event_queue_commit_time_stream_fifo_cap;
wire    event_queue_commit_time_stream_empty_n;
wire    state_buffer_commit_time_stream_full_n;
wire   [31:0] state_buffer_commit_time_stream_dout;
wire   [1:0] state_buffer_commit_time_stream_num_data_valid;
wire   [1:0] state_buffer_commit_time_stream_fifo_cap;
wire    state_buffer_commit_time_stream_empty_n;
wire    cancellation_unit_commit_time_stream_full_n;
wire   [31:0] cancellation_unit_commit_time_stream_dout;
wire   [1:0] cancellation_unit_commit_time_stream_num_data_valid;
wire   [1:0] cancellation_unit_commit_time_stream_fifo_cap;
wire    cancellation_unit_commit_time_stream_empty_n;
wire    issued_event_stream_full_n;
wire   [128:0] issued_event_stream_dout;
wire   [1:0] issued_event_stream_num_data_valid;
wire   [1:0] issued_event_stream_fifo_cap;
wire    issued_event_stream_empty_n;
wire    state_buffer_input_stream_full_n;
wire   [79:0] state_buffer_input_stream_dout;
wire   [1:0] state_buffer_input_stream_num_data_valid;
wire   [1:0] state_buffer_input_stream_fifo_cap;
wire    state_buffer_input_stream_empty_n;
wire    event_processor_input_stream_full_n;
wire   [208:0] event_processor_input_stream_dout;
wire   [1:0] event_processor_input_stream_num_data_valid;
wire   [1:0] event_processor_input_stream_fifo_cap;
wire    event_processor_input_stream_empty_n;
wire    cancellation_unit_input_stream_full_n;
wire   [128:0] cancellation_unit_input_stream_dout;
wire   [1:0] cancellation_unit_input_stream_num_data_valid;
wire   [1:0] cancellation_unit_input_stream_fifo_cap;
wire    cancellation_unit_input_stream_empty_n;

simulation_top_lpcore_control_top_0_s lpcore_control_top_0_U0(
    .causality_violation_stream_dout(causality_violation_stream_dout),
    .causality_violation_stream_empty_n(causality_violation_stream_empty_n),
    .causality_violation_stream_read(lpcore_control_top_0_U0_causality_violation_stream_read),
    .event_queue_rollback_info_stream_din(lpcore_control_top_0_U0_event_queue_rollback_info_stream_din),
    .event_queue_rollback_info_stream_full_n(event_queue_rollback_info_stream_full_n),
    .event_queue_rollback_info_stream_write(lpcore_control_top_0_U0_event_queue_rollback_info_stream_write),
    .state_buffer_rollback_info_stream_din(lpcore_control_top_0_U0_state_buffer_rollback_info_stream_din),
    .state_buffer_rollback_info_stream_full_n(state_buffer_rollback_info_stream_full_n),
    .state_buffer_rollback_info_stream_write(lpcore_control_top_0_U0_state_buffer_rollback_info_stream_write),
    .cancellation_unit_rollback_info_stream_din(lpcore_control_top_0_U0_cancellation_unit_rollback_info_stream_din),
    .cancellation_unit_rollback_info_stream_full_n(cancellation_unit_rollback_info_stream_full_n),
    .cancellation_unit_rollback_info_stream_write(lpcore_control_top_0_U0_cancellation_unit_rollback_info_stream_write),
    .lpcore_commit_time_stream_0_dout(lpcore_commit_time_stream_0_dout),
    .lpcore_commit_time_stream_0_empty_n(lpcore_commit_time_stream_0_empty_n),
    .lpcore_commit_time_stream_0_read(lpcore_control_top_0_U0_lpcore_commit_time_stream_0_read),
    .event_queue_commit_time_stream15_din(lpcore_control_top_0_U0_event_queue_commit_time_stream15_din),
    .event_queue_commit_time_stream15_full_n(event_queue_commit_time_stream_full_n),
    .event_queue_commit_time_stream15_write(lpcore_control_top_0_U0_event_queue_commit_time_stream15_write),
    .state_buffer_commit_time_stream16_din(lpcore_control_top_0_U0_state_buffer_commit_time_stream16_din),
    .state_buffer_commit_time_stream16_full_n(state_buffer_commit_time_stream_full_n),
    .state_buffer_commit_time_stream16_write(lpcore_control_top_0_U0_state_buffer_commit_time_stream16_write),
    .cancellation_unit_commit_time_stream17_din(lpcore_control_top_0_U0_cancellation_unit_commit_time_stream17_din),
    .cancellation_unit_commit_time_stream17_full_n(cancellation_unit_commit_time_stream_full_n),
    .cancellation_unit_commit_time_stream17_write(lpcore_control_top_0_U0_cancellation_unit_commit_time_stream17_write),
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_ready(lpcore_control_top_0_U0_ap_ready)
);

simulation_top_event_queue_top_0_s event_queue_top_0_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(event_queue_top_0_U0_ap_start),
    .ap_done(event_queue_top_0_U0_ap_done),
    .ap_continue(event_queue_top_0_U0_ap_continue),
    .ap_idle(event_queue_top_0_U0_ap_idle),
    .ap_ready(event_queue_top_0_U0_ap_ready),
    .lpcore_init_event_stream_0_dout(lpcore_init_event_stream_0_dout),
    .lpcore_init_event_stream_0_empty_n(lpcore_init_event_stream_0_empty_n),
    .lpcore_init_event_stream_0_read(event_queue_top_0_U0_lpcore_init_event_stream_0_read),
    .lpcore_event_queue_full_stream_0_din(event_queue_top_0_U0_lpcore_event_queue_full_stream_0_din),
    .lpcore_event_queue_full_stream_0_num_data_valid(2'd0),
    .lpcore_event_queue_full_stream_0_fifo_cap(2'd0),
    .lpcore_event_queue_full_stream_0_full_n(lpcore_event_queue_full_stream_0_full_n),
    .lpcore_event_queue_full_stream_0_write(event_queue_top_0_U0_lpcore_event_queue_full_stream_0_write),
    .event_queue_rollback_info_stream_dout(event_queue_rollback_info_stream_dout),
    .event_queue_rollback_info_stream_num_data_valid(event_queue_rollback_info_stream_num_data_valid),
    .event_queue_rollback_info_stream_fifo_cap(event_queue_rollback_info_stream_fifo_cap),
    .event_queue_rollback_info_stream_empty_n(event_queue_rollback_info_stream_empty_n),
    .event_queue_rollback_info_stream_read(event_queue_top_0_U0_event_queue_rollback_info_stream_read),
    .lpcore_anti_message_stream_0_dout(lpcore_anti_message_stream_0_dout),
    .lpcore_anti_message_stream_0_num_data_valid(2'd0),
    .lpcore_anti_message_stream_0_fifo_cap(2'd0),
    .lpcore_anti_message_stream_0_empty_n(lpcore_anti_message_stream_0_empty_n),
    .lpcore_anti_message_stream_0_read(event_queue_top_0_U0_lpcore_anti_message_stream_0_read),
    .lpcore_enqueue_event_stream_0_dout(lpcore_enqueue_event_stream_0_dout),
    .lpcore_enqueue_event_stream_0_num_data_valid(2'd0),
    .lpcore_enqueue_event_stream_0_fifo_cap(2'd0),
    .lpcore_enqueue_event_stream_0_empty_n(lpcore_enqueue_event_stream_0_empty_n),
    .lpcore_enqueue_event_stream_0_read(event_queue_top_0_U0_lpcore_enqueue_event_stream_0_read),
    .event_queue_commit_time_stream15_dout(event_queue_commit_time_stream_dout),
    .event_queue_commit_time_stream15_num_data_valid(event_queue_commit_time_stream_num_data_valid),
    .event_queue_commit_time_stream15_fifo_cap(event_queue_commit_time_stream_fifo_cap),
    .event_queue_commit_time_stream15_empty_n(event_queue_commit_time_stream_empty_n),
    .event_queue_commit_time_stream15_read(event_queue_top_0_U0_event_queue_commit_time_stream15_read),
    .issued_event_stream_din(event_queue_top_0_U0_issued_event_stream_din),
    .issued_event_stream_num_data_valid(issued_event_stream_num_data_valid),
    .issued_event_stream_fifo_cap(issued_event_stream_fifo_cap),
    .issued_event_stream_full_n(issued_event_stream_full_n),
    .issued_event_stream_write(event_queue_top_0_U0_issued_event_stream_write),
    .causality_violation_stream_din(event_queue_top_0_U0_causality_violation_stream_din),
    .causality_violation_stream_num_data_valid(causality_violation_stream_num_data_valid),
    .causality_violation_stream_fifo_cap(causality_violation_stream_fifo_cap),
    .causality_violation_stream_full_n(causality_violation_stream_full_n),
    .causality_violation_stream_write(event_queue_top_0_U0_causality_violation_stream_write)
);

simulation_top_state_buffer_top_0_s state_buffer_top_0_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(state_buffer_top_0_U0_ap_start),
    .ap_done(state_buffer_top_0_U0_ap_done),
    .ap_continue(state_buffer_top_0_U0_ap_continue),
    .ap_idle(state_buffer_top_0_U0_ap_idle),
    .ap_ready(state_buffer_top_0_U0_ap_ready),
    .state_buffer_rollback_info_stream_dout(state_buffer_rollback_info_stream_dout),
    .state_buffer_rollback_info_stream_num_data_valid(state_buffer_rollback_info_stream_num_data_valid),
    .state_buffer_rollback_info_stream_fifo_cap(state_buffer_rollback_info_stream_fifo_cap),
    .state_buffer_rollback_info_stream_empty_n(state_buffer_rollback_info_stream_empty_n),
    .state_buffer_rollback_info_stream_read(state_buffer_top_0_U0_state_buffer_rollback_info_stream_read),
    .state_buffer_commit_time_stream16_dout(state_buffer_commit_time_stream_dout),
    .state_buffer_commit_time_stream16_num_data_valid(state_buffer_commit_time_stream_num_data_valid),
    .state_buffer_commit_time_stream16_fifo_cap(state_buffer_commit_time_stream_fifo_cap),
    .state_buffer_commit_time_stream16_empty_n(state_buffer_commit_time_stream_empty_n),
    .state_buffer_commit_time_stream16_read(state_buffer_top_0_U0_state_buffer_commit_time_stream16_read),
    .state_buffer_input_stream_dout(state_buffer_input_stream_dout),
    .state_buffer_input_stream_num_data_valid(state_buffer_input_stream_num_data_valid),
    .state_buffer_input_stream_fifo_cap(state_buffer_input_stream_fifo_cap),
    .state_buffer_input_stream_empty_n(state_buffer_input_stream_empty_n),
    .state_buffer_input_stream_read(state_buffer_top_0_U0_state_buffer_input_stream_read),
    .issued_event_stream_dout(issued_event_stream_dout),
    .issued_event_stream_num_data_valid(issued_event_stream_num_data_valid),
    .issued_event_stream_fifo_cap(issued_event_stream_fifo_cap),
    .issued_event_stream_empty_n(issued_event_stream_empty_n),
    .issued_event_stream_read(state_buffer_top_0_U0_issued_event_stream_read),
    .event_processor_input_stream_din(state_buffer_top_0_U0_event_processor_input_stream_din),
    .event_processor_input_stream_num_data_valid(event_processor_input_stream_num_data_valid),
    .event_processor_input_stream_fifo_cap(event_processor_input_stream_fifo_cap),
    .event_processor_input_stream_full_n(event_processor_input_stream_full_n),
    .event_processor_input_stream_write(state_buffer_top_0_U0_event_processor_input_stream_write)
);

simulation_top_event_processor_top_0_s event_processor_top_0_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(event_processor_top_0_U0_ap_start),
    .ap_done(event_processor_top_0_U0_ap_done),
    .ap_continue(event_processor_top_0_U0_ap_continue),
    .ap_idle(event_processor_top_0_U0_ap_idle),
    .ap_ready(event_processor_top_0_U0_ap_ready),
    .event_processor_input_stream_dout(event_processor_input_stream_dout),
    .event_processor_input_stream_num_data_valid(event_processor_input_stream_num_data_valid),
    .event_processor_input_stream_fifo_cap(event_processor_input_stream_fifo_cap),
    .event_processor_input_stream_empty_n(event_processor_input_stream_empty_n),
    .event_processor_input_stream_read(event_processor_top_0_U0_event_processor_input_stream_read),
    .state_buffer_input_stream_din(event_processor_top_0_U0_state_buffer_input_stream_din),
    .state_buffer_input_stream_num_data_valid(state_buffer_input_stream_num_data_valid),
    .state_buffer_input_stream_fifo_cap(state_buffer_input_stream_fifo_cap),
    .state_buffer_input_stream_full_n(state_buffer_input_stream_full_n),
    .state_buffer_input_stream_write(event_processor_top_0_U0_state_buffer_input_stream_write),
    .lpcore_lvt_stream_0_din(event_processor_top_0_U0_lpcore_lvt_stream_0_din),
    .lpcore_lvt_stream_0_num_data_valid(2'd0),
    .lpcore_lvt_stream_0_fifo_cap(2'd0),
    .lpcore_lvt_stream_0_full_n(lpcore_lvt_stream_0_full_n),
    .lpcore_lvt_stream_0_write(event_processor_top_0_U0_lpcore_lvt_stream_0_write),
    .lpcore_output_event_stream_0_din(event_processor_top_0_U0_lpcore_output_event_stream_0_din),
    .lpcore_output_event_stream_0_num_data_valid(2'd0),
    .lpcore_output_event_stream_0_fifo_cap(2'd0),
    .lpcore_output_event_stream_0_full_n(lpcore_output_event_stream_0_full_n),
    .lpcore_output_event_stream_0_write(event_processor_top_0_U0_lpcore_output_event_stream_0_write),
    .cancellation_unit_input_stream_din(event_processor_top_0_U0_cancellation_unit_input_stream_din),
    .cancellation_unit_input_stream_num_data_valid(cancellation_unit_input_stream_num_data_valid),
    .cancellation_unit_input_stream_fifo_cap(cancellation_unit_input_stream_fifo_cap),
    .cancellation_unit_input_stream_full_n(cancellation_unit_input_stream_full_n),
    .cancellation_unit_input_stream_write(event_processor_top_0_U0_cancellation_unit_input_stream_write)
);

simulation_top_cancellation_unit_top_0_s cancellation_unit_top_0_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(cancellation_unit_top_0_U0_ap_start),
    .ap_done(cancellation_unit_top_0_U0_ap_done),
    .ap_continue(cancellation_unit_top_0_U0_ap_continue),
    .ap_idle(cancellation_unit_top_0_U0_ap_idle),
    .ap_ready(cancellation_unit_top_0_U0_ap_ready),
    .cancellation_unit_rollback_info_stream_dout(cancellation_unit_rollback_info_stream_dout),
    .cancellation_unit_rollback_info_stream_num_data_valid(cancellation_unit_rollback_info_stream_num_data_valid),
    .cancellation_unit_rollback_info_stream_fifo_cap(cancellation_unit_rollback_info_stream_fifo_cap),
    .cancellation_unit_rollback_info_stream_empty_n(cancellation_unit_rollback_info_stream_empty_n),
    .cancellation_unit_rollback_info_stream_read(cancellation_unit_top_0_U0_cancellation_unit_rollback_info_stream_read),
    .cancellation_unit_commit_time_stream17_dout(cancellation_unit_commit_time_stream_dout),
    .cancellation_unit_commit_time_stream17_num_data_valid(cancellation_unit_commit_time_stream_num_data_valid),
    .cancellation_unit_commit_time_stream17_fifo_cap(cancellation_unit_commit_time_stream_fifo_cap),
    .cancellation_unit_commit_time_stream17_empty_n(cancellation_unit_commit_time_stream_empty_n),
    .cancellation_unit_commit_time_stream17_read(cancellation_unit_top_0_U0_cancellation_unit_commit_time_stream17_read),
    .cancellation_unit_input_stream_dout(cancellation_unit_input_stream_dout),
    .cancellation_unit_input_stream_num_data_valid(cancellation_unit_input_stream_num_data_valid),
    .cancellation_unit_input_stream_fifo_cap(cancellation_unit_input_stream_fifo_cap),
    .cancellation_unit_input_stream_empty_n(cancellation_unit_input_stream_empty_n),
    .cancellation_unit_input_stream_read(cancellation_unit_top_0_U0_cancellation_unit_input_stream_read),
    .lpcore_cancellation_unit_output_stream_0_din(cancellation_unit_top_0_U0_lpcore_cancellation_unit_output_stream_0_din),
    .lpcore_cancellation_unit_output_stream_0_num_data_valid(2'd0),
    .lpcore_cancellation_unit_output_stream_0_fifo_cap(2'd0),
    .lpcore_cancellation_unit_output_stream_0_full_n(lpcore_cancellation_unit_output_stream_0_full_n),
    .lpcore_cancellation_unit_output_stream_0_write(cancellation_unit_top_0_U0_lpcore_cancellation_unit_output_stream_0_write)
);

simulation_top_fifo_w48_d2_S causality_violation_stream_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(event_queue_top_0_U0_causality_violation_stream_din),
    .if_full_n(causality_violation_stream_full_n),
    .if_write(event_queue_top_0_U0_causality_violation_stream_write),
    .if_dout(causality_violation_stream_dout),
    .if_num_data_valid(causality_violation_stream_num_data_valid),
    .if_fifo_cap(causality_violation_stream_fifo_cap),
    .if_empty_n(causality_violation_stream_empty_n),
    .if_read(lpcore_control_top_0_U0_causality_violation_stream_read)
);

simulation_top_fifo_w48_d2_S event_queue_rollback_info_stream_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(lpcore_control_top_0_U0_event_queue_rollback_info_stream_din),
    .if_full_n(event_queue_rollback_info_stream_full_n),
    .if_write(lpcore_control_top_0_U0_event_queue_rollback_info_stream_write),
    .if_dout(event_queue_rollback_info_stream_dout),
    .if_num_data_valid(event_queue_rollback_info_stream_num_data_valid),
    .if_fifo_cap(event_queue_rollback_info_stream_fifo_cap),
    .if_empty_n(event_queue_rollback_info_stream_empty_n),
    .if_read(event_queue_top_0_U0_event_queue_rollback_info_stream_read)
);

simulation_top_fifo_w48_d2_S state_buffer_rollback_info_stream_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(lpcore_control_top_0_U0_state_buffer_rollback_info_stream_din),
    .if_full_n(state_buffer_rollback_info_stream_full_n),
    .if_write(lpcore_control_top_0_U0_state_buffer_rollback_info_stream_write),
    .if_dout(state_buffer_rollback_info_stream_dout),
    .if_num_data_valid(state_buffer_rollback_info_stream_num_data_valid),
    .if_fifo_cap(state_buffer_rollback_info_stream_fifo_cap),
    .if_empty_n(state_buffer_rollback_info_stream_empty_n),
    .if_read(state_buffer_top_0_U0_state_buffer_rollback_info_stream_read)
);

simulation_top_fifo_w48_d2_S cancellation_unit_rollback_info_stream_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(lpcore_control_top_0_U0_cancellation_unit_rollback_info_stream_din),
    .if_full_n(cancellation_unit_rollback_info_stream_full_n),
    .if_write(lpcore_control_top_0_U0_cancellation_unit_rollback_info_stream_write),
    .if_dout(cancellation_unit_rollback_info_stream_dout),
    .if_num_data_valid(cancellation_unit_rollback_info_stream_num_data_valid),
    .if_fifo_cap(cancellation_unit_rollback_info_stream_fifo_cap),
    .if_empty_n(cancellation_unit_rollback_info_stream_empty_n),
    .if_read(cancellation_unit_top_0_U0_cancellation_unit_rollback_info_stream_read)
);

simulation_top_fifo_w32_d2_S event_queue_commit_time_stream_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(lpcore_control_top_0_U0_event_queue_commit_time_stream15_din),
    .if_full_n(event_queue_commit_time_stream_full_n),
    .if_write(lpcore_control_top_0_U0_event_queue_commit_time_stream15_write),
    .if_dout(event_queue_commit_time_stream_dout),
    .if_num_data_valid(event_queue_commit_time_stream_num_data_valid),
    .if_fifo_cap(event_queue_commit_time_stream_fifo_cap),
    .if_empty_n(event_queue_commit_time_stream_empty_n),
    .if_read(event_queue_top_0_U0_event_queue_commit_time_stream15_read)
);

simulation_top_fifo_w32_d2_S state_buffer_commit_time_stream_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(lpcore_control_top_0_U0_state_buffer_commit_time_stream16_din),
    .if_full_n(state_buffer_commit_time_stream_full_n),
    .if_write(lpcore_control_top_0_U0_state_buffer_commit_time_stream16_write),
    .if_dout(state_buffer_commit_time_stream_dout),
    .if_num_data_valid(state_buffer_commit_time_stream_num_data_valid),
    .if_fifo_cap(state_buffer_commit_time_stream_fifo_cap),
    .if_empty_n(state_buffer_commit_time_stream_empty_n),
    .if_read(state_buffer_top_0_U0_state_buffer_commit_time_stream16_read)
);

simulation_top_fifo_w32_d2_S cancellation_unit_commit_time_stream_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(lpcore_control_top_0_U0_cancellation_unit_commit_time_stream17_din),
    .if_full_n(cancellation_unit_commit_time_stream_full_n),
    .if_write(lpcore_control_top_0_U0_cancellation_unit_commit_time_stream17_write),
    .if_dout(cancellation_unit_commit_time_stream_dout),
    .if_num_data_valid(cancellation_unit_commit_time_stream_num_data_valid),
    .if_fifo_cap(cancellation_unit_commit_time_stream_fifo_cap),
    .if_empty_n(cancellation_unit_commit_time_stream_empty_n),
    .if_read(cancellation_unit_top_0_U0_cancellation_unit_commit_time_stream17_read)
);

simulation_top_fifo_w129_d2_S issued_event_stream_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(event_queue_top_0_U0_issued_event_stream_din),
    .if_full_n(issued_event_stream_full_n),
    .if_write(event_queue_top_0_U0_issued_event_stream_write),
    .if_dout(issued_event_stream_dout),
    .if_num_data_valid(issued_event_stream_num_data_valid),
    .if_fifo_cap(issued_event_stream_fifo_cap),
    .if_empty_n(issued_event_stream_empty_n),
    .if_read(state_buffer_top_0_U0_issued_event_stream_read)
);

simulation_top_fifo_w80_d2_S state_buffer_input_stream_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(event_processor_top_0_U0_state_buffer_input_stream_din),
    .if_full_n(state_buffer_input_stream_full_n),
    .if_write(event_processor_top_0_U0_state_buffer_input_stream_write),
    .if_dout(state_buffer_input_stream_dout),
    .if_num_data_valid(state_buffer_input_stream_num_data_valid),
    .if_fifo_cap(state_buffer_input_stream_fifo_cap),
    .if_empty_n(state_buffer_input_stream_empty_n),
    .if_read(state_buffer_top_0_U0_state_buffer_input_stream_read)
);

simulation_top_fifo_w209_d2_S event_processor_input_stream_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(state_buffer_top_0_U0_event_processor_input_stream_din),
    .if_full_n(event_processor_input_stream_full_n),
    .if_write(state_buffer_top_0_U0_event_processor_input_stream_write),
    .if_dout(event_processor_input_stream_dout),
    .if_num_data_valid(event_processor_input_stream_num_data_valid),
    .if_fifo_cap(event_processor_input_stream_fifo_cap),
    .if_empty_n(event_processor_input_stream_empty_n),
    .if_read(event_processor_top_0_U0_event_processor_input_stream_read)
);

simulation_top_fifo_w129_d2_S cancellation_unit_input_stream_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(event_processor_top_0_U0_cancellation_unit_input_stream_din),
    .if_full_n(cancellation_unit_input_stream_full_n),
    .if_write(event_processor_top_0_U0_cancellation_unit_input_stream_write),
    .if_dout(cancellation_unit_input_stream_dout),
    .if_num_data_valid(cancellation_unit_input_stream_num_data_valid),
    .if_fifo_cap(cancellation_unit_input_stream_fifo_cap),
    .if_empty_n(cancellation_unit_input_stream_empty_n),
    .if_read(cancellation_unit_top_0_U0_cancellation_unit_input_stream_read)
);

assign ap_ready = 1'b1;

assign cancellation_unit_top_0_U0_ap_continue = 1'b1;

assign cancellation_unit_top_0_U0_ap_start = 1'b1;

assign event_processor_top_0_U0_ap_continue = 1'b1;

assign event_processor_top_0_U0_ap_start = 1'b1;

assign event_queue_top_0_U0_ap_continue = 1'b1;

assign event_queue_top_0_U0_ap_start = 1'b1;

assign lpcore_anti_message_stream_0_read = event_queue_top_0_U0_lpcore_anti_message_stream_0_read;

assign lpcore_cancellation_unit_output_stream_0_din = cancellation_unit_top_0_U0_lpcore_cancellation_unit_output_stream_0_din;

assign lpcore_cancellation_unit_output_stream_0_write = cancellation_unit_top_0_U0_lpcore_cancellation_unit_output_stream_0_write;

assign lpcore_commit_time_stream_0_read = lpcore_control_top_0_U0_lpcore_commit_time_stream_0_read;

assign lpcore_enqueue_event_stream_0_read = event_queue_top_0_U0_lpcore_enqueue_event_stream_0_read;

assign lpcore_event_queue_full_stream_0_din = event_queue_top_0_U0_lpcore_event_queue_full_stream_0_din;

assign lpcore_event_queue_full_stream_0_write = event_queue_top_0_U0_lpcore_event_queue_full_stream_0_write;

assign lpcore_init_event_stream_0_read = event_queue_top_0_U0_lpcore_init_event_stream_0_read;

assign lpcore_lvt_stream_0_din = event_processor_top_0_U0_lpcore_lvt_stream_0_din;

assign lpcore_lvt_stream_0_write = event_processor_top_0_U0_lpcore_lvt_stream_0_write;

assign lpcore_output_event_stream_0_din = event_processor_top_0_U0_lpcore_output_event_stream_0_din;

assign lpcore_output_event_stream_0_write = event_processor_top_0_U0_lpcore_output_event_stream_0_write;

assign state_buffer_top_0_U0_ap_continue = 1'b1;

assign state_buffer_top_0_U0_ap_start = 1'b1;

endmodule //simulation_top_lpcore_kernel_0_s
