
/afs/eecs.umich.edu/soft/xilinx/2022.1/Vivado/2022.1/bin/xelab xil_defaultlib.apatb_test_state_buffer_top glbl -Oenable_linking_all_libraries  -prj test_state_buffer.prj -L smartconnect_v1_0 -L axi_protocol_checker_v1_1_12 -L axi_protocol_checker_v1_1_13 -L axis_protocol_checker_v1_1_11 -L axis_protocol_checker_v1_1_12 -L xil_defaultlib -L unisims_ver -L xpm  -L floating_point_v7_0_20 -L floating_point_v7_1_14 --lib "ieee_proposed=./ieee_proposed" -s test_state_buffer 
/afs/eecs.umich.edu/soft/xilinx/2022.1/Vivado/2022.1/bin/xsim --noieeewarnings test_state_buffer -tclbatch test_state_buffer.tcl 

