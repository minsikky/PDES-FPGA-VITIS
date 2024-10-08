// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
`timescale 1 ns / 1 ps
module simulation_top_event_queue_top_0_s_event_queue_buffer_next_V_1_RAM_AUTO_1R1W (address0, ce0, d0, we0, q0,  reset,clk);

parameter DataWidth = 16;
parameter AddressWidth = 7;
parameter AddressRange = 128;

input[AddressWidth-1:0] address0;
input ce0;
input[DataWidth-1:0] d0;
input we0;
output reg[DataWidth-1:0] q0;
input reset;
input clk;

(* ram_style = "auto" *)reg [DataWidth-1:0] ram[0:AddressRange-1];

initial begin
    $readmemh("./simulation_top_event_queue_top_0_s_event_queue_buffer_next_V_1_RAM_AUTO_1R1W.dat", ram);
end



always @(posedge clk)  
begin 
    if (ce0) begin
        if (we0) 
            ram[address0] <= d0; 
        q0 <= ram[address0];
    end
end


endmodule

