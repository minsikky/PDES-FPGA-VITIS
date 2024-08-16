// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module simulation_top_event_processor_top_1_s (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        event_processor_input_stream_dout,
        event_processor_input_stream_num_data_valid,
        event_processor_input_stream_fifo_cap,
        event_processor_input_stream_empty_n,
        event_processor_input_stream_read,
        state_buffer_input_stream_din,
        state_buffer_input_stream_num_data_valid,
        state_buffer_input_stream_fifo_cap,
        state_buffer_input_stream_full_n,
        state_buffer_input_stream_write,
        lpcore_output_event_stream_1_din,
        lpcore_output_event_stream_1_full_n,
        lpcore_output_event_stream_1_write,
        cancellation_unit_input_stream_din,
        cancellation_unit_input_stream_num_data_valid,
        cancellation_unit_input_stream_fifo_cap,
        cancellation_unit_input_stream_full_n,
        cancellation_unit_input_stream_write
);

parameter    ap_ST_fsm_state1 = 3'd1;
parameter    ap_ST_fsm_state2 = 3'd2;
parameter    ap_ST_fsm_state3 = 3'd4;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [208:0] event_processor_input_stream_dout;
input  [1:0] event_processor_input_stream_num_data_valid;
input  [1:0] event_processor_input_stream_fifo_cap;
input   event_processor_input_stream_empty_n;
output   event_processor_input_stream_read;
output  [79:0] state_buffer_input_stream_din;
input  [1:0] state_buffer_input_stream_num_data_valid;
input  [1:0] state_buffer_input_stream_fifo_cap;
input   state_buffer_input_stream_full_n;
output   state_buffer_input_stream_write;
output  [128:0] lpcore_output_event_stream_1_din;
input   lpcore_output_event_stream_1_full_n;
output   lpcore_output_event_stream_1_write;
output  [128:0] cancellation_unit_input_stream_din;
input  [1:0] cancellation_unit_input_stream_num_data_valid;
input  [1:0] cancellation_unit_input_stream_fifo_cap;
input   cancellation_unit_input_stream_full_n;
output   cancellation_unit_input_stream_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg event_processor_input_stream_read;
reg state_buffer_input_stream_write;
reg lpcore_output_event_stream_1_write;
reg cancellation_unit_input_stream_write;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [7:0] event_processor_prng_generators_state_V_q0;
reg    event_processor_input_stream_blk_n;
wire   [0:0] tmp_nbreadreq_fu_52_p3;
reg   [0:0] tmp_reg_131;
reg   [15:0] event_receiver_id_V_reg_135;
reg   [0:0] event_is_anti_message_V_reg_140;
reg   [15:0] state_lp_id_V_reg_145;
reg   [31:0] state_rng_state_V_reg_150;
reg   [31:0] event_recv_time_V_reg_155;
wire    grp_process_event_fu_66_ap_start;
wire    grp_process_event_fu_66_ap_done;
wire    grp_process_event_fu_66_ap_idle;
wire    grp_process_event_fu_66_ap_ready;
wire   [3:0] grp_process_event_fu_66_this_prng_generators_address0;
wire    grp_process_event_fu_66_this_prng_generators_ce0;
wire    grp_process_event_fu_66_this_prng_generators_we0;
wire   [7:0] grp_process_event_fu_66_this_prng_generators_d0;
wire   [79:0] grp_process_event_fu_66_state_buffer_input_stream_din;
wire    grp_process_event_fu_66_state_buffer_input_stream_write;
wire   [128:0] grp_process_event_fu_66_lpcore_output_event_stream_1_din;
wire    grp_process_event_fu_66_lpcore_output_event_stream_1_write;
wire   [128:0] grp_process_event_fu_66_cancellation_unit_input_stream_din;
wire    grp_process_event_fu_66_cancellation_unit_input_stream_write;
reg    grp_process_event_fu_66_ap_start_reg;
wire    ap_CS_fsm_state2;
wire    ap_CS_fsm_state3;
reg    ap_block_state1;
reg    ap_block_state3_on_subcall_done;
reg   [2:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
reg    ap_ST_fsm_state3_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 3'd1;
#0 grp_process_event_fu_66_ap_start_reg = 1'b0;
end

simulation_top_event_processor_top_1_s_event_processor_prng_generators_state_V_RAM_AUTO_1R1W #(
    .DataWidth( 8 ),
    .AddressRange( 16 ),
    .AddressWidth( 4 ))
event_processor_prng_generators_state_V_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(grp_process_event_fu_66_this_prng_generators_address0),
    .ce0(grp_process_event_fu_66_this_prng_generators_ce0),
    .we0(grp_process_event_fu_66_this_prng_generators_we0),
    .d0(grp_process_event_fu_66_this_prng_generators_d0),
    .q0(event_processor_prng_generators_state_V_q0)
);

simulation_top_process_event grp_process_event_fu_66(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_process_event_fu_66_ap_start),
    .ap_done(grp_process_event_fu_66_ap_done),
    .ap_idle(grp_process_event_fu_66_ap_idle),
    .ap_ready(grp_process_event_fu_66_ap_ready),
    .this_prng_generators_address0(grp_process_event_fu_66_this_prng_generators_address0),
    .this_prng_generators_ce0(grp_process_event_fu_66_this_prng_generators_ce0),
    .this_prng_generators_we0(grp_process_event_fu_66_this_prng_generators_we0),
    .this_prng_generators_d0(grp_process_event_fu_66_this_prng_generators_d0),
    .this_prng_generators_q0(event_processor_prng_generators_state_V_q0),
    .p_read1(event_recv_time_V_reg_155),
    .p_read2(event_receiver_id_V_reg_135),
    .p_read3(event_is_anti_message_V_reg_140),
    .p_read4(state_lp_id_V_reg_145),
    .p_read6(state_rng_state_V_reg_150),
    .state_buffer_input_stream_din(grp_process_event_fu_66_state_buffer_input_stream_din),
    .state_buffer_input_stream_num_data_valid(2'd0),
    .state_buffer_input_stream_fifo_cap(2'd0),
    .state_buffer_input_stream_full_n(state_buffer_input_stream_full_n),
    .state_buffer_input_stream_write(grp_process_event_fu_66_state_buffer_input_stream_write),
    .lpcore_output_event_stream_1_din(grp_process_event_fu_66_lpcore_output_event_stream_1_din),
    .lpcore_output_event_stream_1_full_n(lpcore_output_event_stream_1_full_n),
    .lpcore_output_event_stream_1_write(grp_process_event_fu_66_lpcore_output_event_stream_1_write),
    .cancellation_unit_input_stream_din(grp_process_event_fu_66_cancellation_unit_input_stream_din),
    .cancellation_unit_input_stream_num_data_valid(2'd0),
    .cancellation_unit_input_stream_fifo_cap(2'd0),
    .cancellation_unit_input_stream_full_n(cancellation_unit_input_stream_full_n),
    .cancellation_unit_input_stream_write(grp_process_event_fu_66_cancellation_unit_input_stream_write)
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
        if ((ap_continue == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((1'b1 == ap_CS_fsm_state3) & (1'b0 == ap_block_state3_on_subcall_done))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_process_event_fu_66_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state2)) begin
            grp_process_event_fu_66_ap_start_reg <= 1'b1;
        end else if ((grp_process_event_fu_66_ap_ready == 1'b1)) begin
            grp_process_event_fu_66_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_nbreadreq_fu_52_p3 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        event_is_anti_message_V_reg_140 <= event_processor_input_stream_dout[32'd128];
        event_receiver_id_V_reg_135 <= {{event_processor_input_stream_dout[127:112]}};
        event_recv_time_V_reg_155 <= {{event_processor_input_stream_dout[63:32]}};
        state_lp_id_V_reg_145 <= {{event_processor_input_stream_dout[144:129]}};
        state_rng_state_V_reg_150 <= {{event_processor_input_stream_dout[208:177]}};
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        tmp_reg_131 <= tmp_nbreadreq_fu_52_p3;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) | (ap_done_reg == 1'b1) | ((tmp_nbreadreq_fu_52_p3 == 1'd1) & (event_processor_input_stream_empty_n == 1'b0)))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

assign ap_ST_fsm_state2_blk = 1'b0;

always @ (*) begin
    if ((1'b1 == ap_block_state3_on_subcall_done)) begin
        ap_ST_fsm_state3_blk = 1'b1;
    end else begin
        ap_ST_fsm_state3_blk = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) & (1'b0 == ap_block_state3_on_subcall_done))) begin
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
    if (((1'b1 == ap_CS_fsm_state3) & (1'b0 == ap_block_state3_on_subcall_done))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_reg_131 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        cancellation_unit_input_stream_write = grp_process_event_fu_66_cancellation_unit_input_stream_write;
    end else begin
        cancellation_unit_input_stream_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (tmp_nbreadreq_fu_52_p3 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        event_processor_input_stream_blk_n = event_processor_input_stream_empty_n;
    end else begin
        event_processor_input_stream_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1) | ((tmp_nbreadreq_fu_52_p3 == 1'd1) & (event_processor_input_stream_empty_n == 1'b0))) & (tmp_nbreadreq_fu_52_p3 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        event_processor_input_stream_read = 1'b1;
    end else begin
        event_processor_input_stream_read = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_reg_131 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        lpcore_output_event_stream_1_write = grp_process_event_fu_66_lpcore_output_event_stream_1_write;
    end else begin
        lpcore_output_event_stream_1_write = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_reg_131 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        state_buffer_input_stream_write = grp_process_event_fu_66_state_buffer_input_stream_write;
    end else begin
        state_buffer_input_stream_write = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1) | ((tmp_nbreadreq_fu_52_p3 == 1'd1) & (event_processor_input_stream_empty_n == 1'b0))) & (tmp_nbreadreq_fu_52_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1) | ((tmp_nbreadreq_fu_52_p3 == 1'd1) & (event_processor_input_stream_empty_n == 1'b0))) & (tmp_nbreadreq_fu_52_p3 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            if (((1'b1 == ap_CS_fsm_state3) & (1'b0 == ap_block_state3_on_subcall_done))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (ap_done_reg == 1'b1) | ((tmp_nbreadreq_fu_52_p3 == 1'd1) & (event_processor_input_stream_empty_n == 1'b0)));
end

always @ (*) begin
    ap_block_state3_on_subcall_done = ((grp_process_event_fu_66_ap_done == 1'b0) & (tmp_reg_131 == 1'd1));
end

assign cancellation_unit_input_stream_din = grp_process_event_fu_66_cancellation_unit_input_stream_din;

assign grp_process_event_fu_66_ap_start = grp_process_event_fu_66_ap_start_reg;

assign lpcore_output_event_stream_1_din = grp_process_event_fu_66_lpcore_output_event_stream_1_din;

assign state_buffer_input_stream_din = grp_process_event_fu_66_state_buffer_input_stream_din;

assign tmp_nbreadreq_fu_52_p3 = event_processor_input_stream_empty_n;

endmodule //simulation_top_event_processor_top_1_s
