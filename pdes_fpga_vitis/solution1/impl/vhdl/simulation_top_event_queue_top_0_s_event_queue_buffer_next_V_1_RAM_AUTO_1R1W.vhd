-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Tool Version Limit: 2022.04
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
--
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity simulation_top_event_queue_top_0_s_event_queue_buffer_next_V_1_RAM_AUTO_1R1W is 
    generic(
            MEM_TYPE    : string := "auto"; 
            DataWidth     : integer := 16; 
            AddressWidth     : integer := 7; 
            AddressRange    : integer := 128
    ); 
    port (
          address0     : in std_logic_vector(AddressWidth-1 downto 0); 
          ce0       : in std_logic; 
          d0        : in std_logic_vector(DataWidth-1 downto 0); 
          we0       : in std_logic; 
          q0        : out std_logic_vector(DataWidth-1 downto 0);
          reset      : in std_logic; 
          clk        : in std_logic 
    ); 
end entity; 


architecture rtl of simulation_top_event_queue_top_0_s_event_queue_buffer_next_V_1_RAM_AUTO_1R1W is 

signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 
type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 
shared variable ram : mem_array := (
    0 => "0000000000000001", 1 => "0000000000000010", 2 => "0000000000000011", 
    3 => "0000000000000100", 4 => "0000000000000101", 5 => "0000000000000110", 
    6 => "0000000000000111", 7 => "0000000000001000", 8 => "0000000000001001", 
    9 => "0000000000001010", 10 => "0000000000001011", 11 => "0000000000001100", 
    12 => "0000000000001101", 13 => "0000000000001110", 14 => "0000000000001111", 
    15 => "0000000000010000", 16 => "0000000000010001", 17 => "0000000000010010", 
    18 => "0000000000010011", 19 => "0000000000010100", 20 => "0000000000010101", 
    21 => "0000000000010110", 22 => "0000000000010111", 23 => "0000000000011000", 
    24 => "0000000000011001", 25 => "0000000000011010", 26 => "0000000000011011", 
    27 => "0000000000011100", 28 => "0000000000011101", 29 => "0000000000011110", 
    30 => "0000000000011111", 31 => "0000000000100000", 32 => "0000000000100001", 
    33 => "0000000000100010", 34 => "0000000000100011", 35 => "0000000000100100", 
    36 => "0000000000100101", 37 => "0000000000100110", 38 => "0000000000100111", 
    39 => "0000000000101000", 40 => "0000000000101001", 41 => "0000000000101010", 
    42 => "0000000000101011", 43 => "0000000000101100", 44 => "0000000000101101", 
    45 => "0000000000101110", 46 => "0000000000101111", 47 => "0000000000110000", 
    48 => "0000000000110001", 49 => "0000000000110010", 50 => "0000000000110011", 
    51 => "0000000000110100", 52 => "0000000000110101", 53 => "0000000000110110", 
    54 => "0000000000110111", 55 => "0000000000111000", 56 => "0000000000111001", 
    57 => "0000000000111010", 58 => "0000000000111011", 59 => "0000000000111100", 
    60 => "0000000000111101", 61 => "0000000000111110", 62 => "0000000000111111", 
    63 => "0000000001000000", 64 => "0000000001000001", 65 => "0000000001000010", 
    66 => "0000000001000011", 67 => "0000000001000100", 68 => "0000000001000101", 
    69 => "0000000001000110", 70 => "0000000001000111", 71 => "0000000001001000", 
    72 => "0000000001001001", 73 => "0000000001001010", 74 => "0000000001001011", 
    75 => "0000000001001100", 76 => "0000000001001101", 77 => "0000000001001110", 
    78 => "0000000001001111", 79 => "0000000001010000", 80 => "0000000001010001", 
    81 => "0000000001010010", 82 => "0000000001010011", 83 => "0000000001010100", 
    84 => "0000000001010101", 85 => "0000000001010110", 86 => "0000000001010111", 
    87 => "0000000001011000", 88 => "0000000001011001", 89 => "0000000001011010", 
    90 => "0000000001011011", 91 => "0000000001011100", 92 => "0000000001011101", 
    93 => "0000000001011110", 94 => "0000000001011111", 95 => "0000000001100000", 
    96 => "0000000001100001", 97 => "0000000001100010", 98 => "0000000001100011", 
    99 => "0000000001100100", 100 => "0000000001100101", 101 => "0000000001100110", 
    102 => "0000000001100111", 103 => "0000000001101000", 104 => "0000000001101001", 
    105 => "0000000001101010", 106 => "0000000001101011", 107 => "0000000001101100", 
    108 => "0000000001101101", 109 => "0000000001101110", 110 => "0000000001101111", 
    111 => "0000000001110000", 112 => "0000000001110001", 113 => "0000000001110010", 
    114 => "0000000001110011", 115 => "0000000001110100", 116 => "0000000001110101", 
    117 => "0000000001110110", 118 => "0000000001110111", 119 => "0000000001111000", 
    120 => "0000000001111001", 121 => "0000000001111010", 122 => "0000000001111011", 
    123 => "0000000001111100", 124 => "0000000001111101", 125 => "0000000001111110", 
    126 => "0000000001111111", 127 => "1111111111111111" );

attribute syn_ramstyle : string; 
attribute syn_ramstyle of ram : variable is "auto";
attribute ram_style : string;
attribute ram_style of ram : variable is MEM_TYPE;

begin 


memory_access_guard_0: process (address0) 
begin
      address0_tmp <= address0;
--synthesis translate_off
      if (CONV_INTEGER(address0) > AddressRange-1) then
           address0_tmp <= (others => '0');
      else 
           address0_tmp <= address0;
      end if;
--synthesis translate_on
end process;

p_memory_access_0: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            q0 <= ram(CONV_INTEGER(address0_tmp));
            if (we0 = '1') then 
                ram(CONV_INTEGER(address0_tmp)) := d0; 
            end if;
        end if;
    end if;
end process;


end rtl;

