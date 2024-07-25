############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project pdes_fpga_vitis
set_top test_state_buffer
add_files cpp/StateBuffer.cpp
add_files cpp/StateBuffer.hpp
add_files cpp/constants.hpp
add_files -tb cpp/StateBufferTest.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xcvu9p-flga2104-2-i}
create_clock -period 200MHz -name default
config_interface -m_axi_latency 0
source "./pdes_fpga_vitis/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
