// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XTEST_STATE_BUFFER_H
#define XTEST_STATE_BUFFER_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xtest_state_buffer_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
    u16 DeviceId;
    u64 Control_BaseAddress;
} XTest_state_buffer_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XTest_state_buffer;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XTest_state_buffer_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XTest_state_buffer_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XTest_state_buffer_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XTest_state_buffer_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XTest_state_buffer_Initialize(XTest_state_buffer *InstancePtr, u16 DeviceId);
XTest_state_buffer_Config* XTest_state_buffer_LookupConfig(u16 DeviceId);
int XTest_state_buffer_CfgInitialize(XTest_state_buffer *InstancePtr, XTest_state_buffer_Config *ConfigPtr);
#else
int XTest_state_buffer_Initialize(XTest_state_buffer *InstancePtr, const char* InstanceName);
int XTest_state_buffer_Release(XTest_state_buffer *InstancePtr);
#endif

void XTest_state_buffer_Start(XTest_state_buffer *InstancePtr);
u32 XTest_state_buffer_IsDone(XTest_state_buffer *InstancePtr);
u32 XTest_state_buffer_IsIdle(XTest_state_buffer *InstancePtr);
u32 XTest_state_buffer_IsReady(XTest_state_buffer *InstancePtr);
void XTest_state_buffer_EnableAutoRestart(XTest_state_buffer *InstancePtr);
void XTest_state_buffer_DisableAutoRestart(XTest_state_buffer *InstancePtr);


void XTest_state_buffer_InterruptGlobalEnable(XTest_state_buffer *InstancePtr);
void XTest_state_buffer_InterruptGlobalDisable(XTest_state_buffer *InstancePtr);
void XTest_state_buffer_InterruptEnable(XTest_state_buffer *InstancePtr, u32 Mask);
void XTest_state_buffer_InterruptDisable(XTest_state_buffer *InstancePtr, u32 Mask);
void XTest_state_buffer_InterruptClear(XTest_state_buffer *InstancePtr, u32 Mask);
u32 XTest_state_buffer_InterruptGetEnabled(XTest_state_buffer *InstancePtr);
u32 XTest_state_buffer_InterruptGetStatus(XTest_state_buffer *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
