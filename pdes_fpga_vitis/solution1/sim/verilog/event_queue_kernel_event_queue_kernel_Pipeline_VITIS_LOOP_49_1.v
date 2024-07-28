// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module event_queue_kernel_event_queue_kernel_Pipeline_VITIS_LOOP_49_1 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        add_ln887,
        zext_ln49,
        temp_recv_time_V_1,
        index_V_2_out,
        index_V_2_out_ap_vld,
        g_event_queue_heap_send_time_V_address0,
        g_event_queue_heap_send_time_V_ce0,
        g_event_queue_heap_send_time_V_we0,
        g_event_queue_heap_send_time_V_d0,
        g_event_queue_heap_send_time_V_q0,
        g_event_queue_heap_data_V_address0,
        g_event_queue_heap_data_V_ce0,
        g_event_queue_heap_data_V_we0,
        g_event_queue_heap_data_V_d0,
        g_event_queue_heap_data_V_q0,
        g_event_queue_heap_sender_id_V_address0,
        g_event_queue_heap_sender_id_V_ce0,
        g_event_queue_heap_sender_id_V_we0,
        g_event_queue_heap_sender_id_V_d0,
        g_event_queue_heap_sender_id_V_q0,
        g_event_queue_heap_receiver_id_V_address0,
        g_event_queue_heap_receiver_id_V_ce0,
        g_event_queue_heap_receiver_id_V_we0,
        g_event_queue_heap_receiver_id_V_d0,
        g_event_queue_heap_receiver_id_V_q0,
        g_event_queue_heap_is_anti_message_V_address0,
        g_event_queue_heap_is_anti_message_V_ce0,
        g_event_queue_heap_is_anti_message_V_we0,
        g_event_queue_heap_is_anti_message_V_d0,
        g_event_queue_heap_is_anti_message_V_q0,
        g_event_queue_heap_recv_time_V_address0,
        g_event_queue_heap_recv_time_V_ce0,
        g_event_queue_heap_recv_time_V_we0,
        g_event_queue_heap_recv_time_V_d0,
        g_event_queue_heap_recv_time_V_q0,
        g_event_queue_heap_recv_time_V_address1,
        g_event_queue_heap_recv_time_V_ce1,
        g_event_queue_heap_recv_time_V_q1
);

parameter    ap_ST_fsm_state1 = 6'd1;
parameter    ap_ST_fsm_pp0_stage0 = 6'd2;
parameter    ap_ST_fsm_pp0_stage1 = 6'd4;
parameter    ap_ST_fsm_pp0_stage2 = 6'd8;
parameter    ap_ST_fsm_state7 = 6'd16;
parameter    ap_ST_fsm_state8 = 6'd32;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [15:0] add_ln887;
input  [15:0] zext_ln49;
input  [31:0] temp_recv_time_V_1;
output  [6:0] index_V_2_out;
output   index_V_2_out_ap_vld;
output  [6:0] g_event_queue_heap_send_time_V_address0;
output   g_event_queue_heap_send_time_V_ce0;
output   g_event_queue_heap_send_time_V_we0;
output  [31:0] g_event_queue_heap_send_time_V_d0;
input  [31:0] g_event_queue_heap_send_time_V_q0;
output  [6:0] g_event_queue_heap_data_V_address0;
output   g_event_queue_heap_data_V_ce0;
output   g_event_queue_heap_data_V_we0;
output  [31:0] g_event_queue_heap_data_V_d0;
input  [31:0] g_event_queue_heap_data_V_q0;
output  [6:0] g_event_queue_heap_sender_id_V_address0;
output   g_event_queue_heap_sender_id_V_ce0;
output   g_event_queue_heap_sender_id_V_we0;
output  [15:0] g_event_queue_heap_sender_id_V_d0;
input  [15:0] g_event_queue_heap_sender_id_V_q0;
output  [6:0] g_event_queue_heap_receiver_id_V_address0;
output   g_event_queue_heap_receiver_id_V_ce0;
output   g_event_queue_heap_receiver_id_V_we0;
output  [15:0] g_event_queue_heap_receiver_id_V_d0;
input  [15:0] g_event_queue_heap_receiver_id_V_q0;
output  [6:0] g_event_queue_heap_is_anti_message_V_address0;
output   g_event_queue_heap_is_anti_message_V_ce0;
output   g_event_queue_heap_is_anti_message_V_we0;
output  [0:0] g_event_queue_heap_is_anti_message_V_d0;
input  [0:0] g_event_queue_heap_is_anti_message_V_q0;
output  [6:0] g_event_queue_heap_recv_time_V_address0;
output   g_event_queue_heap_recv_time_V_ce0;
output   g_event_queue_heap_recv_time_V_we0;
output  [31:0] g_event_queue_heap_recv_time_V_d0;
input  [31:0] g_event_queue_heap_recv_time_V_q0;
output  [6:0] g_event_queue_heap_recv_time_V_address1;
output   g_event_queue_heap_recv_time_V_ce1;
input  [31:0] g_event_queue_heap_recv_time_V_q1;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg index_V_2_out_ap_vld;
reg[6:0] g_event_queue_heap_send_time_V_address0;
reg g_event_queue_heap_send_time_V_ce0;
reg g_event_queue_heap_send_time_V_we0;
reg[6:0] g_event_queue_heap_data_V_address0;
reg g_event_queue_heap_data_V_ce0;
reg g_event_queue_heap_data_V_we0;
reg[6:0] g_event_queue_heap_sender_id_V_address0;
reg g_event_queue_heap_sender_id_V_ce0;
reg g_event_queue_heap_sender_id_V_we0;
reg[6:0] g_event_queue_heap_receiver_id_V_address0;
reg g_event_queue_heap_receiver_id_V_ce0;
reg g_event_queue_heap_receiver_id_V_we0;
reg[6:0] g_event_queue_heap_is_anti_message_V_address0;
reg g_event_queue_heap_is_anti_message_V_ce0;
reg g_event_queue_heap_is_anti_message_V_we0;
reg[6:0] g_event_queue_heap_recv_time_V_address0;
reg g_event_queue_heap_recv_time_V_ce0;
reg g_event_queue_heap_recv_time_V_we0;
reg[6:0] g_event_queue_heap_recv_time_V_address1;
reg g_event_queue_heap_recv_time_V_ce1;

(* fsm_encoding = "none" *) reg   [5:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [16:0] zext_ln49_cast_fu_287_p1;
reg   [16:0] zext_ln49_cast_reg_765;
reg   [14:0] index_V_1_reg_770;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state5_pp0_stage0_iter1;
wire    ap_block_pp0_stage0_11001;
wire   [6:0] empty_fu_359_p1;
reg   [6:0] empty_reg_776;
reg    ap_enable_reg_pp0_iter0;
wire   [0:0] icmp_ln1077_fu_377_p2;
reg   [0:0] icmp_ln1077_reg_781;
wire   [0:0] icmp_ln1073_fu_392_p2;
reg   [0:0] icmp_ln1073_reg_785;
wire   [0:0] addr_cmp23_fu_407_p2;
reg   [0:0] addr_cmp23_reg_795;
wire   [0:0] addr_cmp27_fu_416_p2;
reg   [0:0] addr_cmp27_reg_805;
wire   [14:0] index_V_2_fu_470_p3;
reg   [14:0] index_V_2_reg_810;
wire    ap_CS_fsm_pp0_stage1;
wire    ap_block_state3_pp0_stage1_iter0;
wire    ap_block_state6_pp0_stage1_iter1;
wire    ap_block_pp0_stage1_11001;
wire   [63:0] zext_ln587_2_fu_477_p1;
reg   [63:0] zext_ln587_2_reg_815;
wire   [31:0] reuse_select32_fu_487_p3;
reg   [31:0] reuse_select32_reg_835;
wire    ap_CS_fsm_pp0_stage2;
wire    ap_block_state4_pp0_stage2_iter0;
wire    ap_block_pp0_stage2_11001;
wire   [63:0] zext_ln587_3_fu_500_p1;
reg   [63:0] zext_ln587_3_reg_843;
wire   [0:0] icmp_ln1073_2_fu_495_p2;
wire   [0:0] addr_cmp37_fu_506_p2;
reg   [0:0] addr_cmp37_reg_858;
wire   [0:0] addr_cmp17_fu_514_p2;
reg   [0:0] addr_cmp17_reg_868;
wire   [0:0] addr_cmp11_fu_522_p2;
reg   [0:0] addr_cmp11_reg_878;
wire   [0:0] addr_cmp5_fu_530_p2;
reg   [0:0] addr_cmp5_reg_888;
wire   [0:0] addr_cmp_fu_538_p2;
reg   [0:0] addr_cmp_reg_898;
wire    ap_block_pp0_stage2_subdone;
reg    ap_predicate_tran4to7_state4;
reg    ap_condition_pp0_exit_iter0_state4;
reg    ap_enable_reg_pp0_iter1;
wire   [63:0] zext_ln587_fu_397_p1;
wire    ap_block_pp0_stage0;
wire   [63:0] zext_ln587_1_fu_402_p1;
wire    ap_block_pp0_stage1;
wire    ap_block_pp0_stage2;
reg   [63:0] reuse_addr_reg34_fu_58;
reg   [31:0] reuse_reg33_fu_62;
wire   [31:0] reuse_select38_fu_585_p3;
reg   [63:0] reuse_addr_reg20_fu_66;
reg   [31:0] reuse_reg19_fu_70;
reg   [63:0] reuse_addr_reg14_fu_74;
reg   [31:0] reuse_reg13_fu_78;
wire   [31:0] reuse_select18_fu_596_p3;
reg   [63:0] reuse_addr_reg8_fu_82;
reg   [15:0] reuse_reg7_fu_86;
wire   [15:0] reuse_select12_fu_607_p3;
reg   [63:0] reuse_addr_reg2_fu_90;
reg   [15:0] reuse_reg1_fu_94;
wire   [15:0] reuse_select6_fu_618_p3;
reg   [63:0] reuse_addr_reg_fu_98;
reg   [0:0] reuse_reg_fu_102;
wire   [0:0] reuse_select_fu_629_p3;
reg   [14:0] index_V_fu_106;
wire    ap_CS_fsm_state7;
wire    ap_CS_fsm_state8;
wire   [15:0] shl_ln_fu_363_p3;
wire   [15:0] child_V_3_fu_371_p2;
wire   [16:0] zext_ln1541_fu_382_p1;
wire   [16:0] ret_V_fu_386_p2;
wire   [14:0] shl_ln232_fu_422_p2;
wire   [31:0] reuse_select24_fu_433_p3;
wire   [31:0] reuse_select28_fu_443_p3;
wire   [14:0] or_ln50_fu_427_p2;
wire   [0:0] icmp_ln1073_1_fu_450_p2;
wire   [14:0] child_V_fu_456_p2;
wire   [14:0] select_ln52_fu_462_p3;
wire   [0:0] addr_cmp31_fu_482_p2;
reg   [5:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state7_blk;
wire    ap_ST_fsm_state8_blk;
wire    ap_block_pp0_stage0_subdone;
wire    ap_block_pp0_stage1_subdone;
reg    ap_idle_pp0;
wire    ap_enable_pp0;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 6'd1;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage2_subdone) & (1'b1 == ap_condition_pp0_exit_iter0_state4) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage2_subdone) & (1'b1 == ap_condition_pp0_exit_iter0_state4) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
            ap_enable_reg_pp0_iter1 <= (1'b1 ^ ap_condition_pp0_exit_iter0_state4);
        end else if (((1'b0 == ap_block_pp0_stage2_subdone) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        index_V_fu_106 <= 15'd0;
    end else if (((1'b0 == ap_block_pp0_stage2_11001) & (1'b1 == ap_CS_fsm_pp0_stage2) & (icmp_ln1073_2_fu_495_p2 == 1'd1) & (icmp_ln1077_reg_781 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        index_V_fu_106 <= index_V_2_reg_810;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        reuse_addr_reg14_fu_74 <= 64'd18446744073709551615;
    end else if (((1'b0 == ap_block_pp0_stage2_11001) & (1'b1 == ap_CS_fsm_pp0_stage2) & (icmp_ln1073_2_fu_495_p2 == 1'd1) & (icmp_ln1077_reg_781 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        reuse_addr_reg14_fu_74 <= zext_ln587_3_fu_500_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        reuse_addr_reg20_fu_66 <= 64'd18446744073709551615;
    end else if (((1'b0 == ap_block_pp0_stage2_11001) & (1'b1 == ap_CS_fsm_pp0_stage2) & (icmp_ln1073_2_fu_495_p2 == 1'd1) & (icmp_ln1077_reg_781 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        reuse_addr_reg20_fu_66 <= zext_ln587_3_fu_500_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        reuse_addr_reg2_fu_90 <= 64'd18446744073709551615;
    end else if (((1'b0 == ap_block_pp0_stage2_11001) & (1'b1 == ap_CS_fsm_pp0_stage2) & (icmp_ln1073_2_fu_495_p2 == 1'd1) & (icmp_ln1077_reg_781 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        reuse_addr_reg2_fu_90 <= zext_ln587_3_fu_500_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        reuse_addr_reg34_fu_58 <= 64'd18446744073709551615;
    end else if (((1'b0 == ap_block_pp0_stage2_11001) & (1'b1 == ap_CS_fsm_pp0_stage2) & (icmp_ln1073_2_fu_495_p2 == 1'd1) & (icmp_ln1077_reg_781 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        reuse_addr_reg34_fu_58 <= zext_ln587_3_fu_500_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        reuse_addr_reg8_fu_82 <= 64'd18446744073709551615;
    end else if (((1'b0 == ap_block_pp0_stage2_11001) & (1'b1 == ap_CS_fsm_pp0_stage2) & (icmp_ln1073_2_fu_495_p2 == 1'd1) & (icmp_ln1077_reg_781 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        reuse_addr_reg8_fu_82 <= zext_ln587_3_fu_500_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        reuse_addr_reg_fu_98 <= 64'd18446744073709551615;
    end else if (((1'b0 == ap_block_pp0_stage2_11001) & (1'b1 == ap_CS_fsm_pp0_stage2) & (icmp_ln1073_2_fu_495_p2 == 1'd1) & (icmp_ln1077_reg_781 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        reuse_addr_reg_fu_98 <= zext_ln587_3_fu_500_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        reuse_reg13_fu_78 <= 32'd0;
    end else if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        reuse_reg13_fu_78 <= reuse_select18_fu_596_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        reuse_reg19_fu_70 <= 32'd0;
    end else if (((1'b0 == ap_block_pp0_stage2_11001) & (1'b1 == ap_CS_fsm_pp0_stage2) & (icmp_ln1073_2_fu_495_p2 == 1'd1) & (icmp_ln1077_reg_781 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        reuse_reg19_fu_70 <= reuse_select32_fu_487_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        reuse_reg1_fu_94 <= 16'd0;
    end else if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        reuse_reg1_fu_94 <= reuse_select6_fu_618_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        reuse_reg33_fu_62 <= 32'd0;
    end else if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        reuse_reg33_fu_62 <= reuse_select38_fu_585_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        reuse_reg7_fu_86 <= 16'd0;
    end else if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        reuse_reg7_fu_86 <= reuse_select12_fu_607_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        reuse_reg_fu_102 <= 1'd0;
    end else if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        reuse_reg_fu_102 <= reuse_select_fu_629_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage2_11001) & (1'b1 == ap_CS_fsm_pp0_stage2) & (icmp_ln1073_2_fu_495_p2 == 1'd1) & (icmp_ln1077_reg_781 == 1'd1))) begin
        addr_cmp11_reg_878 <= addr_cmp11_fu_522_p2;
        addr_cmp17_reg_868 <= addr_cmp17_fu_514_p2;
        addr_cmp37_reg_858 <= addr_cmp37_fu_506_p2;
        addr_cmp5_reg_888 <= addr_cmp5_fu_530_p2;
        addr_cmp_reg_898 <= addr_cmp_fu_538_p2;
        zext_ln587_3_reg_843[14 : 0] <= zext_ln587_3_fu_500_p1[14 : 0];
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln1077_fu_377_p2 == 1'd1))) begin
        addr_cmp23_reg_795 <= addr_cmp23_fu_407_p2;
        addr_cmp27_reg_805 <= addr_cmp27_fu_416_p2;
        icmp_ln1073_reg_785 <= icmp_ln1073_fu_392_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        empty_reg_776 <= empty_fu_359_p1;
        icmp_ln1077_reg_781 <= icmp_ln1077_fu_377_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        index_V_1_reg_770 <= index_V_fu_106;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1) & (icmp_ln1077_reg_781 == 1'd1))) begin
        index_V_2_reg_810 <= index_V_2_fu_470_p3;
        zext_ln587_2_reg_815[14 : 0] <= zext_ln587_2_fu_477_p1[14 : 0];
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage2_11001) & (1'b1 == ap_CS_fsm_pp0_stage2) & (icmp_ln1077_reg_781 == 1'd1))) begin
        reuse_select32_reg_835 <= reuse_select32_fu_487_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        zext_ln49_cast_reg_765[15 : 0] <= zext_ln49_cast_fu_287_p1[15 : 0];
    end
end

always @ (*) begin
    if ((ap_start == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

assign ap_ST_fsm_state7_blk = 1'b0;

assign ap_ST_fsm_state8_blk = 1'b0;

always @ (*) begin
    if (((ap_predicate_tran4to7_state4 == 1'b1) | (icmp_ln1077_reg_781 == 1'd0))) begin
        ap_condition_pp0_exit_iter0_state4 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state4 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state7) | ((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0))) begin
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
    if ((1'b1 == ap_CS_fsm_state7)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        g_event_queue_heap_data_V_address0 = zext_ln587_3_reg_843;
    end else if (((1'b0 == ap_block_pp0_stage2) & (1'b1 == ap_CS_fsm_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        g_event_queue_heap_data_V_address0 = zext_ln587_2_reg_815;
    end else begin
        g_event_queue_heap_data_V_address0 = 'bx;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage2_11001) & (1'b1 == ap_CS_fsm_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1)))) begin
        g_event_queue_heap_data_V_ce0 = 1'b1;
    end else begin
        g_event_queue_heap_data_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        g_event_queue_heap_data_V_we0 = 1'b1;
    end else begin
        g_event_queue_heap_data_V_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        g_event_queue_heap_is_anti_message_V_address0 = zext_ln587_3_reg_843;
    end else if (((1'b0 == ap_block_pp0_stage2) & (1'b1 == ap_CS_fsm_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        g_event_queue_heap_is_anti_message_V_address0 = zext_ln587_2_reg_815;
    end else begin
        g_event_queue_heap_is_anti_message_V_address0 = 'bx;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage2_11001) & (1'b1 == ap_CS_fsm_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1)))) begin
        g_event_queue_heap_is_anti_message_V_ce0 = 1'b1;
    end else begin
        g_event_queue_heap_is_anti_message_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        g_event_queue_heap_is_anti_message_V_we0 = 1'b1;
    end else begin
        g_event_queue_heap_is_anti_message_V_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        g_event_queue_heap_receiver_id_V_address0 = zext_ln587_3_reg_843;
    end else if (((1'b0 == ap_block_pp0_stage2) & (1'b1 == ap_CS_fsm_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        g_event_queue_heap_receiver_id_V_address0 = zext_ln587_2_reg_815;
    end else begin
        g_event_queue_heap_receiver_id_V_address0 = 'bx;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage2_11001) & (1'b1 == ap_CS_fsm_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1)))) begin
        g_event_queue_heap_receiver_id_V_ce0 = 1'b1;
    end else begin
        g_event_queue_heap_receiver_id_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        g_event_queue_heap_receiver_id_V_we0 = 1'b1;
    end else begin
        g_event_queue_heap_receiver_id_V_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        g_event_queue_heap_recv_time_V_address0 = zext_ln587_3_reg_843;
    end else if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        g_event_queue_heap_recv_time_V_address0 = zext_ln587_1_fu_402_p1;
    end else begin
        g_event_queue_heap_recv_time_V_address0 = 'bx;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter0 == 1'b1)) begin
        if (((1'b0 == ap_block_pp0_stage1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            g_event_queue_heap_recv_time_V_address1 = zext_ln587_2_fu_477_p1;
        end else if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            g_event_queue_heap_recv_time_V_address1 = zext_ln587_fu_397_p1;
        end else begin
            g_event_queue_heap_recv_time_V_address1 = 'bx;
        end
    end else begin
        g_event_queue_heap_recv_time_V_address1 = 'bx;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1)))) begin
        g_event_queue_heap_recv_time_V_ce0 = 1'b1;
    end else begin
        g_event_queue_heap_recv_time_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1)))) begin
        g_event_queue_heap_recv_time_V_ce1 = 1'b1;
    end else begin
        g_event_queue_heap_recv_time_V_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        g_event_queue_heap_recv_time_V_we0 = 1'b1;
    end else begin
        g_event_queue_heap_recv_time_V_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        g_event_queue_heap_send_time_V_address0 = zext_ln587_3_reg_843;
    end else if (((1'b0 == ap_block_pp0_stage2) & (1'b1 == ap_CS_fsm_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        g_event_queue_heap_send_time_V_address0 = zext_ln587_2_reg_815;
    end else begin
        g_event_queue_heap_send_time_V_address0 = 'bx;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage2_11001) & (1'b1 == ap_CS_fsm_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1)))) begin
        g_event_queue_heap_send_time_V_ce0 = 1'b1;
    end else begin
        g_event_queue_heap_send_time_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        g_event_queue_heap_send_time_V_we0 = 1'b1;
    end else begin
        g_event_queue_heap_send_time_V_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        g_event_queue_heap_sender_id_V_address0 = zext_ln587_3_reg_843;
    end else if (((1'b0 == ap_block_pp0_stage2) & (1'b1 == ap_CS_fsm_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        g_event_queue_heap_sender_id_V_address0 = zext_ln587_2_reg_815;
    end else begin
        g_event_queue_heap_sender_id_V_address0 = 'bx;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage2_11001) & (1'b1 == ap_CS_fsm_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1)))) begin
        g_event_queue_heap_sender_id_V_ce0 = 1'b1;
    end else begin
        g_event_queue_heap_sender_id_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        g_event_queue_heap_sender_id_V_we0 = 1'b1;
    end else begin
        g_event_queue_heap_sender_id_V_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state8) | ((1'b1 == ap_CS_fsm_state7) & (icmp_ln1077_reg_781 == 1'd1)))) begin
        index_V_2_out_ap_vld = 1'b1;
    end else begin
        index_V_2_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_pp0_stage0 : begin
            if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
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
            if ((~(((1'b0 == ap_block_pp0_stage2_subdone) & (icmp_ln1077_reg_781 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((1'b0 == ap_block_pp0_stage2_subdone) & (ap_predicate_tran4to7_state4 == 1'b1) & (ap_enable_reg_pp0_iter0 == 1'b1))) & (1'b0 == ap_block_pp0_stage2_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if (((1'b0 == ap_block_pp0_stage2_subdone) & (icmp_ln1077_reg_781 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end else if (((1'b0 == ap_block_pp0_stage2_subdone) & (ap_predicate_tran4to7_state4 == 1'b1) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage2;
            end
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state7;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign addr_cmp11_fu_522_p2 = ((reuse_addr_reg8_fu_82 == zext_ln587_2_reg_815) ? 1'b1 : 1'b0);

assign addr_cmp17_fu_514_p2 = ((reuse_addr_reg14_fu_74 == zext_ln587_2_reg_815) ? 1'b1 : 1'b0);

assign addr_cmp23_fu_407_p2 = ((reuse_addr_reg20_fu_66 == zext_ln587_fu_397_p1) ? 1'b1 : 1'b0);

assign addr_cmp27_fu_416_p2 = ((reuse_addr_reg20_fu_66 == zext_ln587_1_fu_402_p1) ? 1'b1 : 1'b0);

assign addr_cmp31_fu_482_p2 = ((reuse_addr_reg20_fu_66 == zext_ln587_2_reg_815) ? 1'b1 : 1'b0);

assign addr_cmp37_fu_506_p2 = ((reuse_addr_reg34_fu_58 == zext_ln587_2_reg_815) ? 1'b1 : 1'b0);

assign addr_cmp5_fu_530_p2 = ((reuse_addr_reg2_fu_90 == zext_ln587_2_reg_815) ? 1'b1 : 1'b0);

assign addr_cmp_fu_538_p2 = ((reuse_addr_reg_fu_98 == zext_ln587_2_reg_815) ? 1'b1 : 1'b0);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_pp0_stage1 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_pp0_stage2 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd5];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage2 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage2_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage2_subdone = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage1_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage2_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state6_pp0_stage1_iter1 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

always @ (*) begin
    ap_predicate_tran4to7_state4 = ((icmp_ln1073_2_fu_495_p2 == 1'd0) & (icmp_ln1077_reg_781 == 1'd1));
end

assign child_V_3_fu_371_p2 = (shl_ln_fu_363_p3 | 16'd1);

assign child_V_fu_456_p2 = (or_ln50_fu_427_p2 + 15'd1);

assign empty_fu_359_p1 = index_V_fu_106[6:0];

assign g_event_queue_heap_data_V_d0 = ((addr_cmp17_reg_868[0:0] == 1'b1) ? reuse_reg13_fu_78 : g_event_queue_heap_data_V_q0);

assign g_event_queue_heap_is_anti_message_V_d0 = ((addr_cmp_reg_898[0:0] == 1'b1) ? reuse_reg_fu_102 : g_event_queue_heap_is_anti_message_V_q0);

assign g_event_queue_heap_receiver_id_V_d0 = ((addr_cmp5_reg_888[0:0] == 1'b1) ? reuse_reg1_fu_94 : g_event_queue_heap_receiver_id_V_q0);

assign g_event_queue_heap_recv_time_V_d0 = reuse_select32_reg_835;

assign g_event_queue_heap_send_time_V_d0 = ((addr_cmp37_reg_858[0:0] == 1'b1) ? reuse_reg33_fu_62 : g_event_queue_heap_send_time_V_q0);

assign g_event_queue_heap_sender_id_V_d0 = ((addr_cmp11_reg_878[0:0] == 1'b1) ? reuse_reg7_fu_86 : g_event_queue_heap_sender_id_V_q0);

assign icmp_ln1073_1_fu_450_p2 = (($signed(reuse_select24_fu_433_p3) < $signed(reuse_select28_fu_443_p3)) ? 1'b1 : 1'b0);

assign icmp_ln1073_2_fu_495_p2 = (($signed(reuse_select32_fu_487_p3) < $signed(temp_recv_time_V_1)) ? 1'b1 : 1'b0);

assign icmp_ln1073_fu_392_p2 = ((ret_V_fu_386_p2 < zext_ln49_cast_reg_765) ? 1'b1 : 1'b0);

assign icmp_ln1077_fu_377_p2 = ((child_V_3_fu_371_p2 < add_ln887) ? 1'b1 : 1'b0);

assign index_V_2_fu_470_p3 = ((icmp_ln1073_reg_785[0:0] == 1'b1) ? select_ln52_fu_462_p3 : or_ln50_fu_427_p2);

assign index_V_2_out = empty_reg_776;

assign or_ln50_fu_427_p2 = (shl_ln232_fu_422_p2 | 15'd1);

assign ret_V_fu_386_p2 = (zext_ln1541_fu_382_p1 + 17'd1);

assign reuse_select12_fu_607_p3 = ((addr_cmp11_reg_878[0:0] == 1'b1) ? reuse_reg7_fu_86 : g_event_queue_heap_sender_id_V_q0);

assign reuse_select18_fu_596_p3 = ((addr_cmp17_reg_868[0:0] == 1'b1) ? reuse_reg13_fu_78 : g_event_queue_heap_data_V_q0);

assign reuse_select24_fu_433_p3 = ((addr_cmp23_reg_795[0:0] == 1'b1) ? reuse_reg19_fu_70 : g_event_queue_heap_recv_time_V_q1);

assign reuse_select28_fu_443_p3 = ((addr_cmp27_reg_805[0:0] == 1'b1) ? reuse_reg19_fu_70 : g_event_queue_heap_recv_time_V_q0);

assign reuse_select32_fu_487_p3 = ((addr_cmp31_fu_482_p2[0:0] == 1'b1) ? reuse_reg19_fu_70 : g_event_queue_heap_recv_time_V_q1);

assign reuse_select38_fu_585_p3 = ((addr_cmp37_reg_858[0:0] == 1'b1) ? reuse_reg33_fu_62 : g_event_queue_heap_send_time_V_q0);

assign reuse_select6_fu_618_p3 = ((addr_cmp5_reg_888[0:0] == 1'b1) ? reuse_reg1_fu_94 : g_event_queue_heap_receiver_id_V_q0);

assign reuse_select_fu_629_p3 = ((addr_cmp_reg_898[0:0] == 1'b1) ? reuse_reg_fu_102 : g_event_queue_heap_is_anti_message_V_q0);

assign select_ln52_fu_462_p3 = ((icmp_ln1073_1_fu_450_p2[0:0] == 1'b1) ? child_V_fu_456_p2 : or_ln50_fu_427_p2);

assign shl_ln232_fu_422_p2 = index_V_1_reg_770 << 15'd1;

assign shl_ln_fu_363_p3 = {{index_V_fu_106}, {1'd0}};

assign zext_ln1541_fu_382_p1 = child_V_3_fu_371_p2;

assign zext_ln49_cast_fu_287_p1 = zext_ln49;

assign zext_ln587_1_fu_402_p1 = child_V_3_fu_371_p2;

assign zext_ln587_2_fu_477_p1 = index_V_2_fu_470_p3;

assign zext_ln587_3_fu_500_p1 = index_V_1_reg_770;

assign zext_ln587_fu_397_p1 = ret_V_fu_386_p2;

always @ (posedge ap_clk) begin
    zext_ln49_cast_reg_765[16] <= 1'b0;
    zext_ln587_2_reg_815[63:15] <= 49'b0000000000000000000000000000000000000000000000000;
    zext_ln587_3_reg_843[63:15] <= 49'b0000000000000000000000000000000000000000000000000;
end

endmodule //event_queue_kernel_event_queue_kernel_Pipeline_VITIS_LOOP_49_1
