# ==============================================================
# Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
# Tool Version Limit: 2022.04
# Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
# ==============================================================
CSIM_DESIGN = 1

__SIM_FPO__ = 1

__SIM_MATHHLS__ = 1

__SIM_FFT__ = 1

__SIM_FIR__ = 1

__SIM_DDS__ = 1

ObjDir = obj

HLS_SOURCES = ../../../../cpp/main.cpp ../../../../cpp/CancellationUnit.cpp ../../../../cpp/EventProcessor.cpp ../../../../cpp/EventQueue.cpp ../../../../cpp/EventRouter.cpp ../../../../cpp/LFSR_PRNG.cpp ../../../../cpp/LPCore.cpp ../../../../cpp/LPCoreControl.cpp ../../../../cpp/LPMapping.cpp ../../../../cpp/RollbackControl.cpp ../../../../cpp/StateBuffer.cpp ../../../../cpp/TimeWarpSimulation.cpp ../../../../cpp/VirtualLP.cpp

override TARGET := csim.exe

AUTOPILOT_ROOT := /afs/eecs.umich.edu/soft/xilinx/2022.1/Vitis_HLS/2022.1
AUTOPILOT_MACH := lnx64
ifdef AP_GCC_M32
  AUTOPILOT_MACH := Linux_x86
  IFLAG += -m32
endif
IFLAG += -fPIC
ifndef AP_GCC_PATH
  AP_GCC_PATH := /afs/eecs.umich.edu/soft/xilinx/2022.1/Vitis_HLS/2022.1/tps/lnx64/gcc-8.3.0/bin
endif
AUTOPILOT_TOOL := ${AUTOPILOT_ROOT}/${AUTOPILOT_MACH}/tools
AP_CLANG_PATH := ${AUTOPILOT_TOOL}/clang-3.9/bin
AUTOPILOT_TECH := ${AUTOPILOT_ROOT}/common/technology


IFLAG += -I "${AUTOPILOT_TOOL}/systemc/include"
IFLAG += -I "${AUTOPILOT_ROOT}/include"
IFLAG += -I "${AUTOPILOT_ROOT}/include/ap_sysc"
IFLAG += -I "${AUTOPILOT_TECH}/generic/SystemC"
IFLAG += -I "${AUTOPILOT_TECH}/generic/SystemC/AESL_FP_comp"
IFLAG += -I "${AUTOPILOT_TECH}/generic/SystemC/AESL_comp"
IFLAG += -I "${AUTOPILOT_TOOL}/auto_cc/include"
IFLAG += -D__VITIS_HLS__

IFLAG += -D__SIM_FPO__

IFLAG += -D__SIM_FFT__

IFLAG += -D__SIM_FIR__

IFLAG += -D__SIM_DDS__

IFLAG += -D__DSP48E2__
IFLAG += -Wno-unknown-pragmas -I../../../../../../../../../usr/include -I../../../../../../../usr/include 
IFLAG += -g
DFLAG += -D__xilinx_ip_top= -DAESL_TB
CCFLAG += -Werror=return-type
TOOLCHAIN += 



include ./Makefile.rules

all: $(TARGET)



$(ObjDir)/main.o: ../../../../cpp/main.cpp $(ObjDir)/.dir
	$(Echo) "   Compiling ../../../../cpp/main.cpp in $(BuildMode) mode" $(AVE_DIR_DLOG)
	$(Verb)  $(CC) ${CCFLAG} -c -MMD -Wno-unknown-pragmas -Wno-unknown-pragmas  $(IFLAG) $(DFLAG) $< -o $@ ; \

-include $(ObjDir)/main.d

$(ObjDir)/CancellationUnit.o: ../../../../cpp/CancellationUnit.cpp $(ObjDir)/.dir
	$(Echo) "   Compiling ../../../../cpp/CancellationUnit.cpp in $(BuildMode) mode" $(AVE_DIR_DLOG)
	$(Verb)  $(CC) ${CCFLAG} -c -MMD  $(IFLAG) $(DFLAG) $< -o $@ ; \

-include $(ObjDir)/CancellationUnit.d

$(ObjDir)/EventProcessor.o: ../../../../cpp/EventProcessor.cpp $(ObjDir)/.dir
	$(Echo) "   Compiling ../../../../cpp/EventProcessor.cpp in $(BuildMode) mode" $(AVE_DIR_DLOG)
	$(Verb)  $(CC) ${CCFLAG} -c -MMD  $(IFLAG) $(DFLAG) $< -o $@ ; \

-include $(ObjDir)/EventProcessor.d

$(ObjDir)/EventQueue.o: ../../../../cpp/EventQueue.cpp $(ObjDir)/.dir
	$(Echo) "   Compiling ../../../../cpp/EventQueue.cpp in $(BuildMode) mode" $(AVE_DIR_DLOG)
	$(Verb)  $(CC) ${CCFLAG} -c -MMD  $(IFLAG) $(DFLAG) $< -o $@ ; \

-include $(ObjDir)/EventQueue.d

$(ObjDir)/EventRouter.o: ../../../../cpp/EventRouter.cpp $(ObjDir)/.dir
	$(Echo) "   Compiling ../../../../cpp/EventRouter.cpp in $(BuildMode) mode" $(AVE_DIR_DLOG)
	$(Verb)  $(CC) ${CCFLAG} -c -MMD  $(IFLAG) $(DFLAG) $< -o $@ ; \

-include $(ObjDir)/EventRouter.d

$(ObjDir)/LFSR_PRNG.o: ../../../../cpp/LFSR_PRNG.cpp $(ObjDir)/.dir
	$(Echo) "   Compiling ../../../../cpp/LFSR_PRNG.cpp in $(BuildMode) mode" $(AVE_DIR_DLOG)
	$(Verb)  $(CC) ${CCFLAG} -c -MMD  $(IFLAG) $(DFLAG) $< -o $@ ; \

-include $(ObjDir)/LFSR_PRNG.d

$(ObjDir)/LPCore.o: ../../../../cpp/LPCore.cpp $(ObjDir)/.dir
	$(Echo) "   Compiling ../../../../cpp/LPCore.cpp in $(BuildMode) mode" $(AVE_DIR_DLOG)
	$(Verb)  $(CC) ${CCFLAG} -c -MMD  $(IFLAG) $(DFLAG) $< -o $@ ; \

-include $(ObjDir)/LPCore.d

$(ObjDir)/LPCoreControl.o: ../../../../cpp/LPCoreControl.cpp $(ObjDir)/.dir
	$(Echo) "   Compiling ../../../../cpp/LPCoreControl.cpp in $(BuildMode) mode" $(AVE_DIR_DLOG)
	$(Verb)  $(CC) ${CCFLAG} -c -MMD  $(IFLAG) $(DFLAG) $< -o $@ ; \

-include $(ObjDir)/LPCoreControl.d

$(ObjDir)/LPMapping.o: ../../../../cpp/LPMapping.cpp $(ObjDir)/.dir
	$(Echo) "   Compiling ../../../../cpp/LPMapping.cpp in $(BuildMode) mode" $(AVE_DIR_DLOG)
	$(Verb)  $(CC) ${CCFLAG} -c -MMD  $(IFLAG) $(DFLAG) $< -o $@ ; \

-include $(ObjDir)/LPMapping.d

$(ObjDir)/RollbackControl.o: ../../../../cpp/RollbackControl.cpp $(ObjDir)/.dir
	$(Echo) "   Compiling ../../../../cpp/RollbackControl.cpp in $(BuildMode) mode" $(AVE_DIR_DLOG)
	$(Verb)  $(CC) ${CCFLAG} -c -MMD  $(IFLAG) $(DFLAG) $< -o $@ ; \

-include $(ObjDir)/RollbackControl.d

$(ObjDir)/StateBuffer.o: ../../../../cpp/StateBuffer.cpp $(ObjDir)/.dir
	$(Echo) "   Compiling ../../../../cpp/StateBuffer.cpp in $(BuildMode) mode" $(AVE_DIR_DLOG)
	$(Verb)  $(CC) ${CCFLAG} -c -MMD  $(IFLAG) $(DFLAG) $< -o $@ ; \

-include $(ObjDir)/StateBuffer.d

$(ObjDir)/TimeWarpSimulation.o: ../../../../cpp/TimeWarpSimulation.cpp $(ObjDir)/.dir
	$(Echo) "   Compiling ../../../../cpp/TimeWarpSimulation.cpp in $(BuildMode) mode" $(AVE_DIR_DLOG)
	$(Verb)  $(CC) ${CCFLAG} -c -MMD  $(IFLAG) $(DFLAG) $< -o $@ ; \

-include $(ObjDir)/TimeWarpSimulation.d

$(ObjDir)/VirtualLP.o: ../../../../cpp/VirtualLP.cpp $(ObjDir)/.dir
	$(Echo) "   Compiling ../../../../cpp/VirtualLP.cpp in $(BuildMode) mode" $(AVE_DIR_DLOG)
	$(Verb)  $(CC) ${CCFLAG} -c -MMD  $(IFLAG) $(DFLAG) $< -o $@ ; \

-include $(ObjDir)/VirtualLP.d
