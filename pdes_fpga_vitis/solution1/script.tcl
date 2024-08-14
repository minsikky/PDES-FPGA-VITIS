############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project pdes_fpga_vitis
set_top lpcore_top
add_files cpp/CancellationUnit.cpp
add_files cpp/CancellationUnit.hpp
add_files cpp/CommitControlDummy.cpp
add_files cpp/CommitControlDummy.hpp
add_files cpp/EventProcessor.cpp
add_files cpp/EventProcessor.hpp
add_files cpp/EventQueue.cpp
add_files cpp/EventQueue.hpp
add_files cpp/EventRouter.cpp
add_files cpp/EventRouter.hpp
add_files cpp/LFSR_PRNG.cpp
add_files cpp/LFSR_PRNG.hpp
add_files cpp/LPCore.cpp
add_files cpp/LPCore.hpp
add_files cpp/LPMapping.cpp
add_files cpp/LPMapping.hpp
add_files cpp/RollbackControl.cpp
add_files cpp/RollbackControl.hpp
add_files cpp/StateBuffer.cpp
add_files cpp/StateBuffer.hpp
add_files cpp/VirtualLP.cpp
add_files cpp/VirtualLP.hpp
add_files cpp/constants.hpp
add_files cpp/sys_defs.hpp
add_files -tb cpp/main.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xczu7ev-ffvc1156-2-e}
create_clock -period 200MHz -name default
config_export -format ip_catalog -rtl verilog -vivado_clock 200MHz
#source "./pdes_fpga_vitis/solution1/directives.tcl"
csim_design -clean
csynth_design
cosim_design
export_design -flow syn -rtl verilog -format ip_catalog
