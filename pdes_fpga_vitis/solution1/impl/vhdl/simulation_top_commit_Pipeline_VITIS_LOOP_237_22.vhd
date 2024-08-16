-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Version: 2022.1
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity simulation_top_commit_Pipeline_VITIS_LOOP_237_22 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    this_8_0_reload : IN STD_LOGIC_VECTOR (15 downto 0);
    this_6_0_reload : IN STD_LOGIC_VECTOR (15 downto 0);
    this_2_address0 : OUT STD_LOGIC_VECTOR (1 downto 0);
    this_2_ce0 : OUT STD_LOGIC;
    this_2_we0 : OUT STD_LOGIC;
    this_2_d0 : OUT STD_LOGIC_VECTOR (15 downto 0);
    this_4_address0 : OUT STD_LOGIC_VECTOR (1 downto 0);
    this_4_ce0 : OUT STD_LOGIC;
    this_4_we0 : OUT STD_LOGIC;
    this_4_d0 : OUT STD_LOGIC_VECTOR (15 downto 0);
    this_4_q0 : IN STD_LOGIC_VECTOR (15 downto 0);
    this_1_address0 : OUT STD_LOGIC_VECTOR (1 downto 0);
    this_1_ce0 : OUT STD_LOGIC;
    this_1_we0 : OUT STD_LOGIC;
    this_1_d0 : OUT STD_LOGIC_VECTOR (15 downto 0);
    this_1_address1 : OUT STD_LOGIC_VECTOR (1 downto 0);
    this_1_ce1 : OUT STD_LOGIC;
    this_1_q1 : IN STD_LOGIC_VECTOR (15 downto 0);
    this_0_2_address0 : OUT STD_LOGIC_VECTOR (6 downto 0);
    this_0_2_ce0 : OUT STD_LOGIC;
    this_0_2_we0 : OUT STD_LOGIC;
    this_0_2_d0 : OUT STD_LOGIC_VECTOR (15 downto 0);
    this_0_2_q0 : IN STD_LOGIC_VECTOR (15 downto 0);
    this_0_0_1_address0 : OUT STD_LOGIC_VECTOR (6 downto 0);
    this_0_0_1_ce0 : OUT STD_LOGIC;
    this_0_0_1_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
    commit_time : IN STD_LOGIC_VECTOR (31 downto 0);
    this_8_1_out : OUT STD_LOGIC_VECTOR (15 downto 0);
    this_8_1_out_ap_vld : OUT STD_LOGIC;
    this_6_1_out : OUT STD_LOGIC_VECTOR (15 downto 0);
    this_6_1_out_ap_vld : OUT STD_LOGIC );
end;


architecture behav of simulation_top_commit_Pipeline_VITIS_LOOP_237_22 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (2 downto 0) := "001";
    constant ap_ST_fsm_pp0_stage1 : STD_LOGIC_VECTOR (2 downto 0) := "010";
    constant ap_ST_fsm_pp0_stage2 : STD_LOGIC_VECTOR (2 downto 0) := "100";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv64_1 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000001";
    constant ap_const_lv64_FFFFFFFFFFFFFFFF : STD_LOGIC_VECTOR (63 downto 0) := "1111111111111111111111111111111111111111111111111111111111111111";
    constant ap_const_lv16_0 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
    constant ap_const_lv16_FFFF : STD_LOGIC_VECTOR (15 downto 0) := "1111111111111111";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (2 downto 0) := "001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_CS_fsm_pp0_stage2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage2 : signal is "none";
    signal ap_block_state3_pp0_stage2_iter0 : BOOLEAN;
    signal ap_block_pp0_stage2_subdone : BOOLEAN;
    signal icmp_ln1085_fu_240_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1069_reg_394 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter0_stage2 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state4_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal commit_entry_V_3_fu_221_p3 : STD_LOGIC_VECTOR (15 downto 0);
    signal commit_entry_V_3_reg_388 : STD_LOGIC_VECTOR (15 downto 0);
    signal ap_CS_fsm_pp0_stage1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage1 : signal is "none";
    signal ap_block_state2_pp0_stage1_iter0 : BOOLEAN;
    signal ap_block_pp0_stage1_11001 : BOOLEAN;
    signal icmp_ln1069_fu_229_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal zext_ln587_fu_235_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln587_reg_398 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_block_pp0_stage2_11001 : BOOLEAN;
    signal this_4_addr_reg_415 : STD_LOGIC_VECTOR (1 downto 0);
    signal commit_entry_V_load_6_reg_423 : STD_LOGIC_VECTOR (15 downto 0);
    signal addr_cmp_fu_252_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal addr_cmp_reg_433 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_enable_reg_pp0_iter0_reg : STD_LOGIC := '0';
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal ap_block_pp0_stage1 : BOOLEAN;
    signal ap_block_pp0_stage2 : BOOLEAN;
    signal reuse_addr_reg6_fu_50 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal reuse_reg5_fu_54 : STD_LOGIC_VECTOR (15 downto 0);
    signal reuse_select_fu_287_p3 : STD_LOGIC_VECTOR (15 downto 0);
    signal reuse_addr_reg_fu_58 : STD_LOGIC_VECTOR (63 downto 0);
    signal reuse_reg_fu_62 : STD_LOGIC_VECTOR (15 downto 0);
    signal commit_entry_V_fu_66 : STD_LOGIC_VECTOR (15 downto 0);
    signal commit_entry_V_load_load_fu_323_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal this_8_1_fu_70 : STD_LOGIC_VECTOR (15 downto 0);
    signal add_ln887_fu_269_p2 : STD_LOGIC_VECTOR (15 downto 0);
    signal this_8_1_load_1_load_fu_327_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal ap_block_pp0_stage2_01001 : BOOLEAN;
    signal icmp_ln1065_fu_304_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1065_26_fu_309_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal addr_cmp9_fu_215_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (2 downto 0);
    signal ap_idle_pp0_1to1 : STD_LOGIC;
    signal ap_block_pp0_stage1_subdone : BOOLEAN;
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component simulation_top_flow_control_loop_pipe_sequential_init IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_start_int : OUT STD_LOGIC;
        ap_loop_init : OUT STD_LOGIC;
        ap_ready_int : IN STD_LOGIC;
        ap_loop_exit_ready : IN STD_LOGIC;
        ap_loop_exit_done : IN STD_LOGIC;
        ap_continue_int : OUT STD_LOGIC;
        ap_done_int : IN STD_LOGIC );
    end component;



begin
    flow_control_loop_pipe_sequential_init_U : component simulation_top_flow_control_loop_pipe_sequential_init
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => ap_start,
        ap_ready => ap_ready,
        ap_done => ap_done,
        ap_start_int => ap_start_int,
        ap_loop_init => ap_loop_init,
        ap_ready_int => ap_ready_int,
        ap_loop_exit_ready => ap_condition_exit_pp0_iter0_stage2,
        ap_loop_exit_done => ap_done_int,
        ap_continue_int => ap_continue_int,
        ap_done_int => ap_done_int);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
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
                if ((ap_continue_int = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((ap_loop_exit_ready = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage2_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage2))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter0_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter0_reg <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) then 
                    ap_enable_reg_pp0_iter0_reg <= ap_start_int;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_condition_exit_pp0_iter0_stage2) or ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)))) then 
                    ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage2_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage2))) then 
                    ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
                end if; 
            end if;
        end if;
    end process;


    commit_entry_V_fu_66_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
                commit_entry_V_fu_66 <= this_6_0_reload;
            elsif (((icmp_ln1069_reg_394 = ap_const_lv1_0) and (icmp_ln1085_fu_240_p2 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage2_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage2))) then 
                commit_entry_V_fu_66 <= commit_entry_V_3_reg_388;
            end if; 
        end if;
    end process;

    reuse_addr_reg6_fu_50_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
                reuse_addr_reg6_fu_50(1) <= '1';
                reuse_addr_reg6_fu_50(2) <= '1';
                reuse_addr_reg6_fu_50(3) <= '1';
                reuse_addr_reg6_fu_50(4) <= '1';
                reuse_addr_reg6_fu_50(5) <= '1';
                reuse_addr_reg6_fu_50(6) <= '1';
                reuse_addr_reg6_fu_50(7) <= '1';
                reuse_addr_reg6_fu_50(8) <= '1';
                reuse_addr_reg6_fu_50(9) <= '1';
                reuse_addr_reg6_fu_50(10) <= '1';
                reuse_addr_reg6_fu_50(11) <= '1';
                reuse_addr_reg6_fu_50(12) <= '1';
                reuse_addr_reg6_fu_50(13) <= '1';
                reuse_addr_reg6_fu_50(14) <= '1';
                reuse_addr_reg6_fu_50(15) <= '1';
                reuse_addr_reg6_fu_50(16) <= '1';
                reuse_addr_reg6_fu_50(17) <= '1';
                reuse_addr_reg6_fu_50(18) <= '1';
                reuse_addr_reg6_fu_50(19) <= '1';
                reuse_addr_reg6_fu_50(20) <= '1';
                reuse_addr_reg6_fu_50(21) <= '1';
                reuse_addr_reg6_fu_50(22) <= '1';
                reuse_addr_reg6_fu_50(23) <= '1';
                reuse_addr_reg6_fu_50(24) <= '1';
                reuse_addr_reg6_fu_50(25) <= '1';
                reuse_addr_reg6_fu_50(26) <= '1';
                reuse_addr_reg6_fu_50(27) <= '1';
                reuse_addr_reg6_fu_50(28) <= '1';
                reuse_addr_reg6_fu_50(29) <= '1';
                reuse_addr_reg6_fu_50(30) <= '1';
                reuse_addr_reg6_fu_50(31) <= '1';
                reuse_addr_reg6_fu_50(32) <= '1';
                reuse_addr_reg6_fu_50(33) <= '1';
                reuse_addr_reg6_fu_50(34) <= '1';
                reuse_addr_reg6_fu_50(35) <= '1';
                reuse_addr_reg6_fu_50(36) <= '1';
                reuse_addr_reg6_fu_50(37) <= '1';
                reuse_addr_reg6_fu_50(38) <= '1';
                reuse_addr_reg6_fu_50(39) <= '1';
                reuse_addr_reg6_fu_50(40) <= '1';
                reuse_addr_reg6_fu_50(41) <= '1';
                reuse_addr_reg6_fu_50(42) <= '1';
                reuse_addr_reg6_fu_50(43) <= '1';
                reuse_addr_reg6_fu_50(44) <= '1';
                reuse_addr_reg6_fu_50(45) <= '1';
                reuse_addr_reg6_fu_50(46) <= '1';
                reuse_addr_reg6_fu_50(47) <= '1';
                reuse_addr_reg6_fu_50(48) <= '1';
                reuse_addr_reg6_fu_50(49) <= '1';
                reuse_addr_reg6_fu_50(50) <= '1';
                reuse_addr_reg6_fu_50(51) <= '1';
                reuse_addr_reg6_fu_50(52) <= '1';
                reuse_addr_reg6_fu_50(53) <= '1';
                reuse_addr_reg6_fu_50(54) <= '1';
                reuse_addr_reg6_fu_50(55) <= '1';
                reuse_addr_reg6_fu_50(56) <= '1';
                reuse_addr_reg6_fu_50(57) <= '1';
                reuse_addr_reg6_fu_50(58) <= '1';
                reuse_addr_reg6_fu_50(59) <= '1';
                reuse_addr_reg6_fu_50(60) <= '1';
                reuse_addr_reg6_fu_50(61) <= '1';
                reuse_addr_reg6_fu_50(62) <= '1';
                reuse_addr_reg6_fu_50(63) <= '1';
            elsif (((icmp_ln1069_reg_394 = ap_const_lv1_0) and (icmp_ln1085_fu_240_p2 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage2_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage2))) then 
                reuse_addr_reg6_fu_50(1) <= '0';
                reuse_addr_reg6_fu_50(2) <= '0';
                reuse_addr_reg6_fu_50(3) <= '0';
                reuse_addr_reg6_fu_50(4) <= '0';
                reuse_addr_reg6_fu_50(5) <= '0';
                reuse_addr_reg6_fu_50(6) <= '0';
                reuse_addr_reg6_fu_50(7) <= '0';
                reuse_addr_reg6_fu_50(8) <= '0';
                reuse_addr_reg6_fu_50(9) <= '0';
                reuse_addr_reg6_fu_50(10) <= '0';
                reuse_addr_reg6_fu_50(11) <= '0';
                reuse_addr_reg6_fu_50(12) <= '0';
                reuse_addr_reg6_fu_50(13) <= '0';
                reuse_addr_reg6_fu_50(14) <= '0';
                reuse_addr_reg6_fu_50(15) <= '0';
                reuse_addr_reg6_fu_50(16) <= '0';
                reuse_addr_reg6_fu_50(17) <= '0';
                reuse_addr_reg6_fu_50(18) <= '0';
                reuse_addr_reg6_fu_50(19) <= '0';
                reuse_addr_reg6_fu_50(20) <= '0';
                reuse_addr_reg6_fu_50(21) <= '0';
                reuse_addr_reg6_fu_50(22) <= '0';
                reuse_addr_reg6_fu_50(23) <= '0';
                reuse_addr_reg6_fu_50(24) <= '0';
                reuse_addr_reg6_fu_50(25) <= '0';
                reuse_addr_reg6_fu_50(26) <= '0';
                reuse_addr_reg6_fu_50(27) <= '0';
                reuse_addr_reg6_fu_50(28) <= '0';
                reuse_addr_reg6_fu_50(29) <= '0';
                reuse_addr_reg6_fu_50(30) <= '0';
                reuse_addr_reg6_fu_50(31) <= '0';
                reuse_addr_reg6_fu_50(32) <= '0';
                reuse_addr_reg6_fu_50(33) <= '0';
                reuse_addr_reg6_fu_50(34) <= '0';
                reuse_addr_reg6_fu_50(35) <= '0';
                reuse_addr_reg6_fu_50(36) <= '0';
                reuse_addr_reg6_fu_50(37) <= '0';
                reuse_addr_reg6_fu_50(38) <= '0';
                reuse_addr_reg6_fu_50(39) <= '0';
                reuse_addr_reg6_fu_50(40) <= '0';
                reuse_addr_reg6_fu_50(41) <= '0';
                reuse_addr_reg6_fu_50(42) <= '0';
                reuse_addr_reg6_fu_50(43) <= '0';
                reuse_addr_reg6_fu_50(44) <= '0';
                reuse_addr_reg6_fu_50(45) <= '0';
                reuse_addr_reg6_fu_50(46) <= '0';
                reuse_addr_reg6_fu_50(47) <= '0';
                reuse_addr_reg6_fu_50(48) <= '0';
                reuse_addr_reg6_fu_50(49) <= '0';
                reuse_addr_reg6_fu_50(50) <= '0';
                reuse_addr_reg6_fu_50(51) <= '0';
                reuse_addr_reg6_fu_50(52) <= '0';
                reuse_addr_reg6_fu_50(53) <= '0';
                reuse_addr_reg6_fu_50(54) <= '0';
                reuse_addr_reg6_fu_50(55) <= '0';
                reuse_addr_reg6_fu_50(56) <= '0';
                reuse_addr_reg6_fu_50(57) <= '0';
                reuse_addr_reg6_fu_50(58) <= '0';
                reuse_addr_reg6_fu_50(59) <= '0';
                reuse_addr_reg6_fu_50(60) <= '0';
                reuse_addr_reg6_fu_50(61) <= '0';
                reuse_addr_reg6_fu_50(62) <= '0';
                reuse_addr_reg6_fu_50(63) <= '0';
            end if; 
        end if;
    end process;

    reuse_addr_reg_fu_58_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
                reuse_addr_reg_fu_58 <= ap_const_lv64_FFFFFFFFFFFFFFFF;
            elsif (((icmp_ln1069_reg_394 = ap_const_lv1_0) and (icmp_ln1085_fu_240_p2 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage2_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage2))) then 
                reuse_addr_reg_fu_58 <= zext_ln587_reg_398;
            end if; 
        end if;
    end process;

    reuse_reg5_fu_54_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    reuse_reg5_fu_54 <= ap_const_lv16_0;
                elsif ((ap_enable_reg_pp0_iter1 = ap_const_logic_1)) then 
                    reuse_reg5_fu_54 <= reuse_select_fu_287_p3;
                end if;
            end if; 
        end if;
    end process;

    reuse_reg_fu_62_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    reuse_reg_fu_62 <= ap_const_lv16_0;
                elsif ((ap_enable_reg_pp0_iter1 = ap_const_logic_1)) then 
                    reuse_reg_fu_62 <= commit_entry_V_load_6_reg_423;
                end if;
            end if; 
        end if;
    end process;

    this_8_1_fu_70_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
                this_8_1_fu_70 <= this_8_0_reload;
            elsif (((icmp_ln1069_reg_394 = ap_const_lv1_0) and (icmp_ln1085_fu_240_p2 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage2_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage2))) then 
                this_8_1_fu_70 <= add_ln887_fu_269_p2;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln1069_reg_394 = ap_const_lv1_0) and (icmp_ln1085_fu_240_p2 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage2_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage2))) then
                addr_cmp_reg_433 <= addr_cmp_fu_252_p2;
                commit_entry_V_load_6_reg_423 <= commit_entry_V_fu_66;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then
                commit_entry_V_3_reg_388 <= commit_entry_V_3_fu_221_p3;
                icmp_ln1069_reg_394 <= icmp_ln1069_fu_229_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1) and (icmp_ln1069_fu_229_p2 = ap_const_lv1_0))) then
                    zext_ln587_reg_398(15 downto 0) <= zext_ln587_fu_235_p1(15 downto 0);
            end if;
        end if;
    end process;
    zext_ln587_reg_398(63 downto 16) <= "000000000000000000000000000000000000000000000000";
    reuse_addr_reg6_fu_50(0) <= '1';

    ap_NS_fsm_assign_proc : process (ap_CS_fsm, ap_block_pp0_stage2_subdone, ap_block_pp0_stage0_subdone, ap_idle_pp0_1to1, ap_block_pp0_stage1_subdone, ap_start_int)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_pp0_stage0 => 
                if ((not(((ap_start_int = ap_const_logic_0) and (ap_idle_pp0_1to1 = ap_const_logic_1))) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage1;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                end if;
            when ap_ST_fsm_pp0_stage1 => 
                if ((ap_const_boolean_0 = ap_block_pp0_stage1_subdone)) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage2;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage1;
                end if;
            when ap_ST_fsm_pp0_stage2 => 
                if ((ap_const_boolean_0 = ap_block_pp0_stage2_subdone)) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage2;
                end if;
            when others =>  
                ap_NS_fsm <= "XXX";
        end case;
    end process;
    add_ln887_fu_269_p2 <= std_logic_vector(unsigned(this_8_1_fu_70) + unsigned(ap_const_lv16_FFFF));
    addr_cmp9_fu_215_p2 <= "1" when (reuse_addr_reg6_fu_50 = ap_const_lv64_1) else "0";
    addr_cmp_fu_252_p2 <= "1" when (reuse_addr_reg_fu_58 = zext_ln587_reg_398) else "0";
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
    ap_CS_fsm_pp0_stage1 <= ap_CS_fsm(1);
    ap_CS_fsm_pp0_stage2 <= ap_CS_fsm(2);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage1 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage1_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage1_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage2 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage2_01001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage2_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage2_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state1_pp0_stage0_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state2_pp0_stage1_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state3_pp0_stage2_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state4_pp0_stage0_iter1 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_condition_exit_pp0_iter0_stage2_assign_proc : process(ap_enable_reg_pp0_iter0, ap_CS_fsm_pp0_stage2, ap_block_pp0_stage2_subdone, icmp_ln1085_fu_240_p2, icmp_ln1069_reg_394)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage2_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage2) and ((icmp_ln1069_reg_394 = ap_const_lv1_1) or (icmp_ln1085_fu_240_p2 = ap_const_lv1_1)))) then 
            ap_condition_exit_pp0_iter0_stage2 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter0_stage2 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_int_assign_proc : process(ap_CS_fsm_pp0_stage2, ap_block_pp0_stage2_subdone, ap_loop_exit_ready, ap_done_reg)
    begin
        if (((ap_loop_exit_ready = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage2_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage2))) then 
            ap_done_int <= ap_const_logic_1;
        else 
            ap_done_int <= ap_done_reg;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);

    ap_enable_reg_pp0_iter0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0_reg, ap_start_int)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) then 
            ap_enable_reg_pp0_iter0 <= ap_start_int;
        else 
            ap_enable_reg_pp0_iter0 <= ap_enable_reg_pp0_iter0_reg;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_idle_pp0, ap_start_int)
    begin
        if (((ap_start_int = ap_const_logic_0) and (ap_idle_pp0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_1to1_assign_proc : process(ap_enable_reg_pp0_iter1)
    begin
        if ((ap_enable_reg_pp0_iter1 = ap_const_logic_0)) then 
            ap_idle_pp0_1to1 <= ap_const_logic_1;
        else 
            ap_idle_pp0_1to1 <= ap_const_logic_0;
        end if; 
    end process;

    ap_loop_exit_ready <= ap_condition_exit_pp0_iter0_stage2;

    ap_ready_int_assign_proc : process(ap_enable_reg_pp0_iter0, ap_CS_fsm_pp0_stage2, ap_block_pp0_stage2_subdone)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage2_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage2))) then 
            ap_ready_int <= ap_const_logic_1;
        else 
            ap_ready_int <= ap_const_logic_0;
        end if; 
    end process;

    commit_entry_V_3_fu_221_p3 <= 
        reuse_reg5_fu_54 when (addr_cmp9_fu_215_p2(0) = '1') else 
        this_1_q1;
    commit_entry_V_load_load_fu_323_p1 <= commit_entry_V_fu_66;
    icmp_ln1065_26_fu_309_p2 <= "1" when (reuse_select_fu_287_p3 = ap_const_lv16_FFFF) else "0";
    icmp_ln1065_fu_304_p2 <= "1" when (commit_entry_V_3_reg_388 = this_4_q0) else "0";
    icmp_ln1069_fu_229_p2 <= "1" when (commit_entry_V_3_fu_221_p3 = ap_const_lv16_FFFF) else "0";
    icmp_ln1085_fu_240_p2 <= "1" when (signed(this_0_0_1_q0) > signed(commit_time)) else "0";
    reuse_select_fu_287_p3 <= 
        reuse_reg_fu_62 when (addr_cmp_reg_433(0) = '1') else 
        this_0_2_q0;
    this_0_0_1_address0 <= zext_ln587_fu_235_p1(7 - 1 downto 0);

    this_0_0_1_ce0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_CS_fsm_pp0_stage1, ap_block_pp0_stage1_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
            this_0_0_1_ce0 <= ap_const_logic_1;
        else 
            this_0_0_1_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    this_0_2_address0 <= zext_ln587_reg_398(7 - 1 downto 0);

    this_0_2_ce0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_CS_fsm_pp0_stage2, icmp_ln1085_fu_240_p2, icmp_ln1069_reg_394, ap_block_pp0_stage2_11001)
    begin
        if (((icmp_ln1069_reg_394 = ap_const_lv1_0) and (icmp_ln1085_fu_240_p2 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage2_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage2))) then 
            this_0_2_ce0 <= ap_const_logic_1;
        else 
            this_0_2_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    this_0_2_d0 <= commit_entry_V_fu_66;

    this_0_2_we0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_CS_fsm_pp0_stage2, icmp_ln1085_fu_240_p2, icmp_ln1069_reg_394, ap_block_pp0_stage2_11001)
    begin
        if (((icmp_ln1069_reg_394 = ap_const_lv1_0) and (icmp_ln1085_fu_240_p2 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage2_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage2))) then 
            this_0_2_we0 <= ap_const_logic_1;
        else 
            this_0_2_we0 <= ap_const_logic_0;
        end if; 
    end process;

    this_1_address0 <= ap_const_lv64_1(2 - 1 downto 0);
    this_1_address1 <= ap_const_lv64_1(2 - 1 downto 0);

    this_1_ce0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            this_1_ce0 <= ap_const_logic_1;
        else 
            this_1_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    this_1_ce1_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            this_1_ce1 <= ap_const_logic_1;
        else 
            this_1_ce1 <= ap_const_logic_0;
        end if; 
    end process;

    this_1_d0 <= reuse_select_fu_287_p3;

    this_1_we0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            this_1_we0 <= ap_const_logic_1;
        else 
            this_1_we0 <= ap_const_logic_0;
        end if; 
    end process;

    this_2_address0 <= ap_const_lv64_1(2 - 1 downto 0);

    this_2_ce0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            this_2_ce0 <= ap_const_logic_1;
        else 
            this_2_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    this_2_d0 <= ap_const_lv16_FFFF;

    this_2_we0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001, icmp_ln1065_26_fu_309_p2)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (icmp_ln1065_26_fu_309_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            this_2_we0 <= ap_const_logic_1;
        else 
            this_2_we0 <= ap_const_logic_0;
        end if; 
    end process;

    this_4_addr_reg_415 <= ap_const_lv64_1(2 - 1 downto 0);

    this_4_address0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_CS_fsm_pp0_stage2, this_4_addr_reg_415, ap_block_pp0_stage0, ap_block_pp0_stage2)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            this_4_address0 <= this_4_addr_reg_415;
        elsif (((ap_const_boolean_0 = ap_block_pp0_stage2) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage2))) then 
            this_4_address0 <= ap_const_lv64_1(2 - 1 downto 0);
        else 
            this_4_address0 <= "XX";
        end if; 
    end process;


    this_4_ce0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_CS_fsm_pp0_stage2, ap_block_pp0_stage0_11001, ap_block_pp0_stage2_11001)
    begin
        if ((((ap_const_boolean_0 = ap_block_pp0_stage2_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage2)) or ((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)))) then 
            this_4_ce0 <= ap_const_logic_1;
        else 
            this_4_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    this_4_d0 <= ap_const_lv16_FFFF;

    this_4_we0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001, icmp_ln1065_fu_304_p2)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (icmp_ln1065_fu_304_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            this_4_we0 <= ap_const_logic_1;
        else 
            this_4_we0 <= ap_const_logic_0;
        end if; 
    end process;


    this_6_1_out_assign_proc : process(ap_CS_fsm_pp0_stage2, icmp_ln1085_fu_240_p2, icmp_ln1069_reg_394, commit_entry_V_fu_66, commit_entry_V_load_load_fu_323_p1, ap_block_pp0_stage2_01001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage2_01001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage2))) then
            if ((icmp_ln1069_reg_394 = ap_const_lv1_1)) then 
                this_6_1_out <= commit_entry_V_load_load_fu_323_p1;
            elsif (((icmp_ln1069_reg_394 = ap_const_lv1_0) and (icmp_ln1085_fu_240_p2 = ap_const_lv1_1))) then 
                this_6_1_out <= commit_entry_V_fu_66;
            else 
                this_6_1_out <= "XXXXXXXXXXXXXXXX";
            end if;
        else 
            this_6_1_out <= "XXXXXXXXXXXXXXXX";
        end if; 
    end process;


    this_6_1_out_ap_vld_assign_proc : process(ap_CS_fsm_pp0_stage2, icmp_ln1085_fu_240_p2, icmp_ln1069_reg_394, ap_block_pp0_stage2_11001)
    begin
        if ((((icmp_ln1069_reg_394 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage2_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage2)) or ((icmp_ln1069_reg_394 = ap_const_lv1_0) and (icmp_ln1085_fu_240_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage2_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage2)))) then 
            this_6_1_out_ap_vld <= ap_const_logic_1;
        else 
            this_6_1_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    this_8_1_load_1_load_fu_327_p1 <= this_8_1_fu_70;

    this_8_1_out_assign_proc : process(ap_CS_fsm_pp0_stage2, icmp_ln1085_fu_240_p2, icmp_ln1069_reg_394, this_8_1_fu_70, this_8_1_load_1_load_fu_327_p1, ap_block_pp0_stage2_01001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage2_01001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage2))) then
            if ((icmp_ln1069_reg_394 = ap_const_lv1_1)) then 
                this_8_1_out <= this_8_1_load_1_load_fu_327_p1;
            elsif (((icmp_ln1069_reg_394 = ap_const_lv1_0) and (icmp_ln1085_fu_240_p2 = ap_const_lv1_1))) then 
                this_8_1_out <= this_8_1_fu_70;
            else 
                this_8_1_out <= "XXXXXXXXXXXXXXXX";
            end if;
        else 
            this_8_1_out <= "XXXXXXXXXXXXXXXX";
        end if; 
    end process;


    this_8_1_out_ap_vld_assign_proc : process(ap_CS_fsm_pp0_stage2, icmp_ln1085_fu_240_p2, icmp_ln1069_reg_394, ap_block_pp0_stage2_11001)
    begin
        if ((((icmp_ln1069_reg_394 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage2_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage2)) or ((icmp_ln1069_reg_394 = ap_const_lv1_0) and (icmp_ln1085_fu_240_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage2_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage2)))) then 
            this_8_1_out_ap_vld <= ap_const_logic_1;
        else 
            this_8_1_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    zext_ln587_fu_235_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(commit_entry_V_3_fu_221_p3),64));
end behav;
