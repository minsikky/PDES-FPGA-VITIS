; ModuleID = '/net/higgins/z/minsikky/PDES-FPGA-VITIS/pdes_fpga_vitis/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"struct.ap_uint<3>" = type { %"struct.ap_int_base<3, false>" }
%"struct.ap_int_base<3, false>" = type { %"struct.ssdm_int<3, false>" }
%"struct.ssdm_int<3, false>" = type { i3 }
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
%struct.EventQueueEntry = type { %struct.TimeWarpEvent, %"struct.ap_uint<1>", %"struct.ap_int<16>" }

; Function Attrs: noinline
define void @apatb_event_queue_kernel_ir(%"struct.ap_uint<3>"* nocapture readonly %op, %struct.TimeWarpEvent* nocapture readonly %event, %"struct.ap_int<16>"* nocapture readonly %lp_id, %"struct.ap_int<32>"* nocapture readonly %time, %struct.EventQueueEntry* noalias nocapture nonnull dereferenceable(24) %result_entry, i1* noalias nocapture nonnull dereferenceable(1) %success) local_unnamed_addr #0 {
entry:
  %result_entry_copy = alloca i146, align 512
  %success_copy = alloca i1, align 512
  call fastcc void @copy_in(%struct.EventQueueEntry* nonnull %result_entry, i146* nonnull align 512 %result_entry_copy, i1* nonnull %success, i1* nonnull align 512 %success_copy)
  call void @apatb_event_queue_kernel_hw(%"struct.ap_uint<3>"* %op, %struct.TimeWarpEvent* %event, %"struct.ap_int<16>"* %lp_id, %"struct.ap_int<32>"* %time, i146* %result_entry_copy, i1* %success_copy)
  call void @copy_back(%struct.EventQueueEntry* %result_entry, i146* %result_entry_copy, i1* %success, i1* %success_copy)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_in(%struct.EventQueueEntry* noalias readonly, i146* noalias align 512, i1* noalias readonly, i1* noalias align 512) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0struct.EventQueueEntry(i146* align 512 %1, %struct.EventQueueEntry* %0)
  call fastcc void @onebyonecpy_hls.p0i1(i1* align 512 %3, i1* %2)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0struct.EventQueueEntry(i146* noalias align 512, %struct.EventQueueEntry* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq i146* %0, null
  %3 = icmp eq %struct.EventQueueEntry* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  %.0.0.0.0.010 = getelementptr %struct.EventQueueEntry, %struct.EventQueueEntry* %1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %5 = load i32, i32* %.0.0.0.0.010, align 4
  %6 = zext i32 %5 to i146
  %.0.1.0.0.018 = getelementptr %struct.EventQueueEntry, %struct.EventQueueEntry* %1, i32 0, i32 0, i32 1, i32 0, i32 0, i32 0
  %7 = load i32, i32* %.0.1.0.0.018, align 4
  %8 = zext i32 %7 to i146
  %9 = shl i146 %8, 32
  %.partset6 = or i146 %9, %6
  %.0.2.0.0.026 = getelementptr %struct.EventQueueEntry, %struct.EventQueueEntry* %1, i32 0, i32 0, i32 2, i32 0, i32 0, i32 0
  %10 = load i32, i32* %.0.2.0.0.026, align 4
  %11 = zext i32 %10 to i146
  %12 = shl i146 %11, 64
  %.partset5 = or i146 %.partset6, %12
  %.0.3.0.0.034 = getelementptr %struct.EventQueueEntry, %struct.EventQueueEntry* %1, i32 0, i32 0, i32 3, i32 0, i32 0, i32 0
  %13 = load i16, i16* %.0.3.0.0.034, align 2
  %14 = zext i16 %13 to i146
  %15 = shl i146 %14, 96
  %.partset4 = or i146 %.partset5, %15
  %.0.4.0.0.042 = getelementptr %struct.EventQueueEntry, %struct.EventQueueEntry* %1, i32 0, i32 0, i32 4, i32 0, i32 0, i32 0
  %16 = load i16, i16* %.0.4.0.0.042, align 2
  %17 = zext i16 %16 to i146
  %18 = shl i146 %17, 112
  %.0.5.0.0.050 = getelementptr %struct.EventQueueEntry, %struct.EventQueueEntry* %1, i32 0, i32 0, i32 5, i32 0, i32 0, i32 0
  %19 = bitcast i1* %.0.5.0.0.050 to i8*
  %20 = load i8, i8* %19
  %21 = trunc i8 %20 to i1
  %22 = zext i1 %21 to i146
  %23 = shl i146 %22, 128
  %.1.0.0.056 = getelementptr %struct.EventQueueEntry, %struct.EventQueueEntry* %1, i32 0, i32 1, i32 0, i32 0, i32 0
  %24 = bitcast i1* %.1.0.0.056 to i8*
  %25 = load i8, i8* %24
  %26 = trunc i8 %25 to i1
  %27 = zext i1 %26 to i146
  %28 = shl i146 %27, 129
  %.2.0.0.062 = getelementptr %struct.EventQueueEntry, %struct.EventQueueEntry* %1, i32 0, i32 2, i32 0, i32 0, i32 0
  %29 = load i16, i16* %.2.0.0.062, align 2
  %30 = zext i16 %29 to i146
  %31 = shl i146 %30, 130
  %.masked.masked = or i146 %.partset4, %18
  %.masked8 = or i146 %.masked.masked, %23
  %32 = or i146 %.masked8, %28
  %.partset = or i146 %32, %31
  store i146 %.partset, i146* %0, align 512
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
define internal fastcc void @copy_out(%struct.EventQueueEntry* noalias, i146* noalias readonly align 512, i1* noalias, i1* noalias readonly align 512) unnamed_addr #3 {
entry:
  call fastcc void @onebyonecpy_hls.p0struct.EventQueueEntry.473(%struct.EventQueueEntry* %0, i146* align 512 %1)
  call fastcc void @onebyonecpy_hls.p0i1(i1* %2, i1* align 512 %3)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0struct.EventQueueEntry.473(%struct.EventQueueEntry* noalias, i146* noalias readonly align 512) unnamed_addr #2 {
entry:
  %2 = icmp eq %struct.EventQueueEntry* %0, null
  %3 = icmp eq i146* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  %.01.0.0.0.011 = getelementptr %struct.EventQueueEntry, %struct.EventQueueEntry* %0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %5 = bitcast i146* %1 to i152*
  %6 = load i152, i152* %5
  %7 = trunc i152 %6 to i146
  %.partselect7 = trunc i146 %7 to i32
  store i32 %.partselect7, i32* %.01.0.0.0.011, align 512
  %.01.1.0.0.019 = getelementptr %struct.EventQueueEntry, %struct.EventQueueEntry* %0, i32 0, i32 0, i32 1, i32 0, i32 0, i32 0
  %8 = lshr i146 %7, 32
  %.partselect6 = trunc i146 %8 to i32
  store i32 %.partselect6, i32* %.01.1.0.0.019, align 4
  %.01.2.0.0.027 = getelementptr %struct.EventQueueEntry, %struct.EventQueueEntry* %0, i32 0, i32 0, i32 2, i32 0, i32 0, i32 0
  %9 = lshr i146 %7, 64
  %.partselect5 = trunc i146 %9 to i32
  store i32 %.partselect5, i32* %.01.2.0.0.027, align 8
  %.01.3.0.0.035 = getelementptr %struct.EventQueueEntry, %struct.EventQueueEntry* %0, i32 0, i32 0, i32 3, i32 0, i32 0, i32 0
  %10 = lshr i146 %7, 96
  %.partselect4 = trunc i146 %10 to i16
  store i16 %.partselect4, i16* %.01.3.0.0.035, align 4
  %.01.4.0.0.043 = getelementptr %struct.EventQueueEntry, %struct.EventQueueEntry* %0, i32 0, i32 0, i32 4, i32 0, i32 0, i32 0
  %11 = lshr i146 %7, 112
  %.partselect3 = trunc i146 %11 to i16
  store i16 %.partselect3, i16* %.01.4.0.0.043, align 2
  %.01.5.0.0.051 = getelementptr %struct.EventQueueEntry, %struct.EventQueueEntry* %0, i32 0, i32 0, i32 5, i32 0, i32 0, i32 0
  %12 = lshr i146 %7, 128
  %.partselect2 = trunc i146 %12 to i1
  store i1 %.partselect2, i1* %.01.5.0.0.051, align 16
  %.12.0.0.057 = getelementptr %struct.EventQueueEntry, %struct.EventQueueEntry* %0, i32 0, i32 1, i32 0, i32 0, i32 0
  %13 = lshr i146 %7, 129
  %.partselect1 = trunc i146 %13 to i1
  store i1 %.partselect1, i1* %.12.0.0.057, align 4
  %.23.0.0.063 = getelementptr %struct.EventQueueEntry, %struct.EventQueueEntry* %0, i32 0, i32 2, i32 0, i32 0, i32 0
  %14 = lshr i146 %7, 130
  %.partselect = trunc i146 %14 to i16
  store i16 %.partselect, i16* %.23.0.0.063, align 2
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

declare void @apatb_event_queue_kernel_hw(%"struct.ap_uint<3>"*, %struct.TimeWarpEvent*, %"struct.ap_int<16>"*, %"struct.ap_int<32>"*, i146*, i1*)

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_back(%struct.EventQueueEntry* noalias, i146* noalias readonly align 512, i1* noalias, i1* noalias readonly align 512) unnamed_addr #3 {
entry:
  call fastcc void @onebyonecpy_hls.p0struct.EventQueueEntry.473(%struct.EventQueueEntry* %0, i146* align 512 %1)
  call fastcc void @onebyonecpy_hls.p0i1(i1* %2, i1* align 512 %3)
  ret void
}

define void @event_queue_kernel_hw_stub_wrapper(%"struct.ap_uint<3>"*, %struct.TimeWarpEvent*, %"struct.ap_int<16>"*, %"struct.ap_int<32>"*, i146*, i1*) #4 {
entry:
  %6 = alloca %struct.EventQueueEntry
  call void @copy_out(%struct.EventQueueEntry* %6, i146* %4, i1* null, i1* %5)
  call void @event_queue_kernel_hw_stub(%"struct.ap_uint<3>"* %0, %struct.TimeWarpEvent* %1, %"struct.ap_int<16>"* %2, %"struct.ap_int<32>"* %3, %struct.EventQueueEntry* %6, i1* %5)
  call void @copy_in(%struct.EventQueueEntry* %6, i146* %4, i1* null, i1* %5)
  ret void
}

declare void @event_queue_kernel_hw_stub(%"struct.ap_uint<3>"*, %struct.TimeWarpEvent*, %"struct.ap_int<16>"*, %"struct.ap_int<32>"*, %struct.EventQueueEntry*, i1*)

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
