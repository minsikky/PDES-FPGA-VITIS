; ModuleID = '/net/higgins/z/minsikky/PDES-FPGA-VITIS/pdes_fpga_vitis/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"struct.ap_uint<2>" = type { %"struct.ap_int_base<2, false>" }
%"struct.ap_int_base<2, false>" = type { %"struct.ssdm_int<2, false>" }
%"struct.ssdm_int<2, false>" = type { i2 }
%struct.TimeWarpEvent = type { %"struct.ap_int<32>", %"struct.ap_int<32>", %"struct.ap_int<32>", %"struct.ap_int<16>", %"struct.ap_int<16>", %"struct.ap_uint<1>" }
%"struct.ap_int<32>" = type { %"struct.ap_int_base<32, true>" }
%"struct.ap_int_base<32, true>" = type { %"struct.ssdm_int<32, true>" }
%"struct.ssdm_int<32, true>" = type { i32 }
%"struct.ap_int<16>" = type { %"struct.ap_int_base<16, true>" }
%"struct.ap_int_base<16, true>" = type { %"struct.ssdm_int<16, true>" }
%"struct.ssdm_int<16, true>" = type { i16 }
%"struct.ap_uint<1>" = type { %"struct.ap_int_base<1, false>" }
%"struct.ap_int_base<1, false>" = type { %"struct.ssdm_int<1, false>" }
%"struct.ssdm_int<1, false>" = type { i1 }

; Function Attrs: noinline
define void @apatb_event_history_kernel_ir(%"struct.ap_uint<2>"* nocapture readonly %op, %struct.TimeWarpEvent* nocapture readonly %event, %struct.TimeWarpEvent* noalias nocapture nonnull dereferenceable(20) %result, i1* noalias nocapture nonnull dereferenceable(1) %success) local_unnamed_addr #0 {
entry:
  %result_copy = alloca i129, align 512
  %success_copy = alloca i1, align 512
  call fastcc void @copy_in(%struct.TimeWarpEvent* nonnull %result, i129* nonnull align 512 %result_copy, i1* nonnull %success, i1* nonnull align 512 %success_copy)
  call void @apatb_event_history_kernel_hw(%"struct.ap_uint<2>"* %op, %struct.TimeWarpEvent* %event, i129* %result_copy, i1* %success_copy)
  call void @copy_back(%struct.TimeWarpEvent* %result, i129* %result_copy, i1* %success, i1* %success_copy)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_in(%struct.TimeWarpEvent* noalias readonly, i129* noalias align 512, i1* noalias readonly, i1* noalias align 512) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0struct.TimeWarpEvent(i129* align 512 %1, %struct.TimeWarpEvent* %0)
  call fastcc void @onebyonecpy_hls.p0i1(i1* align 512 %3, i1* %2)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0struct.TimeWarpEvent(i129* noalias align 512, %struct.TimeWarpEvent* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq i129* %0, null
  %3 = icmp eq %struct.TimeWarpEvent* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  %.0.0.0.011 = getelementptr %struct.TimeWarpEvent, %struct.TimeWarpEvent* %1, i32 0, i32 0, i32 0, i32 0, i32 0
  %5 = load i32, i32* %.0.0.0.011, align 4
  %6 = zext i32 %5 to i129
  %.1.0.0.017 = getelementptr %struct.TimeWarpEvent, %struct.TimeWarpEvent* %1, i32 0, i32 1, i32 0, i32 0, i32 0
  %7 = load i32, i32* %.1.0.0.017, align 4
  %8 = zext i32 %7 to i129
  %9 = shl i129 %8, 32
  %.partset4 = or i129 %9, %6
  %.2.0.0.023 = getelementptr %struct.TimeWarpEvent, %struct.TimeWarpEvent* %1, i32 0, i32 2, i32 0, i32 0, i32 0
  %10 = load i32, i32* %.2.0.0.023, align 4
  %11 = zext i32 %10 to i129
  %12 = shl i129 %11, 64
  %.partset3 = or i129 %.partset4, %12
  %.3.0.0.029 = getelementptr %struct.TimeWarpEvent, %struct.TimeWarpEvent* %1, i32 0, i32 3, i32 0, i32 0, i32 0
  %13 = load i16, i16* %.3.0.0.029, align 2
  %14 = zext i16 %13 to i129
  %15 = shl i129 %14, 96
  %.partset2 = or i129 %.partset3, %15
  %.4.0.0.035 = getelementptr %struct.TimeWarpEvent, %struct.TimeWarpEvent* %1, i32 0, i32 4, i32 0, i32 0, i32 0
  %16 = load i16, i16* %.4.0.0.035, align 2
  %17 = zext i16 %16 to i129
  %18 = shl i129 %17, 112
  %.5.0.0.041 = getelementptr %struct.TimeWarpEvent, %struct.TimeWarpEvent* %1, i32 0, i32 5, i32 0, i32 0, i32 0
  %19 = bitcast i1* %.5.0.0.041 to i8*
  %20 = load i8, i8* %19
  %21 = trunc i8 %20 to i1
  %22 = zext i1 %21 to i129
  %23 = shl i129 %22, 128
  %24 = or i129 %.partset2, %18
  %.partset = or i129 %24, %23
  store i129 %.partset, i129* %0, align 512
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
define internal fastcc void @copy_out(%struct.TimeWarpEvent* noalias, i129* noalias readonly align 512, i1* noalias, i1* noalias readonly align 512) unnamed_addr #3 {
entry:
  call fastcc void @onebyonecpy_hls.p0struct.TimeWarpEvent.313(%struct.TimeWarpEvent* %0, i129* align 512 %1)
  call fastcc void @onebyonecpy_hls.p0i1(i1* %2, i1* align 512 %3)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0struct.TimeWarpEvent.313(%struct.TimeWarpEvent* noalias, i129* noalias readonly align 512) unnamed_addr #2 {
entry:
  %2 = icmp eq %struct.TimeWarpEvent* %0, null
  %3 = icmp eq i129* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  %.01.0.0.012 = getelementptr %struct.TimeWarpEvent, %struct.TimeWarpEvent* %0, i32 0, i32 0, i32 0, i32 0, i32 0
  %5 = bitcast i129* %1 to i136*
  %6 = load i136, i136* %5
  %7 = trunc i136 %6 to i129
  %.partselect5 = trunc i129 %7 to i32
  store i32 %.partselect5, i32* %.01.0.0.012, align 512
  %.12.0.0.018 = getelementptr %struct.TimeWarpEvent, %struct.TimeWarpEvent* %0, i32 0, i32 1, i32 0, i32 0, i32 0
  %8 = lshr i129 %7, 32
  %.partselect4 = trunc i129 %8 to i32
  store i32 %.partselect4, i32* %.12.0.0.018, align 4
  %.23.0.0.024 = getelementptr %struct.TimeWarpEvent, %struct.TimeWarpEvent* %0, i32 0, i32 2, i32 0, i32 0, i32 0
  %9 = lshr i129 %7, 64
  %.partselect3 = trunc i129 %9 to i32
  store i32 %.partselect3, i32* %.23.0.0.024, align 8
  %.34.0.0.030 = getelementptr %struct.TimeWarpEvent, %struct.TimeWarpEvent* %0, i32 0, i32 3, i32 0, i32 0, i32 0
  %10 = lshr i129 %7, 96
  %.partselect2 = trunc i129 %10 to i16
  store i16 %.partselect2, i16* %.34.0.0.030, align 4
  %.45.0.0.036 = getelementptr %struct.TimeWarpEvent, %struct.TimeWarpEvent* %0, i32 0, i32 4, i32 0, i32 0, i32 0
  %11 = lshr i129 %7, 112
  %.partselect1 = trunc i129 %11 to i16
  store i16 %.partselect1, i16* %.45.0.0.036, align 2
  %.56.0.0.042 = getelementptr %struct.TimeWarpEvent, %struct.TimeWarpEvent* %0, i32 0, i32 5, i32 0, i32 0, i32 0
  %12 = lshr i129 %7, 128
  %.partselect = trunc i129 %12 to i1
  store i1 %.partselect, i1* %.56.0.0.042, align 16
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

declare void @apatb_event_history_kernel_hw(%"struct.ap_uint<2>"*, %struct.TimeWarpEvent*, i129*, i1*)

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_back(%struct.TimeWarpEvent* noalias, i129* noalias readonly align 512, i1* noalias, i1* noalias readonly align 512) unnamed_addr #3 {
entry:
  call fastcc void @onebyonecpy_hls.p0struct.TimeWarpEvent.313(%struct.TimeWarpEvent* %0, i129* align 512 %1)
  call fastcc void @onebyonecpy_hls.p0i1(i1* %2, i1* align 512 %3)
  ret void
}

define void @event_history_kernel_hw_stub_wrapper(%"struct.ap_uint<2>"*, %struct.TimeWarpEvent*, i129*, i1*) #4 {
entry:
  %4 = alloca %struct.TimeWarpEvent
  call void @copy_out(%struct.TimeWarpEvent* %4, i129* %2, i1* null, i1* %3)
  call void @event_history_kernel_hw_stub(%"struct.ap_uint<2>"* %0, %struct.TimeWarpEvent* %1, %struct.TimeWarpEvent* %4, i1* %3)
  call void @copy_in(%struct.TimeWarpEvent* %4, i129* %2, i1* null, i1* %3)
  ret void
}

declare void @event_history_kernel_hw_stub(%"struct.ap_uint<2>"*, %struct.TimeWarpEvent*, %struct.TimeWarpEvent*, i1*)

attributes #0 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline norecurse "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyout" }
attributes #4 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
