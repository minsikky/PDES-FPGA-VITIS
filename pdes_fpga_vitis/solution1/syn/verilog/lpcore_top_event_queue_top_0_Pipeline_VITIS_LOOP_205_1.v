// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module lpcore_top_event_queue_top_0_Pipeline_VITIS_LOOP_205_1 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        earliest_lp_V_out,
        earliest_lp_V_out_ap_vld,
        event_queue_lp_oldest_unissued_V_address0,
        event_queue_lp_oldest_unissued_V_ce0,
        event_queue_lp_oldest_unissued_V_q0,
        event_queue_buffer_event_recv_time_V_address0,
        event_queue_buffer_event_recv_time_V_ce0,
        event_queue_buffer_event_recv_time_V_q0
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [1:0] earliest_lp_V_out;
output   earliest_lp_V_out_ap_vld;
output  [1:0] event_queue_lp_oldest_unissued_V_address0;
output   event_queue_lp_oldest_unissued_V_ce0;
input  [15:0] event_queue_lp_oldest_unissued_V_q0;
output  [6:0] event_queue_buffer_event_recv_time_V_address0;
output   event_queue_buffer_event_recv_time_V_ce0;
input  [31:0] event_queue_buffer_event_recv_time_V_q0;

reg ap_idle;
reg earliest_lp_V_out_ap_vld;
reg event_queue_lp_oldest_unissued_V_ce0;
reg event_queue_buffer_event_recv_time_V_ce0;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_idle_pp0;
wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
wire    ap_block_state3_pp0_stage0_iter2;
wire    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln1073_fu_103_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire    ap_block_pp0_stage0_11001;
reg   [2:0] i_V_1_reg_222;
reg   [2:0] i_V_1_reg_222_pp0_iter1_reg;
reg   [0:0] icmp_ln1073_reg_227;
reg   [0:0] icmp_ln1073_reg_227_pp0_iter1_reg;
reg   [15:0] event_queue_lp_oldest_unissued_V_load_reg_236;
wire   [63:0] i_V_cast_fu_115_p1;
wire    ap_block_pp0_stage0;
wire   [63:0] zext_ln587_fu_125_p1;
reg   [31:0] earliest_time_V_fu_40;
wire   [31:0] earliest_time_V_1_fu_175_p3;
wire    ap_loop_init;
reg   [15:0] earliest_lp_V_fu_44;
wire   [15:0] earliest_lp_V_3_fu_183_p3;
reg   [2:0] i_V_fu_48;
wire   [2:0] add_ln886_fu_109_p2;
reg   [2:0] ap_sig_allocacmp_i_V_1;
wire    ap_block_pp0_stage0_01001;
wire   [0:0] icmp_ln1073_1_fu_146_p2;
wire   [1:0] trunc_ln209_fu_160_p1;
wire   [15:0] zext_ln209_fu_163_p1;
wire   [0:0] icmp_ln1069_fu_141_p2;
wire   [31:0] select_ln209_fu_152_p3;
wire   [15:0] select_ln209_1_fu_167_p3;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg    ap_loop_exit_ready_pp0_iter1_reg;
reg    ap_loop_exit_ready_pp0_iter2_reg;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
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
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter1_reg == 1'b0))) begin
        ap_loop_exit_ready_pp0_iter2_reg <= 1'b0;
    end else if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
            earliest_lp_V_fu_44 <= 16'd0;
        end else if (((icmp_ln1073_reg_227_pp0_iter1_reg == 1'd0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
            earliest_lp_V_fu_44 <= earliest_lp_V_3_fu_183_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
            earliest_time_V_fu_40 <= 32'd2147483647;
        end else if (((icmp_ln1073_reg_227_pp0_iter1_reg == 1'd0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
            earliest_time_V_fu_40 <= earliest_time_V_1_fu_175_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln1073_fu_103_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            i_V_fu_48 <= add_ln886_fu_109_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            i_V_fu_48 <= 3'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
        i_V_1_reg_222 <= ap_sig_allocacmp_i_V_1;
        i_V_1_reg_222_pp0_iter1_reg <= i_V_1_reg_222;
        icmp_ln1073_reg_227 <= icmp_ln1073_fu_103_p2;
        icmp_ln1073_reg_227_pp0_iter1_reg <= icmp_ln1073_reg_227;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln1073_reg_227 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        event_queue_lp_oldest_unissued_V_load_reg_236 <= event_queue_lp_oldest_unissued_V_q0;
    end
end

always @ (*) begin
    if (((icmp_ln1073_fu_103_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
    if (((ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
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
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_i_V_1 = 3'd0;
    end else begin
        ap_sig_allocacmp_i_V_1 = i_V_fu_48;
    end
end

always @ (*) begin
    if (((icmp_ln1073_reg_227_pp0_iter1_reg == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        earliest_lp_V_out_ap_vld = 1'b1;
    end else begin
        earliest_lp_V_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        event_queue_buffer_event_recv_time_V_ce0 = 1'b1;
    end else begin
        event_queue_buffer_event_recv_time_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        event_queue_lp_oldest_unissued_V_ce0 = 1'b1;
    end else begin
        event_queue_lp_oldest_unissued_V_ce0 = 1'b0;
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

assign add_ln886_fu_109_p2 = (ap_sig_allocacmp_i_V_1 + 3'd1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_01001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign earliest_lp_V_3_fu_183_p3 = ((icmp_ln1069_fu_141_p2[0:0] == 1'b1) ? earliest_lp_V_fu_44 : select_ln209_1_fu_167_p3);

assign earliest_lp_V_out = earliest_lp_V_fu_44[1:0];

assign earliest_time_V_1_fu_175_p3 = ((icmp_ln1069_fu_141_p2[0:0] == 1'b1) ? earliest_time_V_fu_40 : select_ln209_fu_152_p3);

assign event_queue_buffer_event_recv_time_V_address0 = zext_ln587_fu_125_p1;

assign event_queue_lp_oldest_unissued_V_address0 = i_V_cast_fu_115_p1;

assign i_V_cast_fu_115_p1 = ap_sig_allocacmp_i_V_1;

assign icmp_ln1069_fu_141_p2 = ((event_queue_lp_oldest_unissued_V_load_reg_236 == 16'd65535) ? 1'b1 : 1'b0);

assign icmp_ln1073_1_fu_146_p2 = (($signed(earliest_time_V_fu_40) > $signed(event_queue_buffer_event_recv_time_V_q0)) ? 1'b1 : 1'b0);

assign icmp_ln1073_fu_103_p2 = ((ap_sig_allocacmp_i_V_1 == 3'd4) ? 1'b1 : 1'b0);

assign select_ln209_1_fu_167_p3 = ((icmp_ln1073_1_fu_146_p2[0:0] == 1'b1) ? zext_ln209_fu_163_p1 : earliest_lp_V_fu_44);

assign select_ln209_fu_152_p3 = ((icmp_ln1073_1_fu_146_p2[0:0] == 1'b1) ? event_queue_buffer_event_recv_time_V_q0 : earliest_time_V_fu_40);

assign trunc_ln209_fu_160_p1 = i_V_1_reg_222_pp0_iter1_reg[1:0];

assign zext_ln209_fu_163_p1 = trunc_ln209_fu_160_p1;

assign zext_ln587_fu_125_p1 = event_queue_lp_oldest_unissued_V_q0;

endmodule //lpcore_top_event_queue_top_0_Pipeline_VITIS_LOOP_205_1
