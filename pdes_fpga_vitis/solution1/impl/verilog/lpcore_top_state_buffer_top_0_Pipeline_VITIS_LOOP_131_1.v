// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module lpcore_top_state_buffer_top_0_Pipeline_VITIS_LOOP_131_1 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        current_V,
        zext_ln587_3,
        tmp_to_time_V,
        removed_V_out,
        removed_V_out_ap_vld,
        state_buffer_buffer_next_V_address0,
        state_buffer_buffer_next_V_ce0,
        state_buffer_buffer_next_V_we0,
        state_buffer_buffer_next_V_d0,
        state_buffer_buffer_next_V_q0,
        state_buffer_lp_heads_V_address0,
        state_buffer_lp_heads_V_ce0,
        state_buffer_lp_heads_V_we0,
        state_buffer_lp_heads_V_d0,
        state_buffer_free_head_V_i,
        state_buffer_free_head_V_o,
        state_buffer_free_head_V_o_ap_vld,
        state_buffer_buffer_state_lvt_V_address0,
        state_buffer_buffer_state_lvt_V_ce0,
        state_buffer_buffer_state_lvt_V_q0
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
input  [1:0] zext_ln587_3;
input  [31:0] tmp_to_time_V;
output  [15:0] removed_V_out;
output   removed_V_out_ap_vld;
output  [6:0] state_buffer_buffer_next_V_address0;
output   state_buffer_buffer_next_V_ce0;
output   state_buffer_buffer_next_V_we0;
output  [15:0] state_buffer_buffer_next_V_d0;
input  [15:0] state_buffer_buffer_next_V_q0;
output  [1:0] state_buffer_lp_heads_V_address0;
output   state_buffer_lp_heads_V_ce0;
output   state_buffer_lp_heads_V_we0;
output  [15:0] state_buffer_lp_heads_V_d0;
input  [15:0] state_buffer_free_head_V_i;
output  [15:0] state_buffer_free_head_V_o;
output   state_buffer_free_head_V_o_ap_vld;
output  [6:0] state_buffer_buffer_state_lvt_V_address0;
output   state_buffer_buffer_state_lvt_V_ce0;
input  [31:0] state_buffer_buffer_state_lvt_V_q0;

reg ap_idle;
reg removed_V_out_ap_vld;
reg state_buffer_buffer_next_V_ce0;
reg state_buffer_buffer_next_V_we0;
reg state_buffer_lp_heads_V_ce0;
reg state_buffer_lp_heads_V_we0;
reg[15:0] state_buffer_free_head_V_o;
reg state_buffer_free_head_V_o_ap_vld;
reg state_buffer_buffer_state_lvt_V_ce0;

(* fsm_encoding = "none" *) reg   [1:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire    ap_CS_fsm_pp0_stage1;
wire    ap_block_state2_pp0_stage1_iter0;
wire    ap_block_pp0_stage1_subdone;
wire   [0:0] icmp_ln1081_fu_176_p2;
reg   [0:0] icmp_ln1069_reg_271;
reg    ap_condition_exit_pp0_iter0_stage1;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state3_pp0_stage0_iter1;
wire    ap_block_pp0_stage0_11001;
reg   [15:0] current_V_3_reg_261;
reg   [1:0] state_buffer_lp_heads_V_addr_reg_266;
wire   [0:0] icmp_ln1069_fu_155_p2;
wire   [63:0] zext_ln587_fu_161_p1;
reg   [63:0] zext_ln587_reg_275;
wire    ap_block_pp0_stage1_11001;
reg   [15:0] reuse_reg_load_reg_295;
wire   [0:0] addr_cmp_fu_187_p2;
reg   [0:0] addr_cmp_reg_300;
reg    ap_enable_reg_pp0_iter0_reg;
wire    ap_block_pp0_stage0_subdone;
wire   [63:0] zext_ln587_3_cast_fu_127_p1;
wire    ap_block_pp0_stage0;
wire    ap_block_pp0_stage1;
reg   [63:0] reuse_addr_reg_fu_48;
wire    ap_loop_init;
reg   [15:0] reuse_reg_fu_52;
reg   [15:0] removed_V_fu_56;
wire   [15:0] removed_V_2_fu_170_p2;
reg   [15:0] current_V_1_fu_60;
wire   [15:0] current_V_4_fu_216_p3;
reg   [15:0] ap_sig_allocacmp_current_V_3;
wire    ap_block_pp0_stage1_01001;
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

lpcore_top_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
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
            current_V_1_fu_60 <= current_V;
        end else if ((ap_enable_reg_pp0_iter1 == 1'b1)) begin
            current_V_1_fu_60 <= current_V_4_fu_216_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        removed_V_fu_56 <= 16'd0;
    end else if (((icmp_ln1069_reg_271 == 1'd0) & (icmp_ln1081_fu_176_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        removed_V_fu_56 <= removed_V_2_fu_170_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        reuse_addr_reg_fu_48 <= 64'd18446744073709551615;
    end else if (((icmp_ln1069_reg_271 == 1'd0) & (icmp_ln1081_fu_176_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        reuse_addr_reg_fu_48 <= zext_ln587_reg_275;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        reuse_reg_fu_52 <= 16'd0;
    end else if (((icmp_ln1069_reg_271 == 1'd0) & (icmp_ln1081_fu_176_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        reuse_reg_fu_52 <= state_buffer_free_head_V_i;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln1069_reg_271 == 1'd0) & (icmp_ln1081_fu_176_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        addr_cmp_reg_300 <= addr_cmp_fu_187_p2;
        reuse_reg_load_reg_295 <= reuse_reg_fu_52;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        current_V_3_reg_261 <= ap_sig_allocacmp_current_V_3;
        icmp_ln1069_reg_271 <= icmp_ln1069_fu_155_p2;
        state_buffer_lp_heads_V_addr_reg_266 <= zext_ln587_3_cast_fu_127_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln1069_fu_155_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        zext_ln587_reg_275[15 : 0] <= zext_ln587_fu_161_p1[15 : 0];
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & ((icmp_ln1069_reg_271 == 1'd1) | (icmp_ln1081_fu_176_p2 == 1'd0)))) begin
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
    if (((1'b0 == ap_block_pp0_stage1_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            ap_sig_allocacmp_current_V_3 = current_V;
        end else if ((ap_enable_reg_pp0_iter1 == 1'b1)) begin
            ap_sig_allocacmp_current_V_3 = current_V_4_fu_216_p3;
        end else begin
            ap_sig_allocacmp_current_V_3 = current_V_1_fu_60;
        end
    end else begin
        ap_sig_allocacmp_current_V_3 = current_V_1_fu_60;
    end
end

always @ (*) begin
    if ((((icmp_ln1069_reg_271 == 1'd1) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1)) | ((icmp_ln1069_reg_271 == 1'd0) & (icmp_ln1081_fu_176_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1)))) begin
        removed_V_out_ap_vld = 1'b1;
    end else begin
        removed_V_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln1069_reg_271 == 1'd0) & (icmp_ln1081_fu_176_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        state_buffer_buffer_next_V_ce0 = 1'b1;
    end else begin
        state_buffer_buffer_next_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln1069_reg_271 == 1'd0) & (icmp_ln1081_fu_176_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
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
    if (((icmp_ln1069_reg_271 == 1'd0) & (icmp_ln1081_fu_176_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        state_buffer_free_head_V_o = current_V_3_reg_261;
    end else begin
        state_buffer_free_head_V_o = state_buffer_free_head_V_i;
    end
end

always @ (*) begin
    if (((icmp_ln1069_reg_271 == 1'd0) & (icmp_ln1081_fu_176_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        state_buffer_free_head_V_o_ap_vld = 1'b1;
    end else begin
        state_buffer_free_head_V_o_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        state_buffer_lp_heads_V_ce0 = 1'b1;
    end else begin
        state_buffer_lp_heads_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        state_buffer_lp_heads_V_we0 = 1'b1;
    end else begin
        state_buffer_lp_heads_V_we0 = 1'b0;
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

assign addr_cmp_fu_187_p2 = ((reuse_addr_reg_fu_48 == zext_ln587_reg_275) ? 1'b1 : 1'b0);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_pp0_stage1 = ap_CS_fsm[32'd1];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_01001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_subdone = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage1_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage1;

assign current_V_4_fu_216_p3 = ((addr_cmp_reg_300[0:0] == 1'b1) ? reuse_reg_load_reg_295 : state_buffer_buffer_next_V_q0);

assign icmp_ln1069_fu_155_p2 = ((ap_sig_allocacmp_current_V_3 == 16'd65535) ? 1'b1 : 1'b0);

assign icmp_ln1081_fu_176_p2 = (($signed(state_buffer_buffer_state_lvt_V_q0) > $signed(tmp_to_time_V)) ? 1'b1 : 1'b0);

assign removed_V_2_fu_170_p2 = (removed_V_fu_56 + 16'd1);

assign removed_V_out = removed_V_fu_56;

assign state_buffer_buffer_next_V_address0 = zext_ln587_reg_275;

assign state_buffer_buffer_next_V_d0 = state_buffer_free_head_V_i;

assign state_buffer_buffer_state_lvt_V_address0 = zext_ln587_fu_161_p1;

assign state_buffer_lp_heads_V_address0 = state_buffer_lp_heads_V_addr_reg_266;

assign state_buffer_lp_heads_V_d0 = ((addr_cmp_reg_300[0:0] == 1'b1) ? reuse_reg_load_reg_295 : state_buffer_buffer_next_V_q0);

assign zext_ln587_3_cast_fu_127_p1 = zext_ln587_3;

assign zext_ln587_fu_161_p1 = ap_sig_allocacmp_current_V_3;

always @ (posedge ap_clk) begin
    zext_ln587_reg_275[63:16] <= 48'b000000000000000000000000000000000000000000000000;
end

endmodule //lpcore_top_state_buffer_top_0_Pipeline_VITIS_LOOP_131_1
