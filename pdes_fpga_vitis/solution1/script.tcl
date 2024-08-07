############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project pdes_fpga_vitis
set_top event_queue_kernel
add_files cpp/EventQueue.cpp
add_files cpp/EventQueue.hpp
add_files cpp/StateBuffer.cpp
add_files cpp/StateBuffer.hpp
add_files cpp/constants.hpp
add_files -tb cpp/main.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xczu7ev-ffvf1517-3-e}
create_clock -period 200MHz -name default
config_export -format ip_catalog -rtl verilog -vivado_clock 200MHz
#source "./pdes_fpga_vitis/solution1/directives.tcl"
csim_design -clean
csynth_design
cosim_design
export_design -flow syn -rtl verilog -format ip_catalog
