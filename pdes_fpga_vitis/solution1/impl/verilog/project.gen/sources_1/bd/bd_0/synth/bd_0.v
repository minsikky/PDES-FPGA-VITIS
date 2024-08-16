//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
//Date        : Thu Aug 15 18:01:14 2024
//Host        : i1z running 64-bit Red Hat Enterprise Linux Server release 7.9 (Maipo)
//Command     : generate_target bd_0.bd
//Design      : bd_0
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "bd_0,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=bd_0,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=1,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "bd_0.hwdef" *) 
module bd_0
   (ap_clk,
    ap_rst,
    lpcore_anti_message_stream_0_empty_n,
    lpcore_anti_message_stream_0_rd_data,
    lpcore_anti_message_stream_0_rd_en,
    lpcore_anti_message_stream_1_empty_n,
    lpcore_anti_message_stream_1_rd_data,
    lpcore_anti_message_stream_1_rd_en,
    lpcore_cancellation_unit_output_stream_0_full_n,
    lpcore_cancellation_unit_output_stream_0_wr_data,
    lpcore_cancellation_unit_output_stream_0_wr_en,
    lpcore_cancellation_unit_output_stream_1_full_n,
    lpcore_cancellation_unit_output_stream_1_wr_data,
    lpcore_cancellation_unit_output_stream_1_wr_en,
    lpcore_commit_time_stream_0_empty_n,
    lpcore_commit_time_stream_0_rd_data,
    lpcore_commit_time_stream_0_rd_en,
    lpcore_commit_time_stream_1_empty_n,
    lpcore_commit_time_stream_1_rd_data,
    lpcore_commit_time_stream_1_rd_en,
    lpcore_enqueue_event_stream_0_empty_n,
    lpcore_enqueue_event_stream_0_rd_data,
    lpcore_enqueue_event_stream_0_rd_en,
    lpcore_enqueue_event_stream_1_empty_n,
    lpcore_enqueue_event_stream_1_rd_data,
    lpcore_enqueue_event_stream_1_rd_en,
    lpcore_event_queue_full_stream_0_full_n,
    lpcore_event_queue_full_stream_0_wr_data,
    lpcore_event_queue_full_stream_0_wr_en,
    lpcore_event_queue_full_stream_1_full_n,
    lpcore_event_queue_full_stream_1_wr_data,
    lpcore_event_queue_full_stream_1_wr_en,
    lpcore_init_event_stream_0_empty_n,
    lpcore_init_event_stream_0_rd_data,
    lpcore_init_event_stream_0_rd_en,
    lpcore_init_event_stream_1_empty_n,
    lpcore_init_event_stream_1_rd_data,
    lpcore_init_event_stream_1_rd_en,
    lpcore_output_event_stream_0_full_n,
    lpcore_output_event_stream_0_wr_data,
    lpcore_output_event_stream_0_wr_en,
    lpcore_output_event_stream_1_full_n,
    lpcore_output_event_stream_1_wr_data,
    lpcore_output_event_stream_1_wr_en);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.AP_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.AP_CLK, ASSOCIATED_RESET ap_rst, CLK_DOMAIN bd_0_ap_clk_0, FREQ_HZ 200000000.0, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input ap_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.AP_RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.AP_RST, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input ap_rst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 lpcore_anti_message_stream_0 " *) input lpcore_anti_message_stream_0_empty_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 lpcore_anti_message_stream_0 " *) input [128:0]lpcore_anti_message_stream_0_rd_data;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 lpcore_anti_message_stream_0 " *) output lpcore_anti_message_stream_0_rd_en;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 lpcore_anti_message_stream_1 " *) input lpcore_anti_message_stream_1_empty_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 lpcore_anti_message_stream_1 " *) input [128:0]lpcore_anti_message_stream_1_rd_data;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 lpcore_anti_message_stream_1 " *) output lpcore_anti_message_stream_1_rd_en;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 lpcore_cancellation_unit_output_stream_0 " *) input lpcore_cancellation_unit_output_stream_0_full_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 lpcore_cancellation_unit_output_stream_0 " *) output [128:0]lpcore_cancellation_unit_output_stream_0_wr_data;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 lpcore_cancellation_unit_output_stream_0 " *) output lpcore_cancellation_unit_output_stream_0_wr_en;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 lpcore_cancellation_unit_output_stream_1 " *) input lpcore_cancellation_unit_output_stream_1_full_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 lpcore_cancellation_unit_output_stream_1 " *) output [128:0]lpcore_cancellation_unit_output_stream_1_wr_data;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 lpcore_cancellation_unit_output_stream_1 " *) output lpcore_cancellation_unit_output_stream_1_wr_en;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 lpcore_commit_time_stream_0 " *) input lpcore_commit_time_stream_0_empty_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 lpcore_commit_time_stream_0 " *) input [31:0]lpcore_commit_time_stream_0_rd_data;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 lpcore_commit_time_stream_0 " *) output lpcore_commit_time_stream_0_rd_en;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 lpcore_commit_time_stream_1 " *) input lpcore_commit_time_stream_1_empty_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 lpcore_commit_time_stream_1 " *) input [31:0]lpcore_commit_time_stream_1_rd_data;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 lpcore_commit_time_stream_1 " *) output lpcore_commit_time_stream_1_rd_en;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 lpcore_enqueue_event_stream_0 " *) input lpcore_enqueue_event_stream_0_empty_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 lpcore_enqueue_event_stream_0 " *) input [128:0]lpcore_enqueue_event_stream_0_rd_data;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 lpcore_enqueue_event_stream_0 " *) output lpcore_enqueue_event_stream_0_rd_en;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 lpcore_enqueue_event_stream_1 " *) input lpcore_enqueue_event_stream_1_empty_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 lpcore_enqueue_event_stream_1 " *) input [128:0]lpcore_enqueue_event_stream_1_rd_data;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 lpcore_enqueue_event_stream_1 " *) output lpcore_enqueue_event_stream_1_rd_en;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 lpcore_event_queue_full_stream_0 " *) input lpcore_event_queue_full_stream_0_full_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 lpcore_event_queue_full_stream_0 " *) output [0:0]lpcore_event_queue_full_stream_0_wr_data;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 lpcore_event_queue_full_stream_0 " *) output lpcore_event_queue_full_stream_0_wr_en;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 lpcore_event_queue_full_stream_1 " *) input lpcore_event_queue_full_stream_1_full_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 lpcore_event_queue_full_stream_1 " *) output [0:0]lpcore_event_queue_full_stream_1_wr_data;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 lpcore_event_queue_full_stream_1 " *) output lpcore_event_queue_full_stream_1_wr_en;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 lpcore_init_event_stream_0 " *) input lpcore_init_event_stream_0_empty_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 lpcore_init_event_stream_0 " *) input [128:0]lpcore_init_event_stream_0_rd_data;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 lpcore_init_event_stream_0 " *) output lpcore_init_event_stream_0_rd_en;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 lpcore_init_event_stream_1 " *) input lpcore_init_event_stream_1_empty_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 lpcore_init_event_stream_1 " *) input [128:0]lpcore_init_event_stream_1_rd_data;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 lpcore_init_event_stream_1 " *) output lpcore_init_event_stream_1_rd_en;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 lpcore_output_event_stream_0 " *) input lpcore_output_event_stream_0_full_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 lpcore_output_event_stream_0 " *) output [128:0]lpcore_output_event_stream_0_wr_data;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 lpcore_output_event_stream_0 " *) output lpcore_output_event_stream_0_wr_en;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 lpcore_output_event_stream_1 " *) input lpcore_output_event_stream_1_full_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 lpcore_output_event_stream_1 " *) output [128:0]lpcore_output_event_stream_1_wr_data;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 lpcore_output_event_stream_1 " *) output lpcore_output_event_stream_1_wr_en;

  wire ap_clk_0_1;
  wire ap_rst_0_1;
  wire hls_inst_lpcore_anti_message_stream_0_EMPTY_N;
  wire [128:0]hls_inst_lpcore_anti_message_stream_0_RD_DATA;
  wire hls_inst_lpcore_anti_message_stream_0_RD_EN;
  wire hls_inst_lpcore_anti_message_stream_1_EMPTY_N;
  wire [128:0]hls_inst_lpcore_anti_message_stream_1_RD_DATA;
  wire hls_inst_lpcore_anti_message_stream_1_RD_EN;
  wire hls_inst_lpcore_cancellation_unit_output_stream_0_FULL_N;
  wire [128:0]hls_inst_lpcore_cancellation_unit_output_stream_0_WR_DATA;
  wire hls_inst_lpcore_cancellation_unit_output_stream_0_WR_EN;
  wire hls_inst_lpcore_cancellation_unit_output_stream_1_FULL_N;
  wire [128:0]hls_inst_lpcore_cancellation_unit_output_stream_1_WR_DATA;
  wire hls_inst_lpcore_cancellation_unit_output_stream_1_WR_EN;
  wire hls_inst_lpcore_commit_time_stream_0_EMPTY_N;
  wire [31:0]hls_inst_lpcore_commit_time_stream_0_RD_DATA;
  wire hls_inst_lpcore_commit_time_stream_0_RD_EN;
  wire hls_inst_lpcore_commit_time_stream_1_EMPTY_N;
  wire [31:0]hls_inst_lpcore_commit_time_stream_1_RD_DATA;
  wire hls_inst_lpcore_commit_time_stream_1_RD_EN;
  wire hls_inst_lpcore_enqueue_event_stream_0_EMPTY_N;
  wire [128:0]hls_inst_lpcore_enqueue_event_stream_0_RD_DATA;
  wire hls_inst_lpcore_enqueue_event_stream_0_RD_EN;
  wire hls_inst_lpcore_enqueue_event_stream_1_EMPTY_N;
  wire [128:0]hls_inst_lpcore_enqueue_event_stream_1_RD_DATA;
  wire hls_inst_lpcore_enqueue_event_stream_1_RD_EN;
  wire hls_inst_lpcore_event_queue_full_stream_0_FULL_N;
  wire [0:0]hls_inst_lpcore_event_queue_full_stream_0_WR_DATA;
  wire hls_inst_lpcore_event_queue_full_stream_0_WR_EN;
  wire hls_inst_lpcore_event_queue_full_stream_1_FULL_N;
  wire [0:0]hls_inst_lpcore_event_queue_full_stream_1_WR_DATA;
  wire hls_inst_lpcore_event_queue_full_stream_1_WR_EN;
  wire hls_inst_lpcore_init_event_stream_0_EMPTY_N;
  wire [128:0]hls_inst_lpcore_init_event_stream_0_RD_DATA;
  wire hls_inst_lpcore_init_event_stream_0_RD_EN;
  wire hls_inst_lpcore_init_event_stream_1_EMPTY_N;
  wire [128:0]hls_inst_lpcore_init_event_stream_1_RD_DATA;
  wire hls_inst_lpcore_init_event_stream_1_RD_EN;
  wire hls_inst_lpcore_output_event_stream_0_FULL_N;
  wire [128:0]hls_inst_lpcore_output_event_stream_0_WR_DATA;
  wire hls_inst_lpcore_output_event_stream_0_WR_EN;
  wire hls_inst_lpcore_output_event_stream_1_FULL_N;
  wire [128:0]hls_inst_lpcore_output_event_stream_1_WR_DATA;
  wire hls_inst_lpcore_output_event_stream_1_WR_EN;

  assign ap_clk_0_1 = ap_clk;
  assign ap_rst_0_1 = ap_rst;
  assign hls_inst_lpcore_anti_message_stream_0_EMPTY_N = lpcore_anti_message_stream_0_empty_n;
  assign hls_inst_lpcore_anti_message_stream_0_RD_DATA = lpcore_anti_message_stream_0_rd_data[128:0];
  assign hls_inst_lpcore_anti_message_stream_1_EMPTY_N = lpcore_anti_message_stream_1_empty_n;
  assign hls_inst_lpcore_anti_message_stream_1_RD_DATA = lpcore_anti_message_stream_1_rd_data[128:0];
  assign hls_inst_lpcore_cancellation_unit_output_stream_0_FULL_N = lpcore_cancellation_unit_output_stream_0_full_n;
  assign hls_inst_lpcore_cancellation_unit_output_stream_1_FULL_N = lpcore_cancellation_unit_output_stream_1_full_n;
  assign hls_inst_lpcore_commit_time_stream_0_EMPTY_N = lpcore_commit_time_stream_0_empty_n;
  assign hls_inst_lpcore_commit_time_stream_0_RD_DATA = lpcore_commit_time_stream_0_rd_data[31:0];
  assign hls_inst_lpcore_commit_time_stream_1_EMPTY_N = lpcore_commit_time_stream_1_empty_n;
  assign hls_inst_lpcore_commit_time_stream_1_RD_DATA = lpcore_commit_time_stream_1_rd_data[31:0];
  assign hls_inst_lpcore_enqueue_event_stream_0_EMPTY_N = lpcore_enqueue_event_stream_0_empty_n;
  assign hls_inst_lpcore_enqueue_event_stream_0_RD_DATA = lpcore_enqueue_event_stream_0_rd_data[128:0];
  assign hls_inst_lpcore_enqueue_event_stream_1_EMPTY_N = lpcore_enqueue_event_stream_1_empty_n;
  assign hls_inst_lpcore_enqueue_event_stream_1_RD_DATA = lpcore_enqueue_event_stream_1_rd_data[128:0];
  assign hls_inst_lpcore_event_queue_full_stream_0_FULL_N = lpcore_event_queue_full_stream_0_full_n;
  assign hls_inst_lpcore_event_queue_full_stream_1_FULL_N = lpcore_event_queue_full_stream_1_full_n;
  assign hls_inst_lpcore_init_event_stream_0_EMPTY_N = lpcore_init_event_stream_0_empty_n;
  assign hls_inst_lpcore_init_event_stream_0_RD_DATA = lpcore_init_event_stream_0_rd_data[128:0];
  assign hls_inst_lpcore_init_event_stream_1_EMPTY_N = lpcore_init_event_stream_1_empty_n;
  assign hls_inst_lpcore_init_event_stream_1_RD_DATA = lpcore_init_event_stream_1_rd_data[128:0];
  assign hls_inst_lpcore_output_event_stream_0_FULL_N = lpcore_output_event_stream_0_full_n;
  assign hls_inst_lpcore_output_event_stream_1_FULL_N = lpcore_output_event_stream_1_full_n;
  assign lpcore_anti_message_stream_0_rd_en = hls_inst_lpcore_anti_message_stream_0_RD_EN;
  assign lpcore_anti_message_stream_1_rd_en = hls_inst_lpcore_anti_message_stream_1_RD_EN;
  assign lpcore_cancellation_unit_output_stream_0_wr_data[128:0] = hls_inst_lpcore_cancellation_unit_output_stream_0_WR_DATA;
  assign lpcore_cancellation_unit_output_stream_0_wr_en = hls_inst_lpcore_cancellation_unit_output_stream_0_WR_EN;
  assign lpcore_cancellation_unit_output_stream_1_wr_data[128:0] = hls_inst_lpcore_cancellation_unit_output_stream_1_WR_DATA;
  assign lpcore_cancellation_unit_output_stream_1_wr_en = hls_inst_lpcore_cancellation_unit_output_stream_1_WR_EN;
  assign lpcore_commit_time_stream_0_rd_en = hls_inst_lpcore_commit_time_stream_0_RD_EN;
  assign lpcore_commit_time_stream_1_rd_en = hls_inst_lpcore_commit_time_stream_1_RD_EN;
  assign lpcore_enqueue_event_stream_0_rd_en = hls_inst_lpcore_enqueue_event_stream_0_RD_EN;
  assign lpcore_enqueue_event_stream_1_rd_en = hls_inst_lpcore_enqueue_event_stream_1_RD_EN;
  assign lpcore_event_queue_full_stream_0_wr_data[0] = hls_inst_lpcore_event_queue_full_stream_0_WR_DATA;
  assign lpcore_event_queue_full_stream_0_wr_en = hls_inst_lpcore_event_queue_full_stream_0_WR_EN;
  assign lpcore_event_queue_full_stream_1_wr_data[0] = hls_inst_lpcore_event_queue_full_stream_1_WR_DATA;
  assign lpcore_event_queue_full_stream_1_wr_en = hls_inst_lpcore_event_queue_full_stream_1_WR_EN;
  assign lpcore_init_event_stream_0_rd_en = hls_inst_lpcore_init_event_stream_0_RD_EN;
  assign lpcore_init_event_stream_1_rd_en = hls_inst_lpcore_init_event_stream_1_RD_EN;
  assign lpcore_output_event_stream_0_wr_data[128:0] = hls_inst_lpcore_output_event_stream_0_WR_DATA;
  assign lpcore_output_event_stream_0_wr_en = hls_inst_lpcore_output_event_stream_0_WR_EN;
  assign lpcore_output_event_stream_1_wr_data[128:0] = hls_inst_lpcore_output_event_stream_1_WR_DATA;
  assign lpcore_output_event_stream_1_wr_en = hls_inst_lpcore_output_event_stream_1_WR_EN;
  bd_0_hls_inst_0 hls_inst
       (.ap_clk(ap_clk_0_1),
        .ap_rst(ap_rst_0_1),
        .lpcore_anti_message_stream_0_dout(hls_inst_lpcore_anti_message_stream_0_RD_DATA),
        .lpcore_anti_message_stream_0_empty_n(hls_inst_lpcore_anti_message_stream_0_EMPTY_N),
        .lpcore_anti_message_stream_0_read(hls_inst_lpcore_anti_message_stream_0_RD_EN),
        .lpcore_anti_message_stream_1_dout(hls_inst_lpcore_anti_message_stream_1_RD_DATA),
        .lpcore_anti_message_stream_1_empty_n(hls_inst_lpcore_anti_message_stream_1_EMPTY_N),
        .lpcore_anti_message_stream_1_read(hls_inst_lpcore_anti_message_stream_1_RD_EN),
        .lpcore_cancellation_unit_output_stream_0_din(hls_inst_lpcore_cancellation_unit_output_stream_0_WR_DATA),
        .lpcore_cancellation_unit_output_stream_0_full_n(hls_inst_lpcore_cancellation_unit_output_stream_0_FULL_N),
        .lpcore_cancellation_unit_output_stream_0_write(hls_inst_lpcore_cancellation_unit_output_stream_0_WR_EN),
        .lpcore_cancellation_unit_output_stream_1_din(hls_inst_lpcore_cancellation_unit_output_stream_1_WR_DATA),
        .lpcore_cancellation_unit_output_stream_1_full_n(hls_inst_lpcore_cancellation_unit_output_stream_1_FULL_N),
        .lpcore_cancellation_unit_output_stream_1_write(hls_inst_lpcore_cancellation_unit_output_stream_1_WR_EN),
        .lpcore_commit_time_stream_0_dout(hls_inst_lpcore_commit_time_stream_0_RD_DATA),
        .lpcore_commit_time_stream_0_empty_n(hls_inst_lpcore_commit_time_stream_0_EMPTY_N),
        .lpcore_commit_time_stream_0_read(hls_inst_lpcore_commit_time_stream_0_RD_EN),
        .lpcore_commit_time_stream_1_dout(hls_inst_lpcore_commit_time_stream_1_RD_DATA),
        .lpcore_commit_time_stream_1_empty_n(hls_inst_lpcore_commit_time_stream_1_EMPTY_N),
        .lpcore_commit_time_stream_1_read(hls_inst_lpcore_commit_time_stream_1_RD_EN),
        .lpcore_enqueue_event_stream_0_dout(hls_inst_lpcore_enqueue_event_stream_0_RD_DATA),
        .lpcore_enqueue_event_stream_0_empty_n(hls_inst_lpcore_enqueue_event_stream_0_EMPTY_N),
        .lpcore_enqueue_event_stream_0_read(hls_inst_lpcore_enqueue_event_stream_0_RD_EN),
        .lpcore_enqueue_event_stream_1_dout(hls_inst_lpcore_enqueue_event_stream_1_RD_DATA),
        .lpcore_enqueue_event_stream_1_empty_n(hls_inst_lpcore_enqueue_event_stream_1_EMPTY_N),
        .lpcore_enqueue_event_stream_1_read(hls_inst_lpcore_enqueue_event_stream_1_RD_EN),
        .lpcore_event_queue_full_stream_0_din(hls_inst_lpcore_event_queue_full_stream_0_WR_DATA),
        .lpcore_event_queue_full_stream_0_full_n(hls_inst_lpcore_event_queue_full_stream_0_FULL_N),
        .lpcore_event_queue_full_stream_0_write(hls_inst_lpcore_event_queue_full_stream_0_WR_EN),
        .lpcore_event_queue_full_stream_1_din(hls_inst_lpcore_event_queue_full_stream_1_WR_DATA),
        .lpcore_event_queue_full_stream_1_full_n(hls_inst_lpcore_event_queue_full_stream_1_FULL_N),
        .lpcore_event_queue_full_stream_1_write(hls_inst_lpcore_event_queue_full_stream_1_WR_EN),
        .lpcore_init_event_stream_0_dout(hls_inst_lpcore_init_event_stream_0_RD_DATA),
        .lpcore_init_event_stream_0_empty_n(hls_inst_lpcore_init_event_stream_0_EMPTY_N),
        .lpcore_init_event_stream_0_read(hls_inst_lpcore_init_event_stream_0_RD_EN),
        .lpcore_init_event_stream_1_dout(hls_inst_lpcore_init_event_stream_1_RD_DATA),
        .lpcore_init_event_stream_1_empty_n(hls_inst_lpcore_init_event_stream_1_EMPTY_N),
        .lpcore_init_event_stream_1_read(hls_inst_lpcore_init_event_stream_1_RD_EN),
        .lpcore_output_event_stream_0_din(hls_inst_lpcore_output_event_stream_0_WR_DATA),
        .lpcore_output_event_stream_0_full_n(hls_inst_lpcore_output_event_stream_0_FULL_N),
        .lpcore_output_event_stream_0_write(hls_inst_lpcore_output_event_stream_0_WR_EN),
        .lpcore_output_event_stream_1_din(hls_inst_lpcore_output_event_stream_1_WR_DATA),
        .lpcore_output_event_stream_1_full_n(hls_inst_lpcore_output_event_stream_1_FULL_N),
        .lpcore_output_event_stream_1_write(hls_inst_lpcore_output_event_stream_1_WR_EN));
endmodule
