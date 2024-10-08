// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module lpcore_top_commit_Pipeline_VITIS_LOOP_237_2 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        event_queue_lp_tails_V_address0,
        event_queue_lp_tails_V_ce0,
        event_queue_lp_tails_V_we0,
        event_queue_lp_tails_V_d0,
        event_queue_lp_youngest_issued_V_address0,
        event_queue_lp_youngest_issued_V_ce0,
        event_queue_lp_youngest_issued_V_we0,
        event_queue_lp_youngest_issued_V_d0,
        event_queue_lp_youngest_issued_V_q0,
        event_queue_lp_heads_V_address0,
        event_queue_lp_heads_V_ce0,
        event_queue_lp_heads_V_we0,
        event_queue_lp_heads_V_d0,
        event_queue_lp_heads_V_address1,
        event_queue_lp_heads_V_ce1,
        event_queue_lp_heads_V_q1,
        event_queue_buffer_next_V_address0,
        event_queue_buffer_next_V_ce0,
        event_queue_buffer_next_V_we0,
        event_queue_buffer_next_V_d0,
        event_queue_buffer_next_V_q0,
        event_queue_buffer_event_recv_time_V_address0,
        event_queue_buffer_event_recv_time_V_ce0,
        event_queue_buffer_event_recv_time_V_q0,
        commit_time,
        event_queue_size_V_i,
        event_queue_size_V_o,
        event_queue_size_V_o_ap_vld,
        event_queue_free_head_V_i,
        event_queue_free_head_V_o,
        event_queue_free_head_V_o_ap_vld
);

parameter    ap_ST_fsm_pp0_stage0 = 3'd1;
parameter    ap_ST_fsm_pp0_stage1 = 3'd2;
parameter    ap_ST_fsm_pp0_stage2 = 3'd4;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [1:0] event_queue_lp_tails_V_address0;
output   event_queue_lp_tails_V_ce0;
output   event_queue_lp_tails_V_we0;
output  [15:0] event_queue_lp_tails_V_d0;
output  [1:0] event_queue_lp_youngest_issued_V_address0;
output   event_queue_lp_youngest_issued_V_ce0;
output   event_queue_lp_youngest_issued_V_we0;
output  [15:0] event_queue_lp_youngest_issued_V_d0;
input  [15:0] event_queue_lp_youngest_issued_V_q0;
output  [1:0] event_queue_lp_heads_V_address0;
output   event_queue_lp_heads_V_ce0;
output   event_queue_lp_heads_V_we0;
output  [15:0] event_queue_lp_heads_V_d0;
output  [1:0] event_queue_lp_heads_V_address1;
output   event_queue_lp_heads_V_ce1;
input  [15:0] event_queue_lp_heads_V_q1;
output  [6:0] event_queue_buffer_next_V_address0;
output   event_queue_buffer_next_V_ce0;
output   event_queue_buffer_next_V_we0;
output  [15:0] event_queue_buffer_next_V_d0;
input  [15:0] event_queue_buffer_next_V_q0;
output  [6:0] event_queue_buffer_event_recv_time_V_address0;
output   event_queue_buffer_event_recv_time_V_ce0;
input  [31:0] event_queue_buffer_event_recv_time_V_q0;
input  [31:0] commit_time;
input  [15:0] event_queue_size_V_i;
output  [15:0] event_queue_size_V_o;
output   event_queue_size_V_o_ap_vld;
input  [15:0] event_queue_free_head_V_i;
output  [15:0] event_queue_free_head_V_o;
output   event_queue_free_head_V_o_ap_vld;

reg ap_idle;
reg event_queue_lp_tails_V_ce0;
reg event_queue_lp_tails_V_we0;
reg[1:0] event_queue_lp_youngest_issued_V_address0;
reg event_queue_lp_youngest_issued_V_ce0;
reg event_queue_lp_youngest_issued_V_we0;
reg event_queue_lp_heads_V_ce0;
reg event_queue_lp_heads_V_we0;
reg event_queue_lp_heads_V_ce1;
reg event_queue_buffer_next_V_ce0;
reg event_queue_buffer_next_V_we0;
reg event_queue_buffer_event_recv_time_V_ce0;
reg[15:0] event_queue_size_V_o;
reg event_queue_size_V_o_ap_vld;
reg[15:0] event_queue_free_head_V_o;
reg event_queue_free_head_V_o_ap_vld;

(* fsm_encoding = "none" *) reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire    ap_CS_fsm_pp0_stage2;
wire    ap_block_state3_pp0_stage2_iter0;
wire    ap_block_pp0_stage2_subdone;
wire   [0:0] icmp_ln1085_fu_186_p2;
reg   [0:0] icmp_ln1069_reg_310;
reg    ap_condition_exit_pp0_iter0_stage2;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state4_pp0_stage0_iter1;
wire    ap_block_pp0_stage0_11001;
wire   [15:0] commit_entry_V_fu_167_p3;
reg   [15:0] commit_entry_V_reg_304;
wire    ap_CS_fsm_pp0_stage1;
wire    ap_block_state2_pp0_stage1_iter0;
wire    ap_block_pp0_stage1_11001;
wire   [0:0] icmp_ln1069_fu_175_p2;
wire   [63:0] zext_ln587_fu_181_p1;
reg   [63:0] zext_ln587_reg_314;
wire    ap_block_pp0_stage2_11001;
wire   [1:0] event_queue_lp_youngest_issued_V_addr_reg_331;
reg   [15:0] reuse_reg_load_reg_344;
wire   [0:0] addr_cmp_fu_197_p2;
reg   [0:0] addr_cmp_reg_349;
reg    ap_enable_reg_pp0_iter0_reg;
wire    ap_block_pp0_stage0_subdone;
wire    ap_block_pp0_stage0;
wire    ap_block_pp0_stage1;
wire    ap_block_pp0_stage2;
wire   [15:0] add_ln887_fu_230_p2;
reg   [63:0] reuse_addr_reg2_fu_40;
wire    ap_loop_init;
reg   [15:0] reuse_reg1_fu_44;
wire   [15:0] reuse_select_fu_242_p3;
reg   [63:0] reuse_addr_reg_fu_48;
reg   [15:0] reuse_reg_fu_52;
wire   [0:0] icmp_ln1065_fu_254_p2;
wire   [0:0] icmp_ln1065_16_fu_259_p2;
wire   [0:0] addr_cmp5_fu_161_p2;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [2:0] ap_NS_fsm;
reg    ap_idle_pp0_1to1;
wire    ap_block_pp0_stage1_subdone;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 3'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter0_reg = 1'b0;
#0 ap_done_reg = 1'b0;
end

lpcore_top_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage2),
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
        end else if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage2_subdone) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
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
        if (((1'b1 == ap_condition_exit_pp0_iter0_stage2) | ((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage2_subdone) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        reuse_addr_reg2_fu_40 <= 64'd18446744073709551615;
    end else if (((icmp_ln1069_reg_310 == 1'd0) & (icmp_ln1085_fu_186_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage2_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        reuse_addr_reg2_fu_40 <= 64'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        reuse_addr_reg_fu_48 <= 64'd18446744073709551615;
    end else if (((icmp_ln1069_reg_310 == 1'd0) & (icmp_ln1085_fu_186_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage2_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        reuse_addr_reg_fu_48 <= zext_ln587_reg_314;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            reuse_reg1_fu_44 <= 16'd0;
        end else if ((ap_enable_reg_pp0_iter1 == 1'b1)) begin
            reuse_reg1_fu_44 <= reuse_select_fu_242_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        reuse_reg_fu_52 <= 16'd0;
    end else if (((icmp_ln1069_reg_310 == 1'd0) & (icmp_ln1085_fu_186_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage2_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        reuse_reg_fu_52 <= event_queue_free_head_V_i;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln1069_reg_310 == 1'd0) & (icmp_ln1085_fu_186_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage2_11001) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        addr_cmp_reg_349 <= addr_cmp_fu_197_p2;
        reuse_reg_load_reg_344 <= reuse_reg_fu_52;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        commit_entry_V_reg_304 <= commit_entry_V_fu_167_p3;
        icmp_ln1069_reg_310 <= icmp_ln1069_fu_175_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1) & (icmp_ln1069_fu_175_p2 == 1'd0))) begin
        zext_ln587_reg_314[15 : 0] <= zext_ln587_fu_181_p1[15 : 0];
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage2_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2) & ((icmp_ln1069_reg_310 == 1'd1) | (icmp_ln1085_fu_186_p2 == 1'd1)))) begin
        ap_condition_exit_pp0_iter0_stage2 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage2 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage2_subdone) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
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
    if (((ap_idle_pp0 == 1'b1) & (ap_start_int == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
    if (((1'b0 == ap_block_pp0_stage2_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        event_queue_buffer_event_recv_time_V_ce0 = 1'b1;
    end else begin
        event_queue_buffer_event_recv_time_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln1069_reg_310 == 1'd0) & (icmp_ln1085_fu_186_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage2_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        event_queue_buffer_next_V_ce0 = 1'b1;
    end else begin
        event_queue_buffer_next_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln1069_reg_310 == 1'd0) & (icmp_ln1085_fu_186_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage2_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        event_queue_buffer_next_V_we0 = 1'b1;
    end else begin
        event_queue_buffer_next_V_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln1069_reg_310 == 1'd0) & (icmp_ln1085_fu_186_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        event_queue_free_head_V_o = commit_entry_V_reg_304;
    end else begin
        event_queue_free_head_V_o = event_queue_free_head_V_i;
    end
end

always @ (*) begin
    if (((icmp_ln1069_reg_310 == 1'd0) & (icmp_ln1085_fu_186_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage2_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        event_queue_free_head_V_o_ap_vld = 1'b1;
    end else begin
        event_queue_free_head_V_o_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        event_queue_lp_heads_V_ce0 = 1'b1;
    end else begin
        event_queue_lp_heads_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        event_queue_lp_heads_V_ce1 = 1'b1;
    end else begin
        event_queue_lp_heads_V_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        event_queue_lp_heads_V_we0 = 1'b1;
    end else begin
        event_queue_lp_heads_V_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        event_queue_lp_tails_V_ce0 = 1'b1;
    end else begin
        event_queue_lp_tails_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln1065_16_fu_259_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        event_queue_lp_tails_V_we0 = 1'b1;
    end else begin
        event_queue_lp_tails_V_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        event_queue_lp_youngest_issued_V_address0 = event_queue_lp_youngest_issued_V_addr_reg_331;
    end else if (((1'b0 == ap_block_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        event_queue_lp_youngest_issued_V_address0 = 64'd0;
    end else begin
        event_queue_lp_youngest_issued_V_address0 = 'bx;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage2_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2)) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        event_queue_lp_youngest_issued_V_ce0 = 1'b1;
    end else begin
        event_queue_lp_youngest_issued_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln1065_fu_254_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        event_queue_lp_youngest_issued_V_we0 = 1'b1;
    end else begin
        event_queue_lp_youngest_issued_V_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln1069_reg_310 == 1'd0) & (icmp_ln1085_fu_186_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        event_queue_size_V_o = add_ln887_fu_230_p2;
    end else begin
        event_queue_size_V_o = event_queue_size_V_i;
    end
end

always @ (*) begin
    if (((icmp_ln1069_reg_310 == 1'd0) & (icmp_ln1085_fu_186_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage2_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        event_queue_size_V_o_ap_vld = 1'b1;
    end else begin
        event_queue_size_V_o_ap_vld = 1'b0;
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
                ap_NS_fsm = ap_ST_fsm_pp0_stage2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end
        end
        ap_ST_fsm_pp0_stage2 : begin
            if ((1'b0 == ap_block_pp0_stage2_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage2;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln887_fu_230_p2 = ($signed(event_queue_size_V_i) + $signed(16'd65535));

assign addr_cmp5_fu_161_p2 = ((reuse_addr_reg2_fu_40 == 64'd0) ? 1'b1 : 1'b0);

assign addr_cmp_fu_197_p2 = ((reuse_addr_reg_fu_48 == zext_ln587_reg_314) ? 1'b1 : 1'b0);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_pp0_stage1 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_pp0_stage2 = ap_CS_fsm[32'd2];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage2 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage2_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage2_subdone = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage1_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage2_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage2;

assign commit_entry_V_fu_167_p3 = ((addr_cmp5_fu_161_p2[0:0] == 1'b1) ? reuse_reg1_fu_44 : event_queue_lp_heads_V_q1);

assign event_queue_buffer_event_recv_time_V_address0 = zext_ln587_fu_181_p1;

assign event_queue_buffer_next_V_address0 = zext_ln587_reg_314;

assign event_queue_buffer_next_V_d0 = event_queue_free_head_V_i;

assign event_queue_lp_heads_V_address0 = 64'd0;

assign event_queue_lp_heads_V_address1 = 64'd0;

assign event_queue_lp_heads_V_d0 = reuse_select_fu_242_p3;

assign event_queue_lp_tails_V_address0 = 64'd0;

assign event_queue_lp_tails_V_d0 = 16'd65535;

assign event_queue_lp_youngest_issued_V_addr_reg_331 = 64'd0;

assign event_queue_lp_youngest_issued_V_d0 = 16'd65535;

assign icmp_ln1065_16_fu_259_p2 = ((reuse_select_fu_242_p3 == 16'd65535) ? 1'b1 : 1'b0);

assign icmp_ln1065_fu_254_p2 = ((commit_entry_V_reg_304 == event_queue_lp_youngest_issued_V_q0) ? 1'b1 : 1'b0);

assign icmp_ln1069_fu_175_p2 = ((commit_entry_V_fu_167_p3 == 16'd65535) ? 1'b1 : 1'b0);

assign icmp_ln1085_fu_186_p2 = (($signed(event_queue_buffer_event_recv_time_V_q0) > $signed(commit_time)) ? 1'b1 : 1'b0);

assign reuse_select_fu_242_p3 = ((addr_cmp_reg_349[0:0] == 1'b1) ? reuse_reg_load_reg_344 : event_queue_buffer_next_V_q0);

assign zext_ln587_fu_181_p1 = commit_entry_V_fu_167_p3;

always @ (posedge ap_clk) begin
    zext_ln587_reg_314[63:16] <= 48'b000000000000000000000000000000000000000000000000;
end

endmodule //lpcore_top_commit_Pipeline_VITIS_LOOP_237_2
