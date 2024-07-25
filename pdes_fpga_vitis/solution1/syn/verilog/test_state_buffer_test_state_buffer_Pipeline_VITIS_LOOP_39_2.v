// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module test_state_buffer_test_state_buffer_Pipeline_VITIS_LOOP_39_2 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        buffer_lp_sizes_address0,
        buffer_lp_sizes_ce0,
        buffer_lp_sizes_we0,
        buffer_lp_sizes_d0,
        buffer_lp_sizes_2_address0,
        buffer_lp_sizes_2_ce0,
        buffer_lp_sizes_2_we0,
        buffer_lp_sizes_2_d0,
        buffer_lp_heads_address0,
        buffer_lp_heads_ce0,
        buffer_lp_heads_we0,
        buffer_lp_heads_d0,
        buffer_lp_heads_2_address0,
        buffer_lp_heads_2_ce0,
        buffer_lp_heads_2_we0,
        buffer_lp_heads_2_d0
);

parameter    ap_ST_fsm_state1 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [4:0] buffer_lp_sizes_address0;
output   buffer_lp_sizes_ce0;
output   buffer_lp_sizes_we0;
output  [31:0] buffer_lp_sizes_d0;
output  [4:0] buffer_lp_sizes_2_address0;
output   buffer_lp_sizes_2_ce0;
output   buffer_lp_sizes_2_we0;
output  [31:0] buffer_lp_sizes_2_d0;
output  [4:0] buffer_lp_heads_address0;
output   buffer_lp_heads_ce0;
output   buffer_lp_heads_we0;
output  [31:0] buffer_lp_heads_d0;
output  [4:0] buffer_lp_heads_2_address0;
output   buffer_lp_heads_2_ce0;
output   buffer_lp_heads_2_we0;
output  [31:0] buffer_lp_heads_2_d0;

reg ap_idle;
reg buffer_lp_sizes_ce0;
reg buffer_lp_sizes_we0;
reg buffer_lp_sizes_2_ce0;
reg buffer_lp_sizes_2_we0;
reg buffer_lp_heads_ce0;
reg buffer_lp_heads_we0;
reg buffer_lp_heads_2_ce0;
reg buffer_lp_heads_2_we0;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    ap_block_state1_pp0_stage0_iter0;
wire   [0:0] icmp_ln39_fu_106_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire   [63:0] zext_ln40_fu_128_p1;
reg   [6:0] i_fu_38;
wire   [6:0] add_ln39_fu_112_p2;
wire    ap_loop_init;
reg   [6:0] ap_sig_allocacmp_i_1;
wire   [0:0] trunc_ln40_fu_136_p1;
wire   [4:0] lshr_ln_fu_118_p4;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [0:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_done_reg = 1'b0;
end

test_state_buffer_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
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
        ap_CS_fsm <= ap_ST_fsm_state1;
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
        end else if (((ap_loop_exit_ready == 1'b1) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
        if ((icmp_ln39_fu_106_p2 == 1'd0)) begin
            i_fu_38 <= add_ln39_fu_112_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            i_fu_38 <= 7'd0;
        end
    end
end

always @ (*) begin
    if ((ap_start_int == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln39_fu_106_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_sig_allocacmp_i_1 = 7'd0;
    end else begin
        ap_sig_allocacmp_i_1 = i_fu_38;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
        buffer_lp_heads_2_ce0 = 1'b1;
    end else begin
        buffer_lp_heads_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((trunc_ln40_fu_136_p1 == 1'd1) & (icmp_ln39_fu_106_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
        buffer_lp_heads_2_we0 = 1'b1;
    end else begin
        buffer_lp_heads_2_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
        buffer_lp_heads_ce0 = 1'b1;
    end else begin
        buffer_lp_heads_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((trunc_ln40_fu_136_p1 == 1'd0) & (icmp_ln39_fu_106_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
        buffer_lp_heads_we0 = 1'b1;
    end else begin
        buffer_lp_heads_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
        buffer_lp_sizes_2_ce0 = 1'b1;
    end else begin
        buffer_lp_sizes_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((trunc_ln40_fu_136_p1 == 1'd1) & (icmp_ln39_fu_106_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
        buffer_lp_sizes_2_we0 = 1'b1;
    end else begin
        buffer_lp_sizes_2_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
        buffer_lp_sizes_ce0 = 1'b1;
    end else begin
        buffer_lp_sizes_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((trunc_ln40_fu_136_p1 == 1'd0) & (icmp_ln39_fu_106_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
        buffer_lp_sizes_we0 = 1'b1;
    end else begin
        buffer_lp_sizes_we0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln39_fu_112_p2 = (ap_sig_allocacmp_i_1 + 7'd1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = (ap_start_int == 1'b0);
end

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign buffer_lp_heads_2_address0 = zext_ln40_fu_128_p1;

assign buffer_lp_heads_2_d0 = 32'd4294967295;

assign buffer_lp_heads_address0 = zext_ln40_fu_128_p1;

assign buffer_lp_heads_d0 = 32'd4294967295;

assign buffer_lp_sizes_2_address0 = zext_ln40_fu_128_p1;

assign buffer_lp_sizes_2_d0 = 32'd0;

assign buffer_lp_sizes_address0 = zext_ln40_fu_128_p1;

assign buffer_lp_sizes_d0 = 32'd0;

assign icmp_ln39_fu_106_p2 = ((ap_sig_allocacmp_i_1 == 7'd64) ? 1'b1 : 1'b0);

assign lshr_ln_fu_118_p4 = {{ap_sig_allocacmp_i_1[5:1]}};

assign trunc_ln40_fu_136_p1 = ap_sig_allocacmp_i_1[0:0];

assign zext_ln40_fu_128_p1 = lshr_ln_fu_118_p4;

endmodule //test_state_buffer_test_state_buffer_Pipeline_VITIS_LOOP_39_2
