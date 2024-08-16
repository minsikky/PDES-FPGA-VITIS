-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Version: 2022.1
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity simulation_top is
port (
    lpcore_init_event_stream_0_dout : IN STD_LOGIC_VECTOR (128 downto 0);
    lpcore_init_event_stream_0_empty_n : IN STD_LOGIC;
    lpcore_init_event_stream_0_read : OUT STD_LOGIC;
    lpcore_init_event_stream_1_dout : IN STD_LOGIC_VECTOR (128 downto 0);
    lpcore_init_event_stream_1_empty_n : IN STD_LOGIC;
    lpcore_init_event_stream_1_read : OUT STD_LOGIC;
    lpcore_event_queue_full_stream_0_din : OUT STD_LOGIC_VECTOR (0 downto 0);
    lpcore_event_queue_full_stream_0_full_n : IN STD_LOGIC;
    lpcore_event_queue_full_stream_0_write : OUT STD_LOGIC;
    lpcore_event_queue_full_stream_1_din : OUT STD_LOGIC_VECTOR (0 downto 0);
    lpcore_event_queue_full_stream_1_full_n : IN STD_LOGIC;
    lpcore_event_queue_full_stream_1_write : OUT STD_LOGIC;
    lpcore_anti_message_stream_0_dout : IN STD_LOGIC_VECTOR (128 downto 0);
    lpcore_anti_message_stream_0_empty_n : IN STD_LOGIC;
    lpcore_anti_message_stream_0_read : OUT STD_LOGIC;
    lpcore_anti_message_stream_1_dout : IN STD_LOGIC_VECTOR (128 downto 0);
    lpcore_anti_message_stream_1_empty_n : IN STD_LOGIC;
    lpcore_anti_message_stream_1_read : OUT STD_LOGIC;
    lpcore_enqueue_event_stream_0_dout : IN STD_LOGIC_VECTOR (128 downto 0);
    lpcore_enqueue_event_stream_0_empty_n : IN STD_LOGIC;
    lpcore_enqueue_event_stream_0_read : OUT STD_LOGIC;
    lpcore_enqueue_event_stream_1_dout : IN STD_LOGIC_VECTOR (128 downto 0);
    lpcore_enqueue_event_stream_1_empty_n : IN STD_LOGIC;
    lpcore_enqueue_event_stream_1_read : OUT STD_LOGIC;
    lpcore_output_event_stream_0_din : OUT STD_LOGIC_VECTOR (128 downto 0);
    lpcore_output_event_stream_0_full_n : IN STD_LOGIC;
    lpcore_output_event_stream_0_write : OUT STD_LOGIC;
    lpcore_output_event_stream_1_din : OUT STD_LOGIC_VECTOR (128 downto 0);
    lpcore_output_event_stream_1_full_n : IN STD_LOGIC;
    lpcore_output_event_stream_1_write : OUT STD_LOGIC;
    lpcore_cancellation_unit_output_stream_0_din : OUT STD_LOGIC_VECTOR (128 downto 0);
    lpcore_cancellation_unit_output_stream_0_full_n : IN STD_LOGIC;
    lpcore_cancellation_unit_output_stream_0_write : OUT STD_LOGIC;
    lpcore_cancellation_unit_output_stream_1_din : OUT STD_LOGIC_VECTOR (128 downto 0);
    lpcore_cancellation_unit_output_stream_1_full_n : IN STD_LOGIC;
    lpcore_cancellation_unit_output_stream_1_write : OUT STD_LOGIC;
    lpcore_commit_time_stream_0_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    lpcore_commit_time_stream_0_empty_n : IN STD_LOGIC;
    lpcore_commit_time_stream_0_read : OUT STD_LOGIC;
    lpcore_commit_time_stream_1_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    lpcore_commit_time_stream_1_empty_n : IN STD_LOGIC;
    lpcore_commit_time_stream_1_read : OUT STD_LOGIC;
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC );
end;


architecture behav of simulation_top is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "simulation_top_simulation_top,hls_ip_2022_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xczu7ev-ffvc1156-2-e,HLS_INPUT_CLOCK=5.000000,HLS_INPUT_ARCH=dataflow,HLS_SYN_CLOCK=3.650000,HLS_SYN_LAT=-1,HLS_SYN_TPT=-1,HLS_SYN_MEM=34,HLS_SYN_DSP=0,HLS_SYN_FF=9634,HLS_SYN_LUT=15432,HLS_VERSION=2022_1}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';

    signal lpcore_kernel_0_U0_lpcore_init_event_stream_0_read : STD_LOGIC;
    signal lpcore_kernel_0_U0_lpcore_event_queue_full_stream_0_din : STD_LOGIC_VECTOR (0 downto 0);
    signal lpcore_kernel_0_U0_lpcore_event_queue_full_stream_0_write : STD_LOGIC;
    signal lpcore_kernel_0_U0_lpcore_anti_message_stream_0_read : STD_LOGIC;
    signal lpcore_kernel_0_U0_lpcore_enqueue_event_stream_0_read : STD_LOGIC;
    signal lpcore_kernel_0_U0_lpcore_output_event_stream_0_din : STD_LOGIC_VECTOR (128 downto 0);
    signal lpcore_kernel_0_U0_lpcore_output_event_stream_0_write : STD_LOGIC;
    signal lpcore_kernel_0_U0_lpcore_cancellation_unit_output_stream_0_din : STD_LOGIC_VECTOR (128 downto 0);
    signal lpcore_kernel_0_U0_lpcore_cancellation_unit_output_stream_0_write : STD_LOGIC;
    signal lpcore_kernel_0_U0_lpcore_commit_time_stream_0_read : STD_LOGIC;
    signal lpcore_kernel_0_U0_ap_ready : STD_LOGIC;
    signal lpcore_kernel_1_U0_lpcore_init_event_stream_1_read : STD_LOGIC;
    signal lpcore_kernel_1_U0_lpcore_event_queue_full_stream_1_din : STD_LOGIC_VECTOR (0 downto 0);
    signal lpcore_kernel_1_U0_lpcore_event_queue_full_stream_1_write : STD_LOGIC;
    signal lpcore_kernel_1_U0_lpcore_anti_message_stream_1_read : STD_LOGIC;
    signal lpcore_kernel_1_U0_lpcore_enqueue_event_stream_1_read : STD_LOGIC;
    signal lpcore_kernel_1_U0_lpcore_output_event_stream_1_din : STD_LOGIC_VECTOR (128 downto 0);
    signal lpcore_kernel_1_U0_lpcore_output_event_stream_1_write : STD_LOGIC;
    signal lpcore_kernel_1_U0_lpcore_cancellation_unit_output_stream_1_din : STD_LOGIC_VECTOR (128 downto 0);
    signal lpcore_kernel_1_U0_lpcore_cancellation_unit_output_stream_1_write : STD_LOGIC;
    signal lpcore_kernel_1_U0_lpcore_commit_time_stream_1_read : STD_LOGIC;
    signal lpcore_kernel_1_U0_ap_ready : STD_LOGIC;

    component simulation_top_lpcore_kernel_0_s IS
    port (
        lpcore_init_event_stream_0_dout : IN STD_LOGIC_VECTOR (128 downto 0);
        lpcore_init_event_stream_0_empty_n : IN STD_LOGIC;
        lpcore_init_event_stream_0_read : OUT STD_LOGIC;
        lpcore_event_queue_full_stream_0_din : OUT STD_LOGIC_VECTOR (0 downto 0);
        lpcore_event_queue_full_stream_0_full_n : IN STD_LOGIC;
        lpcore_event_queue_full_stream_0_write : OUT STD_LOGIC;
        lpcore_anti_message_stream_0_dout : IN STD_LOGIC_VECTOR (128 downto 0);
        lpcore_anti_message_stream_0_empty_n : IN STD_LOGIC;
        lpcore_anti_message_stream_0_read : OUT STD_LOGIC;
        lpcore_enqueue_event_stream_0_dout : IN STD_LOGIC_VECTOR (128 downto 0);
        lpcore_enqueue_event_stream_0_empty_n : IN STD_LOGIC;
        lpcore_enqueue_event_stream_0_read : OUT STD_LOGIC;
        lpcore_output_event_stream_0_din : OUT STD_LOGIC_VECTOR (128 downto 0);
        lpcore_output_event_stream_0_full_n : IN STD_LOGIC;
        lpcore_output_event_stream_0_write : OUT STD_LOGIC;
        lpcore_cancellation_unit_output_stream_0_din : OUT STD_LOGIC_VECTOR (128 downto 0);
        lpcore_cancellation_unit_output_stream_0_full_n : IN STD_LOGIC;
        lpcore_cancellation_unit_output_stream_0_write : OUT STD_LOGIC;
        lpcore_commit_time_stream_0_dout : IN STD_LOGIC_VECTOR (31 downto 0);
        lpcore_commit_time_stream_0_empty_n : IN STD_LOGIC;
        lpcore_commit_time_stream_0_read : OUT STD_LOGIC;
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_ready : OUT STD_LOGIC );
    end component;


    component simulation_top_lpcore_kernel_1_s IS
    port (
        lpcore_init_event_stream_1_dout : IN STD_LOGIC_VECTOR (128 downto 0);
        lpcore_init_event_stream_1_empty_n : IN STD_LOGIC;
        lpcore_init_event_stream_1_read : OUT STD_LOGIC;
        lpcore_event_queue_full_stream_1_din : OUT STD_LOGIC_VECTOR (0 downto 0);
        lpcore_event_queue_full_stream_1_full_n : IN STD_LOGIC;
        lpcore_event_queue_full_stream_1_write : OUT STD_LOGIC;
        lpcore_anti_message_stream_1_dout : IN STD_LOGIC_VECTOR (128 downto 0);
        lpcore_anti_message_stream_1_empty_n : IN STD_LOGIC;
        lpcore_anti_message_stream_1_read : OUT STD_LOGIC;
        lpcore_enqueue_event_stream_1_dout : IN STD_LOGIC_VECTOR (128 downto 0);
        lpcore_enqueue_event_stream_1_empty_n : IN STD_LOGIC;
        lpcore_enqueue_event_stream_1_read : OUT STD_LOGIC;
        lpcore_output_event_stream_1_din : OUT STD_LOGIC_VECTOR (128 downto 0);
        lpcore_output_event_stream_1_full_n : IN STD_LOGIC;
        lpcore_output_event_stream_1_write : OUT STD_LOGIC;
        lpcore_cancellation_unit_output_stream_1_din : OUT STD_LOGIC_VECTOR (128 downto 0);
        lpcore_cancellation_unit_output_stream_1_full_n : IN STD_LOGIC;
        lpcore_cancellation_unit_output_stream_1_write : OUT STD_LOGIC;
        lpcore_commit_time_stream_1_dout : IN STD_LOGIC_VECTOR (31 downto 0);
        lpcore_commit_time_stream_1_empty_n : IN STD_LOGIC;
        lpcore_commit_time_stream_1_read : OUT STD_LOGIC;
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_ready : OUT STD_LOGIC );
    end component;



begin
    lpcore_kernel_0_U0 : component simulation_top_lpcore_kernel_0_s
    port map (
        lpcore_init_event_stream_0_dout => lpcore_init_event_stream_0_dout,
        lpcore_init_event_stream_0_empty_n => lpcore_init_event_stream_0_empty_n,
        lpcore_init_event_stream_0_read => lpcore_kernel_0_U0_lpcore_init_event_stream_0_read,
        lpcore_event_queue_full_stream_0_din => lpcore_kernel_0_U0_lpcore_event_queue_full_stream_0_din,
        lpcore_event_queue_full_stream_0_full_n => lpcore_event_queue_full_stream_0_full_n,
        lpcore_event_queue_full_stream_0_write => lpcore_kernel_0_U0_lpcore_event_queue_full_stream_0_write,
        lpcore_anti_message_stream_0_dout => lpcore_anti_message_stream_0_dout,
        lpcore_anti_message_stream_0_empty_n => lpcore_anti_message_stream_0_empty_n,
        lpcore_anti_message_stream_0_read => lpcore_kernel_0_U0_lpcore_anti_message_stream_0_read,
        lpcore_enqueue_event_stream_0_dout => lpcore_enqueue_event_stream_0_dout,
        lpcore_enqueue_event_stream_0_empty_n => lpcore_enqueue_event_stream_0_empty_n,
        lpcore_enqueue_event_stream_0_read => lpcore_kernel_0_U0_lpcore_enqueue_event_stream_0_read,
        lpcore_output_event_stream_0_din => lpcore_kernel_0_U0_lpcore_output_event_stream_0_din,
        lpcore_output_event_stream_0_full_n => lpcore_output_event_stream_0_full_n,
        lpcore_output_event_stream_0_write => lpcore_kernel_0_U0_lpcore_output_event_stream_0_write,
        lpcore_cancellation_unit_output_stream_0_din => lpcore_kernel_0_U0_lpcore_cancellation_unit_output_stream_0_din,
        lpcore_cancellation_unit_output_stream_0_full_n => lpcore_cancellation_unit_output_stream_0_full_n,
        lpcore_cancellation_unit_output_stream_0_write => lpcore_kernel_0_U0_lpcore_cancellation_unit_output_stream_0_write,
        lpcore_commit_time_stream_0_dout => lpcore_commit_time_stream_0_dout,
        lpcore_commit_time_stream_0_empty_n => lpcore_commit_time_stream_0_empty_n,
        lpcore_commit_time_stream_0_read => lpcore_kernel_0_U0_lpcore_commit_time_stream_0_read,
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_ready => lpcore_kernel_0_U0_ap_ready);

    lpcore_kernel_1_U0 : component simulation_top_lpcore_kernel_1_s
    port map (
        lpcore_init_event_stream_1_dout => lpcore_init_event_stream_1_dout,
        lpcore_init_event_stream_1_empty_n => lpcore_init_event_stream_1_empty_n,
        lpcore_init_event_stream_1_read => lpcore_kernel_1_U0_lpcore_init_event_stream_1_read,
        lpcore_event_queue_full_stream_1_din => lpcore_kernel_1_U0_lpcore_event_queue_full_stream_1_din,
        lpcore_event_queue_full_stream_1_full_n => lpcore_event_queue_full_stream_1_full_n,
        lpcore_event_queue_full_stream_1_write => lpcore_kernel_1_U0_lpcore_event_queue_full_stream_1_write,
        lpcore_anti_message_stream_1_dout => lpcore_anti_message_stream_1_dout,
        lpcore_anti_message_stream_1_empty_n => lpcore_anti_message_stream_1_empty_n,
        lpcore_anti_message_stream_1_read => lpcore_kernel_1_U0_lpcore_anti_message_stream_1_read,
        lpcore_enqueue_event_stream_1_dout => lpcore_enqueue_event_stream_1_dout,
        lpcore_enqueue_event_stream_1_empty_n => lpcore_enqueue_event_stream_1_empty_n,
        lpcore_enqueue_event_stream_1_read => lpcore_kernel_1_U0_lpcore_enqueue_event_stream_1_read,
        lpcore_output_event_stream_1_din => lpcore_kernel_1_U0_lpcore_output_event_stream_1_din,
        lpcore_output_event_stream_1_full_n => lpcore_output_event_stream_1_full_n,
        lpcore_output_event_stream_1_write => lpcore_kernel_1_U0_lpcore_output_event_stream_1_write,
        lpcore_cancellation_unit_output_stream_1_din => lpcore_kernel_1_U0_lpcore_cancellation_unit_output_stream_1_din,
        lpcore_cancellation_unit_output_stream_1_full_n => lpcore_cancellation_unit_output_stream_1_full_n,
        lpcore_cancellation_unit_output_stream_1_write => lpcore_kernel_1_U0_lpcore_cancellation_unit_output_stream_1_write,
        lpcore_commit_time_stream_1_dout => lpcore_commit_time_stream_1_dout,
        lpcore_commit_time_stream_1_empty_n => lpcore_commit_time_stream_1_empty_n,
        lpcore_commit_time_stream_1_read => lpcore_kernel_1_U0_lpcore_commit_time_stream_1_read,
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_ready => lpcore_kernel_1_U0_ap_ready);




    lpcore_anti_message_stream_0_read <= lpcore_kernel_0_U0_lpcore_anti_message_stream_0_read;
    lpcore_anti_message_stream_1_read <= lpcore_kernel_1_U0_lpcore_anti_message_stream_1_read;
    lpcore_cancellation_unit_output_stream_0_din <= lpcore_kernel_0_U0_lpcore_cancellation_unit_output_stream_0_din;
    lpcore_cancellation_unit_output_stream_0_write <= lpcore_kernel_0_U0_lpcore_cancellation_unit_output_stream_0_write;
    lpcore_cancellation_unit_output_stream_1_din <= lpcore_kernel_1_U0_lpcore_cancellation_unit_output_stream_1_din;
    lpcore_cancellation_unit_output_stream_1_write <= lpcore_kernel_1_U0_lpcore_cancellation_unit_output_stream_1_write;
    lpcore_commit_time_stream_0_read <= lpcore_kernel_0_U0_lpcore_commit_time_stream_0_read;
    lpcore_commit_time_stream_1_read <= lpcore_kernel_1_U0_lpcore_commit_time_stream_1_read;
    lpcore_enqueue_event_stream_0_read <= lpcore_kernel_0_U0_lpcore_enqueue_event_stream_0_read;
    lpcore_enqueue_event_stream_1_read <= lpcore_kernel_1_U0_lpcore_enqueue_event_stream_1_read;
    lpcore_event_queue_full_stream_0_din <= lpcore_kernel_0_U0_lpcore_event_queue_full_stream_0_din;
    lpcore_event_queue_full_stream_0_write <= lpcore_kernel_0_U0_lpcore_event_queue_full_stream_0_write;
    lpcore_event_queue_full_stream_1_din <= lpcore_kernel_1_U0_lpcore_event_queue_full_stream_1_din;
    lpcore_event_queue_full_stream_1_write <= lpcore_kernel_1_U0_lpcore_event_queue_full_stream_1_write;
    lpcore_init_event_stream_0_read <= lpcore_kernel_0_U0_lpcore_init_event_stream_0_read;
    lpcore_init_event_stream_1_read <= lpcore_kernel_1_U0_lpcore_init_event_stream_1_read;
    lpcore_output_event_stream_0_din <= lpcore_kernel_0_U0_lpcore_output_event_stream_0_din;
    lpcore_output_event_stream_0_write <= lpcore_kernel_0_U0_lpcore_output_event_stream_0_write;
    lpcore_output_event_stream_1_din <= lpcore_kernel_1_U0_lpcore_output_event_stream_1_din;
    lpcore_output_event_stream_1_write <= lpcore_kernel_1_U0_lpcore_output_event_stream_1_write;
end behav;
