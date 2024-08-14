
set TopModule "lpcore_top"
set ClockPeriod 5
set ClockList ap_clk
set HasVivadoClockPeriod 1
set CombLogicFlag 0
set PipelineFlag 0
set DataflowTaskPipelineFlag 1
set TrivialPipelineFlag 0
set noPortSwitchingFlag 0
set FloatingPointFlag 0
set FftOrFirFlag 0
set NbRWValue 3
set intNbAccess 1
set NewDSPMapping 1
set HasDSPModule 0
set ResetLevelFlag 1
set ResetStyle control
set ResetSyncFlag 1
set ResetRegisterFlag 0
set ResetVariableFlag 0
set ResetRegisterNum 0
set FsmEncStyle onehot
set MaxFanout 0
set RtlPrefix {}
set RtlSubPrefix lpcore_top_
set ExtraCCFlags {}
set ExtraCLdFlags {}
set SynCheckOptions {}
set PresynOptions {}
set PreprocOptions {}
set SchedOptions {}
set BindOptions {}
set RtlGenOptions {}
set RtlWriterOptions {}
set CbcGenFlag {}
set CasGenFlag {}
set CasMonitorFlag {}
set AutoSimOptions {}
set ExportMCPathFlag 0
set SCTraceFileName mytrace
set SCTraceFileFormat vcd
set SCTraceOption all
set TargetInfo xczu7ev:-ffvc1156:-2-e
set SourceFiles {sc {} c {../../cpp/VirtualLP.cpp ../../cpp/StateBuffer.cpp ../../cpp/RollbackControl.cpp ../../cpp/LPMapping.cpp ../../cpp/LPCoreControl.cpp ../../cpp/LPCore.cpp ../../cpp/LFSR_PRNG.cpp ../../cpp/EventRouter.cpp ../../cpp/EventQueue.cpp ../../cpp/EventProcessor.cpp ../../cpp/CommitControlDummy.cpp ../../cpp/CancellationUnit.cpp}}
set SourceFlags {sc {} c {{} {} {} {} {} {} {} {} {} {} {} {}}}
set DirectiveFile /net/higgins/z/minsikky/PDES-FPGA-VITIS/pdes_fpga_vitis/solution1/solution1.directive
set TBFiles {verilog ../../cpp/main.cpp bc ../../cpp/main.cpp vhdl ../../cpp/main.cpp sc ../../cpp/main.cpp cas ../../cpp/main.cpp c {}}
set SpecLanguage C
set TVInFiles {bc {} c {} sc {} cas {} vhdl {} verilog {}}
set TVOutFiles {bc {} c {} sc {} cas {} vhdl {} verilog {}}
set TBTops {verilog {} bc {} vhdl {} sc {} cas {} c {}}
set TBInstNames {verilog {} bc {} vhdl {} sc {} cas {} c {}}
set XDCFiles {}
set ExtraGlobalOptions {"area_timing" 1 "clock_gate" 1 "impl_flow" map "power_gate" 0}
set TBTVFileNotFound {}
set AppFile ../hls.app
set ApsFile solution1.aps
set AvePath ../..
set DefaultPlatform DefaultPlatform
set multiClockList {}
set SCPortClockMap {}
set intNbAccess 1
set PlatformFiles {{DefaultPlatform {xilinx/zynquplus/zynquplus}}}
set HPFPO 0
