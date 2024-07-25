// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xtest_state_buffer.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XTest_state_buffer_CfgInitialize(XTest_state_buffer *InstancePtr, XTest_state_buffer_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XTest_state_buffer_Start(XTest_state_buffer *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTest_state_buffer_ReadReg(InstancePtr->Control_BaseAddress, XTEST_STATE_BUFFER_CONTROL_ADDR_AP_CTRL) & 0x80;
    XTest_state_buffer_WriteReg(InstancePtr->Control_BaseAddress, XTEST_STATE_BUFFER_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XTest_state_buffer_IsDone(XTest_state_buffer *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTest_state_buffer_ReadReg(InstancePtr->Control_BaseAddress, XTEST_STATE_BUFFER_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XTest_state_buffer_IsIdle(XTest_state_buffer *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTest_state_buffer_ReadReg(InstancePtr->Control_BaseAddress, XTEST_STATE_BUFFER_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XTest_state_buffer_IsReady(XTest_state_buffer *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTest_state_buffer_ReadReg(InstancePtr->Control_BaseAddress, XTEST_STATE_BUFFER_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XTest_state_buffer_EnableAutoRestart(XTest_state_buffer *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTest_state_buffer_WriteReg(InstancePtr->Control_BaseAddress, XTEST_STATE_BUFFER_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XTest_state_buffer_DisableAutoRestart(XTest_state_buffer *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTest_state_buffer_WriteReg(InstancePtr->Control_BaseAddress, XTEST_STATE_BUFFER_CONTROL_ADDR_AP_CTRL, 0);
}

void XTest_state_buffer_InterruptGlobalEnable(XTest_state_buffer *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTest_state_buffer_WriteReg(InstancePtr->Control_BaseAddress, XTEST_STATE_BUFFER_CONTROL_ADDR_GIE, 1);
}

void XTest_state_buffer_InterruptGlobalDisable(XTest_state_buffer *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTest_state_buffer_WriteReg(InstancePtr->Control_BaseAddress, XTEST_STATE_BUFFER_CONTROL_ADDR_GIE, 0);
}

void XTest_state_buffer_InterruptEnable(XTest_state_buffer *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XTest_state_buffer_ReadReg(InstancePtr->Control_BaseAddress, XTEST_STATE_BUFFER_CONTROL_ADDR_IER);
    XTest_state_buffer_WriteReg(InstancePtr->Control_BaseAddress, XTEST_STATE_BUFFER_CONTROL_ADDR_IER, Register | Mask);
}

void XTest_state_buffer_InterruptDisable(XTest_state_buffer *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XTest_state_buffer_ReadReg(InstancePtr->Control_BaseAddress, XTEST_STATE_BUFFER_CONTROL_ADDR_IER);
    XTest_state_buffer_WriteReg(InstancePtr->Control_BaseAddress, XTEST_STATE_BUFFER_CONTROL_ADDR_IER, Register & (~Mask));
}

void XTest_state_buffer_InterruptClear(XTest_state_buffer *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    //XTest_state_buffer_WriteReg(InstancePtr->Control_BaseAddress, XTEST_STATE_BUFFER_CONTROL_ADDR_ISR, Mask);
}

u32 XTest_state_buffer_InterruptGetEnabled(XTest_state_buffer *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XTest_state_buffer_ReadReg(InstancePtr->Control_BaseAddress, XTEST_STATE_BUFFER_CONTROL_ADDR_IER);
}

u32 XTest_state_buffer_InterruptGetStatus(XTest_state_buffer *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    // Current Interrupt Clear Behavior is Clear on Read(COR).
    return XTest_state_buffer_ReadReg(InstancePtr->Control_BaseAddress, XTEST_STATE_BUFFER_CONTROL_ADDR_ISR);
}

