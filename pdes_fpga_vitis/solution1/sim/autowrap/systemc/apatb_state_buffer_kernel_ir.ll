; ModuleID = '/net/higgins/z/minsikky/PDES-FPGA-VITIS/pdes_fpga_vitis/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"struct.ap_uint<2>" = type { %"struct.ap_int_base<2, false>" }
%"struct.ap_int_base<2, false>" = type { %"struct.ssdm_int<2, false>" }
%"struct.ssdm_int<2, false>" = type { i2 }
%struct.LPState = type { %"struct.ap_int<16>", %"struct.ap_int<32>", %"struct.ap_int<32>" }
%"struct.ap_int<16>" = type { %"struct.ap_int_base<16, true>" }
%"struct.ap_int_base<16, true>" = type { %"struct.ssdm_int<16, true>" }
%"struct.ssdm_int<16, true>" = type { i16 }
%"struct.ap_int<32>" = type { %"struct.ap_int_base<32, true>" }
%"struct.ap_int_base<32, true>" = type { %"struct.ssdm_int<32, true>" }
%"struct.ssdm_int<32, true>" = type { i32 }

; Function Attrs: noinline
define void @apatb_state_buffer_kernel_ir(%"struct.ap_uint<2>"* nocapture readonly %op, %struct.LPState* nocapture readonly %state, %struct.LPState* noalias nocapture nonnull dereferenceable(12) %result, i1* noalias nocapture nonnull dereferenceable(1) %success) local_unnamed_addr #0 {
entry:
  %result_copy = alloca i80, align 512
  %success_copy = alloca i1, align 512
  call fastcc void @copy_in(%struct.LPState* nonnull %result, i80* nonnull align 512 %result_copy, i1* nonnull %success, i1* nonnull align 512 %success_copy)
  call void @apatb_state_buffer_kernel_hw(%"struct.ap_uint<2>"* %op, %struct.LPState* %state, i80* %result_copy, i1* %success_copy)
  call void @copy_back(%struct.LPState* %result, i80* %result_copy, i1* %success, i1* %success_copy)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_in(%struct.LPState* noalias readonly, i80* noalias align 512, i1* noalias readonly, i1* noalias align 512) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0struct.LPState(i80* align 512 %1, %struct.LPState* %0)
  call fastcc void @onebyonecpy_hls.p0i1(i1* align 512 %3, i1* %2)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0struct.LPState(i80* noalias align 512, %struct.LPState* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq i80* %0, null
  %3 = icmp eq %struct.LPState* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  %.0.0.0.08 = getelementptr %struct.LPState, %struct.LPState* %1, i32 0, i32 0, i32 0, i32 0, i32 0
  %5 = load i16, i16* %.0.0.0.08, align 2
  %6 = zext i16 %5 to i80
  %.1.0.0.014 = getelementptr %struct.LPState, %struct.LPState* %1, i32 0, i32 1, i32 0, i32 0, i32 0
  %7 = load i32, i32* %.1.0.0.014, align 4
  %8 = zext i32 %7 to i80
  %9 = shl i80 %8, 16
  %.partset1 = or i80 %9, %6
  %.2.0.0.020 = getelementptr %struct.LPState, %struct.LPState* %1, i32 0, i32 2, i32 0, i32 0, i32 0
  %10 = load i32, i32* %.2.0.0.020, align 4
  %11 = zext i32 %10 to i80
  %12 = shl i80 %11, 48
  %.partset = or i80 %.partset1, %12
  store i80 %.partset, i80* %0, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0i1(i1* noalias align 512, i1* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq i1* %0, null
  %3 = icmp eq i1* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  %5 = bitcast i1* %1 to i8*
  %6 = load i8, i8* %5
  %7 = trunc i8 %6 to i1
  store i1 %7, i1* %0, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_out(%struct.LPState* noalias, i80* noalias readonly align 512, i1* noalias, i1* noalias readonly align 512) unnamed_addr #3 {
entry:
  call fastcc void @onebyonecpy_hls.p0struct.LPState.206(%struct.LPState* %0, i80* align 512 %1)
  call fastcc void @onebyonecpy_hls.p0i1(i1* %2, i1* align 512 %3)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0struct.LPState.206(%struct.LPState* noalias, i80* noalias readonly align 512) unnamed_addr #2 {
entry:
  %2 = icmp eq %struct.LPState* %0, null
  %3 = icmp eq i80* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  %.01.0.0.09 = getelementptr %struct.LPState, %struct.LPState* %0, i32 0, i32 0, i32 0, i32 0, i32 0
  %5 = load i80, i80* %1, align 512
  %.partselect2 = trunc i80 %5 to i16
  store i16 %.partselect2, i16* %.01.0.0.09, align 512
  %.12.0.0.015 = getelementptr %struct.LPState, %struct.LPState* %0, i32 0, i32 1, i32 0, i32 0, i32 0
  %6 = lshr i80 %5, 16
  %.partselect1 = trunc i80 %6 to i32
  store i32 %.partselect1, i32* %.12.0.0.015, align 4
  %.23.0.0.021 = getelementptr %struct.LPState, %struct.LPState* %0, i32 0, i32 2, i32 0, i32 0, i32 0
  %7 = lshr i80 %5, 48
  %.partselect = trunc i80 %7 to i32
  store i32 %.partselect, i32* %.23.0.0.021, align 8
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

declare void @apatb_state_buffer_kernel_hw(%"struct.ap_uint<2>"*, %struct.LPState*, i80*, i1*)

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_back(%struct.LPState* noalias, i80* noalias readonly align 512, i1* noalias, i1* noalias readonly align 512) unnamed_addr #3 {
entry:
  call fastcc void @onebyonecpy_hls.p0struct.LPState.206(%struct.LPState* %0, i80* align 512 %1)
  call fastcc void @onebyonecpy_hls.p0i1(i1* %2, i1* align 512 %3)
  ret void
}

define void @state_buffer_kernel_hw_stub_wrapper(%"struct.ap_uint<2>"*, %struct.LPState*, i80*, i1*) #4 {
entry:
  %4 = alloca %struct.LPState
  call void @copy_out(%struct.LPState* %4, i80* %2, i1* null, i1* %3)
  call void @state_buffer_kernel_hw_stub(%"struct.ap_uint<2>"* %0, %struct.LPState* %1, %struct.LPState* %4, i1* %3)
  call void @copy_in(%struct.LPState* %4, i80* %2, i1* null, i1* %3)
  ret void
}

declare void @state_buffer_kernel_hw_stub(%"struct.ap_uint<2>"*, %struct.LPState*, %struct.LPState*, i1*)

attributes #0 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline norecurse "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyout" }
attributes #4 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
