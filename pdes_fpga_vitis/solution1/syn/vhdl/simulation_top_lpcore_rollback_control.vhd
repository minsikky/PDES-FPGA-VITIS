-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Version: 2022.1
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity simulation_top_lpcore_rollback_control is
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
end;


architecture behav of simulation_top_lpcore_rollback_control is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;

attribute shreg_extract : string;
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal causality_violation_stream_blk_n : STD_LOGIC;
    signal event_queue_rollback_info_stream_blk_n : STD_LOGIC;
    signal state_buffer_rollback_info_stream_blk_n : STD_LOGIC;
    signal cancellation_unit_rollback_info_stream_blk_n : STD_LOGIC;
    signal ap_block_state1 : BOOLEAN;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;


begin




    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif ((not(((ap_start = ap_const_logic_0) or (cancellation_unit_rollback_info_stream_full_n = ap_const_logic_0) or (state_buffer_rollback_info_stream_full_n = ap_const_logic_0) or (event_queue_rollback_info_stream_full_n = ap_const_logic_0) or (causality_violation_stream_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_NS_fsm_assign_proc : process (ap_start, ap_done_reg, ap_CS_fsm, ap_CS_fsm_state1, causality_violation_stream_empty_n, event_queue_rollback_info_stream_full_n, state_buffer_rollback_info_stream_full_n, cancellation_unit_rollback_info_stream_full_n)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start, ap_done_reg, causality_violation_stream_empty_n, event_queue_rollback_info_stream_full_n, state_buffer_rollback_info_stream_full_n, cancellation_unit_rollback_info_stream_full_n)
    begin
        if (((ap_start = ap_const_logic_0) or (cancellation_unit_rollback_info_stream_full_n = ap_const_logic_0) or (state_buffer_rollback_info_stream_full_n = ap_const_logic_0) or (event_queue_rollback_info_stream_full_n = ap_const_logic_0) or (causality_violation_stream_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_block_state1_assign_proc : process(ap_start, ap_done_reg, causality_violation_stream_empty_n, event_queue_rollback_info_stream_full_n, state_buffer_rollback_info_stream_full_n, cancellation_unit_rollback_info_stream_full_n)
    begin
                ap_block_state1 <= ((ap_start = ap_const_logic_0) or (cancellation_unit_rollback_info_stream_full_n = ap_const_logic_0) or (state_buffer_rollback_info_stream_full_n = ap_const_logic_0) or (event_queue_rollback_info_stream_full_n = ap_const_logic_0) or (causality_violation_stream_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1));
    end process;


    ap_done_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, causality_violation_stream_empty_n, event_queue_rollback_info_stream_full_n, state_buffer_rollback_info_stream_full_n, cancellation_unit_rollback_info_stream_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (cancellation_unit_rollback_info_stream_full_n = ap_const_logic_0) or (state_buffer_rollback_info_stream_full_n = ap_const_logic_0) or (event_queue_rollback_info_stream_full_n = ap_const_logic_0) or (causality_violation_stream_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_done_reg;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, causality_violation_stream_empty_n, event_queue_rollback_info_stream_full_n, state_buffer_rollback_info_stream_full_n, cancellation_unit_rollback_info_stream_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (cancellation_unit_rollback_info_stream_full_n = ap_const_logic_0) or (state_buffer_rollback_info_stream_full_n = ap_const_logic_0) or (event_queue_rollback_info_stream_full_n = ap_const_logic_0) or (causality_violation_stream_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    cancellation_unit_rollback_info_stream_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, cancellation_unit_rollback_info_stream_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            cancellation_unit_rollback_info_stream_blk_n <= cancellation_unit_rollback_info_stream_full_n;
        else 
            cancellation_unit_rollback_info_stream_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    cancellation_unit_rollback_info_stream_din <= causality_violation_stream_dout;

    cancellation_unit_rollback_info_stream_write_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, causality_violation_stream_empty_n, event_queue_rollback_info_stream_full_n, state_buffer_rollback_info_stream_full_n, cancellation_unit_rollback_info_stream_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (cancellation_unit_rollback_info_stream_full_n = ap_const_logic_0) or (state_buffer_rollback_info_stream_full_n = ap_const_logic_0) or (event_queue_rollback_info_stream_full_n = ap_const_logic_0) or (causality_violation_stream_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            cancellation_unit_rollback_info_stream_write <= ap_const_logic_1;
        else 
            cancellation_unit_rollback_info_stream_write <= ap_const_logic_0;
        end if; 
    end process;


    causality_violation_stream_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, causality_violation_stream_empty_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            causality_violation_stream_blk_n <= causality_violation_stream_empty_n;
        else 
            causality_violation_stream_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    causality_violation_stream_read_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, causality_violation_stream_empty_n, event_queue_rollback_info_stream_full_n, state_buffer_rollback_info_stream_full_n, cancellation_unit_rollback_info_stream_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (cancellation_unit_rollback_info_stream_full_n = ap_const_logic_0) or (state_buffer_rollback_info_stream_full_n = ap_const_logic_0) or (event_queue_rollback_info_stream_full_n = ap_const_logic_0) or (causality_violation_stream_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            causality_violation_stream_read <= ap_const_logic_1;
        else 
            causality_violation_stream_read <= ap_const_logic_0;
        end if; 
    end process;


    event_queue_rollback_info_stream_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, event_queue_rollback_info_stream_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            event_queue_rollback_info_stream_blk_n <= event_queue_rollback_info_stream_full_n;
        else 
            event_queue_rollback_info_stream_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    event_queue_rollback_info_stream_din <= causality_violation_stream_dout;

    event_queue_rollback_info_stream_write_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, causality_violation_stream_empty_n, event_queue_rollback_info_stream_full_n, state_buffer_rollback_info_stream_full_n, cancellation_unit_rollback_info_stream_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (cancellation_unit_rollback_info_stream_full_n = ap_const_logic_0) or (state_buffer_rollback_info_stream_full_n = ap_const_logic_0) or (event_queue_rollback_info_stream_full_n = ap_const_logic_0) or (causality_violation_stream_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            event_queue_rollback_info_stream_write <= ap_const_logic_1;
        else 
            event_queue_rollback_info_stream_write <= ap_const_logic_0;
        end if; 
    end process;


    state_buffer_rollback_info_stream_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, state_buffer_rollback_info_stream_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            state_buffer_rollback_info_stream_blk_n <= state_buffer_rollback_info_stream_full_n;
        else 
            state_buffer_rollback_info_stream_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    state_buffer_rollback_info_stream_din <= causality_violation_stream_dout;

    state_buffer_rollback_info_stream_write_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, causality_violation_stream_empty_n, event_queue_rollback_info_stream_full_n, state_buffer_rollback_info_stream_full_n, cancellation_unit_rollback_info_stream_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (cancellation_unit_rollback_info_stream_full_n = ap_const_logic_0) or (state_buffer_rollback_info_stream_full_n = ap_const_logic_0) or (event_queue_rollback_info_stream_full_n = ap_const_logic_0) or (causality_violation_stream_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            state_buffer_rollback_info_stream_write <= ap_const_logic_1;
        else 
            state_buffer_rollback_info_stream_write <= ap_const_logic_0;
        end if; 
    end process;

end behav;
