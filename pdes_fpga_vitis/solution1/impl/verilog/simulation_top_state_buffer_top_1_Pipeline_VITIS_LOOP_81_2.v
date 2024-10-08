// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module simulation_top_state_buffer_top_1_Pipeline_VITIS_LOOP_81_2 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        current_V_3,
        zext_ln1073,
        tmp_4,
        removed_V_3_out_i,
        removed_V_3_out_o,
        removed_V_3_out_o_ap_vld,
        state_buffer_buffer_next_V_address0,
        state_buffer_buffer_next_V_ce0,
        state_buffer_buffer_next_V_we0,
        state_buffer_buffer_next_V_d0,
        state_buffer_buffer_next_V_q0,
        state_buffer_buffer_state_lvt_V_address0,
        state_buffer_buffer_state_lvt_V_ce0,
        state_buffer_buffer_state_lvt_V_q0,
        state_buffer_free_head_V_i,
        state_buffer_free_head_V_o,
        state_buffer_free_head_V_o_ap_vld,
        state_buffer_lp_sizes_V_address0,
        state_buffer_lp_sizes_V_ce0,
        state_buffer_lp_sizes_V_we0,
        state_buffer_lp_sizes_V_d0,
        state_buffer_lp_sizes_V_q0,
        state_buffer_lp_heads_V_address0,
        state_buffer_lp_heads_V_ce0,
        state_buffer_lp_heads_V_we0,
        state_buffer_lp_heads_V_d0
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
input  [15:0] current_V_3;
input  [0:0] zext_ln1073;
input  [31:0] tmp_4;
input  [15:0] removed_V_3_out_i;
output  [15:0] removed_V_3_out_o;
output   removed_V_3_out_o_ap_vld;
output  [6:0] state_buffer_buffer_next_V_address0;
output   state_buffer_buffer_next_V_ce0;
output   state_buffer_buffer_next_V_we0;
output  [15:0] state_buffer_buffer_next_V_d0;
input  [15:0] state_buffer_buffer_next_V_q0;
output  [6:0] state_buffer_buffer_state_lvt_V_address0;
output   state_buffer_buffer_state_lvt_V_ce0;
input  [31:0] state_buffer_buffer_state_lvt_V_q0;
input  [15:0] state_buffer_free_head_V_i;
output  [15:0] state_buffer_free_head_V_o;
output   state_buffer_free_head_V_o_ap_vld;
output  [0:0] state_buffer_lp_sizes_V_address0;
output   state_buffer_lp_sizes_V_ce0;
output   state_buffer_lp_sizes_V_we0;
output  [15:0] state_buffer_lp_sizes_V_d0;
input  [15:0] state_buffer_lp_sizes_V_q0;
output  [0:0] state_buffer_lp_heads_V_address0;
output   state_buffer_lp_heads_V_ce0;
output   state_buffer_lp_heads_V_we0;
output  [15:0] state_buffer_lp_heads_V_d0;

reg ap_idle;
reg[15:0] removed_V_3_out_o;
reg removed_V_3_out_o_ap_vld;
reg[6:0] state_buffer_buffer_next_V_address0;
reg state_buffer_buffer_next_V_ce0;
reg state_buffer_buffer_next_V_we0;
reg[15:0] state_buffer_buffer_next_V_d0;
reg state_buffer_buffer_state_lvt_V_ce0;
reg[15:0] state_buffer_free_head_V_o;
reg state_buffer_free_head_V_o_ap_vld;
reg state_buffer_lp_sizes_V_ce0;
reg state_buffer_lp_sizes_V_we0;
reg state_buffer_lp_heads_V_ce0;
reg state_buffer_lp_heads_V_we0;

(* fsm_encoding = "none" *) reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state4_pp0_stage0_iter1;
wire    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln1069_fu_161_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire    ap_CS_fsm_pp0_stage2;
wire    ap_block_state3_pp0_stage2_iter0;
wire    ap_block_pp0_stage2_subdone;
wire    ap_block_pp0_stage0_11001;
reg   [15:0] current_V_1_reg_286;
reg   [0:0] state_buffer_lp_heads_V_addr_reg_292;
reg   [0:0] state_buffer_lp_sizes_V_addr_reg_297;
reg   [0:0] icmp_ln1069_reg_302;
reg   [6:0] state_buffer_buffer_next_V_addr_reg_306;
wire   [0:0] or_ln85_fu_181_p2;
reg   [0:0] or_ln85_reg_316;
wire    ap_CS_fsm_pp0_stage1;
wire    ap_block_state2_pp0_stage1_iter0;
wire    ap_block_pp0_stage1_11001;
reg    ap_enable_reg_pp0_iter0_reg;
wire   [63:0] zext_ln1073_cast_fu_137_p1;
wire    ap_block_pp0_stage0;
wire   [63:0] zext_ln587_fu_167_p1;
wire   [63:0] zext_ln587_1_fu_232_p1;
wire    ap_block_pp0_stage2;
wire   [0:0] icmp_ln1065_fu_226_p2;
wire   [15:0] removed_V_fu_197_p2;
wire    ap_block_pp0_stage1;
reg   [0:0] keep_next_fu_48;
wire   [0:0] and_ln85_fu_187_p2;
wire    ap_loop_init;
reg   [15:0] current_V_fu_52;
wire    ap_block_pp0_stage2_11001;
reg   [15:0] ap_sig_allocacmp_current_V_1;
reg   [15:0] prev_V_fu_56;
wire   [0:0] icmp_ln85_fu_176_p2;
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

simulation_top_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
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
        end else if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter0_stage0)) begin
            ap_enable_reg_pp0_iter0_reg <= 1'b0;
        end else if ((1'b1 == ap_CS_fsm_pp0_stage0)) begin
            ap_enable_reg_pp0_iter0_reg <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage2_subdone) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        current_V_fu_52 <= current_V_3;
    end else if (((1'b0 == ap_block_pp0_stage2_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2) & (icmp_ln1069_reg_302 == 1'd0))) begin
        current_V_fu_52 <= state_buffer_buffer_next_V_q0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        keep_next_fu_48 <= 1'd1;
    end else if (((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (or_ln85_fu_181_p2 == 1'd1) & (icmp_ln1069_reg_302 == 1'd0))) begin
        keep_next_fu_48 <= and_ln85_fu_187_p2;
    end else if (((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (or_ln85_fu_181_p2 == 1'd0) & (icmp_ln1069_reg_302 == 1'd0))) begin
        keep_next_fu_48 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        prev_V_fu_56 <= 16'd65535;
    end else if (((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (or_ln85_fu_181_p2 == 1'd1) & (icmp_ln1069_reg_302 == 1'd0))) begin
        prev_V_fu_56 <= current_V_1_reg_286;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        current_V_1_reg_286 <= ap_sig_allocacmp_current_V_1;
        icmp_ln1069_reg_302 <= icmp_ln1069_fu_161_p2;
        state_buffer_lp_heads_V_addr_reg_292 <= zext_ln1073_cast_fu_137_p1;
        state_buffer_lp_sizes_V_addr_reg_297 <= zext_ln1073_cast_fu_137_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1) & (icmp_ln1069_reg_302 == 1'd0))) begin
        or_ln85_reg_316 <= or_ln85_fu_181_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln1069_fu_161_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        state_buffer_buffer_next_V_addr_reg_306 <= zext_ln587_fu_167_p1;
    end
end

always @ (*) begin
    if (((icmp_ln1069_fu_161_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_current_V_1 = current_V_3;
    end else begin
        ap_sig_allocacmp_current_V_1 = current_V_fu_52;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (or_ln85_fu_181_p2 == 1'd0) & (icmp_ln1069_reg_302 == 1'd0))) begin
        removed_V_3_out_o = removed_V_fu_197_p2;
    end else begin
        removed_V_3_out_o = removed_V_3_out_i;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (or_ln85_fu_181_p2 == 1'd0) & (icmp_ln1069_reg_302 == 1'd0))) begin
        removed_V_3_out_o_ap_vld = 1'b1;
    end else begin
        removed_V_3_out_o_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        state_buffer_buffer_next_V_address0 = zext_ln587_1_fu_232_p1;
    end else if ((((1'b0 == ap_block_pp0_stage1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1)) | ((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        state_buffer_buffer_next_V_address0 = state_buffer_buffer_next_V_addr_reg_306;
    end else begin
        state_buffer_buffer_next_V_address0 = 'bx;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage2_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2)) | ((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1)) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        state_buffer_buffer_next_V_ce0 = 1'b1;
    end else begin
        state_buffer_buffer_next_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        state_buffer_buffer_next_V_d0 = state_buffer_free_head_V_i;
    end else if (((1'b0 == ap_block_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        state_buffer_buffer_next_V_d0 = state_buffer_buffer_next_V_q0;
    end else begin
        state_buffer_buffer_next_V_d0 = 'bx;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage2_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2) & (icmp_ln1065_fu_226_p2 == 1'd0) & (or_ln85_reg_316 == 1'd0) & (icmp_ln1069_reg_302 == 1'd0)) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (or_ln85_reg_316 == 1'd0)))) begin
        state_buffer_buffer_next_V_we0 = 1'b1;
    end else begin
        state_buffer_buffer_next_V_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        state_buffer_buffer_state_lvt_V_ce0 = 1'b1;
    end else begin
        state_buffer_buffer_state_lvt_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (or_ln85_reg_316 == 1'd0))) begin
        state_buffer_free_head_V_o = current_V_1_reg_286;
    end else begin
        state_buffer_free_head_V_o = state_buffer_free_head_V_i;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (or_ln85_reg_316 == 1'd0))) begin
        state_buffer_free_head_V_o_ap_vld = 1'b1;
    end else begin
        state_buffer_free_head_V_o_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage2_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        state_buffer_lp_heads_V_ce0 = 1'b1;
    end else begin
        state_buffer_lp_heads_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage2_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2) & (icmp_ln1065_fu_226_p2 == 1'd1) & (or_ln85_reg_316 == 1'd0) & (icmp_ln1069_reg_302 == 1'd0))) begin
        state_buffer_lp_heads_V_we0 = 1'b1;
    end else begin
        state_buffer_lp_heads_V_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage2_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2)) | ((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1)))) begin
        state_buffer_lp_sizes_V_ce0 = 1'b1;
    end else begin
        state_buffer_lp_sizes_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage2_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2) & (or_ln85_reg_316 == 1'd0) & (icmp_ln1069_reg_302 == 1'd0))) begin
        state_buffer_lp_sizes_V_we0 = 1'b1;
    end else begin
        state_buffer_lp_sizes_V_we0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            if ((1'b1 == ap_condition_exit_pp0_iter0_stage0)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((~((ap_start_int == 1'b0) & (ap_idle_pp0_1to1 == 1'b1)) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
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

assign and_ln85_fu_187_p2 = (keep_next_fu_48 & icmp_ln85_fu_176_p2);

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

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign icmp_ln1065_fu_226_p2 = ((prev_V_fu_56 == 16'd65535) ? 1'b1 : 1'b0);

assign icmp_ln1069_fu_161_p2 = ((ap_sig_allocacmp_current_V_1 == 16'd65535) ? 1'b1 : 1'b0);

assign icmp_ln85_fu_176_p2 = (($signed(state_buffer_buffer_state_lvt_V_q0) > $signed(tmp_4)) ? 1'b1 : 1'b0);

assign or_ln85_fu_181_p2 = (keep_next_fu_48 | icmp_ln85_fu_176_p2);

assign removed_V_fu_197_p2 = (removed_V_3_out_i + 16'd1);

assign state_buffer_buffer_state_lvt_V_address0 = zext_ln587_fu_167_p1;

assign state_buffer_lp_heads_V_address0 = state_buffer_lp_heads_V_addr_reg_292;

assign state_buffer_lp_heads_V_d0 = state_buffer_buffer_next_V_q0;

assign state_buffer_lp_sizes_V_address0 = state_buffer_lp_sizes_V_addr_reg_297;

assign state_buffer_lp_sizes_V_d0 = ($signed(state_buffer_lp_sizes_V_q0) + $signed(16'd65535));

assign zext_ln1073_cast_fu_137_p1 = zext_ln1073;

assign zext_ln587_1_fu_232_p1 = prev_V_fu_56;

assign zext_ln587_fu_167_p1 = ap_sig_allocacmp_current_V_1;

endmodule //simulation_top_state_buffer_top_1_Pipeline_VITIS_LOOP_81_2
