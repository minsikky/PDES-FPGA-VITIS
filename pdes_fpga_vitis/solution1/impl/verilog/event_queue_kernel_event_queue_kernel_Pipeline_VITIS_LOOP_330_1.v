// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module event_queue_kernel_event_queue_kernel_Pipeline_VITIS_LOOP_330_1 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        current_V,
        time_r,
        trunc_ln2,
        g_event_queue_buffer_next_V_address0,
        g_event_queue_buffer_next_V_ce0,
        g_event_queue_buffer_next_V_q0,
        g_event_queue_buffer_event_recv_time_V_address0,
        g_event_queue_buffer_event_recv_time_V_ce0,
        g_event_queue_buffer_event_recv_time_V_q0,
        g_event_queue_buffer_event_recv_time_V_address1,
        g_event_queue_buffer_event_recv_time_V_ce1,
        g_event_queue_buffer_event_recv_time_V_q1,
        g_event_queue_buffer_is_issued_V_address0,
        g_event_queue_buffer_is_issued_V_ce0,
        g_event_queue_buffer_is_issued_V_we0,
        g_event_queue_buffer_is_issued_V_d0,
        g_event_queue_buffer_is_issued_V_address1,
        g_event_queue_buffer_is_issued_V_ce1,
        g_event_queue_buffer_is_issued_V_q1,
        g_event_queue_unissued_size_V_i,
        g_event_queue_unissued_size_V_o,
        g_event_queue_unissued_size_V_o_ap_vld,
        g_event_queue_lp_oldest_unissued_V_0_i,
        g_event_queue_lp_oldest_unissued_V_0_o,
        g_event_queue_lp_oldest_unissued_V_0_o_ap_vld,
        g_event_queue_lp_oldest_unissued_V_1_i,
        g_event_queue_lp_oldest_unissued_V_1_o,
        g_event_queue_lp_oldest_unissued_V_1_o_ap_vld,
        g_event_queue_lp_oldest_unissued_V_2_i,
        g_event_queue_lp_oldest_unissued_V_2_o,
        g_event_queue_lp_oldest_unissued_V_2_o_ap_vld,
        g_event_queue_lp_oldest_unissued_V_3_i,
        g_event_queue_lp_oldest_unissued_V_3_o,
        g_event_queue_lp_oldest_unissued_V_3_o_ap_vld
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [15:0] current_V;
input  [31:0] time_r;
input  [1:0] trunc_ln2;
output  [6:0] g_event_queue_buffer_next_V_address0;
output   g_event_queue_buffer_next_V_ce0;
input  [15:0] g_event_queue_buffer_next_V_q0;
output  [6:0] g_event_queue_buffer_event_recv_time_V_address0;
output   g_event_queue_buffer_event_recv_time_V_ce0;
input  [31:0] g_event_queue_buffer_event_recv_time_V_q0;
output  [6:0] g_event_queue_buffer_event_recv_time_V_address1;
output   g_event_queue_buffer_event_recv_time_V_ce1;
input  [31:0] g_event_queue_buffer_event_recv_time_V_q1;
output  [6:0] g_event_queue_buffer_is_issued_V_address0;
output   g_event_queue_buffer_is_issued_V_ce0;
output   g_event_queue_buffer_is_issued_V_we0;
output  [0:0] g_event_queue_buffer_is_issued_V_d0;
output  [6:0] g_event_queue_buffer_is_issued_V_address1;
output   g_event_queue_buffer_is_issued_V_ce1;
input  [0:0] g_event_queue_buffer_is_issued_V_q1;
input  [15:0] g_event_queue_unissued_size_V_i;
output  [15:0] g_event_queue_unissued_size_V_o;
output   g_event_queue_unissued_size_V_o_ap_vld;
input  [15:0] g_event_queue_lp_oldest_unissued_V_0_i;
output  [15:0] g_event_queue_lp_oldest_unissued_V_0_o;
output   g_event_queue_lp_oldest_unissued_V_0_o_ap_vld;
input  [15:0] g_event_queue_lp_oldest_unissued_V_1_i;
output  [15:0] g_event_queue_lp_oldest_unissued_V_1_o;
output   g_event_queue_lp_oldest_unissued_V_1_o_ap_vld;
input  [15:0] g_event_queue_lp_oldest_unissued_V_2_i;
output  [15:0] g_event_queue_lp_oldest_unissued_V_2_o;
output   g_event_queue_lp_oldest_unissued_V_2_o_ap_vld;
input  [15:0] g_event_queue_lp_oldest_unissued_V_3_i;
output  [15:0] g_event_queue_lp_oldest_unissued_V_3_o;
output   g_event_queue_lp_oldest_unissued_V_3_o_ap_vld;

reg ap_idle;
reg g_event_queue_buffer_next_V_ce0;
reg g_event_queue_buffer_event_recv_time_V_ce0;
reg g_event_queue_buffer_event_recv_time_V_ce1;
reg g_event_queue_buffer_is_issued_V_ce0;
reg g_event_queue_buffer_is_issued_V_we0;
reg g_event_queue_buffer_is_issued_V_ce1;
reg[15:0] g_event_queue_unissued_size_V_o;
reg g_event_queue_unissued_size_V_o_ap_vld;
reg[15:0] g_event_queue_lp_oldest_unissued_V_0_o;
reg g_event_queue_lp_oldest_unissued_V_0_o_ap_vld;
reg[15:0] g_event_queue_lp_oldest_unissued_V_1_o;
reg g_event_queue_lp_oldest_unissued_V_1_o_ap_vld;
reg[15:0] g_event_queue_lp_oldest_unissued_V_2_o;
reg g_event_queue_lp_oldest_unissued_V_2_o_ap_vld;
reg[15:0] g_event_queue_lp_oldest_unissued_V_3_o;
reg g_event_queue_lp_oldest_unissued_V_3_o_ap_vld;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_idle_pp0;
wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
wire    ap_block_state3_pp0_stage0_iter2;
wire    ap_block_state4_pp0_stage0_iter3;
wire    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln1069_fu_144_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire   [1:0] trunc_ln2_read_reg_254;
wire    ap_block_pp0_stage0_11001;
reg   [15:0] current_V_2_reg_264;
reg   [15:0] current_V_2_reg_264_pp0_iter1_reg;
reg   [15:0] current_V_2_reg_264_pp0_iter2_reg;
wire   [63:0] zext_ln587_fu_150_p1;
reg   [63:0] zext_ln587_reg_276;
reg   [31:0] g_event_queue_buffer_event_recv_time_V_load_reg_291;
reg   [31:0] g_event_queue_buffer_event_recv_time_V_load_reg_291_pp0_iter2_reg;
wire   [0:0] icmp_ln1081_fu_156_p2;
reg   [0:0] icmp_ln1081_reg_296;
reg   [0:0] icmp_ln1081_reg_296_pp0_iter2_reg;
reg   [6:0] g_event_queue_buffer_is_issued_V_addr_reg_300;
reg   [0:0] g_event_queue_buffer_is_issued_V_load_reg_306;
wire   [0:0] icmp_ln1065_fu_211_p2;
reg   [0:0] icmp_ln1065_reg_310;
wire    ap_block_pp0_stage0;
wire   [63:0] zext_ln587_1_fu_217_p1;
wire   [15:0] add_ln886_fu_170_p2;
wire   [0:0] icmp_ln1081_1_fu_222_p2;
reg   [15:0] ap_sig_allocacmp_g_event_queue_lp_oldest_unissued_V_0_load;
reg   [15:0] ap_sig_allocacmp_g_event_queue_lp_oldest_unissued_V_1_load;
reg   [15:0] ap_sig_allocacmp_g_event_queue_lp_oldest_unissued_V_2_load;
reg   [15:0] ap_sig_allocacmp_g_event_queue_lp_oldest_unissued_V_3_load;
reg   [15:0] current_V_1_fu_58;
reg   [15:0] ap_sig_allocacmp_current_V_2;
wire    ap_loop_init;
wire   [15:0] tmp_6_fu_198_p6;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg    ap_loop_exit_ready_pp0_iter1_reg;
reg    ap_loop_exit_ready_pp0_iter2_reg;
reg   [0:0] ap_NS_fsm;
reg    ap_block_pp0;
reg    ap_enable_operation_27;
reg    ap_enable_state2_pp0_iter1_stage0;
reg    ap_enable_operation_31;
reg    ap_enable_state3_pp0_iter2_stage0;
reg    ap_predicate_op33_store_state3;
reg    ap_enable_operation_33;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_done_reg = 1'b0;
end

event_queue_kernel_mux_42_16_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .din2_WIDTH( 16 ),
    .din3_WIDTH( 16 ),
    .din4_WIDTH( 2 ),
    .dout_WIDTH( 16 ))
mux_42_16_1_1_U1(
    .din0(ap_sig_allocacmp_g_event_queue_lp_oldest_unissued_V_0_load),
    .din1(ap_sig_allocacmp_g_event_queue_lp_oldest_unissued_V_1_load),
    .din2(ap_sig_allocacmp_g_event_queue_lp_oldest_unissued_V_2_load),
    .din3(ap_sig_allocacmp_g_event_queue_lp_oldest_unissued_V_3_load),
    .din4(trunc_ln2),
    .dout(tmp_6_fu_198_p6)
);

event_queue_kernel_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage0),
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
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter2_reg == 1'b1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter0_stage0)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter3 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            current_V_1_fu_58 <= current_V;
        end else if ((ap_enable_reg_pp0_iter1 == 1'b1)) begin
            current_V_1_fu_58 <= g_event_queue_buffer_next_V_q0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
        ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
        current_V_2_reg_264 <= ap_sig_allocacmp_current_V_2;
        current_V_2_reg_264_pp0_iter1_reg <= current_V_2_reg_264;
        icmp_ln1081_reg_296 <= icmp_ln1081_fu_156_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        current_V_2_reg_264_pp0_iter2_reg <= current_V_2_reg_264_pp0_iter1_reg;
        g_event_queue_buffer_event_recv_time_V_load_reg_291_pp0_iter2_reg <= g_event_queue_buffer_event_recv_time_V_load_reg_291;
        icmp_ln1081_reg_296_pp0_iter2_reg <= icmp_ln1081_reg_296;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        g_event_queue_buffer_event_recv_time_V_load_reg_291 <= g_event_queue_buffer_event_recv_time_V_q1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln1081_fu_156_p2 == 1'd1))) begin
        g_event_queue_buffer_is_issued_V_addr_reg_300 <= zext_ln587_reg_276;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1) & (icmp_ln1081_reg_296 == 1'd1))) begin
        g_event_queue_buffer_is_issued_V_load_reg_306 <= g_event_queue_buffer_is_issued_V_q1;
    end
end

always @ (posedge ap_clk) begin
    if (((g_event_queue_buffer_is_issued_V_q1 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln1081_reg_296 == 1'd1))) begin
        icmp_ln1065_reg_310 <= icmp_ln1065_fu_211_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln1069_fu_144_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        zext_ln587_reg_276[15 : 0] <= zext_ln587_fu_150_p1[15 : 0];
    end
end

always @ (*) begin
    if (((icmp_ln1069_fu_144_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter2_reg == 1'b1))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
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
    if (((ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            ap_sig_allocacmp_current_V_2 = current_V;
        end else if ((ap_enable_reg_pp0_iter1 == 1'b1)) begin
            ap_sig_allocacmp_current_V_2 = g_event_queue_buffer_next_V_q0;
        end else begin
            ap_sig_allocacmp_current_V_2 = current_V_1_fu_58;
        end
    end else begin
        ap_sig_allocacmp_current_V_2 = current_V_1_fu_58;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter3 == 1'b1) & (((trunc_ln2_read_reg_254 == 2'd0) & (icmp_ln1065_reg_310 == 1'd1) & (g_event_queue_buffer_is_issued_V_load_reg_306 == 1'd1) & (icmp_ln1081_reg_296_pp0_iter2_reg == 1'd1)) | ((trunc_ln2_read_reg_254 == 2'd0) & (icmp_ln1081_1_fu_222_p2 == 1'd1) & (g_event_queue_buffer_is_issued_V_load_reg_306 == 1'd1) & (icmp_ln1081_reg_296_pp0_iter2_reg == 1'd1))))) begin
        ap_sig_allocacmp_g_event_queue_lp_oldest_unissued_V_0_load = current_V_2_reg_264_pp0_iter2_reg;
    end else begin
        ap_sig_allocacmp_g_event_queue_lp_oldest_unissued_V_0_load = g_event_queue_lp_oldest_unissued_V_0_i;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter3 == 1'b1) & (((trunc_ln2_read_reg_254 == 2'd1) & (icmp_ln1065_reg_310 == 1'd1) & (g_event_queue_buffer_is_issued_V_load_reg_306 == 1'd1) & (icmp_ln1081_reg_296_pp0_iter2_reg == 1'd1)) | ((trunc_ln2_read_reg_254 == 2'd1) & (icmp_ln1081_1_fu_222_p2 == 1'd1) & (g_event_queue_buffer_is_issued_V_load_reg_306 == 1'd1) & (icmp_ln1081_reg_296_pp0_iter2_reg == 1'd1))))) begin
        ap_sig_allocacmp_g_event_queue_lp_oldest_unissued_V_1_load = current_V_2_reg_264_pp0_iter2_reg;
    end else begin
        ap_sig_allocacmp_g_event_queue_lp_oldest_unissued_V_1_load = g_event_queue_lp_oldest_unissued_V_1_i;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter3 == 1'b1) & (((trunc_ln2_read_reg_254 == 2'd2) & (icmp_ln1065_reg_310 == 1'd1) & (g_event_queue_buffer_is_issued_V_load_reg_306 == 1'd1) & (icmp_ln1081_reg_296_pp0_iter2_reg == 1'd1)) | ((trunc_ln2_read_reg_254 == 2'd2) & (icmp_ln1081_1_fu_222_p2 == 1'd1) & (g_event_queue_buffer_is_issued_V_load_reg_306 == 1'd1) & (icmp_ln1081_reg_296_pp0_iter2_reg == 1'd1))))) begin
        ap_sig_allocacmp_g_event_queue_lp_oldest_unissued_V_2_load = current_V_2_reg_264_pp0_iter2_reg;
    end else begin
        ap_sig_allocacmp_g_event_queue_lp_oldest_unissued_V_2_load = g_event_queue_lp_oldest_unissued_V_2_i;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter3 == 1'b1) & (((trunc_ln2_read_reg_254 == 2'd3) & (icmp_ln1065_reg_310 == 1'd1) & (g_event_queue_buffer_is_issued_V_load_reg_306 == 1'd1) & (icmp_ln1081_reg_296_pp0_iter2_reg == 1'd1)) | ((trunc_ln2_read_reg_254 == 2'd3) & (icmp_ln1081_1_fu_222_p2 == 1'd1) & (g_event_queue_buffer_is_issued_V_load_reg_306 == 1'd1) & (icmp_ln1081_reg_296_pp0_iter2_reg == 1'd1))))) begin
        ap_sig_allocacmp_g_event_queue_lp_oldest_unissued_V_3_load = current_V_2_reg_264_pp0_iter2_reg;
    end else begin
        ap_sig_allocacmp_g_event_queue_lp_oldest_unissued_V_3_load = g_event_queue_lp_oldest_unissued_V_3_i;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        g_event_queue_buffer_event_recv_time_V_ce0 = 1'b1;
    end else begin
        g_event_queue_buffer_event_recv_time_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        g_event_queue_buffer_event_recv_time_V_ce1 = 1'b1;
    end else begin
        g_event_queue_buffer_event_recv_time_V_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        g_event_queue_buffer_is_issued_V_ce0 = 1'b1;
    end else begin
        g_event_queue_buffer_is_issued_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        g_event_queue_buffer_is_issued_V_ce1 = 1'b1;
    end else begin
        g_event_queue_buffer_is_issued_V_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((g_event_queue_buffer_is_issued_V_q1 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1) & (icmp_ln1081_reg_296 == 1'd1))) begin
        g_event_queue_buffer_is_issued_V_we0 = 1'b1;
    end else begin
        g_event_queue_buffer_is_issued_V_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        g_event_queue_buffer_next_V_ce0 = 1'b1;
    end else begin
        g_event_queue_buffer_next_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter3 == 1'b1) & (((trunc_ln2_read_reg_254 == 2'd0) & (icmp_ln1065_reg_310 == 1'd1) & (g_event_queue_buffer_is_issued_V_load_reg_306 == 1'd1) & (icmp_ln1081_reg_296_pp0_iter2_reg == 1'd1)) | ((trunc_ln2_read_reg_254 == 2'd0) & (icmp_ln1081_1_fu_222_p2 == 1'd1) & (g_event_queue_buffer_is_issued_V_load_reg_306 == 1'd1) & (icmp_ln1081_reg_296_pp0_iter2_reg == 1'd1))))) begin
        g_event_queue_lp_oldest_unissued_V_0_o = current_V_2_reg_264_pp0_iter2_reg;
    end else begin
        g_event_queue_lp_oldest_unissued_V_0_o = g_event_queue_lp_oldest_unissued_V_0_i;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter3 == 1'b1) & (((trunc_ln2_read_reg_254 == 2'd0) & (icmp_ln1065_reg_310 == 1'd1) & (g_event_queue_buffer_is_issued_V_load_reg_306 == 1'd1) & (icmp_ln1081_reg_296_pp0_iter2_reg == 1'd1)) | ((trunc_ln2_read_reg_254 == 2'd0) & (icmp_ln1081_1_fu_222_p2 == 1'd1) & (g_event_queue_buffer_is_issued_V_load_reg_306 == 1'd1) & (icmp_ln1081_reg_296_pp0_iter2_reg == 1'd1))))) begin
        g_event_queue_lp_oldest_unissued_V_0_o_ap_vld = 1'b1;
    end else begin
        g_event_queue_lp_oldest_unissued_V_0_o_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter3 == 1'b1) & (((trunc_ln2_read_reg_254 == 2'd1) & (icmp_ln1065_reg_310 == 1'd1) & (g_event_queue_buffer_is_issued_V_load_reg_306 == 1'd1) & (icmp_ln1081_reg_296_pp0_iter2_reg == 1'd1)) | ((trunc_ln2_read_reg_254 == 2'd1) & (icmp_ln1081_1_fu_222_p2 == 1'd1) & (g_event_queue_buffer_is_issued_V_load_reg_306 == 1'd1) & (icmp_ln1081_reg_296_pp0_iter2_reg == 1'd1))))) begin
        g_event_queue_lp_oldest_unissued_V_1_o = current_V_2_reg_264_pp0_iter2_reg;
    end else begin
        g_event_queue_lp_oldest_unissued_V_1_o = g_event_queue_lp_oldest_unissued_V_1_i;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter3 == 1'b1) & (((trunc_ln2_read_reg_254 == 2'd1) & (icmp_ln1065_reg_310 == 1'd1) & (g_event_queue_buffer_is_issued_V_load_reg_306 == 1'd1) & (icmp_ln1081_reg_296_pp0_iter2_reg == 1'd1)) | ((trunc_ln2_read_reg_254 == 2'd1) & (icmp_ln1081_1_fu_222_p2 == 1'd1) & (g_event_queue_buffer_is_issued_V_load_reg_306 == 1'd1) & (icmp_ln1081_reg_296_pp0_iter2_reg == 1'd1))))) begin
        g_event_queue_lp_oldest_unissued_V_1_o_ap_vld = 1'b1;
    end else begin
        g_event_queue_lp_oldest_unissued_V_1_o_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter3 == 1'b1) & (((trunc_ln2_read_reg_254 == 2'd2) & (icmp_ln1065_reg_310 == 1'd1) & (g_event_queue_buffer_is_issued_V_load_reg_306 == 1'd1) & (icmp_ln1081_reg_296_pp0_iter2_reg == 1'd1)) | ((trunc_ln2_read_reg_254 == 2'd2) & (icmp_ln1081_1_fu_222_p2 == 1'd1) & (g_event_queue_buffer_is_issued_V_load_reg_306 == 1'd1) & (icmp_ln1081_reg_296_pp0_iter2_reg == 1'd1))))) begin
        g_event_queue_lp_oldest_unissued_V_2_o = current_V_2_reg_264_pp0_iter2_reg;
    end else begin
        g_event_queue_lp_oldest_unissued_V_2_o = g_event_queue_lp_oldest_unissued_V_2_i;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter3 == 1'b1) & (((trunc_ln2_read_reg_254 == 2'd2) & (icmp_ln1065_reg_310 == 1'd1) & (g_event_queue_buffer_is_issued_V_load_reg_306 == 1'd1) & (icmp_ln1081_reg_296_pp0_iter2_reg == 1'd1)) | ((trunc_ln2_read_reg_254 == 2'd2) & (icmp_ln1081_1_fu_222_p2 == 1'd1) & (g_event_queue_buffer_is_issued_V_load_reg_306 == 1'd1) & (icmp_ln1081_reg_296_pp0_iter2_reg == 1'd1))))) begin
        g_event_queue_lp_oldest_unissued_V_2_o_ap_vld = 1'b1;
    end else begin
        g_event_queue_lp_oldest_unissued_V_2_o_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter3 == 1'b1) & (((trunc_ln2_read_reg_254 == 2'd3) & (icmp_ln1065_reg_310 == 1'd1) & (g_event_queue_buffer_is_issued_V_load_reg_306 == 1'd1) & (icmp_ln1081_reg_296_pp0_iter2_reg == 1'd1)) | ((trunc_ln2_read_reg_254 == 2'd3) & (icmp_ln1081_1_fu_222_p2 == 1'd1) & (g_event_queue_buffer_is_issued_V_load_reg_306 == 1'd1) & (icmp_ln1081_reg_296_pp0_iter2_reg == 1'd1))))) begin
        g_event_queue_lp_oldest_unissued_V_3_o = current_V_2_reg_264_pp0_iter2_reg;
    end else begin
        g_event_queue_lp_oldest_unissued_V_3_o = g_event_queue_lp_oldest_unissued_V_3_i;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter3 == 1'b1) & (((trunc_ln2_read_reg_254 == 2'd3) & (icmp_ln1065_reg_310 == 1'd1) & (g_event_queue_buffer_is_issued_V_load_reg_306 == 1'd1) & (icmp_ln1081_reg_296_pp0_iter2_reg == 1'd1)) | ((trunc_ln2_read_reg_254 == 2'd3) & (icmp_ln1081_1_fu_222_p2 == 1'd1) & (g_event_queue_buffer_is_issued_V_load_reg_306 == 1'd1) & (icmp_ln1081_reg_296_pp0_iter2_reg == 1'd1))))) begin
        g_event_queue_lp_oldest_unissued_V_3_o_ap_vld = 1'b1;
    end else begin
        g_event_queue_lp_oldest_unissued_V_3_o_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((g_event_queue_buffer_is_issued_V_q1 == 1'd1) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1) & (icmp_ln1081_reg_296 == 1'd1))) begin
        g_event_queue_unissued_size_V_o = add_ln886_fu_170_p2;
    end else begin
        g_event_queue_unissued_size_V_o = g_event_queue_unissued_size_V_i;
    end
end

always @ (*) begin
    if (((g_event_queue_buffer_is_issued_V_q1 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1) & (icmp_ln1081_reg_296 == 1'd1))) begin
        g_event_queue_unissued_size_V_o_ap_vld = 1'b1;
    end else begin
        g_event_queue_unissued_size_V_o_ap_vld = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln886_fu_170_p2 = (g_event_queue_unissued_size_V_i + 16'd1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

always @ (*) begin
    ap_block_pp0 = ((ap_ST_fsm_pp0_stage0 == ap_CS_fsm) & (1'b1 == ap_block_pp0_stage0_subdone));
end

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter3 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_enable_operation_27 = (icmp_ln1081_fu_156_p2 == 1'd1);
end

always @ (*) begin
    ap_enable_operation_31 = (icmp_ln1081_reg_296 == 1'd1);
end

always @ (*) begin
    ap_enable_operation_33 = (ap_predicate_op33_store_state3 == 1'b1);
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

always @ (*) begin
    ap_enable_state2_pp0_iter1_stage0 = ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

always @ (*) begin
    ap_enable_state3_pp0_iter2_stage0 = ((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

always @ (*) begin
    ap_predicate_op33_store_state3 = ((g_event_queue_buffer_is_issued_V_q1 == 1'd1) & (icmp_ln1081_reg_296 == 1'd1));
end

assign g_event_queue_buffer_event_recv_time_V_address0 = zext_ln587_1_fu_217_p1;

assign g_event_queue_buffer_event_recv_time_V_address1 = zext_ln587_fu_150_p1;

assign g_event_queue_buffer_is_issued_V_address0 = g_event_queue_buffer_is_issued_V_addr_reg_300;

assign g_event_queue_buffer_is_issued_V_address1 = zext_ln587_reg_276;

assign g_event_queue_buffer_is_issued_V_d0 = 1'd0;

assign g_event_queue_buffer_next_V_address0 = zext_ln587_fu_150_p1;

assign icmp_ln1065_fu_211_p2 = ((tmp_6_fu_198_p6 == 16'd65535) ? 1'b1 : 1'b0);

assign icmp_ln1069_fu_144_p2 = ((ap_sig_allocacmp_current_V_2 == 16'd65535) ? 1'b1 : 1'b0);

assign icmp_ln1081_1_fu_222_p2 = (($signed(g_event_queue_buffer_event_recv_time_V_q0) > $signed(g_event_queue_buffer_event_recv_time_V_load_reg_291_pp0_iter2_reg)) ? 1'b1 : 1'b0);

assign icmp_ln1081_fu_156_p2 = (($signed(g_event_queue_buffer_event_recv_time_V_q1) > $signed(time_r)) ? 1'b1 : 1'b0);

assign trunc_ln2_read_reg_254 = trunc_ln2;

assign zext_ln587_1_fu_217_p1 = tmp_6_fu_198_p6;

assign zext_ln587_fu_150_p1 = ap_sig_allocacmp_current_V_2;

always @ (posedge ap_clk) begin
    zext_ln587_reg_276[63:16] <= 48'b000000000000000000000000000000000000000000000000;
end

endmodule //event_queue_kernel_event_queue_kernel_Pipeline_VITIS_LOOP_330_1
