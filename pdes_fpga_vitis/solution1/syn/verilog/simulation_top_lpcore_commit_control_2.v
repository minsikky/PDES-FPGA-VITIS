// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module simulation_top_lpcore_commit_control_2 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        lpcore_commit_time_stream_1_dout,
        lpcore_commit_time_stream_1_num_data_valid,
        lpcore_commit_time_stream_1_fifo_cap,
        lpcore_commit_time_stream_1_empty_n,
        lpcore_commit_time_stream_1_read,
        event_queue_commit_time_stream15_din,
        event_queue_commit_time_stream15_num_data_valid,
        event_queue_commit_time_stream15_fifo_cap,
        event_queue_commit_time_stream15_full_n,
        event_queue_commit_time_stream15_write,
        state_buffer_commit_time_stream16_din,
        state_buffer_commit_time_stream16_num_data_valid,
        state_buffer_commit_time_stream16_fifo_cap,
        state_buffer_commit_time_stream16_full_n,
        state_buffer_commit_time_stream16_write,
        cancellation_unit_commit_time_stream17_din,
        cancellation_unit_commit_time_stream17_num_data_valid,
        cancellation_unit_commit_time_stream17_fifo_cap,
        cancellation_unit_commit_time_stream17_full_n,
        cancellation_unit_commit_time_stream17_write
);

parameter    ap_ST_fsm_state1 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [31:0] lpcore_commit_time_stream_1_dout;
input  [1:0] lpcore_commit_time_stream_1_num_data_valid;
input  [1:0] lpcore_commit_time_stream_1_fifo_cap;
input   lpcore_commit_time_stream_1_empty_n;
output   lpcore_commit_time_stream_1_read;
output  [31:0] event_queue_commit_time_stream15_din;
input  [1:0] event_queue_commit_time_stream15_num_data_valid;
input  [1:0] event_queue_commit_time_stream15_fifo_cap;
input   event_queue_commit_time_stream15_full_n;
output   event_queue_commit_time_stream15_write;
output  [31:0] state_buffer_commit_time_stream16_din;
input  [1:0] state_buffer_commit_time_stream16_num_data_valid;
input  [1:0] state_buffer_commit_time_stream16_fifo_cap;
input   state_buffer_commit_time_stream16_full_n;
output   state_buffer_commit_time_stream16_write;
output  [31:0] cancellation_unit_commit_time_stream17_din;
input  [1:0] cancellation_unit_commit_time_stream17_num_data_valid;
input  [1:0] cancellation_unit_commit_time_stream17_fifo_cap;
input   cancellation_unit_commit_time_stream17_full_n;
output   cancellation_unit_commit_time_stream17_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg lpcore_commit_time_stream_1_read;
reg event_queue_commit_time_stream15_write;
reg state_buffer_commit_time_stream16_write;
reg cancellation_unit_commit_time_stream17_write;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    lpcore_commit_time_stream_1_blk_n;
reg    event_queue_commit_time_stream15_blk_n;
reg    state_buffer_commit_time_stream16_blk_n;
reg    cancellation_unit_commit_time_stream17_blk_n;
reg    ap_block_state1;
reg   [0:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 1'd1;
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
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if ((~((ap_start == 1'b0) | (cancellation_unit_commit_time_stream17_full_n == 1'b0) | (state_buffer_commit_time_stream16_full_n == 1'b0) | (event_queue_commit_time_stream15_full_n == 1'b0) | (lpcore_commit_time_stream_1_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) | (cancellation_unit_commit_time_stream17_full_n == 1'b0) | (state_buffer_commit_time_stream16_full_n == 1'b0) | (event_queue_commit_time_stream15_full_n == 1'b0) | (lpcore_commit_time_stream_1_empty_n == 1'b0) | (ap_done_reg == 1'b1))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (cancellation_unit_commit_time_stream17_full_n == 1'b0) | (state_buffer_commit_time_stream16_full_n == 1'b0) | (event_queue_commit_time_stream15_full_n == 1'b0) | (lpcore_commit_time_stream_1_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (cancellation_unit_commit_time_stream17_full_n == 1'b0) | (state_buffer_commit_time_stream16_full_n == 1'b0) | (event_queue_commit_time_stream15_full_n == 1'b0) | (lpcore_commit_time_stream_1_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        cancellation_unit_commit_time_stream17_blk_n = cancellation_unit_commit_time_stream17_full_n;
    end else begin
        cancellation_unit_commit_time_stream17_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (cancellation_unit_commit_time_stream17_full_n == 1'b0) | (state_buffer_commit_time_stream16_full_n == 1'b0) | (event_queue_commit_time_stream15_full_n == 1'b0) | (lpcore_commit_time_stream_1_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        cancellation_unit_commit_time_stream17_write = 1'b1;
    end else begin
        cancellation_unit_commit_time_stream17_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        event_queue_commit_time_stream15_blk_n = event_queue_commit_time_stream15_full_n;
    end else begin
        event_queue_commit_time_stream15_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (cancellation_unit_commit_time_stream17_full_n == 1'b0) | (state_buffer_commit_time_stream16_full_n == 1'b0) | (event_queue_commit_time_stream15_full_n == 1'b0) | (lpcore_commit_time_stream_1_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        event_queue_commit_time_stream15_write = 1'b1;
    end else begin
        event_queue_commit_time_stream15_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        lpcore_commit_time_stream_1_blk_n = lpcore_commit_time_stream_1_empty_n;
    end else begin
        lpcore_commit_time_stream_1_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (cancellation_unit_commit_time_stream17_full_n == 1'b0) | (state_buffer_commit_time_stream16_full_n == 1'b0) | (event_queue_commit_time_stream15_full_n == 1'b0) | (lpcore_commit_time_stream_1_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        lpcore_commit_time_stream_1_read = 1'b1;
    end else begin
        lpcore_commit_time_stream_1_read = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        state_buffer_commit_time_stream16_blk_n = state_buffer_commit_time_stream16_full_n;
    end else begin
        state_buffer_commit_time_stream16_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (cancellation_unit_commit_time_stream17_full_n == 1'b0) | (state_buffer_commit_time_stream16_full_n == 1'b0) | (event_queue_commit_time_stream15_full_n == 1'b0) | (lpcore_commit_time_stream_1_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        state_buffer_commit_time_stream16_write = 1'b1;
    end else begin
        state_buffer_commit_time_stream16_write = 1'b0;
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

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (cancellation_unit_commit_time_stream17_full_n == 1'b0) | (state_buffer_commit_time_stream16_full_n == 1'b0) | (event_queue_commit_time_stream15_full_n == 1'b0) | (lpcore_commit_time_stream_1_empty_n == 1'b0) | (ap_done_reg == 1'b1));
end

assign cancellation_unit_commit_time_stream17_din = lpcore_commit_time_stream_1_dout;

assign event_queue_commit_time_stream15_din = lpcore_commit_time_stream_1_dout;

assign state_buffer_commit_time_stream16_din = lpcore_commit_time_stream_1_dout;

endmodule //simulation_top_lpcore_commit_control_2
