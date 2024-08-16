// (c) Copyright 1995-2024 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:hls:simulation_top:1.0
// IP Revision: 2113691459

(* X_CORE_INFO = "simulation_top,Vivado 2022.1" *)
(* CHECK_LICENSE_TYPE = "bd_0_hls_inst_0,simulation_top,{}" *)
(* CORE_GENERATION_INFO = "bd_0_hls_inst_0,simulation_top,{x_ipProduct=Vivado 2022.1,x_ipVendor=xilinx.com,x_ipLibrary=hls,x_ipName=simulation_top,x_ipVersion=1.0,x_ipCoreRevision=2113691459,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED}" *)
(* IP_DEFINITION_SOURCE = "HLS" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module bd_0_hls_inst_0 (
  lpcore_init_event_stream_0_dout,
  lpcore_init_event_stream_0_empty_n,
  lpcore_init_event_stream_0_read,
  lpcore_init_event_stream_1_dout,
  lpcore_init_event_stream_1_empty_n,
  lpcore_init_event_stream_1_read,
  lpcore_event_queue_full_stream_0_din,
  lpcore_event_queue_full_stream_0_full_n,
  lpcore_event_queue_full_stream_0_write,
  lpcore_event_queue_full_stream_1_din,
  lpcore_event_queue_full_stream_1_full_n,
  lpcore_event_queue_full_stream_1_write,
  lpcore_anti_message_stream_0_dout,
  lpcore_anti_message_stream_0_empty_n,
  lpcore_anti_message_stream_0_read,
  lpcore_anti_message_stream_1_dout,
  lpcore_anti_message_stream_1_empty_n,
  lpcore_anti_message_stream_1_read,
  lpcore_enqueue_event_stream_0_dout,
  lpcore_enqueue_event_stream_0_empty_n,
  lpcore_enqueue_event_stream_0_read,
  lpcore_enqueue_event_stream_1_dout,
  lpcore_enqueue_event_stream_1_empty_n,
  lpcore_enqueue_event_stream_1_read,
  lpcore_output_event_stream_0_din,
  lpcore_output_event_stream_0_full_n,
  lpcore_output_event_stream_0_write,
  lpcore_output_event_stream_1_din,
  lpcore_output_event_stream_1_full_n,
  lpcore_output_event_stream_1_write,
  lpcore_cancellation_unit_output_stream_0_din,
  lpcore_cancellation_unit_output_stream_0_full_n,
  lpcore_cancellation_unit_output_stream_0_write,
  lpcore_cancellation_unit_output_stream_1_din,
  lpcore_cancellation_unit_output_stream_1_full_n,
  lpcore_cancellation_unit_output_stream_1_write,
  lpcore_commit_time_stream_0_dout,
  lpcore_commit_time_stream_0_empty_n,
  lpcore_commit_time_stream_0_read,
  lpcore_commit_time_stream_1_dout,
  lpcore_commit_time_stream_1_empty_n,
  lpcore_commit_time_stream_1_read,
  ap_clk,
  ap_rst
);

(* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 lpcore_init_event_stream_0 RD_DATA" *)
input wire [128 : 0] lpcore_init_event_stream_0_dout;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 lpcore_init_event_stream_0 EMPTY_N" *)
input wire lpcore_init_event_stream_0_empty_n;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 lpcore_init_event_stream_0 RD_EN" *)
output wire lpcore_init_event_stream_0_read;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 lpcore_init_event_stream_1 RD_DATA" *)
input wire [128 : 0] lpcore_init_event_stream_1_dout;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 lpcore_init_event_stream_1 EMPTY_N" *)
input wire lpcore_init_event_stream_1_empty_n;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 lpcore_init_event_stream_1 RD_EN" *)
output wire lpcore_init_event_stream_1_read;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 lpcore_event_queue_full_stream_0 WR_DATA" *)
output wire [0 : 0] lpcore_event_queue_full_stream_0_din;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 lpcore_event_queue_full_stream_0 FULL_N" *)
input wire lpcore_event_queue_full_stream_0_full_n;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 lpcore_event_queue_full_stream_0 WR_EN" *)
output wire lpcore_event_queue_full_stream_0_write;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 lpcore_event_queue_full_stream_1 WR_DATA" *)
output wire [0 : 0] lpcore_event_queue_full_stream_1_din;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 lpcore_event_queue_full_stream_1 FULL_N" *)
input wire lpcore_event_queue_full_stream_1_full_n;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 lpcore_event_queue_full_stream_1 WR_EN" *)
output wire lpcore_event_queue_full_stream_1_write;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 lpcore_anti_message_stream_0 RD_DATA" *)
input wire [128 : 0] lpcore_anti_message_stream_0_dout;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 lpcore_anti_message_stream_0 EMPTY_N" *)
input wire lpcore_anti_message_stream_0_empty_n;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 lpcore_anti_message_stream_0 RD_EN" *)
output wire lpcore_anti_message_stream_0_read;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 lpcore_anti_message_stream_1 RD_DATA" *)
input wire [128 : 0] lpcore_anti_message_stream_1_dout;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 lpcore_anti_message_stream_1 EMPTY_N" *)
input wire lpcore_anti_message_stream_1_empty_n;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 lpcore_anti_message_stream_1 RD_EN" *)
output wire lpcore_anti_message_stream_1_read;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 lpcore_enqueue_event_stream_0 RD_DATA" *)
input wire [128 : 0] lpcore_enqueue_event_stream_0_dout;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 lpcore_enqueue_event_stream_0 EMPTY_N" *)
input wire lpcore_enqueue_event_stream_0_empty_n;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 lpcore_enqueue_event_stream_0 RD_EN" *)
output wire lpcore_enqueue_event_stream_0_read;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 lpcore_enqueue_event_stream_1 RD_DATA" *)
input wire [128 : 0] lpcore_enqueue_event_stream_1_dout;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 lpcore_enqueue_event_stream_1 EMPTY_N" *)
input wire lpcore_enqueue_event_stream_1_empty_n;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 lpcore_enqueue_event_stream_1 RD_EN" *)
output wire lpcore_enqueue_event_stream_1_read;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 lpcore_output_event_stream_0 WR_DATA" *)
output wire [128 : 0] lpcore_output_event_stream_0_din;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 lpcore_output_event_stream_0 FULL_N" *)
input wire lpcore_output_event_stream_0_full_n;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 lpcore_output_event_stream_0 WR_EN" *)
output wire lpcore_output_event_stream_0_write;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 lpcore_output_event_stream_1 WR_DATA" *)
output wire [128 : 0] lpcore_output_event_stream_1_din;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 lpcore_output_event_stream_1 FULL_N" *)
input wire lpcore_output_event_stream_1_full_n;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 lpcore_output_event_stream_1 WR_EN" *)
output wire lpcore_output_event_stream_1_write;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 lpcore_cancellation_unit_output_stream_0 WR_DATA" *)
output wire [128 : 0] lpcore_cancellation_unit_output_stream_0_din;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 lpcore_cancellation_unit_output_stream_0 FULL_N" *)
input wire lpcore_cancellation_unit_output_stream_0_full_n;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 lpcore_cancellation_unit_output_stream_0 WR_EN" *)
output wire lpcore_cancellation_unit_output_stream_0_write;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 lpcore_cancellation_unit_output_stream_1 WR_DATA" *)
output wire [128 : 0] lpcore_cancellation_unit_output_stream_1_din;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 lpcore_cancellation_unit_output_stream_1 FULL_N" *)
input wire lpcore_cancellation_unit_output_stream_1_full_n;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 lpcore_cancellation_unit_output_stream_1 WR_EN" *)
output wire lpcore_cancellation_unit_output_stream_1_write;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 lpcore_commit_time_stream_0 RD_DATA" *)
input wire [31 : 0] lpcore_commit_time_stream_0_dout;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 lpcore_commit_time_stream_0 EMPTY_N" *)
input wire lpcore_commit_time_stream_0_empty_n;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 lpcore_commit_time_stream_0 RD_EN" *)
output wire lpcore_commit_time_stream_0_read;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 lpcore_commit_time_stream_1 RD_DATA" *)
input wire [31 : 0] lpcore_commit_time_stream_1_dout;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 lpcore_commit_time_stream_1 EMPTY_N" *)
input wire lpcore_commit_time_stream_1_empty_n;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 lpcore_commit_time_stream_1 RD_EN" *)
output wire lpcore_commit_time_stream_1_read;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_clk, ASSOCIATED_RESET ap_rst, FREQ_HZ 200000000.0, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_0_ap_clk_0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ap_clk CLK" *)
input wire ap_clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_rst, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ap_rst RST" *)
input wire ap_rst;

(* SDX_KERNEL = "true" *)
(* SDX_KERNEL_TYPE = "hls" *)
(* SDX_KERNEL_SYNTH_INST = "inst" *)
  simulation_top inst (
    .lpcore_init_event_stream_0_dout(lpcore_init_event_stream_0_dout),
    .lpcore_init_event_stream_0_empty_n(lpcore_init_event_stream_0_empty_n),
    .lpcore_init_event_stream_0_read(lpcore_init_event_stream_0_read),
    .lpcore_init_event_stream_1_dout(lpcore_init_event_stream_1_dout),
    .lpcore_init_event_stream_1_empty_n(lpcore_init_event_stream_1_empty_n),
    .lpcore_init_event_stream_1_read(lpcore_init_event_stream_1_read),
    .lpcore_event_queue_full_stream_0_din(lpcore_event_queue_full_stream_0_din),
    .lpcore_event_queue_full_stream_0_full_n(lpcore_event_queue_full_stream_0_full_n),
    .lpcore_event_queue_full_stream_0_write(lpcore_event_queue_full_stream_0_write),
    .lpcore_event_queue_full_stream_1_din(lpcore_event_queue_full_stream_1_din),
    .lpcore_event_queue_full_stream_1_full_n(lpcore_event_queue_full_stream_1_full_n),
    .lpcore_event_queue_full_stream_1_write(lpcore_event_queue_full_stream_1_write),
    .lpcore_anti_message_stream_0_dout(lpcore_anti_message_stream_0_dout),
    .lpcore_anti_message_stream_0_empty_n(lpcore_anti_message_stream_0_empty_n),
    .lpcore_anti_message_stream_0_read(lpcore_anti_message_stream_0_read),
    .lpcore_anti_message_stream_1_dout(lpcore_anti_message_stream_1_dout),
    .lpcore_anti_message_stream_1_empty_n(lpcore_anti_message_stream_1_empty_n),
    .lpcore_anti_message_stream_1_read(lpcore_anti_message_stream_1_read),
    .lpcore_enqueue_event_stream_0_dout(lpcore_enqueue_event_stream_0_dout),
    .lpcore_enqueue_event_stream_0_empty_n(lpcore_enqueue_event_stream_0_empty_n),
    .lpcore_enqueue_event_stream_0_read(lpcore_enqueue_event_stream_0_read),
    .lpcore_enqueue_event_stream_1_dout(lpcore_enqueue_event_stream_1_dout),
    .lpcore_enqueue_event_stream_1_empty_n(lpcore_enqueue_event_stream_1_empty_n),
    .lpcore_enqueue_event_stream_1_read(lpcore_enqueue_event_stream_1_read),
    .lpcore_output_event_stream_0_din(lpcore_output_event_stream_0_din),
    .lpcore_output_event_stream_0_full_n(lpcore_output_event_stream_0_full_n),
    .lpcore_output_event_stream_0_write(lpcore_output_event_stream_0_write),
    .lpcore_output_event_stream_1_din(lpcore_output_event_stream_1_din),
    .lpcore_output_event_stream_1_full_n(lpcore_output_event_stream_1_full_n),
    .lpcore_output_event_stream_1_write(lpcore_output_event_stream_1_write),
    .lpcore_cancellation_unit_output_stream_0_din(lpcore_cancellation_unit_output_stream_0_din),
    .lpcore_cancellation_unit_output_stream_0_full_n(lpcore_cancellation_unit_output_stream_0_full_n),
    .lpcore_cancellation_unit_output_stream_0_write(lpcore_cancellation_unit_output_stream_0_write),
    .lpcore_cancellation_unit_output_stream_1_din(lpcore_cancellation_unit_output_stream_1_din),
    .lpcore_cancellation_unit_output_stream_1_full_n(lpcore_cancellation_unit_output_stream_1_full_n),
    .lpcore_cancellation_unit_output_stream_1_write(lpcore_cancellation_unit_output_stream_1_write),
    .lpcore_commit_time_stream_0_dout(lpcore_commit_time_stream_0_dout),
    .lpcore_commit_time_stream_0_empty_n(lpcore_commit_time_stream_0_empty_n),
    .lpcore_commit_time_stream_0_read(lpcore_commit_time_stream_0_read),
    .lpcore_commit_time_stream_1_dout(lpcore_commit_time_stream_1_dout),
    .lpcore_commit_time_stream_1_empty_n(lpcore_commit_time_stream_1_empty_n),
    .lpcore_commit_time_stream_1_read(lpcore_commit_time_stream_1_read),
    .ap_clk(ap_clk),
    .ap_rst(ap_rst)
  );
endmodule
