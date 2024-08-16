// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module simulation_top_cancellation_unit_top_0_Pipeline_VITIS_LOOP_58_1 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        current_V,
        zext_ln145,
        lpcore_cancellation_unit_output_stream_0_din,
        lpcore_cancellation_unit_output_stream_0_num_data_valid,
        lpcore_cancellation_unit_output_stream_0_fifo_cap,
        lpcore_cancellation_unit_output_stream_0_full_n,
        lpcore_cancellation_unit_output_stream_0_write,
        tmp_to_time_V,
        cancellation_unit_buffer_event_recv_time_V_1_address0,
        cancellation_unit_buffer_event_recv_time_V_1_ce0,
        cancellation_unit_buffer_event_recv_time_V_1_q0,
        cancellation_unit_buffer_event_data_V_1_address0,
        cancellation_unit_buffer_event_data_V_1_ce0,
        cancellation_unit_buffer_event_data_V_1_q0,
        cancellation_unit_buffer_event_sender_id_V_1_address0,
        cancellation_unit_buffer_event_sender_id_V_1_ce0,
        cancellation_unit_buffer_event_sender_id_V_1_q0,
        cancellation_unit_buffer_event_receiver_id_V_1_address0,
        cancellation_unit_buffer_event_receiver_id_V_1_ce0,
        cancellation_unit_buffer_event_receiver_id_V_1_q0,
        cancellation_unit_buffer_next_V_1_address0,
        cancellation_unit_buffer_next_V_1_ce0,
        cancellation_unit_buffer_next_V_1_we0,
        cancellation_unit_buffer_next_V_1_d0,
        cancellation_unit_buffer_next_V_1_q0,
        cancellation_unit_lp_heads_V_1_address0,
        cancellation_unit_lp_heads_V_1_ce0,
        cancellation_unit_lp_heads_V_1_we0,
        cancellation_unit_lp_heads_V_1_d0,
        cancellation_unit_free_head_V_1_i,
        cancellation_unit_free_head_V_1_o,
        cancellation_unit_free_head_V_1_o_ap_vld,
        cancellation_unit_lp_sizes_V_1_address0,
        cancellation_unit_lp_sizes_V_1_ce0,
        cancellation_unit_lp_sizes_V_1_we0,
        cancellation_unit_lp_sizes_V_1_d0,
        cancellation_unit_lp_sizes_V_1_q0,
        cancellation_unit_total_size_V_1_i,
        cancellation_unit_total_size_V_1_o,
        cancellation_unit_total_size_V_1_o_ap_vld,
        cancellation_unit_buffer_event_send_time_V_1_address0,
        cancellation_unit_buffer_event_send_time_V_1_ce0,
        cancellation_unit_buffer_event_send_time_V_1_q0
);

parameter    ap_ST_fsm_pp0_stage0 = 2'd1;
parameter    ap_ST_fsm_pp0_stage1 = 2'd2;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [15:0] current_V;
input  [1:0] zext_ln145;
output  [128:0] lpcore_cancellation_unit_output_stream_0_din;
input  [1:0] lpcore_cancellation_unit_output_stream_0_num_data_valid;
input  [1:0] lpcore_cancellation_unit_output_stream_0_fifo_cap;
input   lpcore_cancellation_unit_output_stream_0_full_n;
output   lpcore_cancellation_unit_output_stream_0_write;
input  [31:0] tmp_to_time_V;
output  [5:0] cancellation_unit_buffer_event_recv_time_V_1_address0;
output   cancellation_unit_buffer_event_recv_time_V_1_ce0;
input  [31:0] cancellation_unit_buffer_event_recv_time_V_1_q0;
output  [5:0] cancellation_unit_buffer_event_data_V_1_address0;
output   cancellation_unit_buffer_event_data_V_1_ce0;
input  [31:0] cancellation_unit_buffer_event_data_V_1_q0;
output  [5:0] cancellation_unit_buffer_event_sender_id_V_1_address0;
output   cancellation_unit_buffer_event_sender_id_V_1_ce0;
input  [15:0] cancellation_unit_buffer_event_sender_id_V_1_q0;
output  [5:0] cancellation_unit_buffer_event_receiver_id_V_1_address0;
output   cancellation_unit_buffer_event_receiver_id_V_1_ce0;
input  [15:0] cancellation_unit_buffer_event_receiver_id_V_1_q0;
output  [5:0] cancellation_unit_buffer_next_V_1_address0;
output   cancellation_unit_buffer_next_V_1_ce0;
output   cancellation_unit_buffer_next_V_1_we0;
output  [15:0] cancellation_unit_buffer_next_V_1_d0;
input  [15:0] cancellation_unit_buffer_next_V_1_q0;
output  [1:0] cancellation_unit_lp_heads_V_1_address0;
output   cancellation_unit_lp_heads_V_1_ce0;
output   cancellation_unit_lp_heads_V_1_we0;
output  [15:0] cancellation_unit_lp_heads_V_1_d0;
input  [15:0] cancellation_unit_free_head_V_1_i;
output  [15:0] cancellation_unit_free_head_V_1_o;
output   cancellation_unit_free_head_V_1_o_ap_vld;
output  [1:0] cancellation_unit_lp_sizes_V_1_address0;
output   cancellation_unit_lp_sizes_V_1_ce0;
output   cancellation_unit_lp_sizes_V_1_we0;
output  [15:0] cancellation_unit_lp_sizes_V_1_d0;
input  [15:0] cancellation_unit_lp_sizes_V_1_q0;
input  [15:0] cancellation_unit_total_size_V_1_i;
output  [15:0] cancellation_unit_total_size_V_1_o;
output   cancellation_unit_total_size_V_1_o_ap_vld;
output  [5:0] cancellation_unit_buffer_event_send_time_V_1_address0;
output   cancellation_unit_buffer_event_send_time_V_1_ce0;
input  [31:0] cancellation_unit_buffer_event_send_time_V_1_q0;

reg ap_idle;
reg lpcore_cancellation_unit_output_stream_0_write;
reg cancellation_unit_buffer_event_recv_time_V_1_ce0;
reg cancellation_unit_buffer_event_data_V_1_ce0;
reg cancellation_unit_buffer_event_sender_id_V_1_ce0;
reg cancellation_unit_buffer_event_receiver_id_V_1_ce0;
reg cancellation_unit_buffer_next_V_1_ce0;
reg cancellation_unit_buffer_next_V_1_we0;
reg cancellation_unit_lp_heads_V_1_ce0;
reg cancellation_unit_lp_heads_V_1_we0;
reg[15:0] cancellation_unit_free_head_V_1_o;
reg cancellation_unit_free_head_V_1_o_ap_vld;
reg[1:0] cancellation_unit_lp_sizes_V_1_address0;
reg cancellation_unit_lp_sizes_V_1_ce0;
reg cancellation_unit_lp_sizes_V_1_we0;
reg[15:0] cancellation_unit_total_size_V_1_o;
reg cancellation_unit_total_size_V_1_o_ap_vld;
reg cancellation_unit_buffer_event_send_time_V_1_ce0;

(* fsm_encoding = "none" *) reg   [1:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire    ap_CS_fsm_pp0_stage1;
wire    ap_block_state2_pp0_stage1_iter0;
wire    ap_block_pp0_stage1_subdone;
wire   [0:0] icmp_ln1081_fu_259_p2;
reg   [0:0] icmp_ln1069_reg_425;
reg    ap_condition_exit_pp0_iter0_stage1;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    lpcore_cancellation_unit_output_stream_0_blk_n;
wire    ap_block_pp0_stage0;
wire    ap_block_state1_pp0_stage0_iter0;
reg    ap_block_state3_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_11001;
wire   [63:0] zext_ln145_cast_fu_216_p1;
reg   [63:0] zext_ln145_cast_reg_412;
reg   [15:0] current_V_34_reg_420;
wire   [0:0] icmp_ln1069_fu_248_p2;
wire   [63:0] zext_ln587_fu_254_p1;
reg   [63:0] zext_ln587_reg_429;
reg   [1:0] cancellation_unit_lp_sizes_V_1_addr_reg_445;
wire    ap_block_pp0_stage1_11001;
reg   [1:0] cancellation_unit_lp_heads_V_1_addr_reg_450;
reg   [31:0] anti_message_send_time_V_reg_455;
reg   [15:0] reuse_reg1_load_reg_488;
wire   [0:0] addr_cmp5_fu_270_p2;
reg   [0:0] addr_cmp5_reg_493;
wire   [0:0] addr_cmp_fu_297_p2;
reg   [0:0] addr_cmp_reg_498;
reg    ap_enable_reg_pp0_iter0_reg;
reg    ap_block_pp0_stage0_subdone;
wire    ap_block_pp0_stage1;
wire   [15:0] add_ln887_6_fu_310_p2;
reg   [63:0] reuse_addr_reg2_fu_68;
wire    ap_loop_init;
reg   [15:0] reuse_reg1_fu_72;
reg   [63:0] reuse_addr_reg_fu_76;
reg   [15:0] reuse_reg_fu_80;
wire   [15:0] add_ln887_fu_355_p2;
reg   [15:0] current_V_26_fu_84;
wire   [15:0] current_V_35_fu_338_p3;
reg   [15:0] ap_sig_allocacmp_current_V_34;
reg    ap_block_pp0_stage0_01001;
wire   [15:0] reuse_select_fu_348_p3;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [1:0] ap_NS_fsm;
reg    ap_idle_pp0_1to1;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 2'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter0_reg = 1'b0;
#0 ap_done_reg = 1'b0;
end

simulation_top_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage1),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue_int == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_pp0_stage0)) begin
            ap_enable_reg_pp0_iter0_reg <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b1 == ap_condition_exit_pp0_iter0_stage1) | ((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            current_V_26_fu_84 <= current_V;
        end else if ((ap_enable_reg_pp0_iter1 == 1'b1)) begin
            current_V_26_fu_84 <= current_V_35_fu_338_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        reuse_addr_reg2_fu_68 <= 64'd18446744073709551615;
    end else if (((icmp_ln1069_reg_425 == 1'd0) & (icmp_ln1081_fu_259_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        reuse_addr_reg2_fu_68 <= zext_ln587_reg_429;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        reuse_addr_reg_fu_76 <= 64'd18446744073709551615;
    end else if (((icmp_ln1069_reg_425 == 1'd0) & (icmp_ln1081_fu_259_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        reuse_addr_reg_fu_76 <= zext_ln145_cast_reg_412;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        reuse_reg1_fu_72 <= 16'd0;
    end else if (((icmp_ln1069_reg_425 == 1'd0) & (icmp_ln1081_fu_259_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        reuse_reg1_fu_72 <= cancellation_unit_free_head_V_1_i;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            reuse_reg_fu_80 <= 16'd0;
        end else if ((ap_enable_reg_pp0_iter1 == 1'b1)) begin
            reuse_reg_fu_80 <= add_ln887_fu_355_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln1069_reg_425 == 1'd0) & (icmp_ln1081_fu_259_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        addr_cmp5_reg_493 <= addr_cmp5_fu_270_p2;
        addr_cmp_reg_498 <= addr_cmp_fu_297_p2;
        reuse_reg1_load_reg_488 <= reuse_reg1_fu_72;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln1069_reg_425 == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        anti_message_send_time_V_reg_455 <= cancellation_unit_buffer_event_send_time_V_1_q0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        cancellation_unit_lp_heads_V_1_addr_reg_450 <= zext_ln145_cast_reg_412;
        cancellation_unit_lp_sizes_V_1_addr_reg_445 <= zext_ln145_cast_reg_412;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        current_V_34_reg_420 <= ap_sig_allocacmp_current_V_34;
        icmp_ln1069_reg_425 <= icmp_ln1069_fu_248_p2;
        zext_ln145_cast_reg_412[1 : 0] <= zext_ln145_cast_fu_216_p1[1 : 0];
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln1069_fu_248_p2 == 1'd0))) begin
        zext_ln587_reg_429[15 : 0] <= zext_ln587_fu_254_p1[15 : 0];
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & ((icmp_ln1069_reg_425 == 1'd1) | (icmp_ln1081_fu_259_p2 == 1'd0)))) begin
        ap_condition_exit_pp0_iter0_stage1 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_pp0_stage0)) begin
        ap_enable_reg_pp0_iter0 = ap_start_int;
    end else begin
        ap_enable_reg_pp0_iter0 = ap_enable_reg_pp0_iter0_reg;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b0) & (ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter1 == 1'b0)) begin
        ap_idle_pp0_1to1 = 1'b1;
    end else begin
        ap_idle_pp0_1to1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            ap_sig_allocacmp_current_V_34 = current_V;
        end else if ((ap_enable_reg_pp0_iter1 == 1'b1)) begin
            ap_sig_allocacmp_current_V_34 = current_V_35_fu_338_p3;
        end else begin
            ap_sig_allocacmp_current_V_34 = current_V_26_fu_84;
        end
    end else begin
        ap_sig_allocacmp_current_V_34 = current_V_26_fu_84;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        cancellation_unit_buffer_event_data_V_1_ce0 = 1'b1;
    end else begin
        cancellation_unit_buffer_event_data_V_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        cancellation_unit_buffer_event_receiver_id_V_1_ce0 = 1'b1;
    end else begin
        cancellation_unit_buffer_event_receiver_id_V_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        cancellation_unit_buffer_event_recv_time_V_1_ce0 = 1'b1;
    end else begin
        cancellation_unit_buffer_event_recv_time_V_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        cancellation_unit_buffer_event_send_time_V_1_ce0 = 1'b1;
    end else begin
        cancellation_unit_buffer_event_send_time_V_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        cancellation_unit_buffer_event_sender_id_V_1_ce0 = 1'b1;
    end else begin
        cancellation_unit_buffer_event_sender_id_V_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln1069_reg_425 == 1'd0) & (icmp_ln1081_fu_259_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        cancellation_unit_buffer_next_V_1_ce0 = 1'b1;
    end else begin
        cancellation_unit_buffer_next_V_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln1069_reg_425 == 1'd0) & (icmp_ln1081_fu_259_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        cancellation_unit_buffer_next_V_1_we0 = 1'b1;
    end else begin
        cancellation_unit_buffer_next_V_1_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln1069_reg_425 == 1'd0) & (icmp_ln1081_fu_259_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        cancellation_unit_free_head_V_1_o = current_V_34_reg_420;
    end else begin
        cancellation_unit_free_head_V_1_o = cancellation_unit_free_head_V_1_i;
    end
end

always @ (*) begin
    if (((icmp_ln1069_reg_425 == 1'd0) & (icmp_ln1081_fu_259_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        cancellation_unit_free_head_V_1_o_ap_vld = 1'b1;
    end else begin
        cancellation_unit_free_head_V_1_o_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        cancellation_unit_lp_heads_V_1_ce0 = 1'b1;
    end else begin
        cancellation_unit_lp_heads_V_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        cancellation_unit_lp_heads_V_1_we0 = 1'b1;
    end else begin
        cancellation_unit_lp_heads_V_1_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        cancellation_unit_lp_sizes_V_1_address0 = cancellation_unit_lp_sizes_V_1_addr_reg_445;
    end else if (((1'b0 == ap_block_pp0_stage1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        cancellation_unit_lp_sizes_V_1_address0 = zext_ln145_cast_reg_412;
    end else begin
        cancellation_unit_lp_sizes_V_1_address0 = 'bx;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1)) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        cancellation_unit_lp_sizes_V_1_ce0 = 1'b1;
    end else begin
        cancellation_unit_lp_sizes_V_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        cancellation_unit_lp_sizes_V_1_we0 = 1'b1;
    end else begin
        cancellation_unit_lp_sizes_V_1_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln1069_reg_425 == 1'd0) & (icmp_ln1081_fu_259_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        cancellation_unit_total_size_V_1_o = add_ln887_6_fu_310_p2;
    end else begin
        cancellation_unit_total_size_V_1_o = cancellation_unit_total_size_V_1_i;
    end
end

always @ (*) begin
    if (((icmp_ln1069_reg_425 == 1'd0) & (icmp_ln1081_fu_259_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        cancellation_unit_total_size_V_1_o_ap_vld = 1'b1;
    end else begin
        cancellation_unit_total_size_V_1_o_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        lpcore_cancellation_unit_output_stream_0_blk_n = lpcore_cancellation_unit_output_stream_0_full_n;
    end else begin
        lpcore_cancellation_unit_output_stream_0_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        lpcore_cancellation_unit_output_stream_0_write = 1'b1;
    end else begin
        lpcore_cancellation_unit_output_stream_0_write = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((ap_start_int == 1'b0) & (ap_idle_pp0_1to1 == 1'b1)) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_pp0_stage1 : begin
            if ((1'b0 == ap_block_pp0_stage1_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln887_6_fu_310_p2 = ($signed(cancellation_unit_total_size_V_1_i) + $signed(16'd65535));

assign add_ln887_fu_355_p2 = ($signed(reuse_select_fu_348_p3) + $signed(16'd65535));

assign addr_cmp5_fu_270_p2 = ((reuse_addr_reg2_fu_68 == zext_ln587_reg_429) ? 1'b1 : 1'b0);

assign addr_cmp_fu_297_p2 = ((reuse_addr_reg_fu_76 == zext_ln145_cast_reg_412) ? 1'b1 : 1'b0);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_pp0_stage1 = ap_CS_fsm[32'd1];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((lpcore_cancellation_unit_output_stream_0_full_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((lpcore_cancellation_unit_output_stream_0_full_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((lpcore_cancellation_unit_output_stream_0_full_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

assign ap_block_pp0_stage1 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_subdone = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage1_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state3_pp0_stage0_iter1 = (lpcore_cancellation_unit_output_stream_0_full_n == 1'b0);
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage1;

assign cancellation_unit_buffer_event_data_V_1_address0 = zext_ln587_reg_429;

assign cancellation_unit_buffer_event_receiver_id_V_1_address0 = zext_ln587_reg_429;

assign cancellation_unit_buffer_event_recv_time_V_1_address0 = zext_ln587_reg_429;

assign cancellation_unit_buffer_event_send_time_V_1_address0 = zext_ln587_fu_254_p1;

assign cancellation_unit_buffer_event_sender_id_V_1_address0 = zext_ln587_reg_429;

assign cancellation_unit_buffer_next_V_1_address0 = zext_ln587_reg_429;

assign cancellation_unit_buffer_next_V_1_d0 = cancellation_unit_free_head_V_1_i;

assign cancellation_unit_lp_heads_V_1_address0 = cancellation_unit_lp_heads_V_1_addr_reg_450;

assign cancellation_unit_lp_heads_V_1_d0 = ((addr_cmp5_reg_493[0:0] == 1'b1) ? reuse_reg1_load_reg_488 : cancellation_unit_buffer_next_V_1_q0);

assign cancellation_unit_lp_sizes_V_1_d0 = ($signed(reuse_select_fu_348_p3) + $signed(16'd65535));

assign current_V_35_fu_338_p3 = ((addr_cmp5_reg_493[0:0] == 1'b1) ? reuse_reg1_load_reg_488 : cancellation_unit_buffer_next_V_1_q0);

assign icmp_ln1069_fu_248_p2 = ((ap_sig_allocacmp_current_V_34 == 16'd65535) ? 1'b1 : 1'b0);

assign icmp_ln1081_fu_259_p2 = (($signed(cancellation_unit_buffer_event_send_time_V_1_q0) > $signed(tmp_to_time_V)) ? 1'b1 : 1'b0);

assign lpcore_cancellation_unit_output_stream_0_din = {{{{{{{{{{1'd1}, {cancellation_unit_buffer_event_receiver_id_V_1_q0}}}, {cancellation_unit_buffer_event_sender_id_V_1_q0}}}, {cancellation_unit_buffer_event_data_V_1_q0}}}, {cancellation_unit_buffer_event_recv_time_V_1_q0}}}, {anti_message_send_time_V_reg_455}};

assign reuse_select_fu_348_p3 = ((addr_cmp_reg_498[0:0] == 1'b1) ? reuse_reg_fu_80 : cancellation_unit_lp_sizes_V_1_q0);

assign zext_ln145_cast_fu_216_p1 = zext_ln145;

assign zext_ln587_fu_254_p1 = ap_sig_allocacmp_current_V_34;

always @ (posedge ap_clk) begin
    zext_ln145_cast_reg_412[63:2] <= 62'b00000000000000000000000000000000000000000000000000000000000000;
    zext_ln587_reg_429[63:16] <= 48'b000000000000000000000000000000000000000000000000;
end

endmodule //simulation_top_cancellation_unit_top_0_Pipeline_VITIS_LOOP_58_1
