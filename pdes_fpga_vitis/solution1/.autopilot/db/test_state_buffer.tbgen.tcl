set moduleName test_state_buffer
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {test_state_buffer}
set C_modelType { void 0 }
set C_modelArgList {
	{ in_stream int 96 regular {axi_s 0 volatile  { in_stream Data } }  }
	{ out_stream int 32 regular {axi_s 1 volatile  { out_stream Data } }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "in_stream", "interface" : "axis", "bitwidth" : 96, "direction" : "READONLY"} , 
 	{ "Name" : "out_stream", "interface" : "axis", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 26
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ in_stream_TDATA sc_in sc_lv 96 signal 0 } 
	{ in_stream_TVALID sc_in sc_logic 1 invld 0 } 
	{ in_stream_TREADY sc_out sc_logic 1 inacc 0 } 
	{ out_stream_TDATA sc_out sc_lv 32 signal 1 } 
	{ out_stream_TVALID sc_out sc_logic 1 outvld 1 } 
	{ out_stream_TREADY sc_in sc_logic 1 outacc 1 } 
	{ s_axi_control_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_AWADDR sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_ARADDR sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_control_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_control_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_BRESP sc_out sc_lv 2 signal -1 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"test_state_buffer","role":"start","value":"0","valid_bit":"0"},{"name":"test_state_buffer","role":"continue","value":"0","valid_bit":"4"},{"name":"test_state_buffer","role":"auto_start","value":"0","valid_bit":"7"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[{"name":"test_state_buffer","role":"start","value":"0","valid_bit":"0"},{"name":"test_state_buffer","role":"done","value":"0","valid_bit":"1"},{"name":"test_state_buffer","role":"idle","value":"0","valid_bit":"2"},{"name":"test_state_buffer","role":"ready","value":"0","valid_bit":"3"},{"name":"test_state_buffer","role":"auto_start","value":"0","valid_bit":"7"}] },
	{ "name": "s_axi_control_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARVALID" } },
	{ "name": "s_axi_control_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARREADY" } },
	{ "name": "s_axi_control_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RVALID" } },
	{ "name": "s_axi_control_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RREADY" } },
	{ "name": "s_axi_control_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "RDATA" } },
	{ "name": "s_axi_control_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "RRESP" } },
	{ "name": "s_axi_control_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BVALID" } },
	{ "name": "s_axi_control_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BREADY" } },
	{ "name": "s_axi_control_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "interrupt" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "in_stream_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":96, "type": "signal", "bundle":{"name": "in_stream", "role": "TDATA" }} , 
 	{ "name": "in_stream_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "in_stream", "role": "TVALID" }} , 
 	{ "name": "in_stream_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "in_stream", "role": "TREADY" }} , 
 	{ "name": "out_stream_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "out_stream", "role": "TDATA" }} , 
 	{ "name": "out_stream_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "out_stream", "role": "TVALID" }} , 
 	{ "name": "out_stream_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "out_stream", "role": "TREADY" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "9", "11", "13", "14", "15", "16", "17", "18"],
		"CDFG" : "test_state_buffer",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "1",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "in_stream", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "in_stream_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "out_stream", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "out_stream_TDATA_blk_n", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "grp_test_state_buffer_Pipeline_VITIS_LOOP_43_3_fu_7502", "Port" : "out_stream", "Inst_start_state" : "272", "Inst_end_state" : "273"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_85_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state262", "LastState" : ["ap_ST_fsm_state264"], "QuitState" : ["ap_ST_fsm_state263", "ap_ST_fsm_state264"], "PreState" : ["ap_ST_fsm_state5"], "PostState" : ["ap_ST_fsm_state265"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state6", "LastState" : ["ap_ST_fsm_state8"], "QuitState" : ["ap_ST_fsm_state8"], "PreState" : ["ap_ST_fsm_state5"], "PostState" : ["ap_ST_fsm_state9"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state10", "LastState" : ["ap_ST_fsm_state12"], "QuitState" : ["ap_ST_fsm_state12"], "PreState" : ["ap_ST_fsm_state9"], "PostState" : ["ap_ST_fsm_state13"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state14", "LastState" : ["ap_ST_fsm_state16"], "QuitState" : ["ap_ST_fsm_state16"], "PreState" : ["ap_ST_fsm_state13"], "PostState" : ["ap_ST_fsm_state17"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state18", "LastState" : ["ap_ST_fsm_state20"], "QuitState" : ["ap_ST_fsm_state20"], "PreState" : ["ap_ST_fsm_state17"], "PostState" : ["ap_ST_fsm_state21"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state22", "LastState" : ["ap_ST_fsm_state24"], "QuitState" : ["ap_ST_fsm_state24"], "PreState" : ["ap_ST_fsm_state21"], "PostState" : ["ap_ST_fsm_state25"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state26", "LastState" : ["ap_ST_fsm_state28"], "QuitState" : ["ap_ST_fsm_state28"], "PreState" : ["ap_ST_fsm_state25"], "PostState" : ["ap_ST_fsm_state29"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state30", "LastState" : ["ap_ST_fsm_state32"], "QuitState" : ["ap_ST_fsm_state32"], "PreState" : ["ap_ST_fsm_state29"], "PostState" : ["ap_ST_fsm_state33"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state34", "LastState" : ["ap_ST_fsm_state36"], "QuitState" : ["ap_ST_fsm_state36"], "PreState" : ["ap_ST_fsm_state33"], "PostState" : ["ap_ST_fsm_state37"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state38", "LastState" : ["ap_ST_fsm_state40"], "QuitState" : ["ap_ST_fsm_state40"], "PreState" : ["ap_ST_fsm_state37"], "PostState" : ["ap_ST_fsm_state41"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state42", "LastState" : ["ap_ST_fsm_state44"], "QuitState" : ["ap_ST_fsm_state44"], "PreState" : ["ap_ST_fsm_state41"], "PostState" : ["ap_ST_fsm_state45"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state46", "LastState" : ["ap_ST_fsm_state48"], "QuitState" : ["ap_ST_fsm_state48"], "PreState" : ["ap_ST_fsm_state45"], "PostState" : ["ap_ST_fsm_state49"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state50", "LastState" : ["ap_ST_fsm_state52"], "QuitState" : ["ap_ST_fsm_state52"], "PreState" : ["ap_ST_fsm_state49"], "PostState" : ["ap_ST_fsm_state53"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state54", "LastState" : ["ap_ST_fsm_state56"], "QuitState" : ["ap_ST_fsm_state56"], "PreState" : ["ap_ST_fsm_state53"], "PostState" : ["ap_ST_fsm_state57"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state58", "LastState" : ["ap_ST_fsm_state60"], "QuitState" : ["ap_ST_fsm_state60"], "PreState" : ["ap_ST_fsm_state57"], "PostState" : ["ap_ST_fsm_state61"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state62", "LastState" : ["ap_ST_fsm_state64"], "QuitState" : ["ap_ST_fsm_state64"], "PreState" : ["ap_ST_fsm_state61"], "PostState" : ["ap_ST_fsm_state65"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state66", "LastState" : ["ap_ST_fsm_state68"], "QuitState" : ["ap_ST_fsm_state68"], "PreState" : ["ap_ST_fsm_state65"], "PostState" : ["ap_ST_fsm_state69"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state70", "LastState" : ["ap_ST_fsm_state72"], "QuitState" : ["ap_ST_fsm_state72"], "PreState" : ["ap_ST_fsm_state69"], "PostState" : ["ap_ST_fsm_state73"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state74", "LastState" : ["ap_ST_fsm_state76"], "QuitState" : ["ap_ST_fsm_state76"], "PreState" : ["ap_ST_fsm_state73"], "PostState" : ["ap_ST_fsm_state77"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state78", "LastState" : ["ap_ST_fsm_state80"], "QuitState" : ["ap_ST_fsm_state80"], "PreState" : ["ap_ST_fsm_state77"], "PostState" : ["ap_ST_fsm_state81"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state82", "LastState" : ["ap_ST_fsm_state84"], "QuitState" : ["ap_ST_fsm_state84"], "PreState" : ["ap_ST_fsm_state81"], "PostState" : ["ap_ST_fsm_state85"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state86", "LastState" : ["ap_ST_fsm_state88"], "QuitState" : ["ap_ST_fsm_state88"], "PreState" : ["ap_ST_fsm_state85"], "PostState" : ["ap_ST_fsm_state89"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state90", "LastState" : ["ap_ST_fsm_state92"], "QuitState" : ["ap_ST_fsm_state92"], "PreState" : ["ap_ST_fsm_state89"], "PostState" : ["ap_ST_fsm_state93"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state94", "LastState" : ["ap_ST_fsm_state96"], "QuitState" : ["ap_ST_fsm_state96"], "PreState" : ["ap_ST_fsm_state93"], "PostState" : ["ap_ST_fsm_state97"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state98", "LastState" : ["ap_ST_fsm_state100"], "QuitState" : ["ap_ST_fsm_state100"], "PreState" : ["ap_ST_fsm_state97"], "PostState" : ["ap_ST_fsm_state101"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state102", "LastState" : ["ap_ST_fsm_state104"], "QuitState" : ["ap_ST_fsm_state104"], "PreState" : ["ap_ST_fsm_state101"], "PostState" : ["ap_ST_fsm_state105"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state106", "LastState" : ["ap_ST_fsm_state108"], "QuitState" : ["ap_ST_fsm_state108"], "PreState" : ["ap_ST_fsm_state105"], "PostState" : ["ap_ST_fsm_state109"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state110", "LastState" : ["ap_ST_fsm_state112"], "QuitState" : ["ap_ST_fsm_state112"], "PreState" : ["ap_ST_fsm_state109"], "PostState" : ["ap_ST_fsm_state113"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state114", "LastState" : ["ap_ST_fsm_state116"], "QuitState" : ["ap_ST_fsm_state116"], "PreState" : ["ap_ST_fsm_state113"], "PostState" : ["ap_ST_fsm_state117"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state118", "LastState" : ["ap_ST_fsm_state120"], "QuitState" : ["ap_ST_fsm_state120"], "PreState" : ["ap_ST_fsm_state117"], "PostState" : ["ap_ST_fsm_state121"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state122", "LastState" : ["ap_ST_fsm_state124"], "QuitState" : ["ap_ST_fsm_state124"], "PreState" : ["ap_ST_fsm_state121"], "PostState" : ["ap_ST_fsm_state125"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state126", "LastState" : ["ap_ST_fsm_state128"], "QuitState" : ["ap_ST_fsm_state128"], "PreState" : ["ap_ST_fsm_state125"], "PostState" : ["ap_ST_fsm_state129"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state130", "LastState" : ["ap_ST_fsm_state132"], "QuitState" : ["ap_ST_fsm_state132"], "PreState" : ["ap_ST_fsm_state129"], "PostState" : ["ap_ST_fsm_state133"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state134", "LastState" : ["ap_ST_fsm_state136"], "QuitState" : ["ap_ST_fsm_state136"], "PreState" : ["ap_ST_fsm_state133"], "PostState" : ["ap_ST_fsm_state137"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state138", "LastState" : ["ap_ST_fsm_state140"], "QuitState" : ["ap_ST_fsm_state140"], "PreState" : ["ap_ST_fsm_state137"], "PostState" : ["ap_ST_fsm_state141"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state142", "LastState" : ["ap_ST_fsm_state144"], "QuitState" : ["ap_ST_fsm_state144"], "PreState" : ["ap_ST_fsm_state141"], "PostState" : ["ap_ST_fsm_state145"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state146", "LastState" : ["ap_ST_fsm_state148"], "QuitState" : ["ap_ST_fsm_state148"], "PreState" : ["ap_ST_fsm_state145"], "PostState" : ["ap_ST_fsm_state149"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state150", "LastState" : ["ap_ST_fsm_state152"], "QuitState" : ["ap_ST_fsm_state152"], "PreState" : ["ap_ST_fsm_state149"], "PostState" : ["ap_ST_fsm_state153"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state154", "LastState" : ["ap_ST_fsm_state156"], "QuitState" : ["ap_ST_fsm_state156"], "PreState" : ["ap_ST_fsm_state153"], "PostState" : ["ap_ST_fsm_state157"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state158", "LastState" : ["ap_ST_fsm_state160"], "QuitState" : ["ap_ST_fsm_state160"], "PreState" : ["ap_ST_fsm_state157"], "PostState" : ["ap_ST_fsm_state161"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state162", "LastState" : ["ap_ST_fsm_state164"], "QuitState" : ["ap_ST_fsm_state164"], "PreState" : ["ap_ST_fsm_state161"], "PostState" : ["ap_ST_fsm_state165"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state166", "LastState" : ["ap_ST_fsm_state168"], "QuitState" : ["ap_ST_fsm_state168"], "PreState" : ["ap_ST_fsm_state165"], "PostState" : ["ap_ST_fsm_state169"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state170", "LastState" : ["ap_ST_fsm_state172"], "QuitState" : ["ap_ST_fsm_state172"], "PreState" : ["ap_ST_fsm_state169"], "PostState" : ["ap_ST_fsm_state173"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state174", "LastState" : ["ap_ST_fsm_state176"], "QuitState" : ["ap_ST_fsm_state176"], "PreState" : ["ap_ST_fsm_state173"], "PostState" : ["ap_ST_fsm_state177"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state178", "LastState" : ["ap_ST_fsm_state180"], "QuitState" : ["ap_ST_fsm_state180"], "PreState" : ["ap_ST_fsm_state177"], "PostState" : ["ap_ST_fsm_state181"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state182", "LastState" : ["ap_ST_fsm_state184"], "QuitState" : ["ap_ST_fsm_state184"], "PreState" : ["ap_ST_fsm_state181"], "PostState" : ["ap_ST_fsm_state185"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state186", "LastState" : ["ap_ST_fsm_state188"], "QuitState" : ["ap_ST_fsm_state188"], "PreState" : ["ap_ST_fsm_state185"], "PostState" : ["ap_ST_fsm_state189"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state190", "LastState" : ["ap_ST_fsm_state192"], "QuitState" : ["ap_ST_fsm_state192"], "PreState" : ["ap_ST_fsm_state189"], "PostState" : ["ap_ST_fsm_state193"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state194", "LastState" : ["ap_ST_fsm_state196"], "QuitState" : ["ap_ST_fsm_state196"], "PreState" : ["ap_ST_fsm_state193"], "PostState" : ["ap_ST_fsm_state197"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state198", "LastState" : ["ap_ST_fsm_state200"], "QuitState" : ["ap_ST_fsm_state200"], "PreState" : ["ap_ST_fsm_state197"], "PostState" : ["ap_ST_fsm_state201"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state202", "LastState" : ["ap_ST_fsm_state204"], "QuitState" : ["ap_ST_fsm_state204"], "PreState" : ["ap_ST_fsm_state201"], "PostState" : ["ap_ST_fsm_state205"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state206", "LastState" : ["ap_ST_fsm_state208"], "QuitState" : ["ap_ST_fsm_state208"], "PreState" : ["ap_ST_fsm_state205"], "PostState" : ["ap_ST_fsm_state209"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state210", "LastState" : ["ap_ST_fsm_state212"], "QuitState" : ["ap_ST_fsm_state212"], "PreState" : ["ap_ST_fsm_state209"], "PostState" : ["ap_ST_fsm_state213"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state214", "LastState" : ["ap_ST_fsm_state216"], "QuitState" : ["ap_ST_fsm_state216"], "PreState" : ["ap_ST_fsm_state213"], "PostState" : ["ap_ST_fsm_state217"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state218", "LastState" : ["ap_ST_fsm_state220"], "QuitState" : ["ap_ST_fsm_state220"], "PreState" : ["ap_ST_fsm_state217"], "PostState" : ["ap_ST_fsm_state221"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state222", "LastState" : ["ap_ST_fsm_state224"], "QuitState" : ["ap_ST_fsm_state224"], "PreState" : ["ap_ST_fsm_state221"], "PostState" : ["ap_ST_fsm_state225"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state226", "LastState" : ["ap_ST_fsm_state228"], "QuitState" : ["ap_ST_fsm_state228"], "PreState" : ["ap_ST_fsm_state225"], "PostState" : ["ap_ST_fsm_state229"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state230", "LastState" : ["ap_ST_fsm_state232"], "QuitState" : ["ap_ST_fsm_state232"], "PreState" : ["ap_ST_fsm_state229"], "PostState" : ["ap_ST_fsm_state233"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state234", "LastState" : ["ap_ST_fsm_state236"], "QuitState" : ["ap_ST_fsm_state236"], "PreState" : ["ap_ST_fsm_state233"], "PostState" : ["ap_ST_fsm_state237"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state238", "LastState" : ["ap_ST_fsm_state240"], "QuitState" : ["ap_ST_fsm_state240"], "PreState" : ["ap_ST_fsm_state237"], "PostState" : ["ap_ST_fsm_state241"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state242", "LastState" : ["ap_ST_fsm_state244"], "QuitState" : ["ap_ST_fsm_state244"], "PreState" : ["ap_ST_fsm_state241"], "PostState" : ["ap_ST_fsm_state245"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state246", "LastState" : ["ap_ST_fsm_state248"], "QuitState" : ["ap_ST_fsm_state248"], "PreState" : ["ap_ST_fsm_state245"], "PostState" : ["ap_ST_fsm_state249"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state250", "LastState" : ["ap_ST_fsm_state252"], "QuitState" : ["ap_ST_fsm_state252"], "PreState" : ["ap_ST_fsm_state249"], "PostState" : ["ap_ST_fsm_state253"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state254", "LastState" : ["ap_ST_fsm_state256"], "QuitState" : ["ap_ST_fsm_state256"], "PreState" : ["ap_ST_fsm_state253"], "PostState" : ["ap_ST_fsm_state257"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state258", "LastState" : ["ap_ST_fsm_state260"], "QuitState" : ["ap_ST_fsm_state260"], "PreState" : ["ap_ST_fsm_state257"], "PostState" : ["ap_ST_fsm_state261"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_19_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state4", "LastState" : ["ap_ST_fsm_state261"], "QuitState" : ["ap_ST_fsm_state4"], "PreState" : ["ap_ST_fsm_state3"], "PostState" : ["ap_ST_fsm_state270"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_41_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "276", "FirstState" : "ap_ST_fsm_state271", "LastState" : ["ap_ST_fsm_state275"], "QuitState" : ["ap_ST_fsm_state271"], "PreState" : ["ap_ST_fsm_state270"], "PostState" : ["ap_ST_fsm_state276"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.buffer_buffer_state_lvt_V_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.buffer_buffer_next_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.buffer_lp_heads_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.buffer_lp_heads_2_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.buffer_lp_sizes_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.buffer_lp_sizes_2_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_test_state_buffer_Pipeline_VITIS_LOOP_34_1_fu_7484", "Parent" : "0", "Child" : ["8"],
		"CDFG" : "test_state_buffer_Pipeline_VITIS_LOOP_34_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "129", "EstimateLatencyMax" : "129",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "buffer_buffer_next", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_34_1", "PipelineType" : "NotSupport"}]},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_test_state_buffer_Pipeline_VITIS_LOOP_34_1_fu_7484.flow_control_loop_pipe_sequential_init_U", "Parent" : "7"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_test_state_buffer_Pipeline_VITIS_LOOP_39_2_fu_7490", "Parent" : "0", "Child" : ["10"],
		"CDFG" : "test_state_buffer_Pipeline_VITIS_LOOP_39_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "66", "EstimateLatencyMax" : "66",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "buffer_lp_sizes", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "buffer_lp_sizes_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "buffer_lp_heads", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "buffer_lp_heads_2", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_39_2", "PipelineType" : "NotSupport"}]},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_test_state_buffer_Pipeline_VITIS_LOOP_39_2_fu_7490.flow_control_loop_pipe_sequential_init_U", "Parent" : "9"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_test_state_buffer_Pipeline_VITIS_LOOP_43_3_fu_7502", "Parent" : "0", "Child" : ["12"],
		"CDFG" : "test_state_buffer_Pipeline_VITIS_LOOP_43_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "current_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "buffer_buffer_state_lvt_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "out_stream", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "out_stream_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "buffer_buffer_next", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_43_3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_test_state_buffer_Pipeline_VITIS_LOOP_43_3_fu_7502.flow_control_loop_pipe_sequential_init_U", "Parent" : "11"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.control_s_axi_U", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_32_1_1_U10", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_32_1_1_U11", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_32_1_1_U12", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_in_stream_U", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_out_stream_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	test_state_buffer {
		in_stream {Type I LastRead 3 FirstWrite -1}
		out_stream {Type O LastRead -1 FirstWrite 1}}
	test_state_buffer_Pipeline_VITIS_LOOP_34_1 {
		buffer_buffer_next {Type O LastRead -1 FirstWrite 0}}
	test_state_buffer_Pipeline_VITIS_LOOP_39_2 {
		buffer_lp_sizes {Type O LastRead -1 FirstWrite 0}
		buffer_lp_sizes_2 {Type O LastRead -1 FirstWrite 0}
		buffer_lp_heads {Type O LastRead -1 FirstWrite 0}
		buffer_lp_heads_2 {Type O LastRead -1 FirstWrite 0}}
	test_state_buffer_Pipeline_VITIS_LOOP_43_3 {
		current_2 {Type I LastRead 0 FirstWrite -1}
		buffer_buffer_state_lvt_V {Type I LastRead 0 FirstWrite -1}
		out_stream {Type O LastRead -1 FirstWrite 1}
		buffer_buffer_next {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "0", "Max" : "0"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	in_stream { axis {  { in_stream_TDATA in_data 0 96 }  { in_stream_TVALID in_vld 0 1 }  { in_stream_TREADY in_acc 1 1 } } }
	out_stream { axis {  { out_stream_TDATA out_data 1 32 }  { out_stream_TVALID out_vld 1 1 }  { out_stream_TREADY out_acc 0 1 } } }
}

set maxi_interface_dict [dict create]

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
