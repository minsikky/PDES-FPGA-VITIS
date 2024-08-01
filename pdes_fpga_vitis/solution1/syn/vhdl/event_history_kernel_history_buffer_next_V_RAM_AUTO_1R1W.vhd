-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Tool Version Limit: 2022.04
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
--
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity event_history_kernel_history_buffer_next_V_RAM_AUTO_1R1W is 
    generic(
            MEM_TYPE    : string := "auto"; 
            DataWidth     : integer := 16; 
            AddressWidth     : integer := 6; 
            AddressRange    : integer := 64
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


architecture rtl of event_history_kernel_history_buffer_next_V_RAM_AUTO_1R1W is 

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
    63 => "1111111111111111" );

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

