// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xtest_state_buffer.h"

extern XTest_state_buffer_Config XTest_state_buffer_ConfigTable[];

XTest_state_buffer_Config *XTest_state_buffer_LookupConfig(u16 DeviceId) {
	XTest_state_buffer_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XTEST_STATE_BUFFER_NUM_INSTANCES; Index++) {
		if (XTest_state_buffer_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XTest_state_buffer_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XTest_state_buffer_Initialize(XTest_state_buffer *InstancePtr, u16 DeviceId) {
	XTest_state_buffer_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XTest_state_buffer_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XTest_state_buffer_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

