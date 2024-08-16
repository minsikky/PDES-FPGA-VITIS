// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module simulation_top_commit_Pipeline_VITIS_LOOP_237_22 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        this_8_1_reload,
        this_6_1_reload,
        this_2_address0,
        this_2_ce0,
        this_2_we0,
        this_2_d0,
        this_4_address0,
        this_4_ce0,
        this_4_we0,
        this_4_d0,
        this_4_q0,
        this_1_address0,
        this_1_ce0,
        this_1_we0,
        this_1_d0,
        this_1_address1,
        this_1_ce1,
        this_1_q1,
        this_0_2_address0,
        this_0_2_ce0,
        this_0_2_we0,
        this_0_2_d0,
        this_0_2_q0,
        this_0_0_1_address0,
        this_0_0_1_ce0,
        this_0_0_1_q0,
        commit_time,
        this_8_2_out,
        this_8_2_out_ap_vld,
        this_6_2_out,
        this_6_2_out_ap_vld
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
input  [15:0] this_8_1_reload;
input  [15:0] this_6_1_reload;
output  [1:0] this_2_address0;
output   this_2_ce0;
output   this_2_we0;
output  [15:0] this_2_d0;
output  [1:0] this_4_address0;
output   this_4_ce0;
output   this_4_we0;
output  [15:0] this_4_d0;
input  [15:0] this_4_q0;
output  [1:0] this_1_address0;
output   this_1_ce0;
output   this_1_we0;
output  [15:0] this_1_d0;
output  [1:0] this_1_address1;
output   this_1_ce1;
input  [15:0] this_1_q1;
output  [6:0] this_0_2_address0;
output   this_0_2_ce0;
output   this_0_2_we0;
output  [15:0] this_0_2_d0;
input  [15:0] this_0_2_q0;
output  [6:0] this_0_0_1_address0;
output   this_0_0_1_ce0;
input  [31:0] this_0_0_1_q0;
input  [31:0] commit_time;
output  [15:0] this_8_2_out;
output   this_8_2_out_ap_vld;
output  [15:0] this_6_2_out;
output   this_6_2_out_ap_vld;

reg ap_idle;
reg this_2_ce0;
reg this_2_we0;
reg[1:0] this_4_address0;
reg this_4_ce0;
reg this_4_we0;
reg this_1_ce0;
reg this_1_we0;
reg this_1_ce1;
reg this_0_2_ce0;
reg this_0_2_we0;
reg this_0_0_1_ce0;
reg[15:0] this_8_2_out;
reg this_8_2_out_ap_vld;
reg[15:0] this_6_2_out;
reg this_6_2_out_ap_vld;

(* fsm_encoding = "none" *) reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire    ap_CS_fsm_pp0_stage2;
wire    ap_block_state3_pp0_stage2_iter0;
wire    ap_block_pp0_stage2_subdone;
wire   [0:0] icmp_ln1085_fu_240_p2;
reg   [0:0] icmp_ln1069_reg_394;
reg    ap_condition_exit_pp0_iter0_stage2;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state4_pp0_stage0_iter1;
wire    ap_block_pp0_stage0_11001;
wire   [15:0] commit_entry_V_2_fu_221_p3;
reg   [15:0] commit_entry_V_2_reg_388;
wire    ap_CS_fsm_pp0_stage1;
wire    ap_block_state2_pp0_stage1_iter0;
wire    ap_block_pp0_stage1_11001;
wire   [0:0] icmp_ln1069_fu_229_p2;
wire   [63:0] zext_ln587_fu_235_p1;
reg   [63:0] zext_ln587_reg_398;
wire    ap_block_pp0_stage2_11001;
wire   [1:0] this_4_addr_reg_415;
reg   [15:0] commit_entry_V_load_4_reg_423;
wire   [0:0] addr_cmp_fu_252_p2;
reg   [0:0] addr_cmp_reg_433;
reg    ap_enable_reg_pp0_iter0_reg;
wire    ap_block_pp0_stage0_subdone;
wire    ap_block_pp0_stage0;
wire    ap_block_pp0_stage1;
wire    ap_block_pp0_stage2;
reg   [63:0] reuse_addr_reg6_fu_50;
wire    ap_loop_init;
reg   [15:0] reuse_reg5_fu_54;
wire   [15:0] reuse_select_fu_287_p3;
reg   [63:0] reuse_addr_reg_fu_58;
reg   [15:0] reuse_reg_fu_62;
reg   [15:0] commit_entry_V_fu_66;
wire   [15:0] commit_entry_V_load_load_fu_323_p1;
reg   [15:0] this_8_2_fu_70;
wire   [15:0] add_ln887_fu_269_p2;
wire   [15:0] this_8_2_load_1_load_fu_327_p1;
wire    ap_block_pp0_stage2_01001;
wire   [0:0] icmp_ln1065_fu_304_p2;
wire   [0:0] icmp_ln1065_25_fu_309_p2;
wire   [0:0] addr_cmp9_fu_215_p2;
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
        commit_entry_V_fu_66 <= this_6_1_reload;
    end else if (((icmp_ln1069_reg_394 == 1'd0) & (icmp_ln1085_fu_240_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage2_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        commit_entry_V_fu_66 <= commit_entry_V_2_reg_388;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
                reuse_addr_reg6_fu_50[0] <= 1'b1;
        reuse_addr_reg6_fu_50[2] <= 1'b1;
        reuse_addr_reg6_fu_50[3] <= 1'b1;
        reuse_addr_reg6_fu_50[4] <= 1'b1;
        reuse_addr_reg6_fu_50[5] <= 1'b1;
        reuse_addr_reg6_fu_50[6] <= 1'b1;
        reuse_addr_reg6_fu_50[7] <= 1'b1;
        reuse_addr_reg6_fu_50[8] <= 1'b1;
        reuse_addr_reg6_fu_50[9] <= 1'b1;
        reuse_addr_reg6_fu_50[10] <= 1'b1;
        reuse_addr_reg6_fu_50[11] <= 1'b1;
        reuse_addr_reg6_fu_50[12] <= 1'b1;
        reuse_addr_reg6_fu_50[13] <= 1'b1;
        reuse_addr_reg6_fu_50[14] <= 1'b1;
        reuse_addr_reg6_fu_50[15] <= 1'b1;
        reuse_addr_reg6_fu_50[16] <= 1'b1;
        reuse_addr_reg6_fu_50[17] <= 1'b1;
        reuse_addr_reg6_fu_50[18] <= 1'b1;
        reuse_addr_reg6_fu_50[19] <= 1'b1;
        reuse_addr_reg6_fu_50[20] <= 1'b1;
        reuse_addr_reg6_fu_50[21] <= 1'b1;
        reuse_addr_reg6_fu_50[22] <= 1'b1;
        reuse_addr_reg6_fu_50[23] <= 1'b1;
        reuse_addr_reg6_fu_50[24] <= 1'b1;
        reuse_addr_reg6_fu_50[25] <= 1'b1;
        reuse_addr_reg6_fu_50[26] <= 1'b1;
        reuse_addr_reg6_fu_50[27] <= 1'b1;
        reuse_addr_reg6_fu_50[28] <= 1'b1;
        reuse_addr_reg6_fu_50[29] <= 1'b1;
        reuse_addr_reg6_fu_50[30] <= 1'b1;
        reuse_addr_reg6_fu_50[31] <= 1'b1;
        reuse_addr_reg6_fu_50[32] <= 1'b1;
        reuse_addr_reg6_fu_50[33] <= 1'b1;
        reuse_addr_reg6_fu_50[34] <= 1'b1;
        reuse_addr_reg6_fu_50[35] <= 1'b1;
        reuse_addr_reg6_fu_50[36] <= 1'b1;
        reuse_addr_reg6_fu_50[37] <= 1'b1;
        reuse_addr_reg6_fu_50[38] <= 1'b1;
        reuse_addr_reg6_fu_50[39] <= 1'b1;
        reuse_addr_reg6_fu_50[40] <= 1'b1;
        reuse_addr_reg6_fu_50[41] <= 1'b1;
        reuse_addr_reg6_fu_50[42] <= 1'b1;
        reuse_addr_reg6_fu_50[43] <= 1'b1;
        reuse_addr_reg6_fu_50[44] <= 1'b1;
        reuse_addr_reg6_fu_50[45] <= 1'b1;
        reuse_addr_reg6_fu_50[46] <= 1'b1;
        reuse_addr_reg6_fu_50[47] <= 1'b1;
        reuse_addr_reg6_fu_50[48] <= 1'b1;
        reuse_addr_reg6_fu_50[49] <= 1'b1;
        reuse_addr_reg6_fu_50[50] <= 1'b1;
        reuse_addr_reg6_fu_50[51] <= 1'b1;
        reuse_addr_reg6_fu_50[52] <= 1'b1;
        reuse_addr_reg6_fu_50[53] <= 1'b1;
        reuse_addr_reg6_fu_50[54] <= 1'b1;
        reuse_addr_reg6_fu_50[55] <= 1'b1;
        reuse_addr_reg6_fu_50[56] <= 1'b1;
        reuse_addr_reg6_fu_50[57] <= 1'b1;
        reuse_addr_reg6_fu_50[58] <= 1'b1;
        reuse_addr_reg6_fu_50[59] <= 1'b1;
        reuse_addr_reg6_fu_50[60] <= 1'b1;
        reuse_addr_reg6_fu_50[61] <= 1'b1;
        reuse_addr_reg6_fu_50[62] <= 1'b1;
        reuse_addr_reg6_fu_50[63] <= 1'b1;
    end else if (((icmp_ln1069_reg_394 == 1'd0) & (icmp_ln1085_fu_240_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage2_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
                reuse_addr_reg6_fu_50[0] <= 1'b0;
        reuse_addr_reg6_fu_50[2] <= 1'b0;
        reuse_addr_reg6_fu_50[3] <= 1'b0;
        reuse_addr_reg6_fu_50[4] <= 1'b0;
        reuse_addr_reg6_fu_50[5] <= 1'b0;
        reuse_addr_reg6_fu_50[6] <= 1'b0;
        reuse_addr_reg6_fu_50[7] <= 1'b0;
        reuse_addr_reg6_fu_50[8] <= 1'b0;
        reuse_addr_reg6_fu_50[9] <= 1'b0;
        reuse_addr_reg6_fu_50[10] <= 1'b0;
        reuse_addr_reg6_fu_50[11] <= 1'b0;
        reuse_addr_reg6_fu_50[12] <= 1'b0;
        reuse_addr_reg6_fu_50[13] <= 1'b0;
        reuse_addr_reg6_fu_50[14] <= 1'b0;
        reuse_addr_reg6_fu_50[15] <= 1'b0;
        reuse_addr_reg6_fu_50[16] <= 1'b0;
        reuse_addr_reg6_fu_50[17] <= 1'b0;
        reuse_addr_reg6_fu_50[18] <= 1'b0;
        reuse_addr_reg6_fu_50[19] <= 1'b0;
        reuse_addr_reg6_fu_50[20] <= 1'b0;
        reuse_addr_reg6_fu_50[21] <= 1'b0;
        reuse_addr_reg6_fu_50[22] <= 1'b0;
        reuse_addr_reg6_fu_50[23] <= 1'b0;
        reuse_addr_reg6_fu_50[24] <= 1'b0;
        reuse_addr_reg6_fu_50[25] <= 1'b0;
        reuse_addr_reg6_fu_50[26] <= 1'b0;
        reuse_addr_reg6_fu_50[27] <= 1'b0;
        reuse_addr_reg6_fu_50[28] <= 1'b0;
        reuse_addr_reg6_fu_50[29] <= 1'b0;
        reuse_addr_reg6_fu_50[30] <= 1'b0;
        reuse_addr_reg6_fu_50[31] <= 1'b0;
        reuse_addr_reg6_fu_50[32] <= 1'b0;
        reuse_addr_reg6_fu_50[33] <= 1'b0;
        reuse_addr_reg6_fu_50[34] <= 1'b0;
        reuse_addr_reg6_fu_50[35] <= 1'b0;
        reuse_addr_reg6_fu_50[36] <= 1'b0;
        reuse_addr_reg6_fu_50[37] <= 1'b0;
        reuse_addr_reg6_fu_50[38] <= 1'b0;
        reuse_addr_reg6_fu_50[39] <= 1'b0;
        reuse_addr_reg6_fu_50[40] <= 1'b0;
        reuse_addr_reg6_fu_50[41] <= 1'b0;
        reuse_addr_reg6_fu_50[42] <= 1'b0;
        reuse_addr_reg6_fu_50[43] <= 1'b0;
        reuse_addr_reg6_fu_50[44] <= 1'b0;
        reuse_addr_reg6_fu_50[45] <= 1'b0;
        reuse_addr_reg6_fu_50[46] <= 1'b0;
        reuse_addr_reg6_fu_50[47] <= 1'b0;
        reuse_addr_reg6_fu_50[48] <= 1'b0;
        reuse_addr_reg6_fu_50[49] <= 1'b0;
        reuse_addr_reg6_fu_50[50] <= 1'b0;
        reuse_addr_reg6_fu_50[51] <= 1'b0;
        reuse_addr_reg6_fu_50[52] <= 1'b0;
        reuse_addr_reg6_fu_50[53] <= 1'b0;
        reuse_addr_reg6_fu_50[54] <= 1'b0;
        reuse_addr_reg6_fu_50[55] <= 1'b0;
        reuse_addr_reg6_fu_50[56] <= 1'b0;
        reuse_addr_reg6_fu_50[57] <= 1'b0;
        reuse_addr_reg6_fu_50[58] <= 1'b0;
        reuse_addr_reg6_fu_50[59] <= 1'b0;
        reuse_addr_reg6_fu_50[60] <= 1'b0;
        reuse_addr_reg6_fu_50[61] <= 1'b0;
        reuse_addr_reg6_fu_50[62] <= 1'b0;
        reuse_addr_reg6_fu_50[63] <= 1'b0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        reuse_addr_reg_fu_58 <= 64'd18446744073709551615;
    end else if (((icmp_ln1069_reg_394 == 1'd0) & (icmp_ln1085_fu_240_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage2_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        reuse_addr_reg_fu_58 <= zext_ln587_reg_398;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            reuse_reg5_fu_54 <= 16'd0;
        end else if ((ap_enable_reg_pp0_iter1 == 1'b1)) begin
            reuse_reg5_fu_54 <= reuse_select_fu_287_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            reuse_reg_fu_62 <= 16'd0;
        end else if ((ap_enable_reg_pp0_iter1 == 1'b1)) begin
            reuse_reg_fu_62 <= commit_entry_V_load_4_reg_423;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        this_8_2_fu_70 <= this_8_1_reload;
    end else if (((icmp_ln1069_reg_394 == 1'd0) & (icmp_ln1085_fu_240_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage2_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        this_8_2_fu_70 <= add_ln887_fu_269_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln1069_reg_394 == 1'd0) & (icmp_ln1085_fu_240_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage2_11001) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        addr_cmp_reg_433 <= addr_cmp_fu_252_p2;
        commit_entry_V_load_4_reg_423 <= commit_entry_V_fu_66;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        commit_entry_V_2_reg_388 <= commit_entry_V_2_fu_221_p3;
        icmp_ln1069_reg_394 <= icmp_ln1069_fu_229_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1) & (icmp_ln1069_fu_229_p2 == 1'd0))) begin
        zext_ln587_reg_398[15 : 0] <= zext_ln587_fu_235_p1[15 : 0];
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage2_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2) & ((icmp_ln1069_reg_394 == 1'd1) | (icmp_ln1085_fu_240_p2 == 1'd1)))) begin
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
    if (((1'b0 == ap_block_pp0_stage2_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        this_0_0_1_ce0 = 1'b1;
    end else begin
        this_0_0_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln1069_reg_394 == 1'd0) & (icmp_ln1085_fu_240_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage2_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        this_0_2_ce0 = 1'b1;
    end else begin
        this_0_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln1069_reg_394 == 1'd0) & (icmp_ln1085_fu_240_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage2_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        this_0_2_we0 = 1'b1;
    end else begin
        this_0_2_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        this_1_ce0 = 1'b1;
    end else begin
        this_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        this_1_ce1 = 1'b1;
    end else begin
        this_1_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        this_1_we0 = 1'b1;
    end else begin
        this_1_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        this_2_ce0 = 1'b1;
    end else begin
        this_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln1065_25_fu_309_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        this_2_we0 = 1'b1;
    end else begin
        this_2_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        this_4_address0 = this_4_addr_reg_415;
    end else if (((1'b0 == ap_block_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        this_4_address0 = 64'd2;
    end else begin
        this_4_address0 = 'bx;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage2_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2)) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        this_4_ce0 = 1'b1;
    end else begin
        this_4_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln1065_fu_304_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        this_4_we0 = 1'b1;
    end else begin
        this_4_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage2_01001) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        if ((icmp_ln1069_reg_394 == 1'd1)) begin
            this_6_2_out = commit_entry_V_load_load_fu_323_p1;
        end else if (((icmp_ln1069_reg_394 == 1'd0) & (icmp_ln1085_fu_240_p2 == 1'd1))) begin
            this_6_2_out = commit_entry_V_fu_66;
        end else begin
            this_6_2_out = 'bx;
        end
    end else begin
        this_6_2_out = 'bx;
    end
end

always @ (*) begin
    if ((((icmp_ln1069_reg_394 == 1'd1) & (1'b0 == ap_block_pp0_stage2_11001) & (1'b1 == ap_CS_fsm_pp0_stage2)) | ((icmp_ln1069_reg_394 == 1'd0) & (icmp_ln1085_fu_240_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage2_11001) & (1'b1 == ap_CS_fsm_pp0_stage2)))) begin
        this_6_2_out_ap_vld = 1'b1;
    end else begin
        this_6_2_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage2_01001) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        if ((icmp_ln1069_reg_394 == 1'd1)) begin
            this_8_2_out = this_8_2_load_1_load_fu_327_p1;
        end else if (((icmp_ln1069_reg_394 == 1'd0) & (icmp_ln1085_fu_240_p2 == 1'd1))) begin
            this_8_2_out = this_8_2_fu_70;
        end else begin
            this_8_2_out = 'bx;
        end
    end else begin
        this_8_2_out = 'bx;
    end
end

always @ (*) begin
    if ((((icmp_ln1069_reg_394 == 1'd1) & (1'b0 == ap_block_pp0_stage2_11001) & (1'b1 == ap_CS_fsm_pp0_stage2)) | ((icmp_ln1069_reg_394 == 1'd0) & (icmp_ln1085_fu_240_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage2_11001) & (1'b1 == ap_CS_fsm_pp0_stage2)))) begin
        this_8_2_out_ap_vld = 1'b1;
    end else begin
        this_8_2_out_ap_vld = 1'b0;
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

assign add_ln887_fu_269_p2 = ($signed(this_8_2_fu_70) + $signed(16'd65535));

assign addr_cmp9_fu_215_p2 = ((reuse_addr_reg6_fu_50 == 64'd2) ? 1'b1 : 1'b0);

assign addr_cmp_fu_252_p2 = ((reuse_addr_reg_fu_58 == zext_ln587_reg_398) ? 1'b1 : 1'b0);

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

assign ap_block_pp0_stage2_01001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage2_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage2_subdone = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage1_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage2_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage2;

assign commit_entry_V_2_fu_221_p3 = ((addr_cmp9_fu_215_p2[0:0] == 1'b1) ? reuse_reg5_fu_54 : this_1_q1);

assign commit_entry_V_load_load_fu_323_p1 = commit_entry_V_fu_66;

assign icmp_ln1065_25_fu_309_p2 = ((reuse_select_fu_287_p3 == 16'd65535) ? 1'b1 : 1'b0);

assign icmp_ln1065_fu_304_p2 = ((commit_entry_V_2_reg_388 == this_4_q0) ? 1'b1 : 1'b0);

assign icmp_ln1069_fu_229_p2 = ((commit_entry_V_2_fu_221_p3 == 16'd65535) ? 1'b1 : 1'b0);

assign icmp_ln1085_fu_240_p2 = (($signed(this_0_0_1_q0) > $signed(commit_time)) ? 1'b1 : 1'b0);

assign reuse_select_fu_287_p3 = ((addr_cmp_reg_433[0:0] == 1'b1) ? reuse_reg_fu_62 : this_0_2_q0);

assign this_0_0_1_address0 = zext_ln587_fu_235_p1;

assign this_0_2_address0 = zext_ln587_reg_398;

assign this_0_2_d0 = commit_entry_V_fu_66;

assign this_1_address0 = 64'd2;

assign this_1_address1 = 64'd2;

assign this_1_d0 = reuse_select_fu_287_p3;

assign this_2_address0 = 64'd2;

assign this_2_d0 = 16'd65535;

assign this_4_addr_reg_415 = 64'd2;

assign this_4_d0 = 16'd65535;

assign this_8_2_load_1_load_fu_327_p1 = this_8_2_fu_70;

assign zext_ln587_fu_235_p1 = commit_entry_V_2_fu_221_p3;

always @ (posedge ap_clk) begin
    zext_ln587_reg_398[63:16] <= 48'b000000000000000000000000000000000000000000000000;
    reuse_addr_reg6_fu_50[1] <= 1'b1;
end

endmodule //simulation_top_commit_Pipeline_VITIS_LOOP_237_22
