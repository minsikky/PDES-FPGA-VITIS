-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
-- Date        : Thu Aug 15 18:03:21 2024
-- Host        : i1z running 64-bit Red Hat Enterprise Linux Server release 7.9 (Maipo)
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ bd_0_hls_inst_0_stub.vhdl
-- Design      : bd_0_hls_inst_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu7ev-ffvc1156-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    lpcore_init_event_stream_0_dout : in STD_LOGIC_VECTOR ( 128 downto 0 );
    lpcore_init_event_stream_0_empty_n : in STD_LOGIC;
    lpcore_init_event_stream_0_read : out STD_LOGIC;
    lpcore_init_event_stream_1_dout : in STD_LOGIC_VECTOR ( 128 downto 0 );
    lpcore_init_event_stream_1_empty_n : in STD_LOGIC;
    lpcore_init_event_stream_1_read : out STD_LOGIC;
    lpcore_event_queue_full_stream_0_din : out STD_LOGIC_VECTOR ( 0 to 0 );
    lpcore_event_queue_full_stream_0_full_n : in STD_LOGIC;
    lpcore_event_queue_full_stream_0_write : out STD_LOGIC;
    lpcore_event_queue_full_stream_1_din : out STD_LOGIC_VECTOR ( 0 to 0 );
    lpcore_event_queue_full_stream_1_full_n : in STD_LOGIC;
    lpcore_event_queue_full_stream_1_write : out STD_LOGIC;
    lpcore_anti_message_stream_0_dout : in STD_LOGIC_VECTOR ( 128 downto 0 );
    lpcore_anti_message_stream_0_empty_n : in STD_LOGIC;
    lpcore_anti_message_stream_0_read : out STD_LOGIC;
    lpcore_anti_message_stream_1_dout : in STD_LOGIC_VECTOR ( 128 downto 0 );
    lpcore_anti_message_stream_1_empty_n : in STD_LOGIC;
    lpcore_anti_message_stream_1_read : out STD_LOGIC;
    lpcore_enqueue_event_stream_0_dout : in STD_LOGIC_VECTOR ( 128 downto 0 );
    lpcore_enqueue_event_stream_0_empty_n : in STD_LOGIC;
    lpcore_enqueue_event_stream_0_read : out STD_LOGIC;
    lpcore_enqueue_event_stream_1_dout : in STD_LOGIC_VECTOR ( 128 downto 0 );
    lpcore_enqueue_event_stream_1_empty_n : in STD_LOGIC;
    lpcore_enqueue_event_stream_1_read : out STD_LOGIC;
    lpcore_output_event_stream_0_din : out STD_LOGIC_VECTOR ( 128 downto 0 );
    lpcore_output_event_stream_0_full_n : in STD_LOGIC;
    lpcore_output_event_stream_0_write : out STD_LOGIC;
    lpcore_output_event_stream_1_din : out STD_LOGIC_VECTOR ( 128 downto 0 );
    lpcore_output_event_stream_1_full_n : in STD_LOGIC;
    lpcore_output_event_stream_1_write : out STD_LOGIC;
    lpcore_cancellation_unit_output_stream_0_din : out STD_LOGIC_VECTOR ( 128 downto 0 );
    lpcore_cancellation_unit_output_stream_0_full_n : in STD_LOGIC;
    lpcore_cancellation_unit_output_stream_0_write : out STD_LOGIC;
    lpcore_cancellation_unit_output_stream_1_din : out STD_LOGIC_VECTOR ( 128 downto 0 );
    lpcore_cancellation_unit_output_stream_1_full_n : in STD_LOGIC;
    lpcore_cancellation_unit_output_stream_1_write : out STD_LOGIC;
    lpcore_commit_time_stream_0_dout : in STD_LOGIC_VECTOR ( 31 downto 0 );
    lpcore_commit_time_stream_0_empty_n : in STD_LOGIC;
    lpcore_commit_time_stream_0_read : out STD_LOGIC;
    lpcore_commit_time_stream_1_dout : in STD_LOGIC_VECTOR ( 31 downto 0 );
    lpcore_commit_time_stream_1_empty_n : in STD_LOGIC;
    lpcore_commit_time_stream_1_read : out STD_LOGIC;
    ap_clk : in STD_LOGIC;
    ap_rst : in STD_LOGIC
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "lpcore_init_event_stream_0_dout[128:0],lpcore_init_event_stream_0_empty_n,lpcore_init_event_stream_0_read,lpcore_init_event_stream_1_dout[128:0],lpcore_init_event_stream_1_empty_n,lpcore_init_event_stream_1_read,lpcore_event_queue_full_stream_0_din[0:0],lpcore_event_queue_full_stream_0_full_n,lpcore_event_queue_full_stream_0_write,lpcore_event_queue_full_stream_1_din[0:0],lpcore_event_queue_full_stream_1_full_n,lpcore_event_queue_full_stream_1_write,lpcore_anti_message_stream_0_dout[128:0],lpcore_anti_message_stream_0_empty_n,lpcore_anti_message_stream_0_read,lpcore_anti_message_stream_1_dout[128:0],lpcore_anti_message_stream_1_empty_n,lpcore_anti_message_stream_1_read,lpcore_enqueue_event_stream_0_dout[128:0],lpcore_enqueue_event_stream_0_empty_n,lpcore_enqueue_event_stream_0_read,lpcore_enqueue_event_stream_1_dout[128:0],lpcore_enqueue_event_stream_1_empty_n,lpcore_enqueue_event_stream_1_read,lpcore_output_event_stream_0_din[128:0],lpcore_output_event_stream_0_full_n,lpcore_output_event_stream_0_write,lpcore_output_event_stream_1_din[128:0],lpcore_output_event_stream_1_full_n,lpcore_output_event_stream_1_write,lpcore_cancellation_unit_output_stream_0_din[128:0],lpcore_cancellation_unit_output_stream_0_full_n,lpcore_cancellation_unit_output_stream_0_write,lpcore_cancellation_unit_output_stream_1_din[128:0],lpcore_cancellation_unit_output_stream_1_full_n,lpcore_cancellation_unit_output_stream_1_write,lpcore_commit_time_stream_0_dout[31:0],lpcore_commit_time_stream_0_empty_n,lpcore_commit_time_stream_0_read,lpcore_commit_time_stream_1_dout[31:0],lpcore_commit_time_stream_1_empty_n,lpcore_commit_time_stream_1_read,ap_clk,ap_rst";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "simulation_top,Vivado 2022.1";
begin
end;
