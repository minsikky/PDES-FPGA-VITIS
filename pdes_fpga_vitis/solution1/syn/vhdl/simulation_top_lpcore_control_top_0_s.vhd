-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Version: 2022.1
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity simulation_top_lpcore_control_top_0_s is
port (
    causality_violation_stream_dout : IN STD_LOGIC_VECTOR (47 downto 0);
    causality_violation_stream_empty_n : IN STD_LOGIC;
    causality_violation_stream_read : OUT STD_LOGIC;
    event_queue_rollback_info_stream_din : OUT STD_LOGIC_VECTOR (47 downto 0);
    event_queue_rollback_info_stream_full_n : IN STD_LOGIC;
    event_queue_rollback_info_stream_write : OUT STD_LOGIC;
    state_buffer_rollback_info_stream_din : OUT STD_LOGIC_VECTOR (47 downto 0);
    state_buffer_rollback_info_stream_full_n : IN STD_LOGIC;
    state_buffer_rollback_info_stream_write : OUT STD_LOGIC;
    cancellation_unit_rollback_info_stream_din : OUT STD_LOGIC_VECTOR (47 downto 0);
    cancellation_unit_rollback_info_stream_full_n : IN STD_LOGIC;
    cancellation_unit_rollback_info_stream_write : OUT STD_LOGIC;
    lpcore_commit_time_stream_0_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    lpcore_commit_time_stream_0_empty_n : IN STD_LOGIC;
    lpcore_commit_time_stream_0_read : OUT STD_LOGIC;
    event_queue_commit_time_stream15_din : OUT STD_LOGIC_VECTOR (31 downto 0);
    event_queue_commit_time_stream15_full_n : IN STD_LOGIC;
    event_queue_commit_time_stream15_write : OUT STD_LOGIC;
    state_buffer_commit_time_stream16_din : OUT STD_LOGIC_VECTOR (31 downto 0);
    state_buffer_commit_time_stream16_full_n : IN STD_LOGIC;
    state_buffer_commit_time_stream16_write : OUT STD_LOGIC;
    cancellation_unit_commit_time_stream17_din : OUT STD_LOGIC_VECTOR (31 downto 0);
    cancellation_unit_commit_time_stream17_full_n : IN STD_LOGIC;
    cancellation_unit_commit_time_stream17_write : OUT STD_LOGIC;
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_ready : OUT STD_LOGIC );
end;


architecture behav of simulation_top_lpcore_control_top_0_s is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_logic_0 : STD_LOGIC := '0';

attribute shreg_extract : string;
    signal lpcore_rollback_control_U0_ap_start : STD_LOGIC;
    signal lpcore_rollback_control_U0_ap_done : STD_LOGIC;
    signal lpcore_rollback_control_U0_ap_continue : STD_LOGIC;
    signal lpcore_rollback_control_U0_ap_idle : STD_LOGIC;
    signal lpcore_rollback_control_U0_ap_ready : STD_LOGIC;
    signal lpcore_rollback_control_U0_causality_violation_stream_read : STD_LOGIC;
    signal lpcore_rollback_control_U0_event_queue_rollback_info_stream_din : STD_LOGIC_VECTOR (47 downto 0);
    signal lpcore_rollback_control_U0_event_queue_rollback_info_stream_write : STD_LOGIC;
    signal lpcore_rollback_control_U0_state_buffer_rollback_info_stream_din : STD_LOGIC_VECTOR (47 downto 0);
    signal lpcore_rollback_control_U0_state_buffer_rollback_info_stream_write : STD_LOGIC;
    signal lpcore_rollback_control_U0_cancellation_unit_rollback_info_stream_din : STD_LOGIC_VECTOR (47 downto 0);
    signal lpcore_rollback_control_U0_cancellation_unit_rollback_info_stream_write : STD_LOGIC;
    signal lpcore_commit_control_U0_ap_start : STD_LOGIC;
    signal lpcore_commit_control_U0_ap_done : STD_LOGIC;
    signal lpcore_commit_control_U0_ap_continue : STD_LOGIC;
    signal lpcore_commit_control_U0_ap_idle : STD_LOGIC;
    signal lpcore_commit_control_U0_ap_ready : STD_LOGIC;
    signal lpcore_commit_control_U0_lpcore_commit_time_stream_0_read : STD_LOGIC;
    signal lpcore_commit_control_U0_event_queue_commit_time_stream15_din : STD_LOGIC_VECTOR (31 downto 0);
    signal lpcore_commit_control_U0_event_queue_commit_time_stream15_write : STD_LOGIC;
    signal lpcore_commit_control_U0_state_buffer_commit_time_stream16_din : STD_LOGIC_VECTOR (31 downto 0);
    signal lpcore_commit_control_U0_state_buffer_commit_time_stream16_write : STD_LOGIC;
    signal lpcore_commit_control_U0_cancellation_unit_commit_time_stream17_din : STD_LOGIC_VECTOR (31 downto 0);
    signal lpcore_commit_control_U0_cancellation_unit_commit_time_stream17_write : STD_LOGIC;

    component simulation_top_lpcore_rollback_control IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        causality_violation_stream_dout : IN STD_LOGIC_VECTOR (47 downto 0);
        causality_violation_stream_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
        causality_violation_stream_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
        causality_violation_stream_empty_n : IN STD_LOGIC;
        causality_violation_stream_read : OUT STD_LOGIC;
        event_queue_rollback_info_stream_din : OUT STD_LOGIC_VECTOR (47 downto 0);
        event_queue_rollback_info_stream_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
        event_queue_rollback_info_stream_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
        event_queue_rollback_info_stream_full_n : IN STD_LOGIC;
        event_queue_rollback_info_stream_write : OUT STD_LOGIC;
        state_buffer_rollback_info_stream_din : OUT STD_LOGIC_VECTOR (47 downto 0);
        state_buffer_rollback_info_stream_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
        state_buffer_rollback_info_stream_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
        state_buffer_rollback_info_stream_full_n : IN STD_LOGIC;
        state_buffer_rollback_info_stream_write : OUT STD_LOGIC;
        cancellation_unit_rollback_info_stream_din : OUT STD_LOGIC_VECTOR (47 downto 0);
        cancellation_unit_rollback_info_stream_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
        cancellation_unit_rollback_info_stream_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
        cancellation_unit_rollback_info_stream_full_n : IN STD_LOGIC;
        cancellation_unit_rollback_info_stream_write : OUT STD_LOGIC );
    end component;


    component simulation_top_lpcore_commit_control IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        lpcore_commit_time_stream_0_dout : IN STD_LOGIC_VECTOR (31 downto 0);
        lpcore_commit_time_stream_0_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
        lpcore_commit_time_stream_0_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
        lpcore_commit_time_stream_0_empty_n : IN STD_LOGIC;
        lpcore_commit_time_stream_0_read : OUT STD_LOGIC;
        event_queue_commit_time_stream15_din : OUT STD_LOGIC_VECTOR (31 downto 0);
        event_queue_commit_time_stream15_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
        event_queue_commit_time_stream15_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
        event_queue_commit_time_stream15_full_n : IN STD_LOGIC;
        event_queue_commit_time_stream15_write : OUT STD_LOGIC;
        state_buffer_commit_time_stream16_din : OUT STD_LOGIC_VECTOR (31 downto 0);
        state_buffer_commit_time_stream16_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
        state_buffer_commit_time_stream16_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
        state_buffer_commit_time_stream16_full_n : IN STD_LOGIC;
        state_buffer_commit_time_stream16_write : OUT STD_LOGIC;
        cancellation_unit_commit_time_stream17_din : OUT STD_LOGIC_VECTOR (31 downto 0);
        cancellation_unit_commit_time_stream17_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
        cancellation_unit_commit_time_stream17_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
        cancellation_unit_commit_time_stream17_full_n : IN STD_LOGIC;
        cancellation_unit_commit_time_stream17_write : OUT STD_LOGIC );
    end component;



begin
    lpcore_rollback_control_U0 : component simulation_top_lpcore_rollback_control
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => lpcore_rollback_control_U0_ap_start,
        ap_done => lpcore_rollback_control_U0_ap_done,
        ap_continue => lpcore_rollback_control_U0_ap_continue,
        ap_idle => lpcore_rollback_control_U0_ap_idle,
        ap_ready => lpcore_rollback_control_U0_ap_ready,
        causality_violation_stream_dout => causality_violation_stream_dout,
        causality_violation_stream_num_data_valid => ap_const_lv2_0,
        causality_violation_stream_fifo_cap => ap_const_lv2_0,
        causality_violation_stream_empty_n => causality_violation_stream_empty_n,
        causality_violation_stream_read => lpcore_rollback_control_U0_causality_violation_stream_read,
        event_queue_rollback_info_stream_din => lpcore_rollback_control_U0_event_queue_rollback_info_stream_din,
        event_queue_rollback_info_stream_num_data_valid => ap_const_lv2_0,
        event_queue_rollback_info_stream_fifo_cap => ap_const_lv2_0,
        event_queue_rollback_info_stream_full_n => event_queue_rollback_info_stream_full_n,
        event_queue_rollback_info_stream_write => lpcore_rollback_control_U0_event_queue_rollback_info_stream_write,
        state_buffer_rollback_info_stream_din => lpcore_rollback_control_U0_state_buffer_rollback_info_stream_din,
        state_buffer_rollback_info_stream_num_data_valid => ap_const_lv2_0,
        state_buffer_rollback_info_stream_fifo_cap => ap_const_lv2_0,
        state_buffer_rollback_info_stream_full_n => state_buffer_rollback_info_stream_full_n,
        state_buffer_rollback_info_stream_write => lpcore_rollback_control_U0_state_buffer_rollback_info_stream_write,
        cancellation_unit_rollback_info_stream_din => lpcore_rollback_control_U0_cancellation_unit_rollback_info_stream_din,
        cancellation_unit_rollback_info_stream_num_data_valid => ap_const_lv2_0,
        cancellation_unit_rollback_info_stream_fifo_cap => ap_const_lv2_0,
        cancellation_unit_rollback_info_stream_full_n => cancellation_unit_rollback_info_stream_full_n,
        cancellation_unit_rollback_info_stream_write => lpcore_rollback_control_U0_cancellation_unit_rollback_info_stream_write);

    lpcore_commit_control_U0 : component simulation_top_lpcore_commit_control
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => lpcore_commit_control_U0_ap_start,
        ap_done => lpcore_commit_control_U0_ap_done,
        ap_continue => lpcore_commit_control_U0_ap_continue,
        ap_idle => lpcore_commit_control_U0_ap_idle,
        ap_ready => lpcore_commit_control_U0_ap_ready,
        lpcore_commit_time_stream_0_dout => lpcore_commit_time_stream_0_dout,
        lpcore_commit_time_stream_0_num_data_valid => ap_const_lv2_0,
        lpcore_commit_time_stream_0_fifo_cap => ap_const_lv2_0,
        lpcore_commit_time_stream_0_empty_n => lpcore_commit_time_stream_0_empty_n,
        lpcore_commit_time_stream_0_read => lpcore_commit_control_U0_lpcore_commit_time_stream_0_read,
        event_queue_commit_time_stream15_din => lpcore_commit_control_U0_event_queue_commit_time_stream15_din,
        event_queue_commit_time_stream15_num_data_valid => ap_const_lv2_0,
        event_queue_commit_time_stream15_fifo_cap => ap_const_lv2_0,
        event_queue_commit_time_stream15_full_n => event_queue_commit_time_stream15_full_n,
        event_queue_commit_time_stream15_write => lpcore_commit_control_U0_event_queue_commit_time_stream15_write,
        state_buffer_commit_time_stream16_din => lpcore_commit_control_U0_state_buffer_commit_time_stream16_din,
        state_buffer_commit_time_stream16_num_data_valid => ap_const_lv2_0,
        state_buffer_commit_time_stream16_fifo_cap => ap_const_lv2_0,
        state_buffer_commit_time_stream16_full_n => state_buffer_commit_time_stream16_full_n,
        state_buffer_commit_time_stream16_write => lpcore_commit_control_U0_state_buffer_commit_time_stream16_write,
        cancellation_unit_commit_time_stream17_din => lpcore_commit_control_U0_cancellation_unit_commit_time_stream17_din,
        cancellation_unit_commit_time_stream17_num_data_valid => ap_const_lv2_0,
        cancellation_unit_commit_time_stream17_fifo_cap => ap_const_lv2_0,
        cancellation_unit_commit_time_stream17_full_n => cancellation_unit_commit_time_stream17_full_n,
        cancellation_unit_commit_time_stream17_write => lpcore_commit_control_U0_cancellation_unit_commit_time_stream17_write);




    ap_ready <= ap_const_logic_1;
    cancellation_unit_commit_time_stream17_din <= lpcore_commit_control_U0_cancellation_unit_commit_time_stream17_din;
    cancellation_unit_commit_time_stream17_write <= lpcore_commit_control_U0_cancellation_unit_commit_time_stream17_write;
    cancellation_unit_rollback_info_stream_din <= lpcore_rollback_control_U0_cancellation_unit_rollback_info_stream_din;
    cancellation_unit_rollback_info_stream_write <= lpcore_rollback_control_U0_cancellation_unit_rollback_info_stream_write;
    causality_violation_stream_read <= lpcore_rollback_control_U0_causality_violation_stream_read;
    event_queue_commit_time_stream15_din <= lpcore_commit_control_U0_event_queue_commit_time_stream15_din;
    event_queue_commit_time_stream15_write <= lpcore_commit_control_U0_event_queue_commit_time_stream15_write;
    event_queue_rollback_info_stream_din <= lpcore_rollback_control_U0_event_queue_rollback_info_stream_din;
    event_queue_rollback_info_stream_write <= lpcore_rollback_control_U0_event_queue_rollback_info_stream_write;
    lpcore_commit_control_U0_ap_continue <= ap_const_logic_1;
    lpcore_commit_control_U0_ap_start <= ap_const_logic_1;
    lpcore_commit_time_stream_0_read <= lpcore_commit_control_U0_lpcore_commit_time_stream_0_read;
    lpcore_rollback_control_U0_ap_continue <= ap_const_logic_1;
    lpcore_rollback_control_U0_ap_start <= ap_const_logic_1;
    state_buffer_commit_time_stream16_din <= lpcore_commit_control_U0_state_buffer_commit_time_stream16_din;
    state_buffer_commit_time_stream16_write <= lpcore_commit_control_U0_state_buffer_commit_time_stream16_write;
    state_buffer_rollback_info_stream_din <= lpcore_rollback_control_U0_state_buffer_rollback_info_stream_din;
    state_buffer_rollback_info_stream_write <= lpcore_rollback_control_U0_state_buffer_rollback_info_stream_write;
end behav;
