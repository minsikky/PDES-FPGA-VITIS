#include "hls_design_meta.h"
const Port_Property HLS_Design_Meta::port_props[]={
	Port_Property("lpcore_init_event_stream_0_dout", 129, hls_in, 0, "ap_fifo", "fifo_port_we", 1),
	Port_Property("lpcore_init_event_stream_0_empty_n", 1, hls_in, 0, "ap_fifo", "fifo_status", 1),
	Port_Property("lpcore_init_event_stream_0_read", 1, hls_out, 0, "ap_fifo", "fifo_data", 1),
	Port_Property("lpcore_init_event_stream_1_dout", 129, hls_in, 1, "ap_fifo", "fifo_port_we", 1),
	Port_Property("lpcore_init_event_stream_1_empty_n", 1, hls_in, 1, "ap_fifo", "fifo_status", 1),
	Port_Property("lpcore_init_event_stream_1_read", 1, hls_out, 1, "ap_fifo", "fifo_data", 1),
	Port_Property("ap_clk", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_rst", 1, hls_in, -1, "", "", 1),
};
const char* HLS_Design_Meta::dut_name = "simulation_top";
