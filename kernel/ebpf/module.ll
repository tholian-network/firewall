; ModuleID = '/home/cookiengineer/Software/cookiengineer/ebpf-firewall/kernel/ebpf/module.c'
source_filename = "/home/cookiengineer/Software/cookiengineer/ebpf-firewall/kernel/ebpf/module.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.anon.9 = type { ptr, ptr, ptr, ptr }
%struct.anon.10 = type { ptr, ptr, ptr, ptr }
%struct.anon.11 = type { ptr, ptr, ptr, ptr }
%struct.anon.12 = type { ptr, ptr, ptr, ptr }
%struct.anon.13 = type { ptr, ptr, ptr, ptr }
%struct.anon.14 = type { ptr, ptr, ptr, ptr }
%struct.xdp_md = type { i32, i32, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, %union.anon }
%union.anon = type { %struct.anon }
%struct.anon = type { i32, i32 }
%struct.udphdr = type { i16, i16, i16, i16 }
%struct.tcphdr = type { i16, i16, i32, i32, i16, i16, i16, i16 }
%struct.icmphdr = type { i8, i8, i16, %union.anon.5 }
%union.anon.5 = type { i32 }
%struct.ipv6hdr = type { i8, [3 x i8], i16, i8, i8, %union.anon.1 }
%union.anon.1 = type { %struct.anon.2 }
%struct.anon.2 = type { %struct.in6_addr, %struct.in6_addr }
%struct.in6_addr = type { %union.anon.3 }
%union.anon.3 = type { [4 x i32] }
%struct.ipv6_opt_hdr = type { i8, i8 }
%struct.icmp6hdr = type { i8, i8, i16, %union.anon.8 }
%union.anon.8 = type { [1 x i32] }

@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !0
@domain_bans = dso_local global %struct.anon.9 zeroinitializer, section ".maps", align 8, !dbg !60
@ipv4_bans = dso_local global %struct.anon.10 zeroinitializer, section ".maps", align 8, !dbg !85
@ipv4_warnings = dso_local global %struct.anon.11 zeroinitializer, section ".maps", align 8, !dbg !95
@ipv6_bans = dso_local global %struct.anon.12 zeroinitializer, section ".maps", align 8, !dbg !111
@ipv6_warnings = dso_local global %struct.anon.13 zeroinitializer, section ".maps", align 8, !dbg !123
@port_bans = dso_local global %struct.anon.14 zeroinitializer, section ".maps", align 8, !dbg !131
@llvm.compiler.used = appending global [8 x ptr] [ptr @_license, ptr @domain_bans, ptr @ipv4_bans, ptr @ipv4_warnings, ptr @ipv6_bans, ptr @ipv6_warnings, ptr @port_bans, ptr @xdp_prog_main], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @xdp_prog_main(ptr nocapture noundef readonly %0) #0 section "xdp" !dbg !168 {
  %2 = alloca i16, align 2
  %3 = alloca i16, align 2
  %4 = alloca i8, align 1
  %5 = alloca i8, align 1
  %6 = alloca i8, align 1
  %7 = alloca i16, align 2
  %8 = alloca i16, align 2
  %9 = alloca i16, align 2
  %10 = alloca i16, align 2
  %11 = alloca i8, align 1
  %12 = alloca i8, align 1
  %13 = alloca i8, align 1
  %14 = alloca i16, align 2
  %15 = alloca i16, align 2
  %16 = alloca i32, align 4
  %17 = alloca i128, align 16
  call void @llvm.dbg.value(metadata ptr %0, metadata !181, metadata !DIExpression()), !dbg !413
  %18 = getelementptr inbounds %struct.xdp_md, ptr %0, i64 0, i32 1, !dbg !414
  %19 = load i32, ptr %18, align 4, !dbg !414, !tbaa !415
  %20 = zext i32 %19 to i64, !dbg !420
  %21 = inttoptr i64 %20 to ptr, !dbg !421
  call void @llvm.dbg.value(metadata ptr %21, metadata !182, metadata !DIExpression()), !dbg !413
  %22 = load i32, ptr %0, align 4, !dbg !422, !tbaa !423
  %23 = zext i32 %22 to i64, !dbg !424
  %24 = inttoptr i64 %23 to ptr, !dbg !425
  call void @llvm.dbg.value(metadata ptr %24, metadata !183, metadata !DIExpression()), !dbg !413
  %25 = getelementptr i8, ptr %24, i64 14, !dbg !426
  %26 = icmp ugt ptr %25, %21, !dbg !428
  br i1 %26, label %387, label %27, !dbg !429

27:                                               ; preds = %1
  call void @llvm.dbg.value(metadata ptr null, metadata !190, metadata !DIExpression()), !dbg !413
  call void @llvm.dbg.value(metadata ptr null, metadata !204, metadata !DIExpression()), !dbg !413
  call void @llvm.dbg.value(metadata ptr null, metadata !235, metadata !DIExpression()), !dbg !413
  call void @llvm.dbg.value(metadata ptr %24, metadata !185, metadata !DIExpression()), !dbg !413
  call void @llvm.dbg.value(metadata ptr undef, metadata !430, metadata !DIExpression()), !dbg !449
  call void @llvm.dbg.value(metadata ptr %21, metadata !437, metadata !DIExpression()), !dbg !449
  call void @llvm.dbg.value(metadata ptr undef, metadata !438, metadata !DIExpression()), !dbg !449
  call void @llvm.dbg.value(metadata ptr %24, metadata !439, metadata !DIExpression()), !dbg !449
  call void @llvm.dbg.value(metadata ptr %25, metadata !185, metadata !DIExpression()), !dbg !413
  call void @llvm.dbg.value(metadata ptr %25, metadata !440, metadata !DIExpression()), !dbg !449
  %28 = getelementptr inbounds %struct.ethhdr, ptr %24, i64 0, i32 2, !dbg !451
  call void @llvm.dbg.value(metadata i16 undef, metadata !447, metadata !DIExpression()), !dbg !449
  call void @llvm.dbg.value(metadata i32 0, metadata !448, metadata !DIExpression()), !dbg !449
  %29 = load i16, ptr %28, align 1, !dbg !449, !tbaa !452
  call void @llvm.dbg.value(metadata i16 %29, metadata !447, metadata !DIExpression()), !dbg !449
  call void @llvm.dbg.value(metadata i16 %29, metadata !454, metadata !DIExpression()), !dbg !459
  %30 = icmp eq i16 %29, 129, !dbg !465
  %31 = icmp eq i16 %29, -22392, !dbg !466
  %32 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 2, i1 %30)
  %33 = or i1 %31, %32, !dbg !466
  %34 = xor i1 %33, true, !dbg !467
  %35 = getelementptr inbounds %struct.ethhdr, ptr %24, i64 1, i32 0, i64 4
  %36 = icmp ugt ptr %35, %21
  %37 = select i1 %34, i1 true, i1 %36, !dbg !468
  br i1 %37, label %74, label %38, !dbg !468

38:                                               ; preds = %27
  %39 = getelementptr inbounds %struct.ethhdr, ptr %24, i64 1, i32 0, i64 2, !dbg !469
  call void @llvm.dbg.value(metadata i16 undef, metadata !447, metadata !DIExpression()), !dbg !449
  call void @llvm.dbg.value(metadata ptr %35, metadata !440, metadata !DIExpression()), !dbg !449
  call void @llvm.dbg.value(metadata i32 1, metadata !448, metadata !DIExpression()), !dbg !449
  %40 = load i16, ptr %39, align 1, !dbg !449, !tbaa !452
  call void @llvm.dbg.value(metadata i16 %40, metadata !447, metadata !DIExpression()), !dbg !449
  call void @llvm.dbg.value(metadata i16 %40, metadata !454, metadata !DIExpression()), !dbg !459
  %41 = icmp eq i16 %40, 129, !dbg !465
  %42 = icmp eq i16 %40, -22392, !dbg !466
  %43 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 2, i1 %41)
  %44 = or i1 %42, %43, !dbg !466
  %45 = xor i1 %44, true, !dbg !467
  %46 = getelementptr inbounds %struct.ethhdr, ptr %24, i64 1, i32 1, i64 2
  %47 = icmp ugt ptr %46, %21
  %48 = select i1 %45, i1 true, i1 %47, !dbg !468
  br i1 %48, label %74, label %49, !dbg !468

49:                                               ; preds = %38
  %50 = getelementptr inbounds %struct.ethhdr, ptr %24, i64 1, i32 1, !dbg !469
  call void @llvm.dbg.value(metadata i16 undef, metadata !447, metadata !DIExpression()), !dbg !449
  call void @llvm.dbg.value(metadata ptr %46, metadata !440, metadata !DIExpression()), !dbg !449
  call void @llvm.dbg.value(metadata i32 2, metadata !448, metadata !DIExpression()), !dbg !449
  %51 = load i16, ptr %50, align 1, !dbg !449, !tbaa !452
  call void @llvm.dbg.value(metadata i16 %51, metadata !447, metadata !DIExpression()), !dbg !449
  call void @llvm.dbg.value(metadata i16 %51, metadata !454, metadata !DIExpression()), !dbg !459
  %52 = icmp eq i16 %51, 129, !dbg !465
  %53 = icmp eq i16 %51, -22392, !dbg !466
  %54 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 2, i1 %52)
  %55 = or i1 %53, %54, !dbg !466
  %56 = xor i1 %55, true, !dbg !467
  %57 = getelementptr inbounds %struct.ethhdr, ptr %24, i64 1, i32 2
  %58 = icmp ugt ptr %57, %21
  %59 = select i1 %56, i1 true, i1 %58, !dbg !468
  br i1 %59, label %74, label %60, !dbg !468

60:                                               ; preds = %49
  %61 = getelementptr inbounds %struct.ethhdr, ptr %24, i64 1, i32 1, i64 4, !dbg !469
  call void @llvm.dbg.value(metadata i16 undef, metadata !447, metadata !DIExpression()), !dbg !449
  call void @llvm.dbg.value(metadata ptr %57, metadata !440, metadata !DIExpression()), !dbg !449
  call void @llvm.dbg.value(metadata i32 3, metadata !448, metadata !DIExpression()), !dbg !449
  %62 = load i16, ptr %61, align 1, !dbg !449, !tbaa !452
  call void @llvm.dbg.value(metadata i16 %62, metadata !447, metadata !DIExpression()), !dbg !449
  call void @llvm.dbg.value(metadata i16 %62, metadata !454, metadata !DIExpression()), !dbg !459
  %63 = icmp eq i16 %62, 129, !dbg !465
  %64 = icmp eq i16 %62, -22392, !dbg !466
  %65 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 2, i1 %63)
  %66 = or i1 %64, %65, !dbg !466
  %67 = xor i1 %66, true, !dbg !467
  %68 = getelementptr inbounds %struct.ethhdr, ptr %24, i64 2, i32 0, i64 2
  %69 = icmp ugt ptr %68, %21
  %70 = select i1 %67, i1 true, i1 %69, !dbg !468
  br i1 %70, label %74, label %71, !dbg !468

71:                                               ; preds = %60
  %72 = getelementptr inbounds %struct.ethhdr, ptr %24, i64 2, !dbg !469
  call void @llvm.dbg.value(metadata i16 undef, metadata !447, metadata !DIExpression()), !dbg !449
  call void @llvm.dbg.value(metadata ptr %68, metadata !440, metadata !DIExpression()), !dbg !449
  call void @llvm.dbg.value(metadata i32 4, metadata !448, metadata !DIExpression()), !dbg !449
  %73 = load i16, ptr %72, align 1, !dbg !449, !tbaa !452
  call void @llvm.dbg.value(metadata i16 %73, metadata !447, metadata !DIExpression()), !dbg !449
  br label %74

74:                                               ; preds = %27, %38, %49, %60, %71
  %75 = phi ptr [ %25, %27 ], [ %35, %38 ], [ %46, %49 ], [ %57, %60 ], [ %68, %71 ], !dbg !449
  %76 = phi i16 [ %29, %27 ], [ %40, %38 ], [ %51, %49 ], [ %62, %60 ], [ %73, %71 ], !dbg !449
  call void @llvm.dbg.value(metadata ptr %75, metadata !185, metadata !DIExpression()), !dbg !413
  call void @llvm.dbg.value(metadata i16 %76, metadata !184, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_signed, DW_OP_LLVM_convert, 32, DW_ATE_signed, DW_OP_stack_value)), !dbg !413
  switch i16 %76, label %387 [
    i16 8, label %77
    i16 -8826, label %179
  ], !dbg !470

77:                                               ; preds = %74
  call void @llvm.dbg.value(metadata ptr undef, metadata !471, metadata !DIExpression()), !dbg !481
  call void @llvm.dbg.value(metadata ptr %21, metadata !477, metadata !DIExpression()), !dbg !481
  call void @llvm.dbg.value(metadata ptr undef, metadata !478, metadata !DIExpression()), !dbg !481
  call void @llvm.dbg.value(metadata ptr %75, metadata !479, metadata !DIExpression()), !dbg !481
  %78 = getelementptr inbounds %struct.iphdr, ptr %75, i64 1, !dbg !483
  %79 = icmp ugt ptr %78, %21, !dbg !485
  br i1 %79, label %87, label %80, !dbg !486

80:                                               ; preds = %77
  %81 = load i8, ptr %75, align 4, !dbg !487
  %82 = shl i8 %81, 2, !dbg !488
  %83 = and i8 %82, 60, !dbg !488
  %84 = zext i8 %83 to i64
  call void @llvm.dbg.value(metadata i64 %84, metadata !480, metadata !DIExpression()), !dbg !481
  %85 = getelementptr i8, ptr %75, i64 %84, !dbg !489
  %86 = icmp ugt ptr %85, %21, !dbg !491
  br i1 %86, label %87, label %88, !dbg !492

87:                                               ; preds = %77, %80
  call void @llvm.dbg.value(metadata ptr %85, metadata !185, metadata !DIExpression()), !dbg !413
  call void @llvm.dbg.value(metadata i8 undef, metadata !278, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !493
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %16) #6, !dbg !494
  call void @llvm.dbg.value(metadata i32 0, metadata !281, metadata !DIExpression()), !dbg !493
  call void @llvm.dbg.value(metadata i32 0, metadata !282, metadata !DIExpression()), !dbg !493
  call void @llvm.dbg.value(metadata ptr %75, metadata !204, metadata !DIExpression()), !dbg !413
  call void @llvm.dbg.value(metadata i32 %92, metadata !281, metadata !DIExpression()), !dbg !493
  br label %176, !dbg !495

88:                                               ; preds = %80
  call void @llvm.dbg.value(metadata ptr %85, metadata !185, metadata !DIExpression()), !dbg !413
  %89 = getelementptr inbounds %struct.iphdr, ptr %75, i64 0, i32 6, !dbg !496
  %90 = load i8, ptr %89, align 1, !dbg !496, !tbaa !497
  call void @llvm.dbg.value(metadata i8 undef, metadata !278, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !493
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %16) #6, !dbg !494
  call void @llvm.dbg.value(metadata i32 0, metadata !281, metadata !DIExpression()), !dbg !493
  call void @llvm.dbg.value(metadata i32 0, metadata !282, metadata !DIExpression()), !dbg !493
  call void @llvm.dbg.value(metadata ptr %75, metadata !204, metadata !DIExpression()), !dbg !413
  %91 = getelementptr inbounds %struct.iphdr, ptr %75, i64 0, i32 8, !dbg !499
  call void @llvm.dbg.value(metadata ptr %16, metadata !281, metadata !DIExpression(DW_OP_deref)), !dbg !493
  %92 = load i32, ptr %91, align 4, !dbg !499
  store i32 %92, ptr %16, align 4, !dbg !499
  call void @llvm.dbg.value(metadata ptr undef, metadata !204, metadata !DIExpression()), !dbg !413
  call void @llvm.dbg.value(metadata i32 undef, metadata !282, metadata !DIExpression()), !dbg !493
  call void @llvm.dbg.value(metadata i32 %92, metadata !281, metadata !DIExpression()), !dbg !493
  %93 = icmp eq i32 %92, 0, !dbg !502
  br i1 %93, label %97, label %94, !dbg !504

94:                                               ; preds = %88
  call void @llvm.dbg.value(metadata ptr %16, metadata !281, metadata !DIExpression(DW_OP_deref)), !dbg !493
  call void @llvm.dbg.value(metadata ptr %16, metadata !505, metadata !DIExpression()), !dbg !512
  call void @llvm.dbg.value(metadata ptr null, metadata !511, metadata !DIExpression()), !dbg !512
  %95 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @ipv4_bans, ptr noundef nonnull %16) #6, !dbg !516
  call void @llvm.dbg.value(metadata ptr %95, metadata !511, metadata !DIExpression()), !dbg !512
  %96 = icmp eq ptr %95, null, !dbg !517
  br i1 %96, label %97, label %177, !dbg !519

97:                                               ; preds = %94, %88
  switch i8 %90, label %176 [
    i8 17, label %98
    i8 6, label %115
    i8 1, label %163
  ], !dbg !495

98:                                               ; preds = %97
  call void @llvm.dbg.value(metadata ptr null, metadata !283, metadata !DIExpression()), !dbg !520
  call void @llvm.dbg.value(metadata ptr undef, metadata !521, metadata !DIExpression()), !dbg !531
  call void @llvm.dbg.value(metadata ptr %21, metadata !527, metadata !DIExpression()), !dbg !531
  call void @llvm.dbg.value(metadata ptr undef, metadata !528, metadata !DIExpression()), !dbg !531
  call void @llvm.dbg.value(metadata ptr %85, metadata !530, metadata !DIExpression()), !dbg !531
  %99 = getelementptr inbounds %struct.udphdr, ptr %85, i64 1, !dbg !533
  %100 = icmp ugt ptr %99, %21, !dbg !535
  br i1 %100, label %177, label %101, !dbg !536

101:                                              ; preds = %98
  call void @llvm.dbg.value(metadata ptr %99, metadata !185, metadata !DIExpression()), !dbg !413
  %102 = getelementptr inbounds %struct.udphdr, ptr %85, i64 0, i32 2, !dbg !537
  %103 = load i16, ptr %102, align 2, !dbg !537, !tbaa !538
  %104 = call i16 @llvm.bswap.i16(i16 %103), !dbg !537
  call void @llvm.dbg.value(metadata i16 %104, metadata !529, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_constu, 8, DW_OP_minus, DW_OP_stack_value)), !dbg !531
  %105 = icmp ult i16 %104, 8, !dbg !540
  br i1 %105, label %177, label %106, !dbg !542

106:                                              ; preds = %101
  call void @llvm.dbg.value(metadata i16 %104, metadata !529, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_constu, 8, DW_OP_minus, DW_OP_stack_value)), !dbg !531
  call void @llvm.dbg.value(metadata i16 %104, metadata !529, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_constu, 8, DW_OP_minus, DW_OP_stack_value)), !dbg !531
  call void @llvm.dbg.value(metadata i16 %104, metadata !294, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_constu, 8, DW_OP_minus, DW_OP_stack_value)), !dbg !520
  call void @llvm.dbg.value(metadata ptr %85, metadata !283, metadata !DIExpression()), !dbg !520
  %107 = load i16, ptr %85, align 2, !dbg !543, !tbaa !544
  call void @llvm.dbg.value(metadata i16 %107, metadata !295, metadata !DIExpression()), !dbg !520
  call void @llvm.lifetime.start.p0(i64 2, ptr nonnull %15), !dbg !545
  call void @llvm.dbg.value(metadata i16 %107, metadata !550, metadata !DIExpression()), !dbg !545
  store i16 %107, ptr %15, align 2, !tbaa !452
  call void @llvm.dbg.value(metadata ptr null, metadata !551, metadata !DIExpression()), !dbg !545
  call void @llvm.dbg.value(metadata ptr %15, metadata !550, metadata !DIExpression(DW_OP_deref)), !dbg !545
  %108 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @port_bans, ptr noundef nonnull %15) #6, !dbg !554
  call void @llvm.dbg.value(metadata ptr %108, metadata !551, metadata !DIExpression()), !dbg !545
  %109 = icmp eq ptr %108, null, !dbg !555
  call void @llvm.lifetime.end.p0(i64 2, ptr nonnull %15), !dbg !557
  br i1 %109, label %110, label %177, !dbg !558

110:                                              ; preds = %106
  call void @llvm.dbg.value(metadata ptr %85, metadata !283, metadata !DIExpression()), !dbg !520
  %111 = getelementptr inbounds %struct.udphdr, ptr %85, i64 0, i32 1, !dbg !559
  %112 = load i16, ptr %111, align 2, !dbg !559, !tbaa !560
  call void @llvm.dbg.value(metadata i16 %112, metadata !296, metadata !DIExpression()), !dbg !520
  call void @llvm.lifetime.start.p0(i64 2, ptr nonnull %14), !dbg !561
  call void @llvm.dbg.value(metadata i16 %112, metadata !550, metadata !DIExpression()), !dbg !561
  store i16 %112, ptr %14, align 2, !tbaa !452
  call void @llvm.dbg.value(metadata ptr null, metadata !551, metadata !DIExpression()), !dbg !561
  call void @llvm.dbg.value(metadata ptr %14, metadata !550, metadata !DIExpression(DW_OP_deref)), !dbg !561
  %113 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @port_bans, ptr noundef nonnull %14) #6, !dbg !564
  call void @llvm.dbg.value(metadata ptr %113, metadata !551, metadata !DIExpression()), !dbg !561
  %114 = icmp eq ptr %113, null, !dbg !565
  call void @llvm.lifetime.end.p0(i64 2, ptr nonnull %14), !dbg !566
  br i1 %114, label %176, label %177

115:                                              ; preds = %97
  call void @llvm.dbg.value(metadata ptr null, metadata !297, metadata !DIExpression()), !dbg !567
  call void @llvm.dbg.value(metadata ptr undef, metadata !568, metadata !DIExpression()), !dbg !578
  call void @llvm.dbg.value(metadata ptr %21, metadata !574, metadata !DIExpression()), !dbg !578
  call void @llvm.dbg.value(metadata ptr undef, metadata !575, metadata !DIExpression()), !dbg !578
  call void @llvm.dbg.value(metadata ptr %85, metadata !577, metadata !DIExpression()), !dbg !578
  %116 = getelementptr inbounds %struct.tcphdr, ptr %85, i64 1, !dbg !580
  %117 = icmp ugt ptr %116, %21, !dbg !582
  br i1 %117, label %177, label %118, !dbg !583

118:                                              ; preds = %115
  %119 = getelementptr inbounds %struct.tcphdr, ptr %85, i64 0, i32 4, !dbg !584
  %120 = load i16, ptr %119, align 4, !dbg !584
  %121 = lshr i16 %120, 2, !dbg !585
  %122 = and i16 %121, 60, !dbg !585
  call void @llvm.dbg.value(metadata i16 %122, metadata !576, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !578
  %123 = zext i16 %122 to i64
  %124 = getelementptr i8, ptr %85, i64 %123, !dbg !586
  %125 = icmp ugt ptr %124, %21, !dbg !588
  br i1 %125, label %177, label %126, !dbg !589

126:                                              ; preds = %118
  call void @llvm.dbg.value(metadata i16 %122, metadata !576, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !578
  call void @llvm.dbg.value(metadata ptr %116, metadata !185, metadata !DIExpression()), !dbg !413
  call void @llvm.dbg.value(metadata i16 %122, metadata !321, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !567
  call void @llvm.dbg.value(metadata ptr %85, metadata !297, metadata !DIExpression()), !dbg !567
  call void @llvm.dbg.value(metadata ptr %85, metadata !590, metadata !DIExpression()), !dbg !595
  %127 = and i16 %120, -256, !dbg !598
  switch i16 %127, label %132 [
    i16 256, label %177
    i16 5120, label %128
  ], !dbg !598

128:                                              ; preds = %126
  %129 = getelementptr inbounds %struct.tcphdr, ptr %85, i64 0, i32 5, !dbg !600
  %130 = load i16, ptr %129, align 2, !dbg !600, !tbaa !602
  %131 = icmp eq i16 %130, 0, !dbg !604
  br i1 %131, label %177, label %132, !dbg !605

132:                                              ; preds = %128, %126
  call void @llvm.dbg.value(metadata ptr %85, metadata !297, metadata !DIExpression()), !dbg !567
  call void @llvm.dbg.value(metadata ptr %85, metadata !606, metadata !DIExpression()), !dbg !609
  %133 = and i16 %120, -8448, !dbg !612
  %134 = icmp eq i16 %133, 512, !dbg !612
  br i1 %134, label %135, label %154, !dbg !612

135:                                              ; preds = %132
  %136 = getelementptr inbounds %struct.tcphdr, ptr %85, i64 0, i32 5, !dbg !614
  %137 = load i16, ptr %136, align 2, !dbg !614, !tbaa !602
  %138 = icmp eq i16 %137, -3846, !dbg !615
  br i1 %138, label %139, label %154, !dbg !616

139:                                              ; preds = %135
  call void @llvm.dbg.value(metadata ptr %16, metadata !281, metadata !DIExpression(DW_OP_deref)), !dbg !493
  call void @llvm.dbg.value(metadata ptr %16, metadata !617, metadata !DIExpression()), !dbg !630
  call void @llvm.dbg.value(metadata ptr null, metadata !621, metadata !DIExpression()), !dbg !630
  %140 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @ipv4_warnings, ptr noundef nonnull %16) #6, !dbg !633
  call void @llvm.dbg.value(metadata ptr %140, metadata !621, metadata !DIExpression()), !dbg !630
  %141 = icmp eq ptr %140, null, !dbg !634
  br i1 %141, label %152, label %142, !dbg !635

142:                                              ; preds = %139
  call void @llvm.lifetime.start.p0(i64 1, ptr nonnull %11) #6, !dbg !636
  call void @llvm.dbg.value(metadata i8 0, metadata !622, metadata !DIExpression()), !dbg !637
  %143 = load i8, ptr %140, align 1, !dbg !638, !tbaa !639
  %144 = add i8 %143, 1, !dbg !640
  call void @llvm.dbg.value(metadata i8 %144, metadata !622, metadata !DIExpression()), !dbg !637
  store i8 %144, ptr %11, align 1, !dbg !641, !tbaa !639
  call void @llvm.dbg.value(metadata ptr %11, metadata !622, metadata !DIExpression(DW_OP_deref)), !dbg !637
  %145 = call i64 inttoptr (i64 2 to ptr)(ptr noundef nonnull @ipv4_warnings, ptr noundef nonnull %16, ptr noundef nonnull %11, i64 noundef 0) #6, !dbg !642
  %146 = load i8, ptr %11, align 1, !dbg !643, !tbaa !639
  call void @llvm.dbg.value(metadata i8 %146, metadata !622, metadata !DIExpression()), !dbg !637
  %147 = icmp ugt i8 %146, 16, !dbg !644
  br i1 %147, label %148, label %151, !dbg !645

148:                                              ; preds = %142
  call void @llvm.lifetime.start.p0(i64 1, ptr nonnull %12) #6, !dbg !646
  call void @llvm.dbg.value(metadata i8 1, metadata !625, metadata !DIExpression()), !dbg !647
  store i8 1, ptr %12, align 1, !dbg !648, !tbaa !639
  call void @llvm.dbg.value(metadata ptr %12, metadata !625, metadata !DIExpression(DW_OP_deref)), !dbg !647
  %149 = call i64 inttoptr (i64 2 to ptr)(ptr noundef nonnull @ipv4_bans, ptr noundef nonnull %16, ptr noundef nonnull %12, i64 noundef 0) #6, !dbg !649
  call void @llvm.dbg.value(metadata i8 0, metadata !622, metadata !DIExpression()), !dbg !637
  store i8 0, ptr %11, align 1, !dbg !650, !tbaa !639
  call void @llvm.dbg.value(metadata ptr %11, metadata !622, metadata !DIExpression(DW_OP_deref)), !dbg !637
  %150 = call i64 inttoptr (i64 2 to ptr)(ptr noundef nonnull @ipv4_warnings, ptr noundef nonnull %16, ptr noundef nonnull %11, i64 noundef 0) #6, !dbg !651
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %12) #6, !dbg !652
  br label %151, !dbg !653

151:                                              ; preds = %148, %142
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %11) #6, !dbg !654
  br label %154, !dbg !655

152:                                              ; preds = %139
  call void @llvm.lifetime.start.p0(i64 1, ptr nonnull %13) #6, !dbg !656
  call void @llvm.dbg.value(metadata i8 1, metadata !628, metadata !DIExpression()), !dbg !657
  store i8 1, ptr %13, align 1, !dbg !658, !tbaa !639
  call void @llvm.dbg.value(metadata ptr %13, metadata !628, metadata !DIExpression(DW_OP_deref)), !dbg !657
  %153 = call i64 inttoptr (i64 2 to ptr)(ptr noundef nonnull @ipv4_warnings, ptr noundef nonnull %16, ptr noundef nonnull %13, i64 noundef 0) #6, !dbg !659
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %13) #6, !dbg !660
  br label %154

154:                                              ; preds = %152, %151, %135, %132
  call void @llvm.dbg.value(metadata ptr %85, metadata !297, metadata !DIExpression()), !dbg !567
  %155 = load i16, ptr %85, align 4, !dbg !661, !tbaa !662
  call void @llvm.dbg.value(metadata i16 %155, metadata !322, metadata !DIExpression()), !dbg !567
  call void @llvm.lifetime.start.p0(i64 2, ptr nonnull %10), !dbg !663
  call void @llvm.dbg.value(metadata i16 %155, metadata !550, metadata !DIExpression()), !dbg !663
  store i16 %155, ptr %10, align 2, !tbaa !452
  call void @llvm.dbg.value(metadata ptr null, metadata !551, metadata !DIExpression()), !dbg !663
  call void @llvm.dbg.value(metadata ptr %10, metadata !550, metadata !DIExpression(DW_OP_deref)), !dbg !663
  %156 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @port_bans, ptr noundef nonnull %10) #6, !dbg !666
  call void @llvm.dbg.value(metadata ptr %156, metadata !551, metadata !DIExpression()), !dbg !663
  %157 = icmp eq ptr %156, null, !dbg !667
  call void @llvm.lifetime.end.p0(i64 2, ptr nonnull %10), !dbg !668
  br i1 %157, label %158, label %177, !dbg !669

158:                                              ; preds = %154
  call void @llvm.dbg.value(metadata ptr %85, metadata !297, metadata !DIExpression()), !dbg !567
  %159 = getelementptr inbounds %struct.tcphdr, ptr %85, i64 0, i32 1, !dbg !670
  %160 = load i16, ptr %159, align 2, !dbg !670, !tbaa !671
  call void @llvm.dbg.value(metadata i16 %160, metadata !323, metadata !DIExpression()), !dbg !567
  call void @llvm.lifetime.start.p0(i64 2, ptr nonnull %9), !dbg !672
  call void @llvm.dbg.value(metadata i16 %160, metadata !550, metadata !DIExpression()), !dbg !672
  store i16 %160, ptr %9, align 2, !tbaa !452
  call void @llvm.dbg.value(metadata ptr null, metadata !551, metadata !DIExpression()), !dbg !672
  call void @llvm.dbg.value(metadata ptr %9, metadata !550, metadata !DIExpression(DW_OP_deref)), !dbg !672
  %161 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @port_bans, ptr noundef nonnull %9) #6, !dbg !675
  call void @llvm.dbg.value(metadata ptr %161, metadata !551, metadata !DIExpression()), !dbg !672
  %162 = icmp eq ptr %161, null, !dbg !676
  call void @llvm.lifetime.end.p0(i64 2, ptr nonnull %9), !dbg !677
  br i1 %162, label %176, label %177

163:                                              ; preds = %97
  call void @llvm.dbg.value(metadata ptr null, metadata !324, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata ptr undef, metadata !679, metadata !DIExpression()), !dbg !688
  call void @llvm.dbg.value(metadata ptr %21, metadata !685, metadata !DIExpression()), !dbg !688
  call void @llvm.dbg.value(metadata ptr undef, metadata !686, metadata !DIExpression()), !dbg !688
  call void @llvm.dbg.value(metadata ptr %85, metadata !687, metadata !DIExpression()), !dbg !688
  %164 = getelementptr inbounds %struct.icmphdr, ptr %85, i64 1, !dbg !690
  %165 = icmp ugt ptr %164, %21, !dbg !692
  %166 = icmp eq ptr %85, null
  %167 = or i1 %166, %165, !dbg !693
  call void @llvm.dbg.value(metadata ptr %164, metadata !185, metadata !DIExpression()), !dbg !413
  call void @llvm.dbg.value(metadata ptr %85, metadata !324, metadata !DIExpression()), !dbg !678
  br i1 %167, label %176, label %168, !dbg !693

168:                                              ; preds = %163
  call void @llvm.dbg.value(metadata ptr %85, metadata !694, metadata !DIExpression()), !dbg !700
  %169 = load i8, ptr %85, align 4, !dbg !703, !tbaa !704
  call void @llvm.dbg.value(metadata i8 %169, metadata !699, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !700
  %170 = icmp eq i8 %169, 0, !dbg !706
  %171 = call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %170)
  %172 = freeze i1 %171, !dbg !708
  br i1 %172, label %177, label %173, !dbg !708

173:                                              ; preds = %168
  switch i8 %169, label %174 [
    i8 19, label %177
    i8 18, label %177
    i8 17, label %177
    i8 16, label %177
    i8 15, label %177
    i8 14, label %177
    i8 13, label %177
    i8 10, label %177
    i8 9, label %177
    i8 8, label %177
    i8 7, label %177
    i8 6, label %177
    i8 4, label %177
    i8 2, label %177
    i8 1, label %177
  ], !dbg !708

174:                                              ; preds = %173
  %175 = icmp ugt i8 %169, 19, !dbg !709
  br i1 %175, label %177, label %176, !dbg !709

176:                                              ; preds = %163, %174, %158, %110, %87, %97
  br label %177, !dbg !710

177:                                              ; preds = %158, %128, %126, %118, %115, %154, %110, %101, %98, %106, %174, %168, %173, %173, %173, %173, %173, %173, %173, %173, %173, %173, %173, %173, %173, %173, %173, %94, %176
  %178 = phi i32 [ 2, %176 ], [ 1, %94 ], [ 1, %173 ], [ 1, %173 ], [ 1, %173 ], [ 1, %173 ], [ 1, %173 ], [ 1, %173 ], [ 1, %173 ], [ 1, %173 ], [ 1, %173 ], [ 1, %173 ], [ 1, %173 ], [ 1, %173 ], [ 1, %173 ], [ 1, %173 ], [ 1, %173 ], [ 1, %168 ], [ 1, %174 ], [ 1, %106 ], [ 1, %98 ], [ 1, %101 ], [ 1, %110 ], [ 1, %154 ], [ 1, %115 ], [ 1, %118 ], [ 1, %126 ], [ 1, %128 ], [ 1, %158 ], !dbg !493
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %16) #6, !dbg !711
  br label %387

179:                                              ; preds = %74
  call void @llvm.dbg.value(metadata ptr undef, metadata !712, metadata !DIExpression()), !dbg !721
  call void @llvm.dbg.value(metadata ptr %21, metadata !718, metadata !DIExpression()), !dbg !721
  call void @llvm.dbg.value(metadata ptr undef, metadata !719, metadata !DIExpression()), !dbg !721
  call void @llvm.dbg.value(metadata ptr %75, metadata !720, metadata !DIExpression()), !dbg !721
  %180 = getelementptr inbounds %struct.ipv6hdr, ptr %75, i64 1, !dbg !723
  %181 = icmp ugt ptr %180, %21, !dbg !725
  br i1 %181, label %283, label %182, !dbg !726

182:                                              ; preds = %179
  call void @llvm.dbg.value(metadata ptr %180, metadata !185, metadata !DIExpression()), !dbg !413
  call void @llvm.dbg.value(metadata ptr undef, metadata !727, metadata !DIExpression()), !dbg !744
  call void @llvm.dbg.value(metadata ptr %21, metadata !732, metadata !DIExpression()), !dbg !744
  call void @llvm.dbg.value(metadata i32 0, metadata !734, metadata !DIExpression()), !dbg !746
  call void @llvm.dbg.value(metadata i8 undef, metadata !733, metadata !DIExpression()), !dbg !744
  call void @llvm.dbg.value(metadata ptr %180, metadata !736, metadata !DIExpression()), !dbg !747
  %183 = getelementptr inbounds %struct.ipv6hdr, ptr %75, i64 1, i32 1, i64 1, !dbg !748
  %184 = icmp ugt ptr %183, %21, !dbg !750
  br i1 %184, label %284, label %185, !dbg !751

185:                                              ; preds = %182
  %186 = getelementptr inbounds %struct.ipv6hdr, ptr %75, i64 0, i32 3, !dbg !752
  %187 = load i8, ptr %186, align 2, !dbg !752, !tbaa !753
  call void @llvm.dbg.value(metadata i8 %187, metadata !733, metadata !DIExpression()), !dbg !744
  switch i8 %187, label %189 [
    i8 0, label %193
    i8 60, label %193
    i8 43, label %193
    i8 -121, label %193
    i8 51, label %188
    i8 44, label %200
  ], !dbg !755

188:                                              ; preds = %185
  call void @llvm.dbg.value(metadata i8 undef, metadata !733, metadata !DIExpression()), !dbg !744
  br label %193, !dbg !756

189:                                              ; preds = %265, %250, %235, %220, %205, %185
  %190 = phi ptr [ %180, %185 ], [ %202, %205 ], [ %217, %220 ], [ %232, %235 ], [ %247, %250 ], [ %262, %265 ], !dbg !721
  %191 = phi i8 [ %187, %185 ], [ %206, %205 ], [ %221, %220 ], [ %236, %235 ], [ %251, %250 ], [ %266, %265 ]
  call void @llvm.dbg.value(metadata ptr %190, metadata !185, metadata !DIExpression()), !dbg !413
  %192 = zext i8 %191 to i32, !dbg !758
  br label %284, !dbg !759

193:                                              ; preds = %188, %185, %185, %185, %185
  %194 = phi i64 [ 2, %188 ], [ 3, %185 ], [ 3, %185 ], [ 3, %185 ], [ 3, %185 ]
  %195 = getelementptr inbounds %struct.ipv6hdr, ptr %75, i64 1, i32 1, !dbg !760
  %196 = load i8, ptr %195, align 1, !dbg !760, !tbaa !761
  %197 = zext i8 %196 to i64, !dbg !760
  %198 = shl nuw nsw i64 %197, %194, !dbg !760
  %199 = add nuw nsw i64 %198, 8, !dbg !760
  br label %200, !dbg !760

200:                                              ; preds = %193, %185
  %201 = phi i64 [ 8, %185 ], [ %199, %193 ]
  %202 = getelementptr inbounds i8, ptr %180, i64 %201, !dbg !760
  call void @llvm.dbg.value(metadata ptr %202, metadata !185, metadata !DIExpression()), !dbg !413
  call void @llvm.dbg.value(metadata i32 1, metadata !734, metadata !DIExpression()), !dbg !746
  call void @llvm.dbg.value(metadata i8 undef, metadata !733, metadata !DIExpression()), !dbg !744
  call void @llvm.dbg.value(metadata ptr %202, metadata !736, metadata !DIExpression()), !dbg !747
  %203 = getelementptr inbounds %struct.ipv6_opt_hdr, ptr %202, i64 1, !dbg !748
  %204 = icmp ugt ptr %203, %21, !dbg !750
  br i1 %204, label %284, label %205, !dbg !751

205:                                              ; preds = %200
  %206 = load i8, ptr %180, align 1, !dbg !760, !tbaa !763
  call void @llvm.dbg.value(metadata i8 %206, metadata !733, metadata !DIExpression()), !dbg !744
  switch i8 %206, label %189 [
    i8 0, label %207
    i8 60, label %207
    i8 43, label %207
    i8 -121, label %207
    i8 51, label %208
    i8 44, label %215
  ], !dbg !755

207:                                              ; preds = %205, %205, %205, %205
  call void @llvm.dbg.value(metadata i8 undef, metadata !733, metadata !DIExpression()), !dbg !744
  br label %208, !dbg !764

208:                                              ; preds = %207, %205
  %209 = phi i64 [ 3, %207 ], [ 2, %205 ]
  %210 = getelementptr inbounds %struct.ipv6_opt_hdr, ptr %202, i64 0, i32 1, !dbg !760
  %211 = load i8, ptr %210, align 1, !dbg !760, !tbaa !761
  %212 = zext i8 %211 to i64, !dbg !760
  %213 = shl nuw nsw i64 %212, %209, !dbg !760
  %214 = add nuw nsw i64 %213, 8, !dbg !760
  br label %215, !dbg !760

215:                                              ; preds = %208, %205
  %216 = phi i64 [ 8, %205 ], [ %214, %208 ]
  %217 = getelementptr inbounds i8, ptr %202, i64 %216, !dbg !760
  call void @llvm.dbg.value(metadata ptr %217, metadata !185, metadata !DIExpression()), !dbg !413
  call void @llvm.dbg.value(metadata i32 2, metadata !734, metadata !DIExpression()), !dbg !746
  call void @llvm.dbg.value(metadata i8 undef, metadata !733, metadata !DIExpression()), !dbg !744
  call void @llvm.dbg.value(metadata ptr %217, metadata !736, metadata !DIExpression()), !dbg !747
  %218 = getelementptr inbounds %struct.ipv6_opt_hdr, ptr %217, i64 1, !dbg !748
  %219 = icmp ugt ptr %218, %21, !dbg !750
  br i1 %219, label %284, label %220, !dbg !751

220:                                              ; preds = %215
  %221 = load i8, ptr %202, align 1, !dbg !760, !tbaa !763
  call void @llvm.dbg.value(metadata i8 %221, metadata !733, metadata !DIExpression()), !dbg !744
  switch i8 %221, label %189 [
    i8 0, label %222
    i8 60, label %222
    i8 43, label %222
    i8 -121, label %222
    i8 51, label %223
    i8 44, label %230
  ], !dbg !755

222:                                              ; preds = %220, %220, %220, %220
  call void @llvm.dbg.value(metadata i8 undef, metadata !733, metadata !DIExpression()), !dbg !744
  br label %223, !dbg !764

223:                                              ; preds = %222, %220
  %224 = phi i64 [ 3, %222 ], [ 2, %220 ]
  %225 = getelementptr inbounds %struct.ipv6_opt_hdr, ptr %217, i64 0, i32 1, !dbg !760
  %226 = load i8, ptr %225, align 1, !dbg !760, !tbaa !761
  %227 = zext i8 %226 to i64, !dbg !760
  %228 = shl nuw nsw i64 %227, %224, !dbg !760
  %229 = add nuw nsw i64 %228, 8, !dbg !760
  br label %230, !dbg !760

230:                                              ; preds = %223, %220
  %231 = phi i64 [ 8, %220 ], [ %229, %223 ]
  %232 = getelementptr inbounds i8, ptr %217, i64 %231, !dbg !760
  call void @llvm.dbg.value(metadata ptr %232, metadata !185, metadata !DIExpression()), !dbg !413
  call void @llvm.dbg.value(metadata i32 3, metadata !734, metadata !DIExpression()), !dbg !746
  call void @llvm.dbg.value(metadata i8 undef, metadata !733, metadata !DIExpression()), !dbg !744
  call void @llvm.dbg.value(metadata ptr %232, metadata !736, metadata !DIExpression()), !dbg !747
  %233 = getelementptr inbounds %struct.ipv6_opt_hdr, ptr %232, i64 1, !dbg !748
  %234 = icmp ugt ptr %233, %21, !dbg !750
  br i1 %234, label %284, label %235, !dbg !751

235:                                              ; preds = %230
  %236 = load i8, ptr %217, align 1, !dbg !760, !tbaa !763
  call void @llvm.dbg.value(metadata i8 %236, metadata !733, metadata !DIExpression()), !dbg !744
  switch i8 %236, label %189 [
    i8 0, label %237
    i8 60, label %237
    i8 43, label %237
    i8 -121, label %237
    i8 51, label %238
    i8 44, label %245
  ], !dbg !755

237:                                              ; preds = %235, %235, %235, %235
  call void @llvm.dbg.value(metadata i8 undef, metadata !733, metadata !DIExpression()), !dbg !744
  br label %238, !dbg !764

238:                                              ; preds = %237, %235
  %239 = phi i64 [ 3, %237 ], [ 2, %235 ]
  %240 = getelementptr inbounds %struct.ipv6_opt_hdr, ptr %232, i64 0, i32 1, !dbg !760
  %241 = load i8, ptr %240, align 1, !dbg !760, !tbaa !761
  %242 = zext i8 %241 to i64, !dbg !760
  %243 = shl nuw nsw i64 %242, %239, !dbg !760
  %244 = add nuw nsw i64 %243, 8, !dbg !760
  br label %245, !dbg !760

245:                                              ; preds = %238, %235
  %246 = phi i64 [ 8, %235 ], [ %244, %238 ]
  %247 = getelementptr inbounds i8, ptr %232, i64 %246, !dbg !760
  call void @llvm.dbg.value(metadata ptr %247, metadata !185, metadata !DIExpression()), !dbg !413
  call void @llvm.dbg.value(metadata i32 4, metadata !734, metadata !DIExpression()), !dbg !746
  call void @llvm.dbg.value(metadata i8 undef, metadata !733, metadata !DIExpression()), !dbg !744
  call void @llvm.dbg.value(metadata ptr %247, metadata !736, metadata !DIExpression()), !dbg !747
  %248 = getelementptr inbounds %struct.ipv6_opt_hdr, ptr %247, i64 1, !dbg !748
  %249 = icmp ugt ptr %248, %21, !dbg !750
  br i1 %249, label %284, label %250, !dbg !751

250:                                              ; preds = %245
  %251 = load i8, ptr %232, align 1, !dbg !760, !tbaa !763
  call void @llvm.dbg.value(metadata i8 %251, metadata !733, metadata !DIExpression()), !dbg !744
  switch i8 %251, label %189 [
    i8 0, label %252
    i8 60, label %252
    i8 43, label %252
    i8 -121, label %252
    i8 51, label %253
    i8 44, label %260
  ], !dbg !755

252:                                              ; preds = %250, %250, %250, %250
  call void @llvm.dbg.value(metadata i8 undef, metadata !733, metadata !DIExpression()), !dbg !744
  br label %253, !dbg !764

253:                                              ; preds = %252, %250
  %254 = phi i64 [ 3, %252 ], [ 2, %250 ]
  %255 = getelementptr inbounds %struct.ipv6_opt_hdr, ptr %247, i64 0, i32 1, !dbg !760
  %256 = load i8, ptr %255, align 1, !dbg !760, !tbaa !761
  %257 = zext i8 %256 to i64, !dbg !760
  %258 = shl nuw nsw i64 %257, %254, !dbg !760
  %259 = add nuw nsw i64 %258, 8, !dbg !760
  br label %260, !dbg !760

260:                                              ; preds = %253, %250
  %261 = phi i64 [ 8, %250 ], [ %259, %253 ]
  %262 = getelementptr inbounds i8, ptr %247, i64 %261, !dbg !760
  call void @llvm.dbg.value(metadata ptr %262, metadata !185, metadata !DIExpression()), !dbg !413
  call void @llvm.dbg.value(metadata i32 5, metadata !734, metadata !DIExpression()), !dbg !746
  call void @llvm.dbg.value(metadata i8 undef, metadata !733, metadata !DIExpression()), !dbg !744
  call void @llvm.dbg.value(metadata ptr %262, metadata !736, metadata !DIExpression()), !dbg !747
  %263 = getelementptr inbounds %struct.ipv6_opt_hdr, ptr %262, i64 1, !dbg !748
  %264 = icmp ugt ptr %263, %21, !dbg !750
  br i1 %264, label %284, label %265, !dbg !751

265:                                              ; preds = %260
  %266 = load i8, ptr %247, align 1, !dbg !760, !tbaa !763
  call void @llvm.dbg.value(metadata i8 %266, metadata !733, metadata !DIExpression()), !dbg !744
  switch i8 %266, label %189 [
    i8 0, label %276
    i8 60, label %276
    i8 43, label %276
    i8 -121, label %276
    i8 51, label %269
    i8 44, label %267
  ], !dbg !755

267:                                              ; preds = %265
  %268 = getelementptr inbounds i8, ptr %262, i64 8, !dbg !765
  call void @llvm.dbg.value(metadata ptr %268, metadata !185, metadata !DIExpression()), !dbg !413
  call void @llvm.dbg.value(metadata i8 undef, metadata !733, metadata !DIExpression()), !dbg !744
  br label %284, !dbg !766

269:                                              ; preds = %265
  %270 = getelementptr inbounds %struct.ipv6_opt_hdr, ptr %262, i64 0, i32 1, !dbg !767
  %271 = load i8, ptr %270, align 1, !dbg !767, !tbaa !761
  %272 = zext i8 %271 to i64, !dbg !768
  %273 = shl nuw nsw i64 %272, 2, !dbg !769
  %274 = add nuw nsw i64 %273, 8, !dbg !769
  %275 = getelementptr inbounds i8, ptr %262, i64 %274, !dbg !770
  call void @llvm.dbg.value(metadata ptr %275, metadata !185, metadata !DIExpression()), !dbg !413
  call void @llvm.dbg.value(metadata i8 undef, metadata !733, metadata !DIExpression()), !dbg !744
  br label %284, !dbg !756

276:                                              ; preds = %265, %265, %265, %265
  %277 = getelementptr inbounds %struct.ipv6_opt_hdr, ptr %262, i64 0, i32 1, !dbg !771
  %278 = load i8, ptr %277, align 1, !dbg !771, !tbaa !761
  %279 = zext i8 %278 to i64, !dbg !772
  %280 = shl nuw nsw i64 %279, 3, !dbg !773
  %281 = add nuw nsw i64 %280, 8, !dbg !773
  %282 = getelementptr inbounds i8, ptr %262, i64 %281, !dbg !774
  call void @llvm.dbg.value(metadata ptr %282, metadata !185, metadata !DIExpression()), !dbg !413
  call void @llvm.dbg.value(metadata i8 undef, metadata !733, metadata !DIExpression()), !dbg !744
  br label %284, !dbg !764

283:                                              ; preds = %179
  call void @llvm.dbg.value(metadata ptr undef, metadata !185, metadata !DIExpression()), !dbg !413
  call void @llvm.dbg.value(metadata i32 undef, metadata !350, metadata !DIExpression()), !dbg !775
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %17) #6, !dbg !776
  call void @llvm.dbg.value(metadata i128 0, metadata !353, metadata !DIExpression()), !dbg !775
  call void @llvm.dbg.value(metadata i128 0, metadata !354, metadata !DIExpression()), !dbg !775
  call void @llvm.dbg.value(metadata ptr null, metadata !235, metadata !DIExpression()), !dbg !413
  call void @llvm.dbg.value(metadata i128 %288, metadata !353, metadata !DIExpression()), !dbg !775
  br label %385, !dbg !777

284:                                              ; preds = %276, %269, %267, %260, %245, %230, %215, %200, %189, %182
  %285 = phi ptr [ %282, %276 ], [ %275, %269 ], [ %268, %267 ], [ %262, %260 ], [ %247, %245 ], [ %232, %230 ], [ %217, %215 ], [ %202, %200 ], [ %190, %189 ], [ %180, %182 ]
  %286 = phi i32 [ -1, %276 ], [ -1, %269 ], [ -1, %267 ], [ -1, %260 ], [ -1, %245 ], [ -1, %230 ], [ -1, %215 ], [ -1, %200 ], [ %192, %189 ], [ -1, %182 ]
  call void @llvm.dbg.value(metadata ptr undef, metadata !185, metadata !DIExpression()), !dbg !413
  call void @llvm.dbg.value(metadata i32 undef, metadata !350, metadata !DIExpression()), !dbg !775
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %17) #6, !dbg !776
  call void @llvm.dbg.value(metadata i128 0, metadata !353, metadata !DIExpression()), !dbg !775
  call void @llvm.dbg.value(metadata i128 0, metadata !354, metadata !DIExpression()), !dbg !775
  call void @llvm.dbg.value(metadata ptr null, metadata !235, metadata !DIExpression()), !dbg !413
  %287 = getelementptr inbounds %struct.ipv6hdr, ptr %75, i64 0, i32 5, !dbg !778
  call void @llvm.dbg.value(metadata ptr %17, metadata !353, metadata !DIExpression(DW_OP_deref)), !dbg !775
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(16) %17, ptr noundef nonnull align 4 dereferenceable(16) %287, i64 16, i1 false), !dbg !778
  call void @llvm.dbg.value(metadata ptr undef, metadata !235, metadata !DIExpression()), !dbg !413
  call void @llvm.dbg.value(metadata i128 undef, metadata !354, metadata !DIExpression()), !dbg !775
  %288 = load i128, ptr %17, align 16, !dbg !781, !tbaa !783
  call void @llvm.dbg.value(metadata i128 %288, metadata !353, metadata !DIExpression()), !dbg !775
  %289 = icmp eq i128 %288, 0, !dbg !785
  br i1 %289, label %293, label %290, !dbg !786

290:                                              ; preds = %284
  call void @llvm.dbg.value(metadata ptr %17, metadata !353, metadata !DIExpression(DW_OP_deref)), !dbg !775
  call void @llvm.dbg.value(metadata ptr %17, metadata !787, metadata !DIExpression()), !dbg !793
  call void @llvm.dbg.value(metadata ptr null, metadata !792, metadata !DIExpression()), !dbg !793
  %291 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @ipv6_bans, ptr noundef nonnull %17) #6, !dbg !797
  call void @llvm.dbg.value(metadata ptr %291, metadata !792, metadata !DIExpression()), !dbg !793
  %292 = icmp eq ptr %291, null, !dbg !798
  br i1 %292, label %293, label %386, !dbg !800

293:                                              ; preds = %290, %284
  switch i32 %286, label %385 [
    i32 17, label %294
    i32 6, label %311
    i32 1, label %359
    i32 58, label %370
  ], !dbg !777

294:                                              ; preds = %293
  call void @llvm.dbg.value(metadata ptr null, metadata !355, metadata !DIExpression()), !dbg !801
  call void @llvm.dbg.value(metadata ptr undef, metadata !521, metadata !DIExpression()), !dbg !802
  call void @llvm.dbg.value(metadata ptr %21, metadata !527, metadata !DIExpression()), !dbg !802
  call void @llvm.dbg.value(metadata ptr undef, metadata !528, metadata !DIExpression()), !dbg !802
  call void @llvm.dbg.value(metadata ptr undef, metadata !530, metadata !DIExpression()), !dbg !802
  %295 = getelementptr inbounds %struct.udphdr, ptr %285, i64 1, !dbg !804
  %296 = icmp ugt ptr %295, %21, !dbg !805
  br i1 %296, label %386, label %297, !dbg !806

297:                                              ; preds = %294
  call void @llvm.dbg.value(metadata ptr %295, metadata !185, metadata !DIExpression()), !dbg !413
  %298 = getelementptr inbounds %struct.udphdr, ptr %285, i64 0, i32 2, !dbg !807
  %299 = load i16, ptr %298, align 2, !dbg !807, !tbaa !538
  %300 = call i16 @llvm.bswap.i16(i16 %299), !dbg !807
  call void @llvm.dbg.value(metadata i16 %300, metadata !529, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_constu, 8, DW_OP_minus, DW_OP_stack_value)), !dbg !802
  %301 = icmp ult i16 %300, 8, !dbg !808
  br i1 %301, label %386, label %302, !dbg !809

302:                                              ; preds = %297
  call void @llvm.dbg.value(metadata i16 %300, metadata !529, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_constu, 8, DW_OP_minus, DW_OP_stack_value)), !dbg !802
  call void @llvm.dbg.value(metadata i16 %300, metadata !529, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_constu, 8, DW_OP_minus, DW_OP_stack_value)), !dbg !802
  call void @llvm.dbg.value(metadata i16 %300, metadata !358, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_constu, 8, DW_OP_minus, DW_OP_stack_value)), !dbg !801
  call void @llvm.dbg.value(metadata ptr %285, metadata !355, metadata !DIExpression()), !dbg !801
  %303 = load i16, ptr %285, align 2, !dbg !810, !tbaa !544
  call void @llvm.dbg.value(metadata i16 %303, metadata !359, metadata !DIExpression()), !dbg !801
  call void @llvm.lifetime.start.p0(i64 2, ptr nonnull %8), !dbg !811
  call void @llvm.dbg.value(metadata i16 %303, metadata !550, metadata !DIExpression()), !dbg !811
  store i16 %303, ptr %8, align 2, !tbaa !452
  call void @llvm.dbg.value(metadata ptr null, metadata !551, metadata !DIExpression()), !dbg !811
  call void @llvm.dbg.value(metadata ptr %8, metadata !550, metadata !DIExpression(DW_OP_deref)), !dbg !811
  %304 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @port_bans, ptr noundef nonnull %8) #6, !dbg !814
  call void @llvm.dbg.value(metadata ptr %304, metadata !551, metadata !DIExpression()), !dbg !811
  %305 = icmp eq ptr %304, null, !dbg !815
  call void @llvm.lifetime.end.p0(i64 2, ptr nonnull %8), !dbg !816
  br i1 %305, label %306, label %386, !dbg !817

306:                                              ; preds = %302
  call void @llvm.dbg.value(metadata ptr %285, metadata !355, metadata !DIExpression()), !dbg !801
  %307 = getelementptr inbounds %struct.udphdr, ptr %285, i64 0, i32 1, !dbg !818
  %308 = load i16, ptr %307, align 2, !dbg !818, !tbaa !560
  call void @llvm.dbg.value(metadata i16 %308, metadata !360, metadata !DIExpression()), !dbg !801
  call void @llvm.lifetime.start.p0(i64 2, ptr nonnull %7), !dbg !819
  call void @llvm.dbg.value(metadata i16 %308, metadata !550, metadata !DIExpression()), !dbg !819
  store i16 %308, ptr %7, align 2, !tbaa !452
  call void @llvm.dbg.value(metadata ptr null, metadata !551, metadata !DIExpression()), !dbg !819
  call void @llvm.dbg.value(metadata ptr %7, metadata !550, metadata !DIExpression(DW_OP_deref)), !dbg !819
  %309 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @port_bans, ptr noundef nonnull %7) #6, !dbg !822
  call void @llvm.dbg.value(metadata ptr %309, metadata !551, metadata !DIExpression()), !dbg !819
  %310 = icmp eq ptr %309, null, !dbg !823
  call void @llvm.lifetime.end.p0(i64 2, ptr nonnull %7), !dbg !824
  br i1 %310, label %385, label %386

311:                                              ; preds = %293
  call void @llvm.dbg.value(metadata ptr null, metadata !361, metadata !DIExpression()), !dbg !825
  call void @llvm.dbg.value(metadata ptr undef, metadata !568, metadata !DIExpression()), !dbg !826
  call void @llvm.dbg.value(metadata ptr %21, metadata !574, metadata !DIExpression()), !dbg !826
  call void @llvm.dbg.value(metadata ptr undef, metadata !575, metadata !DIExpression()), !dbg !826
  call void @llvm.dbg.value(metadata ptr undef, metadata !577, metadata !DIExpression()), !dbg !826
  %312 = getelementptr inbounds %struct.tcphdr, ptr %285, i64 1, !dbg !828
  %313 = icmp ugt ptr %312, %21, !dbg !829
  br i1 %313, label %386, label %314, !dbg !830

314:                                              ; preds = %311
  %315 = getelementptr inbounds %struct.tcphdr, ptr %285, i64 0, i32 4, !dbg !831
  %316 = load i16, ptr %315, align 4, !dbg !831
  %317 = lshr i16 %316, 2, !dbg !832
  %318 = and i16 %317, 60, !dbg !832
  call void @llvm.dbg.value(metadata i16 %318, metadata !576, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !826
  %319 = zext i16 %318 to i64
  %320 = getelementptr i8, ptr %285, i64 %319, !dbg !833
  %321 = icmp ugt ptr %320, %21, !dbg !834
  br i1 %321, label %386, label %322, !dbg !835

322:                                              ; preds = %314
  call void @llvm.dbg.value(metadata i16 %318, metadata !576, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !826
  call void @llvm.dbg.value(metadata ptr %312, metadata !185, metadata !DIExpression()), !dbg !413
  call void @llvm.dbg.value(metadata i16 %318, metadata !364, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !825
  call void @llvm.dbg.value(metadata ptr %285, metadata !361, metadata !DIExpression()), !dbg !825
  call void @llvm.dbg.value(metadata ptr %285, metadata !590, metadata !DIExpression()), !dbg !836
  %323 = and i16 %316, -256, !dbg !839
  switch i16 %323, label %328 [
    i16 256, label %386
    i16 5120, label %324
  ], !dbg !839

324:                                              ; preds = %322
  %325 = getelementptr inbounds %struct.tcphdr, ptr %285, i64 0, i32 5, !dbg !840
  %326 = load i16, ptr %325, align 2, !dbg !840, !tbaa !602
  %327 = icmp eq i16 %326, 0, !dbg !841
  br i1 %327, label %386, label %328, !dbg !842

328:                                              ; preds = %324, %322
  call void @llvm.dbg.value(metadata ptr %285, metadata !361, metadata !DIExpression()), !dbg !825
  call void @llvm.dbg.value(metadata ptr %285, metadata !606, metadata !DIExpression()), !dbg !843
  %329 = and i16 %316, -8448, !dbg !846
  %330 = icmp eq i16 %329, 512, !dbg !846
  br i1 %330, label %331, label %350, !dbg !846

331:                                              ; preds = %328
  %332 = getelementptr inbounds %struct.tcphdr, ptr %285, i64 0, i32 5, !dbg !847
  %333 = load i16, ptr %332, align 2, !dbg !847, !tbaa !602
  %334 = icmp eq i16 %333, -3846, !dbg !848
  br i1 %334, label %335, label %350, !dbg !849

335:                                              ; preds = %331
  call void @llvm.dbg.value(metadata ptr %17, metadata !353, metadata !DIExpression(DW_OP_deref)), !dbg !775
  call void @llvm.dbg.value(metadata ptr %17, metadata !850, metadata !DIExpression()), !dbg !863
  call void @llvm.dbg.value(metadata ptr null, metadata !854, metadata !DIExpression()), !dbg !863
  %336 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @ipv6_warnings, ptr noundef nonnull %17) #6, !dbg !866
  call void @llvm.dbg.value(metadata ptr %336, metadata !854, metadata !DIExpression()), !dbg !863
  %337 = icmp eq ptr %336, null, !dbg !867
  br i1 %337, label %348, label %338, !dbg !868

338:                                              ; preds = %335
  call void @llvm.lifetime.start.p0(i64 1, ptr nonnull %4) #6, !dbg !869
  call void @llvm.dbg.value(metadata i8 0, metadata !855, metadata !DIExpression()), !dbg !870
  %339 = load i8, ptr %336, align 1, !dbg !871, !tbaa !639
  %340 = add i8 %339, 1, !dbg !872
  call void @llvm.dbg.value(metadata i8 %340, metadata !855, metadata !DIExpression()), !dbg !870
  store i8 %340, ptr %4, align 1, !dbg !873, !tbaa !639
  call void @llvm.dbg.value(metadata ptr %4, metadata !855, metadata !DIExpression(DW_OP_deref)), !dbg !870
  %341 = call i64 inttoptr (i64 2 to ptr)(ptr noundef nonnull @ipv6_warnings, ptr noundef nonnull %17, ptr noundef nonnull %4, i64 noundef 0) #6, !dbg !874
  %342 = load i8, ptr %4, align 1, !dbg !875, !tbaa !639
  call void @llvm.dbg.value(metadata i8 %342, metadata !855, metadata !DIExpression()), !dbg !870
  %343 = icmp ugt i8 %342, 16, !dbg !876
  br i1 %343, label %344, label %347, !dbg !877

344:                                              ; preds = %338
  call void @llvm.lifetime.start.p0(i64 1, ptr nonnull %5) #6, !dbg !878
  call void @llvm.dbg.value(metadata i8 1, metadata !858, metadata !DIExpression()), !dbg !879
  store i8 1, ptr %5, align 1, !dbg !880, !tbaa !639
  call void @llvm.dbg.value(metadata ptr %5, metadata !858, metadata !DIExpression(DW_OP_deref)), !dbg !879
  %345 = call i64 inttoptr (i64 2 to ptr)(ptr noundef nonnull @ipv6_bans, ptr noundef nonnull %17, ptr noundef nonnull %5, i64 noundef 0) #6, !dbg !881
  call void @llvm.dbg.value(metadata i8 0, metadata !855, metadata !DIExpression()), !dbg !870
  store i8 0, ptr %4, align 1, !dbg !882, !tbaa !639
  call void @llvm.dbg.value(metadata ptr %4, metadata !855, metadata !DIExpression(DW_OP_deref)), !dbg !870
  %346 = call i64 inttoptr (i64 2 to ptr)(ptr noundef nonnull @ipv6_warnings, ptr noundef nonnull %17, ptr noundef nonnull %4, i64 noundef 0) #6, !dbg !883
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %5) #6, !dbg !884
  br label %347, !dbg !885

347:                                              ; preds = %344, %338
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %4) #6, !dbg !886
  br label %350, !dbg !887

348:                                              ; preds = %335
  call void @llvm.lifetime.start.p0(i64 1, ptr nonnull %6) #6, !dbg !888
  call void @llvm.dbg.value(metadata i8 1, metadata !861, metadata !DIExpression()), !dbg !889
  store i8 1, ptr %6, align 1, !dbg !890, !tbaa !639
  call void @llvm.dbg.value(metadata ptr %6, metadata !861, metadata !DIExpression(DW_OP_deref)), !dbg !889
  %349 = call i64 inttoptr (i64 2 to ptr)(ptr noundef nonnull @ipv6_warnings, ptr noundef nonnull %17, ptr noundef nonnull %6, i64 noundef 0) #6, !dbg !891
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %6) #6, !dbg !892
  br label %350

350:                                              ; preds = %348, %347, %331, %328
  call void @llvm.dbg.value(metadata ptr %285, metadata !361, metadata !DIExpression()), !dbg !825
  %351 = load i16, ptr %285, align 4, !dbg !893, !tbaa !662
  call void @llvm.dbg.value(metadata i16 %351, metadata !365, metadata !DIExpression()), !dbg !825
  call void @llvm.lifetime.start.p0(i64 2, ptr nonnull %3), !dbg !894
  call void @llvm.dbg.value(metadata i16 %351, metadata !550, metadata !DIExpression()), !dbg !894
  store i16 %351, ptr %3, align 2, !tbaa !452
  call void @llvm.dbg.value(metadata ptr null, metadata !551, metadata !DIExpression()), !dbg !894
  call void @llvm.dbg.value(metadata ptr %3, metadata !550, metadata !DIExpression(DW_OP_deref)), !dbg !894
  %352 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @port_bans, ptr noundef nonnull %3) #6, !dbg !897
  call void @llvm.dbg.value(metadata ptr %352, metadata !551, metadata !DIExpression()), !dbg !894
  %353 = icmp eq ptr %352, null, !dbg !898
  call void @llvm.lifetime.end.p0(i64 2, ptr nonnull %3), !dbg !899
  br i1 %353, label %354, label %386, !dbg !900

354:                                              ; preds = %350
  call void @llvm.dbg.value(metadata ptr %285, metadata !361, metadata !DIExpression()), !dbg !825
  %355 = getelementptr inbounds %struct.tcphdr, ptr %285, i64 0, i32 1, !dbg !901
  %356 = load i16, ptr %355, align 2, !dbg !901, !tbaa !671
  call void @llvm.dbg.value(metadata i16 %356, metadata !366, metadata !DIExpression()), !dbg !825
  call void @llvm.lifetime.start.p0(i64 2, ptr nonnull %2), !dbg !902
  call void @llvm.dbg.value(metadata i16 %356, metadata !550, metadata !DIExpression()), !dbg !902
  store i16 %356, ptr %2, align 2, !tbaa !452
  call void @llvm.dbg.value(metadata ptr null, metadata !551, metadata !DIExpression()), !dbg !902
  call void @llvm.dbg.value(metadata ptr %2, metadata !550, metadata !DIExpression(DW_OP_deref)), !dbg !902
  %357 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @port_bans, ptr noundef nonnull %2) #6, !dbg !905
  call void @llvm.dbg.value(metadata ptr %357, metadata !551, metadata !DIExpression()), !dbg !902
  %358 = icmp eq ptr %357, null, !dbg !906
  call void @llvm.lifetime.end.p0(i64 2, ptr nonnull %2), !dbg !907
  br i1 %358, label %385, label %386

359:                                              ; preds = %293
  call void @llvm.dbg.value(metadata ptr null, metadata !367, metadata !DIExpression()), !dbg !908
  call void @llvm.dbg.value(metadata ptr undef, metadata !679, metadata !DIExpression()), !dbg !909
  call void @llvm.dbg.value(metadata ptr %21, metadata !685, metadata !DIExpression()), !dbg !909
  call void @llvm.dbg.value(metadata ptr undef, metadata !686, metadata !DIExpression()), !dbg !909
  call void @llvm.dbg.value(metadata ptr undef, metadata !687, metadata !DIExpression()), !dbg !909
  %360 = getelementptr inbounds %struct.icmphdr, ptr %285, i64 1, !dbg !911
  %361 = icmp ugt ptr %360, %21, !dbg !912
  br i1 %361, label %385, label %362, !dbg !913

362:                                              ; preds = %359
  call void @llvm.dbg.value(metadata ptr %360, metadata !185, metadata !DIExpression()), !dbg !413
  call void @llvm.dbg.value(metadata ptr %285, metadata !367, metadata !DIExpression()), !dbg !908
  call void @llvm.dbg.value(metadata ptr %285, metadata !694, metadata !DIExpression()), !dbg !914
  %363 = load i8, ptr %285, align 4, !dbg !917, !tbaa !704
  call void @llvm.dbg.value(metadata i8 %363, metadata !699, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !914
  %364 = icmp eq i8 %363, 0, !dbg !918
  %365 = call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %364)
  %366 = freeze i1 %365, !dbg !919
  br i1 %366, label %386, label %367, !dbg !919

367:                                              ; preds = %362
  switch i8 %363, label %368 [
    i8 19, label %386
    i8 18, label %386
    i8 17, label %386
    i8 16, label %386
    i8 15, label %386
    i8 14, label %386
    i8 13, label %386
    i8 10, label %386
    i8 9, label %386
    i8 8, label %386
    i8 7, label %386
    i8 6, label %386
    i8 4, label %386
    i8 2, label %386
    i8 1, label %386
  ], !dbg !919

368:                                              ; preds = %367
  %369 = icmp ugt i8 %363, 19, !dbg !920
  br i1 %369, label %386, label %385, !dbg !920

370:                                              ; preds = %293
  call void @llvm.dbg.value(metadata ptr null, metadata !370, metadata !DIExpression()), !dbg !921
  call void @llvm.dbg.value(metadata ptr undef, metadata !922, metadata !DIExpression()), !dbg !931
  call void @llvm.dbg.value(metadata ptr %21, metadata !928, metadata !DIExpression()), !dbg !931
  call void @llvm.dbg.value(metadata ptr undef, metadata !929, metadata !DIExpression()), !dbg !931
  call void @llvm.dbg.value(metadata ptr undef, metadata !930, metadata !DIExpression()), !dbg !931
  %371 = getelementptr inbounds %struct.icmp6hdr, ptr %285, i64 1, !dbg !933
  %372 = icmp ugt ptr %371, %21, !dbg !935
  br i1 %372, label %385, label %373, !dbg !936

373:                                              ; preds = %370
  call void @llvm.dbg.value(metadata ptr %371, metadata !185, metadata !DIExpression()), !dbg !413
  call void @llvm.dbg.value(metadata ptr %285, metadata !370, metadata !DIExpression()), !dbg !921
  call void @llvm.dbg.value(metadata ptr %285, metadata !937, metadata !DIExpression()), !dbg !943
  %374 = load i8, ptr %285, align 4, !dbg !946, !tbaa !947
  call void @llvm.dbg.value(metadata i8 %374, metadata !942, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !943
  %375 = icmp eq i8 %374, 0, !dbg !949
  %376 = call i1 @llvm.bpf.passthrough.i1.i1(i32 1, i1 %375)
  %377 = freeze i1 %376, !dbg !951
  br i1 %377, label %386, label %378, !dbg !951

378:                                              ; preds = %373
  switch i8 %374, label %379 [
    i8 19, label %386
    i8 18, label %386
    i8 17, label %386
    i8 16, label %386
    i8 15, label %386
    i8 14, label %386
    i8 13, label %386
    i8 10, label %386
    i8 9, label %386
    i8 8, label %386
    i8 7, label %386
    i8 6, label %386
    i8 4, label %386
    i8 2, label %386
    i8 1, label %386
  ], !dbg !951

379:                                              ; preds = %378
  %380 = add i8 %374, -20, !dbg !952
  %381 = icmp ult i8 %380, 110, !dbg !952
  br i1 %381, label %386, label %382, !dbg !952

382:                                              ; preds = %379
  switch i8 %374, label %383 [
    i8 -102, label %386
    i8 -103, label %386
    i8 -104, label %386
    i8 -105, label %386
    i8 -106, label %386
    i8 -120, label %386
    i8 -121, label %386
    i8 -122, label %386
    i8 -123, label %386
  ], !dbg !953

383:                                              ; preds = %382
  %384 = icmp ugt i8 %374, -101, !dbg !954
  br i1 %384, label %386, label %385, !dbg !955

385:                                              ; preds = %370, %359, %383, %368, %354, %306, %283, %293
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %17) #6, !dbg !956
  br label %387

386:                                              ; preds = %354, %324, %322, %314, %311, %350, %306, %297, %294, %302, %379, %383, %373, %378, %378, %378, %378, %378, %378, %378, %378, %378, %378, %378, %378, %378, %378, %378, %382, %382, %382, %382, %382, %382, %382, %382, %382, %368, %362, %367, %367, %367, %367, %367, %367, %367, %367, %367, %367, %367, %367, %367, %367, %367, %290
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %17) #6, !dbg !956
  br label %387

387:                                              ; preds = %177, %386, %385, %74, %1
  %388 = phi i32 [ 1, %1 ], [ %178, %177 ], [ 1, %386 ], [ 2, %385 ], [ 2, %74 ], !dbg !413
  ret i32 %388, !dbg !957
}

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: argmemonly mustprogress nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i16 @llvm.bswap.i16(i16) #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #4

; Function Attrs: nounwind readnone
declare i1 @llvm.bpf.passthrough.i1.i1(i32, i1) #5

attributes #0 = { nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #2 = { argmemonly mustprogress nocallback nofree nounwind willreturn }
attributes #3 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #5 = { nounwind readnone }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!163, !164, !165, !166}
!llvm.ident = !{!167}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !62, line: 638, type: !160, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 15.0.7", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !52, globals: !59, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/cookiengineer/Software/cookiengineer/ebpf-firewall/kernel/ebpf/module.c", directory: "/home/cookiengineer/Software/cookiengineer/ebpf-firewall/kernel", checksumkind: CSK_MD5, checksum: "ab6398d954245ab03791f0b2699edd78")
!4 = !{!5, !14, !46}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "xdp_action", file: !6, line: 59, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "ebpf/../headers/common.h", directory: "/home/cookiengineer/Software/cookiengineer/ebpf-firewall/kernel", checksumkind: CSK_MD5, checksum: "0f2b21500512e7536bea338eb9a94a39")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11, !12, !13}
!9 = !DIEnumerator(name: "XDP_ABORTED", value: 0)
!10 = !DIEnumerator(name: "XDP_DROP", value: 1)
!11 = !DIEnumerator(name: "XDP_PASS", value: 2)
!12 = !DIEnumerator(name: "XDP_TX", value: 3)
!13 = !DIEnumerator(name: "XDP_REDIRECT", value: 4)
!14 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !15, line: 29, baseType: !7, size: 32, elements: !16)
!15 = !DIFile(filename: "/usr/include/linux/in.h", directory: "", checksumkind: CSK_MD5, checksum: "800947bc91ad5a693098cf2699931b1e")
!16 = !{!17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45}
!17 = !DIEnumerator(name: "IPPROTO_IP", value: 0)
!18 = !DIEnumerator(name: "IPPROTO_ICMP", value: 1)
!19 = !DIEnumerator(name: "IPPROTO_IGMP", value: 2)
!20 = !DIEnumerator(name: "IPPROTO_IPIP", value: 4)
!21 = !DIEnumerator(name: "IPPROTO_TCP", value: 6)
!22 = !DIEnumerator(name: "IPPROTO_EGP", value: 8)
!23 = !DIEnumerator(name: "IPPROTO_PUP", value: 12)
!24 = !DIEnumerator(name: "IPPROTO_UDP", value: 17)
!25 = !DIEnumerator(name: "IPPROTO_IDP", value: 22)
!26 = !DIEnumerator(name: "IPPROTO_TP", value: 29)
!27 = !DIEnumerator(name: "IPPROTO_DCCP", value: 33)
!28 = !DIEnumerator(name: "IPPROTO_IPV6", value: 41)
!29 = !DIEnumerator(name: "IPPROTO_RSVP", value: 46)
!30 = !DIEnumerator(name: "IPPROTO_GRE", value: 47)
!31 = !DIEnumerator(name: "IPPROTO_ESP", value: 50)
!32 = !DIEnumerator(name: "IPPROTO_AH", value: 51)
!33 = !DIEnumerator(name: "IPPROTO_MTP", value: 92)
!34 = !DIEnumerator(name: "IPPROTO_BEETPH", value: 94)
!35 = !DIEnumerator(name: "IPPROTO_ENCAP", value: 98)
!36 = !DIEnumerator(name: "IPPROTO_PIM", value: 103)
!37 = !DIEnumerator(name: "IPPROTO_COMP", value: 108)
!38 = !DIEnumerator(name: "IPPROTO_L2TP", value: 115)
!39 = !DIEnumerator(name: "IPPROTO_SCTP", value: 132)
!40 = !DIEnumerator(name: "IPPROTO_UDPLITE", value: 136)
!41 = !DIEnumerator(name: "IPPROTO_MPLS", value: 137)
!42 = !DIEnumerator(name: "IPPROTO_ETHERNET", value: 143)
!43 = !DIEnumerator(name: "IPPROTO_RAW", value: 255)
!44 = !DIEnumerator(name: "IPPROTO_MPTCP", value: 262)
!45 = !DIEnumerator(name: "IPPROTO_MAX", value: 263)
!46 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !6, line: 106, baseType: !7, size: 32, elements: !47)
!47 = !{!48, !49, !50, !51}
!48 = !DIEnumerator(name: "BPF_ANY", value: 0)
!49 = !DIEnumerator(name: "BPF_NOEXIST", value: 1)
!50 = !DIEnumerator(name: "BPF_EXIST", value: 2)
!51 = !DIEnumerator(name: "BPF_F_LOCK", value: 4)
!52 = !{!53, !54, !55, !57}
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!54 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !6, line: 7, baseType: !56)
!56 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!59 = !{!0, !60, !85, !95, !111, !123, !131, !144, !152}
!60 = !DIGlobalVariableExpression(var: !61, expr: !DIExpression())
!61 = distinct !DIGlobalVariable(name: "domain_bans", scope: !2, file: !62, line: 21, type: !63, isLocal: false, isDefinition: true)
!62 = !DIFile(filename: "ebpf/module.c", directory: "/home/cookiengineer/Software/cookiengineer/ebpf-firewall/kernel", checksumkind: CSK_MD5, checksum: "ab6398d954245ab03791f0b2699edd78")
!63 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !62, line: 16, size: 256, elements: !64)
!64 = !{!65, !71, !76, !81}
!65 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !63, file: !62, line: 17, baseType: !66, size: 64)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DICompositeType(tag: DW_TAG_array_type, baseType: !68, size: 32, elements: !69)
!68 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!69 = !{!70}
!70 = !DISubrange(count: 1)
!71 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !63, file: !62, line: 18, baseType: !72, size: 64, offset: 64)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DICompositeType(tag: DW_TAG_array_type, baseType: !68, size: 16000000, elements: !74)
!74 = !{!75}
!75 = !DISubrange(count: 500000)
!76 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !63, file: !62, line: 19, baseType: !77, size: 64, offset: 128)
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DICompositeType(tag: DW_TAG_array_type, baseType: !68, size: 8128, elements: !79)
!79 = !{!80}
!80 = !DISubrange(count: 254)
!81 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !63, file: !62, line: 20, baseType: !82, size: 64, offset: 192)
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !6, line: 5, baseType: !84)
!84 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!85 = !DIGlobalVariableExpression(var: !86, expr: !DIExpression())
!86 = distinct !DIGlobalVariable(name: "ipv4_bans", scope: !2, file: !62, line: 28, type: !87, isLocal: false, isDefinition: true)
!87 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !62, line: 23, size: 256, elements: !88)
!88 = !{!89, !90, !91, !94}
!89 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !87, file: !62, line: 24, baseType: !66, size: 64)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !87, file: !62, line: 25, baseType: !72, size: 64, offset: 64)
!91 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !87, file: !62, line: 26, baseType: !92, size: 64, offset: 128)
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !93, size: 64)
!93 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !6, line: 9, baseType: !7)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !87, file: !62, line: 27, baseType: !82, size: 64, offset: 192)
!95 = !DIGlobalVariableExpression(var: !96, expr: !DIExpression())
!96 = distinct !DIGlobalVariable(name: "ipv4_warnings", scope: !2, file: !62, line: 35, type: !97, isLocal: false, isDefinition: true)
!97 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !62, line: 30, size: 256, elements: !98)
!98 = !{!99, !104, !109, !110}
!99 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !97, file: !62, line: 31, baseType: !100, size: 64)
!100 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !101, size: 64)
!101 = !DICompositeType(tag: DW_TAG_array_type, baseType: !68, size: 288, elements: !102)
!102 = !{!103}
!103 = !DISubrange(count: 9)
!104 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !97, file: !62, line: 32, baseType: !105, size: 64, offset: 64)
!105 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !106, size: 64)
!106 = !DICompositeType(tag: DW_TAG_array_type, baseType: !68, size: 4096, elements: !107)
!107 = !{!108}
!108 = !DISubrange(count: 128)
!109 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !97, file: !62, line: 33, baseType: !92, size: 64, offset: 128)
!110 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !97, file: !62, line: 34, baseType: !82, size: 64, offset: 192)
!111 = !DIGlobalVariableExpression(var: !112, expr: !DIExpression())
!112 = distinct !DIGlobalVariable(name: "ipv6_bans", scope: !2, file: !62, line: 42, type: !113, isLocal: false, isDefinition: true)
!113 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !62, line: 37, size: 256, elements: !114)
!114 = !{!115, !116, !117, !122}
!115 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !113, file: !62, line: 38, baseType: !66, size: 64)
!116 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !113, file: !62, line: 39, baseType: !72, size: 64, offset: 64)
!117 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !113, file: !62, line: 40, baseType: !118, size: 64, offset: 128)
!118 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !119, size: 64)
!119 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint128_t", file: !120, baseType: !121)
!120 = !DIFile(filename: "ebpf/module.c", directory: "/home/cookiengineer/Software/cookiengineer/ebpf-firewall/kernel")
!121 = !DIBasicType(name: "unsigned __int128", size: 128, encoding: DW_ATE_unsigned)
!122 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !113, file: !62, line: 41, baseType: !82, size: 64, offset: 192)
!123 = !DIGlobalVariableExpression(var: !124, expr: !DIExpression())
!124 = distinct !DIGlobalVariable(name: "ipv6_warnings", scope: !2, file: !62, line: 49, type: !125, isLocal: false, isDefinition: true)
!125 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !62, line: 44, size: 256, elements: !126)
!126 = !{!127, !128, !129, !130}
!127 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !125, file: !62, line: 45, baseType: !100, size: 64)
!128 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !125, file: !62, line: 46, baseType: !105, size: 64, offset: 64)
!129 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !125, file: !62, line: 47, baseType: !118, size: 64, offset: 128)
!130 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !125, file: !62, line: 48, baseType: !82, size: 64, offset: 192)
!131 = !DIGlobalVariableExpression(var: !132, expr: !DIExpression())
!132 = distinct !DIGlobalVariable(name: "port_bans", scope: !2, file: !62, line: 56, type: !133, isLocal: false, isDefinition: true)
!133 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !62, line: 51, size: 256, elements: !134)
!134 = !{!135, !136, !141, !143}
!135 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !133, file: !62, line: 52, baseType: !66, size: 64)
!136 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !133, file: !62, line: 53, baseType: !137, size: 64, offset: 64)
!137 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !138, size: 64)
!138 = !DICompositeType(tag: DW_TAG_array_type, baseType: !68, size: 2097120, elements: !139)
!139 = !{!140}
!140 = !DISubrange(count: 65535)
!141 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !133, file: !62, line: 54, baseType: !142, size: 64, offset: 128)
!142 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!143 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !133, file: !62, line: 55, baseType: !82, size: 64, offset: 192)
!144 = !DIGlobalVariableExpression(var: !145, expr: !DIExpression())
!145 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !2, file: !146, line: 51, type: !147, isLocal: true, isDefinition: true)
!146 = !DIFile(filename: "headers/bpf_helper_defs.h", directory: "/home/cookiengineer/Software/cookiengineer/ebpf-firewall/kernel", checksumkind: CSK_MD5, checksum: "67458ddab14190d1ab39602394f9ecef")
!147 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !148, size: 64)
!148 = !DISubroutineType(types: !149)
!149 = !{!53, !53, !150}
!150 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !151, size: 64)
!151 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!152 = !DIGlobalVariableExpression(var: !153, expr: !DIExpression())
!153 = distinct !DIGlobalVariable(name: "bpf_map_update_elem", scope: !2, file: !146, line: 73, type: !154, isLocal: true, isDefinition: true)
!154 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !155, size: 64)
!155 = !DISubroutineType(types: !156)
!156 = !{!54, !53, !150, !150, !157}
!157 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !158, line: 31, baseType: !159)
!158 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "", checksumkind: CSK_MD5, checksum: "b810f270733e106319b67ef512c6246e")
!159 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!160 = !DICompositeType(tag: DW_TAG_array_type, baseType: !58, size: 32, elements: !161)
!161 = !{!162}
!162 = !DISubrange(count: 4)
!163 = !{i32 7, !"Dwarf Version", i32 5}
!164 = !{i32 2, !"Debug Info Version", i32 3}
!165 = !{i32 1, !"wchar_size", i32 4}
!166 = !{i32 7, !"frame-pointer", i32 2}
!167 = !{!"clang version 15.0.7"}
!168 = distinct !DISubprogram(name: "xdp_prog_main", scope: !62, file: !62, line: 314, type: !169, scopeLine: 314, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !180)
!169 = !DISubroutineType(types: !170)
!170 = !{!68, !171}
!171 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !172, size: 64)
!172 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !6, line: 67, size: 192, elements: !173)
!173 = !{!174, !175, !176, !177, !178, !179}
!174 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !172, file: !6, line: 68, baseType: !93, size: 32)
!175 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !172, file: !6, line: 69, baseType: !93, size: 32, offset: 32)
!176 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !172, file: !6, line: 70, baseType: !93, size: 32, offset: 64)
!177 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !172, file: !6, line: 71, baseType: !93, size: 32, offset: 96)
!178 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !172, file: !6, line: 72, baseType: !93, size: 32, offset: 128)
!179 = !DIDerivedType(tag: DW_TAG_member, name: "egress_ifindex", scope: !172, file: !6, line: 73, baseType: !93, size: 32, offset: 160)
!180 = !{!181, !182, !183, !184, !185, !190, !204, !235, !278, !281, !282, !283, !294, !295, !296, !297, !321, !322, !323, !324, !350, !353, !354, !355, !358, !359, !360, !361, !364, !365, !366, !367, !370}
!181 = !DILocalVariable(name: "ctx", arg: 1, scope: !168, file: !62, line: 314, type: !171)
!182 = !DILocalVariable(name: "data_end", scope: !168, file: !62, line: 317, type: !53)
!183 = !DILocalVariable(name: "data", scope: !168, file: !62, line: 318, type: !53)
!184 = !DILocalVariable(name: "ethernet_protocol", scope: !168, file: !62, line: 324, type: !68)
!185 = !DILocalVariable(name: "cursor", scope: !168, file: !62, line: 325, type: !186)
!186 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "hdr_cursor", file: !187, line: 28, size: 64, elements: !188)
!187 = !DIFile(filename: "ebpf/module.h", directory: "/home/cookiengineer/Software/cookiengineer/ebpf-firewall/kernel", checksumkind: CSK_MD5, checksum: "a8cb7812e84cb0d7626c35fc624fbe3c")
!188 = !{!189}
!189 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !186, file: !187, line: 29, baseType: !53, size: 64)
!190 = !DILocalVariable(name: "ethernet_header", scope: !168, file: !62, line: 326, type: !191)
!191 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !192, size: 64)
!192 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !193, line: 173, size: 112, elements: !194)
!193 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "", checksumkind: CSK_MD5, checksum: "163f54fb1af2e21fea410f14eb18fa76")
!194 = !{!195, !199, !200}
!195 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !192, file: !193, line: 174, baseType: !196, size: 48)
!196 = !DICompositeType(tag: DW_TAG_array_type, baseType: !84, size: 48, elements: !197)
!197 = !{!198}
!198 = !DISubrange(count: 6)
!199 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !192, file: !193, line: 175, baseType: !196, size: 48, offset: 48)
!200 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !192, file: !193, line: 176, baseType: !201, size: 16, offset: 96)
!201 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !202, line: 28, baseType: !203)
!202 = !DIFile(filename: "/usr/include/linux/types.h", directory: "", checksumkind: CSK_MD5, checksum: "64bcf4b731906682de6e750679b9f4a2")
!203 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !158, line: 24, baseType: !56)
!204 = !DILocalVariable(name: "ipv4_header", scope: !168, file: !62, line: 327, type: !205)
!205 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !206, size: 64)
!206 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !207, line: 87, size: 160, elements: !208)
!207 = !DIFile(filename: "/usr/include/linux/ip.h", directory: "", checksumkind: CSK_MD5, checksum: "149778ace30a1ff208adc8783fd04b29")
!208 = !{!209, !211, !212, !213, !214, !215, !216, !217, !218, !220}
!209 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !206, file: !207, line: 89, baseType: !210, size: 4, flags: DIFlagBitField, extraData: i64 0)
!210 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !158, line: 21, baseType: !84)
!211 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !206, file: !207, line: 90, baseType: !210, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!212 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !206, file: !207, line: 97, baseType: !210, size: 8, offset: 8)
!213 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !206, file: !207, line: 98, baseType: !201, size: 16, offset: 16)
!214 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !206, file: !207, line: 99, baseType: !201, size: 16, offset: 32)
!215 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !206, file: !207, line: 100, baseType: !201, size: 16, offset: 48)
!216 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !206, file: !207, line: 101, baseType: !210, size: 8, offset: 64)
!217 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !206, file: !207, line: 102, baseType: !210, size: 8, offset: 72)
!218 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !206, file: !207, line: 103, baseType: !219, size: 16, offset: 80)
!219 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !202, line: 34, baseType: !203)
!220 = !DIDerivedType(tag: DW_TAG_member, scope: !206, file: !207, line: 104, baseType: !221, size: 64, offset: 96)
!221 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !206, file: !207, line: 104, size: 64, elements: !222)
!222 = !{!223, !230}
!223 = !DIDerivedType(tag: DW_TAG_member, scope: !221, file: !207, line: 104, baseType: !224, size: 64)
!224 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !221, file: !207, line: 104, size: 64, elements: !225)
!225 = !{!226, !229}
!226 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !224, file: !207, line: 104, baseType: !227, size: 32)
!227 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !202, line: 30, baseType: !228)
!228 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !158, line: 27, baseType: !7)
!229 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !224, file: !207, line: 104, baseType: !227, size: 32, offset: 32)
!230 = !DIDerivedType(tag: DW_TAG_member, name: "addrs", scope: !221, file: !207, line: 104, baseType: !231, size: 64)
!231 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !221, file: !207, line: 104, size: 64, elements: !232)
!232 = !{!233, !234}
!233 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !231, file: !207, line: 104, baseType: !227, size: 32)
!234 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !231, file: !207, line: 104, baseType: !227, size: 32, offset: 32)
!235 = !DILocalVariable(name: "ipv6_header", scope: !168, file: !62, line: 328, type: !236)
!236 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !237, size: 64)
!237 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipv6hdr", file: !238, line: 118, size: 320, elements: !239)
!238 = !DIFile(filename: "/usr/include/linux/ipv6.h", directory: "", checksumkind: CSK_MD5, checksum: "deff6bca6b519042089ed906aa3655c3")
!239 = !{!240, !241, !242, !246, !247, !248, !249}
!240 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !237, file: !238, line: 120, baseType: !210, size: 4, flags: DIFlagBitField, extraData: i64 0)
!241 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !237, file: !238, line: 121, baseType: !210, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!242 = !DIDerivedType(tag: DW_TAG_member, name: "flow_lbl", scope: !237, file: !238, line: 128, baseType: !243, size: 24, offset: 8)
!243 = !DICompositeType(tag: DW_TAG_array_type, baseType: !210, size: 24, elements: !244)
!244 = !{!245}
!245 = !DISubrange(count: 3)
!246 = !DIDerivedType(tag: DW_TAG_member, name: "payload_len", scope: !237, file: !238, line: 130, baseType: !201, size: 16, offset: 32)
!247 = !DIDerivedType(tag: DW_TAG_member, name: "nexthdr", scope: !237, file: !238, line: 131, baseType: !210, size: 8, offset: 48)
!248 = !DIDerivedType(tag: DW_TAG_member, name: "hop_limit", scope: !237, file: !238, line: 132, baseType: !210, size: 8, offset: 56)
!249 = !DIDerivedType(tag: DW_TAG_member, scope: !237, file: !238, line: 134, baseType: !250, size: 256, offset: 64)
!250 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !237, file: !238, line: 134, size: 256, elements: !251)
!251 = !{!252, !273}
!252 = !DIDerivedType(tag: DW_TAG_member, scope: !250, file: !238, line: 134, baseType: !253, size: 256)
!253 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !250, file: !238, line: 134, size: 256, elements: !254)
!254 = !{!255, !272}
!255 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !253, file: !238, line: 134, baseType: !256, size: 128)
!256 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in6_addr", file: !257, line: 33, size: 128, elements: !258)
!257 = !DIFile(filename: "/usr/include/linux/in6.h", directory: "", checksumkind: CSK_MD5, checksum: "8bebb780b45d3fe932cc1d934fa5f5fe")
!258 = !{!259}
!259 = !DIDerivedType(tag: DW_TAG_member, name: "in6_u", scope: !256, file: !257, line: 40, baseType: !260, size: 128)
!260 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !256, file: !257, line: 34, size: 128, elements: !261)
!261 = !{!262, !266, !270}
!262 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr8", scope: !260, file: !257, line: 35, baseType: !263, size: 128)
!263 = !DICompositeType(tag: DW_TAG_array_type, baseType: !210, size: 128, elements: !264)
!264 = !{!265}
!265 = !DISubrange(count: 16)
!266 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr16", scope: !260, file: !257, line: 37, baseType: !267, size: 128)
!267 = !DICompositeType(tag: DW_TAG_array_type, baseType: !201, size: 128, elements: !268)
!268 = !{!269}
!269 = !DISubrange(count: 8)
!270 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr32", scope: !260, file: !257, line: 38, baseType: !271, size: 128)
!271 = !DICompositeType(tag: DW_TAG_array_type, baseType: !227, size: 128, elements: !161)
!272 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !253, file: !238, line: 134, baseType: !256, size: 128, offset: 128)
!273 = !DIDerivedType(tag: DW_TAG_member, name: "addrs", scope: !250, file: !238, line: 134, baseType: !274, size: 256)
!274 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !250, file: !238, line: 134, size: 256, elements: !275)
!275 = !{!276, !277}
!276 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !274, file: !238, line: 134, baseType: !256, size: 128)
!277 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !274, file: !238, line: 134, baseType: !256, size: 128, offset: 128)
!278 = !DILocalVariable(name: "protocol", scope: !279, file: !62, line: 344, type: !68)
!279 = distinct !DILexicalBlock(scope: !280, file: !62, line: 342, column: 48)
!280 = distinct !DILexicalBlock(scope: !168, file: !62, line: 342, column: 6)
!281 = !DILocalVariable(name: "ipv4_source", scope: !279, file: !62, line: 346, type: !93)
!282 = !DILocalVariable(name: "ipv4_dest", scope: !279, file: !62, line: 347, type: !93)
!283 = !DILocalVariable(name: "udp_header", scope: !284, file: !62, line: 370, type: !286)
!284 = distinct !DILexicalBlock(scope: !285, file: !62, line: 368, column: 32)
!285 = distinct !DILexicalBlock(scope: !279, file: !62, line: 368, column: 7)
!286 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !287, size: 64)
!287 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "udphdr", file: !288, line: 23, size: 64, elements: !289)
!288 = !DIFile(filename: "/usr/include/linux/udp.h", directory: "", checksumkind: CSK_MD5, checksum: "53c0d42e1bf6d93b39151764be2d20fb")
!289 = !{!290, !291, !292, !293}
!290 = !DIDerivedType(tag: DW_TAG_member, name: "source", scope: !287, file: !288, line: 24, baseType: !201, size: 16)
!291 = !DIDerivedType(tag: DW_TAG_member, name: "dest", scope: !287, file: !288, line: 25, baseType: !201, size: 16, offset: 16)
!292 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !287, file: !288, line: 26, baseType: !201, size: 16, offset: 32)
!293 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !287, file: !288, line: 27, baseType: !219, size: 16, offset: 48)
!294 = !DILocalVariable(name: "length", scope: !284, file: !62, line: 372, type: !68)
!295 = !DILocalVariable(name: "port_source", scope: !284, file: !62, line: 377, type: !55)
!296 = !DILocalVariable(name: "port_dest", scope: !284, file: !62, line: 384, type: !55)
!297 = !DILocalVariable(name: "tcp_header", scope: !298, file: !62, line: 419, type: !300)
!298 = distinct !DILexicalBlock(scope: !299, file: !62, line: 417, column: 39)
!299 = distinct !DILexicalBlock(scope: !285, file: !62, line: 417, column: 14)
!300 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !301, size: 64)
!301 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tcphdr", file: !302, line: 25, size: 160, elements: !303)
!302 = !DIFile(filename: "/usr/include/linux/tcp.h", directory: "", checksumkind: CSK_MD5, checksum: "0fb7164446a017a2406c1e3b94b6d7a6")
!303 = !{!304, !305, !306, !307, !308, !309, !310, !311, !312, !313, !314, !315, !316, !317, !318, !319, !320}
!304 = !DIDerivedType(tag: DW_TAG_member, name: "source", scope: !301, file: !302, line: 26, baseType: !201, size: 16)
!305 = !DIDerivedType(tag: DW_TAG_member, name: "dest", scope: !301, file: !302, line: 27, baseType: !201, size: 16, offset: 16)
!306 = !DIDerivedType(tag: DW_TAG_member, name: "seq", scope: !301, file: !302, line: 28, baseType: !227, size: 32, offset: 32)
!307 = !DIDerivedType(tag: DW_TAG_member, name: "ack_seq", scope: !301, file: !302, line: 29, baseType: !227, size: 32, offset: 64)
!308 = !DIDerivedType(tag: DW_TAG_member, name: "res1", scope: !301, file: !302, line: 31, baseType: !203, size: 4, offset: 96, flags: DIFlagBitField, extraData: i64 96)
!309 = !DIDerivedType(tag: DW_TAG_member, name: "doff", scope: !301, file: !302, line: 32, baseType: !203, size: 4, offset: 100, flags: DIFlagBitField, extraData: i64 96)
!310 = !DIDerivedType(tag: DW_TAG_member, name: "fin", scope: !301, file: !302, line: 33, baseType: !203, size: 1, offset: 104, flags: DIFlagBitField, extraData: i64 96)
!311 = !DIDerivedType(tag: DW_TAG_member, name: "syn", scope: !301, file: !302, line: 34, baseType: !203, size: 1, offset: 105, flags: DIFlagBitField, extraData: i64 96)
!312 = !DIDerivedType(tag: DW_TAG_member, name: "rst", scope: !301, file: !302, line: 35, baseType: !203, size: 1, offset: 106, flags: DIFlagBitField, extraData: i64 96)
!313 = !DIDerivedType(tag: DW_TAG_member, name: "psh", scope: !301, file: !302, line: 36, baseType: !203, size: 1, offset: 107, flags: DIFlagBitField, extraData: i64 96)
!314 = !DIDerivedType(tag: DW_TAG_member, name: "ack", scope: !301, file: !302, line: 37, baseType: !203, size: 1, offset: 108, flags: DIFlagBitField, extraData: i64 96)
!315 = !DIDerivedType(tag: DW_TAG_member, name: "urg", scope: !301, file: !302, line: 38, baseType: !203, size: 1, offset: 109, flags: DIFlagBitField, extraData: i64 96)
!316 = !DIDerivedType(tag: DW_TAG_member, name: "ece", scope: !301, file: !302, line: 39, baseType: !203, size: 1, offset: 110, flags: DIFlagBitField, extraData: i64 96)
!317 = !DIDerivedType(tag: DW_TAG_member, name: "cwr", scope: !301, file: !302, line: 40, baseType: !203, size: 1, offset: 111, flags: DIFlagBitField, extraData: i64 96)
!318 = !DIDerivedType(tag: DW_TAG_member, name: "window", scope: !301, file: !302, line: 55, baseType: !201, size: 16, offset: 112)
!319 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !301, file: !302, line: 56, baseType: !219, size: 16, offset: 128)
!320 = !DIDerivedType(tag: DW_TAG_member, name: "urg_ptr", scope: !301, file: !302, line: 57, baseType: !201, size: 16, offset: 144)
!321 = !DILocalVariable(name: "length", scope: !298, file: !62, line: 421, type: !68)
!322 = !DILocalVariable(name: "port_source", scope: !298, file: !62, line: 433, type: !55)
!323 = !DILocalVariable(name: "port_dest", scope: !298, file: !62, line: 440, type: !55)
!324 = !DILocalVariable(name: "icmp_header", scope: !325, file: !62, line: 467, type: !327)
!325 = distinct !DILexicalBlock(scope: !326, file: !62, line: 465, column: 40)
!326 = distinct !DILexicalBlock(scope: !299, file: !62, line: 465, column: 14)
!327 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !328, size: 64)
!328 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmphdr", file: !329, line: 89, size: 64, elements: !330)
!329 = !DIFile(filename: "/usr/include/linux/icmp.h", directory: "", checksumkind: CSK_MD5, checksum: "a505632898dce546638b3344627d334b")
!330 = !{!331, !332, !333, !334}
!331 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !328, file: !329, line: 90, baseType: !210, size: 8)
!332 = !DIDerivedType(tag: DW_TAG_member, name: "code", scope: !328, file: !329, line: 91, baseType: !210, size: 8, offset: 8)
!333 = !DIDerivedType(tag: DW_TAG_member, name: "checksum", scope: !328, file: !329, line: 92, baseType: !219, size: 16, offset: 16)
!334 = !DIDerivedType(tag: DW_TAG_member, name: "un", scope: !328, file: !329, line: 104, baseType: !335, size: 32, offset: 32)
!335 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !328, file: !329, line: 93, size: 32, elements: !336)
!336 = !{!337, !342, !343, !348}
!337 = !DIDerivedType(tag: DW_TAG_member, name: "echo", scope: !335, file: !329, line: 97, baseType: !338, size: 32)
!338 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !335, file: !329, line: 94, size: 32, elements: !339)
!339 = !{!340, !341}
!340 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !338, file: !329, line: 95, baseType: !201, size: 16)
!341 = !DIDerivedType(tag: DW_TAG_member, name: "sequence", scope: !338, file: !329, line: 96, baseType: !201, size: 16, offset: 16)
!342 = !DIDerivedType(tag: DW_TAG_member, name: "gateway", scope: !335, file: !329, line: 98, baseType: !227, size: 32)
!343 = !DIDerivedType(tag: DW_TAG_member, name: "frag", scope: !335, file: !329, line: 102, baseType: !344, size: 32)
!344 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !335, file: !329, line: 99, size: 32, elements: !345)
!345 = !{!346, !347}
!346 = !DIDerivedType(tag: DW_TAG_member, name: "__unused", scope: !344, file: !329, line: 100, baseType: !201, size: 16)
!347 = !DIDerivedType(tag: DW_TAG_member, name: "mtu", scope: !344, file: !329, line: 101, baseType: !201, size: 16, offset: 16)
!348 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !335, file: !329, line: 103, baseType: !349, size: 32)
!349 = !DICompositeType(tag: DW_TAG_array_type, baseType: !210, size: 32, elements: !161)
!350 = !DILocalVariable(name: "protocol", scope: !351, file: !62, line: 487, type: !68)
!351 = distinct !DILexicalBlock(scope: !352, file: !62, line: 485, column: 57)
!352 = distinct !DILexicalBlock(scope: !280, file: !62, line: 485, column: 13)
!353 = !DILocalVariable(name: "ipv6_source", scope: !351, file: !62, line: 489, type: !119)
!354 = !DILocalVariable(name: "ipv6_dest", scope: !351, file: !62, line: 490, type: !119)
!355 = !DILocalVariable(name: "udp_header", scope: !356, file: !62, line: 513, type: !286)
!356 = distinct !DILexicalBlock(scope: !357, file: !62, line: 511, column: 32)
!357 = distinct !DILexicalBlock(scope: !351, file: !62, line: 511, column: 7)
!358 = !DILocalVariable(name: "length", scope: !356, file: !62, line: 515, type: !68)
!359 = !DILocalVariable(name: "port_source", scope: !356, file: !62, line: 520, type: !55)
!360 = !DILocalVariable(name: "port_dest", scope: !356, file: !62, line: 527, type: !55)
!361 = !DILocalVariable(name: "tcp_header", scope: !362, file: !62, line: 553, type: !300)
!362 = distinct !DILexicalBlock(scope: !363, file: !62, line: 551, column: 39)
!363 = distinct !DILexicalBlock(scope: !357, file: !62, line: 551, column: 14)
!364 = !DILocalVariable(name: "length", scope: !362, file: !62, line: 555, type: !68)
!365 = !DILocalVariable(name: "port_source", scope: !362, file: !62, line: 567, type: !55)
!366 = !DILocalVariable(name: "port_dest", scope: !362, file: !62, line: 574, type: !55)
!367 = !DILocalVariable(name: "icmp_header", scope: !368, file: !62, line: 600, type: !327)
!368 = distinct !DILexicalBlock(scope: !369, file: !62, line: 598, column: 40)
!369 = distinct !DILexicalBlock(scope: !363, file: !62, line: 598, column: 14)
!370 = !DILocalVariable(name: "icmp6_header", scope: !371, file: !62, line: 616, type: !373)
!371 = distinct !DILexicalBlock(scope: !372, file: !62, line: 614, column: 42)
!372 = distinct !DILexicalBlock(scope: !369, file: !62, line: 614, column: 14)
!373 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !374, size: 64)
!374 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmp6hdr", file: !375, line: 8, size: 64, elements: !376)
!375 = !DIFile(filename: "/usr/include/linux/icmpv6.h", directory: "", checksumkind: CSK_MD5, checksum: "0310ca5584e6f44f6eea6cf040ee84b9")
!376 = !{!377, !378, !379, !380}
!377 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_type", scope: !374, file: !375, line: 10, baseType: !210, size: 8)
!378 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_code", scope: !374, file: !375, line: 11, baseType: !210, size: 8, offset: 8)
!379 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_cksum", scope: !374, file: !375, line: 12, baseType: !219, size: 16, offset: 16)
!380 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_dataun", scope: !374, file: !375, line: 63, baseType: !381, size: 32, offset: 32)
!381 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !374, file: !375, line: 15, size: 32, elements: !382)
!382 = !{!383, !385, !389, !390, !395, !403}
!383 = !DIDerivedType(tag: DW_TAG_member, name: "un_data32", scope: !381, file: !375, line: 16, baseType: !384, size: 32)
!384 = !DICompositeType(tag: DW_TAG_array_type, baseType: !227, size: 32, elements: !69)
!385 = !DIDerivedType(tag: DW_TAG_member, name: "un_data16", scope: !381, file: !375, line: 17, baseType: !386, size: 32)
!386 = !DICompositeType(tag: DW_TAG_array_type, baseType: !201, size: 32, elements: !387)
!387 = !{!388}
!388 = !DISubrange(count: 2)
!389 = !DIDerivedType(tag: DW_TAG_member, name: "un_data8", scope: !381, file: !375, line: 18, baseType: !349, size: 32)
!390 = !DIDerivedType(tag: DW_TAG_member, name: "u_echo", scope: !381, file: !375, line: 23, baseType: !391, size: 32)
!391 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmpv6_echo", file: !375, line: 20, size: 32, elements: !392)
!392 = !{!393, !394}
!393 = !DIDerivedType(tag: DW_TAG_member, name: "identifier", scope: !391, file: !375, line: 21, baseType: !201, size: 16)
!394 = !DIDerivedType(tag: DW_TAG_member, name: "sequence", scope: !391, file: !375, line: 22, baseType: !201, size: 16, offset: 16)
!395 = !DIDerivedType(tag: DW_TAG_member, name: "u_nd_advt", scope: !381, file: !375, line: 40, baseType: !396, size: 32)
!396 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmpv6_nd_advt", file: !375, line: 25, size: 32, elements: !397)
!397 = !{!398, !399, !400, !401, !402}
!398 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !396, file: !375, line: 27, baseType: !228, size: 5, flags: DIFlagBitField, extraData: i64 0)
!399 = !DIDerivedType(tag: DW_TAG_member, name: "override", scope: !396, file: !375, line: 28, baseType: !228, size: 1, offset: 5, flags: DIFlagBitField, extraData: i64 0)
!400 = !DIDerivedType(tag: DW_TAG_member, name: "solicited", scope: !396, file: !375, line: 29, baseType: !228, size: 1, offset: 6, flags: DIFlagBitField, extraData: i64 0)
!401 = !DIDerivedType(tag: DW_TAG_member, name: "router", scope: !396, file: !375, line: 30, baseType: !228, size: 1, offset: 7, flags: DIFlagBitField, extraData: i64 0)
!402 = !DIDerivedType(tag: DW_TAG_member, name: "reserved2", scope: !396, file: !375, line: 31, baseType: !228, size: 24, offset: 8, flags: DIFlagBitField, extraData: i64 0)
!403 = !DIDerivedType(tag: DW_TAG_member, name: "u_nd_ra", scope: !381, file: !375, line: 61, baseType: !404, size: 32)
!404 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmpv6_nd_ra", file: !375, line: 42, size: 32, elements: !405)
!405 = !{!406, !407, !408, !409, !410, !411, !412}
!406 = !DIDerivedType(tag: DW_TAG_member, name: "hop_limit", scope: !404, file: !375, line: 43, baseType: !210, size: 8)
!407 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !404, file: !375, line: 45, baseType: !210, size: 3, offset: 8, flags: DIFlagBitField, extraData: i64 8)
!408 = !DIDerivedType(tag: DW_TAG_member, name: "router_pref", scope: !404, file: !375, line: 46, baseType: !210, size: 2, offset: 11, flags: DIFlagBitField, extraData: i64 8)
!409 = !DIDerivedType(tag: DW_TAG_member, name: "home_agent", scope: !404, file: !375, line: 47, baseType: !210, size: 1, offset: 13, flags: DIFlagBitField, extraData: i64 8)
!410 = !DIDerivedType(tag: DW_TAG_member, name: "other", scope: !404, file: !375, line: 48, baseType: !210, size: 1, offset: 14, flags: DIFlagBitField, extraData: i64 8)
!411 = !DIDerivedType(tag: DW_TAG_member, name: "managed", scope: !404, file: !375, line: 49, baseType: !210, size: 1, offset: 15, flags: DIFlagBitField, extraData: i64 8)
!412 = !DIDerivedType(tag: DW_TAG_member, name: "rt_lifetime", scope: !404, file: !375, line: 60, baseType: !201, size: 16, offset: 16)
!413 = !DILocation(line: 0, scope: !168)
!414 = !DILocation(line: 317, column: 38, scope: !168)
!415 = !{!416, !417, i64 4}
!416 = !{!"xdp_md", !417, i64 0, !417, i64 4, !417, i64 8, !417, i64 12, !417, i64 16, !417, i64 20}
!417 = !{!"int", !418, i64 0}
!418 = !{!"omnipotent char", !419, i64 0}
!419 = !{!"Simple C/C++ TBAA"}
!420 = !DILocation(line: 317, column: 27, scope: !168)
!421 = !DILocation(line: 317, column: 19, scope: !168)
!422 = !DILocation(line: 318, column: 34, scope: !168)
!423 = !{!416, !417, i64 0}
!424 = !DILocation(line: 318, column: 23, scope: !168)
!425 = !DILocation(line: 318, column: 15, scope: !168)
!426 = !DILocation(line: 320, column: 11, scope: !427)
!427 = distinct !DILexicalBlock(scope: !168, file: !62, line: 320, column: 6)
!428 = !DILocation(line: 320, column: 35, scope: !427)
!429 = !DILocation(line: 320, column: 6, scope: !168)
!430 = !DILocalVariable(name: "nh", arg: 1, scope: !431, file: !187, line: 151, type: !434)
!431 = distinct !DISubprogram(name: "parse_ethhdr", scope: !187, file: !187, line: 151, type: !432, scopeLine: 151, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !436)
!432 = !DISubroutineType(types: !433)
!433 = !{!68, !434, !53, !435}
!434 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !186, size: 64)
!435 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !191, size: 64)
!436 = !{!430, !437, !438, !439, !440, !447, !448}
!437 = !DILocalVariable(name: "data_end", arg: 2, scope: !431, file: !187, line: 151, type: !53)
!438 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !431, file: !187, line: 151, type: !435)
!439 = !DILocalVariable(name: "eth", scope: !431, file: !187, line: 153, type: !191)
!440 = !DILocalVariable(name: "vlh", scope: !431, file: !187, line: 154, type: !441)
!441 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !442, size: 64)
!442 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vlanhdr", file: !187, line: 38, size: 32, elements: !443)
!443 = !{!444, !446}
!444 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_TCI", scope: !442, file: !187, line: 39, baseType: !445, size: 16)
!445 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !6, line: 20, baseType: !55)
!446 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_encapsulated_proto", scope: !442, file: !187, line: 40, baseType: !445, size: 16, offset: 16)
!447 = !DILocalVariable(name: "h_proto", scope: !431, file: !187, line: 155, type: !55)
!448 = !DILocalVariable(name: "i", scope: !431, file: !187, line: 156, type: !68)
!449 = !DILocation(line: 0, scope: !431, inlinedAt: !450)
!450 = distinct !DILocation(line: 331, column: 22, scope: !168)
!451 = !DILocation(line: 164, column: 17, scope: !431, inlinedAt: !450)
!452 = !{!453, !453, i64 0}
!453 = !{!"short", !418, i64 0}
!454 = !DILocalVariable(name: "h_proto", arg: 1, scope: !455, file: !187, line: 109, type: !55)
!455 = distinct !DISubprogram(name: "proto_is_vlan", scope: !187, file: !187, line: 109, type: !456, scopeLine: 109, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !458)
!456 = !DISubroutineType(types: !457)
!457 = !{!68, !55}
!458 = !{!454}
!459 = !DILocation(line: 0, scope: !455, inlinedAt: !460)
!460 = distinct !DILocation(line: 172, column: 8, scope: !461, inlinedAt: !450)
!461 = distinct !DILexicalBlock(scope: !462, file: !187, line: 172, column: 7)
!462 = distinct !DILexicalBlock(scope: !463, file: !187, line: 170, column: 39)
!463 = distinct !DILexicalBlock(scope: !464, file: !187, line: 170, column: 2)
!464 = distinct !DILexicalBlock(scope: !431, file: !187, line: 170, column: 2)
!465 = !DILocation(line: 110, column: 20, scope: !455, inlinedAt: !460)
!466 = !DILocation(line: 110, column: 46, scope: !455, inlinedAt: !460)
!467 = !DILocation(line: 172, column: 8, scope: !461, inlinedAt: !450)
!468 = !DILocation(line: 172, column: 7, scope: !462, inlinedAt: !450)
!469 = !DILocation(line: 180, column: 18, scope: !462, inlinedAt: !450)
!470 = !DILocation(line: 342, column: 6, scope: !168)
!471 = !DILocalVariable(name: "nh", arg: 1, scope: !472, file: !187, line: 191, type: !434)
!472 = distinct !DISubprogram(name: "parse_iphdr", scope: !187, file: !187, line: 191, type: !473, scopeLine: 191, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !476)
!473 = !DISubroutineType(types: !474)
!474 = !{!68, !434, !53, !475}
!475 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !205, size: 64)
!476 = !{!471, !477, !478, !479, !480}
!477 = !DILocalVariable(name: "data_end", arg: 2, scope: !472, file: !187, line: 191, type: !53)
!478 = !DILocalVariable(name: "iphdr", arg: 3, scope: !472, file: !187, line: 191, type: !475)
!479 = !DILocalVariable(name: "iph", scope: !472, file: !187, line: 193, type: !205)
!480 = !DILocalVariable(name: "hdrsize", scope: !472, file: !187, line: 194, type: !68)
!481 = !DILocation(line: 0, scope: !472, inlinedAt: !482)
!482 = distinct !DILocation(line: 344, column: 18, scope: !279)
!483 = !DILocation(line: 196, column: 10, scope: !484, inlinedAt: !482)
!484 = distinct !DILexicalBlock(scope: !472, file: !187, line: 196, column: 6)
!485 = !DILocation(line: 196, column: 14, scope: !484, inlinedAt: !482)
!486 = !DILocation(line: 196, column: 6, scope: !472, inlinedAt: !482)
!487 = !DILocation(line: 200, column: 17, scope: !472, inlinedAt: !482)
!488 = !DILocation(line: 200, column: 21, scope: !472, inlinedAt: !482)
!489 = !DILocation(line: 203, column: 14, scope: !490, inlinedAt: !482)
!490 = distinct !DILexicalBlock(scope: !472, file: !187, line: 203, column: 6)
!491 = !DILocation(line: 203, column: 24, scope: !490, inlinedAt: !482)
!492 = !DILocation(line: 203, column: 6, scope: !472, inlinedAt: !482)
!493 = !DILocation(line: 0, scope: !279)
!494 = !DILocation(line: 346, column: 3, scope: !279)
!495 = !DILocation(line: 368, column: 7, scope: !279)
!496 = !DILocation(line: 210, column: 14, scope: !472, inlinedAt: !482)
!497 = !{!498, !418, i64 9}
!498 = !{!"iphdr", !418, i64 0, !418, i64 0, !418, i64 1, !453, i64 2, !453, i64 4, !453, i64 6, !418, i64 8, !418, i64 9, !453, i64 10, !418, i64 12}
!499 = !DILocation(line: 350, column: 4, scope: !500)
!500 = distinct !DILexicalBlock(scope: !501, file: !62, line: 349, column: 20)
!501 = distinct !DILexicalBlock(scope: !279, file: !62, line: 349, column: 7)
!502 = !DILocation(line: 354, column: 19, scope: !503)
!503 = distinct !DILexicalBlock(scope: !279, file: !62, line: 354, column: 7)
!504 = !DILocation(line: 354, column: 7, scope: !279)
!505 = !DILocalVariable(name: "address", arg: 1, scope: !506, file: !62, line: 132, type: !92)
!506 = distinct !DISubprogram(name: "is_filtered_ipv4", scope: !62, file: !62, line: 132, type: !507, scopeLine: 132, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !510)
!507 = !DISubroutineType(types: !508)
!508 = !{!509, !92}
!509 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!510 = !{!505, !511}
!511 = !DILocalVariable(name: "banned", scope: !506, file: !62, line: 134, type: !82)
!512 = !DILocation(line: 0, scope: !506, inlinedAt: !513)
!513 = distinct !DILocation(line: 356, column: 8, scope: !514)
!514 = distinct !DILexicalBlock(scope: !515, file: !62, line: 356, column: 8)
!515 = distinct !DILexicalBlock(scope: !503, file: !62, line: 354, column: 25)
!516 = !DILocation(line: 136, column: 11, scope: !506, inlinedAt: !513)
!517 = !DILocation(line: 138, column: 13, scope: !518, inlinedAt: !513)
!518 = distinct !DILexicalBlock(scope: !506, file: !62, line: 138, column: 6)
!519 = !DILocation(line: 356, column: 8, scope: !515)
!520 = !DILocation(line: 0, scope: !284)
!521 = !DILocalVariable(name: "nh", arg: 1, scope: !522, file: !187, line: 259, type: !434)
!522 = distinct !DISubprogram(name: "parse_udphdr", scope: !187, file: !187, line: 259, type: !523, scopeLine: 259, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !526)
!523 = !DISubroutineType(types: !524)
!524 = !{!68, !434, !53, !525}
!525 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !286, size: 64)
!526 = !{!521, !527, !528, !529, !530}
!527 = !DILocalVariable(name: "data_end", arg: 2, scope: !522, file: !187, line: 259, type: !53)
!528 = !DILocalVariable(name: "udphdr", arg: 3, scope: !522, file: !187, line: 259, type: !525)
!529 = !DILocalVariable(name: "len", scope: !522, file: !187, line: 261, type: !68)
!530 = !DILocalVariable(name: "udph", scope: !522, file: !187, line: 262, type: !286)
!531 = !DILocation(line: 0, scope: !522, inlinedAt: !532)
!532 = distinct !DILocation(line: 372, column: 17, scope: !284)
!533 = !DILocation(line: 264, column: 11, scope: !534, inlinedAt: !532)
!534 = distinct !DILexicalBlock(scope: !522, file: !187, line: 264, column: 6)
!535 = !DILocation(line: 264, column: 15, scope: !534, inlinedAt: !532)
!536 = !DILocation(line: 264, column: 6, scope: !522, inlinedAt: !532)
!537 = !DILocation(line: 271, column: 8, scope: !522, inlinedAt: !532)
!538 = !{!539, !453, i64 4}
!539 = !{!"udphdr", !453, i64 0, !453, i64 2, !453, i64 4, !453, i64 6}
!540 = !DILocation(line: 272, column: 10, scope: !541, inlinedAt: !532)
!541 = distinct !DILexicalBlock(scope: !522, file: !187, line: 272, column: 6)
!542 = !DILocation(line: 272, column: 6, scope: !522, inlinedAt: !532)
!543 = !DILocation(line: 377, column: 36, scope: !284)
!544 = !{!539, !453, i64 0}
!545 = !DILocation(line: 0, scope: !546, inlinedAt: !552)
!546 = distinct !DISubprogram(name: "is_filtered_port", scope: !62, file: !62, line: 160, type: !547, scopeLine: 160, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !549)
!547 = !DISubroutineType(types: !548)
!548 = !{!509, !55}
!549 = !{!550, !551}
!550 = !DILocalVariable(name: "port", arg: 1, scope: !546, file: !62, line: 160, type: !55)
!551 = !DILocalVariable(name: "blocked_port", scope: !546, file: !62, line: 162, type: !82)
!552 = distinct !DILocation(line: 380, column: 8, scope: !553)
!553 = distinct !DILexicalBlock(scope: !284, file: !62, line: 380, column: 8)
!554 = !DILocation(line: 164, column: 17, scope: !546, inlinedAt: !552)
!555 = !DILocation(line: 166, column: 19, scope: !556, inlinedAt: !552)
!556 = distinct !DILexicalBlock(scope: !546, file: !62, line: 166, column: 6)
!557 = !DILocation(line: 172, column: 1, scope: !546, inlinedAt: !552)
!558 = !DILocation(line: 380, column: 8, scope: !284)
!559 = !DILocation(line: 384, column: 34, scope: !284)
!560 = !{!539, !453, i64 2}
!561 = !DILocation(line: 0, scope: !546, inlinedAt: !562)
!562 = distinct !DILocation(line: 387, column: 8, scope: !563)
!563 = distinct !DILexicalBlock(scope: !284, file: !62, line: 387, column: 8)
!564 = !DILocation(line: 164, column: 17, scope: !546, inlinedAt: !562)
!565 = !DILocation(line: 166, column: 19, scope: !556, inlinedAt: !562)
!566 = !DILocation(line: 172, column: 1, scope: !546, inlinedAt: !562)
!567 = !DILocation(line: 0, scope: !298)
!568 = !DILocalVariable(name: "nh", arg: 1, scope: !569, file: !187, line: 298, type: !434)
!569 = distinct !DISubprogram(name: "parse_tcphdr", scope: !187, file: !187, line: 298, type: !570, scopeLine: 298, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !573)
!570 = !DISubroutineType(types: !571)
!571 = !{!68, !434, !53, !572}
!572 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !300, size: 64)
!573 = !{!568, !574, !575, !576, !577}
!574 = !DILocalVariable(name: "data_end", arg: 2, scope: !569, file: !187, line: 298, type: !53)
!575 = !DILocalVariable(name: "tcphdr", arg: 3, scope: !569, file: !187, line: 298, type: !572)
!576 = !DILocalVariable(name: "len", scope: !569, file: !187, line: 300, type: !68)
!577 = !DILocalVariable(name: "tcph", scope: !569, file: !187, line: 301, type: !300)
!578 = !DILocation(line: 0, scope: !569, inlinedAt: !579)
!579 = distinct !DILocation(line: 421, column: 17, scope: !298)
!580 = !DILocation(line: 303, column: 11, scope: !581, inlinedAt: !579)
!581 = distinct !DILexicalBlock(scope: !569, file: !187, line: 303, column: 6)
!582 = !DILocation(line: 303, column: 15, scope: !581, inlinedAt: !579)
!583 = !DILocation(line: 303, column: 6, scope: !569, inlinedAt: !579)
!584 = !DILocation(line: 307, column: 14, scope: !569, inlinedAt: !579)
!585 = !DILocation(line: 307, column: 19, scope: !569, inlinedAt: !579)
!586 = !DILocation(line: 308, column: 20, scope: !587, inlinedAt: !579)
!587 = distinct !DILexicalBlock(scope: !569, file: !187, line: 308, column: 6)
!588 = !DILocation(line: 308, column: 26, scope: !587, inlinedAt: !579)
!589 = !DILocation(line: 308, column: 6, scope: !569, inlinedAt: !579)
!590 = !DILocalVariable(name: "tcp_header", arg: 1, scope: !591, file: !62, line: 252, type: !300)
!591 = distinct !DISubprogram(name: "is_filtered_nmap_tcp_scan", scope: !62, file: !62, line: 252, type: !592, scopeLine: 252, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !594)
!592 = !DISubroutineType(types: !593)
!593 = !{!509, !300}
!594 = !{!590}
!595 = !DILocation(line: 0, scope: !591, inlinedAt: !596)
!596 = distinct !DILocation(line: 427, column: 8, scope: !597)
!597 = distinct !DILexicalBlock(scope: !298, file: !62, line: 427, column: 8)
!598 = !DILocation(line: 256, column: 3, scope: !599, inlinedAt: !596)
!599 = distinct !DILexicalBlock(scope: !591, file: !62, line: 255, column: 3)
!600 = !DILocation(line: 277, column: 18, scope: !601, inlinedAt: !596)
!601 = distinct !DILexicalBlock(scope: !591, file: !62, line: 269, column: 3)
!602 = !{!603, !453, i64 14}
!603 = !{!"tcphdr", !453, i64 0, !453, i64 2, !417, i64 4, !417, i64 8, !453, i64 12, !453, i64 12, !453, i64 13, !453, i64 13, !453, i64 13, !453, i64 13, !453, i64 13, !453, i64 13, !453, i64 13, !453, i64 13, !453, i64 14, !453, i64 16, !453, i64 18}
!604 = !DILocation(line: 277, column: 25, scope: !601, inlinedAt: !596)
!605 = !DILocation(line: 269, column: 3, scope: !591, inlinedAt: !596)
!606 = !DILocalVariable(name: "tcp_header", arg: 1, scope: !607, file: !62, line: 286, type: !300)
!607 = distinct !DISubprogram(name: "is_likely_nmap_tcp_scan", scope: !62, file: !62, line: 286, type: !592, scopeLine: 286, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !608)
!608 = !{!606}
!609 = !DILocation(line: 0, scope: !607, inlinedAt: !610)
!610 = distinct !DILocation(line: 429, column: 15, scope: !611)
!611 = distinct !DILexicalBlock(scope: !597, file: !62, line: 429, column: 15)
!612 = !DILocation(line: 292, column: 3, scope: !613, inlinedAt: !610)
!613 = distinct !DILexicalBlock(scope: !607, file: !62, line: 291, column: 3)
!614 = !DILocation(line: 298, column: 18, scope: !613, inlinedAt: !610)
!615 = !DILocation(line: 298, column: 25, scope: !613, inlinedAt: !610)
!616 = !DILocation(line: 291, column: 3, scope: !607, inlinedAt: !610)
!617 = !DILocalVariable(name: "address", arg: 1, scope: !618, file: !62, line: 60, type: !92)
!618 = distinct !DISubprogram(name: "warn_ipv4", scope: !62, file: !62, line: 60, type: !619, scopeLine: 60, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !620)
!619 = !DISubroutineType(cc: DW_CC_nocall, types: !508)
!620 = !{!617, !621, !622, !625, !628}
!621 = !DILocalVariable(name: "warnings_ipv4", scope: !618, file: !62, line: 62, type: !82)
!622 = !DILocalVariable(name: "tmp", scope: !623, file: !62, line: 68, type: !83)
!623 = distinct !DILexicalBlock(scope: !624, file: !62, line: 66, column: 29)
!624 = distinct !DILexicalBlock(scope: !618, file: !62, line: 66, column: 6)
!625 = !DILocalVariable(name: "banned", scope: !626, file: !62, line: 76, type: !83)
!626 = distinct !DILexicalBlock(scope: !627, file: !62, line: 74, column: 17)
!627 = distinct !DILexicalBlock(scope: !623, file: !62, line: 74, column: 7)
!628 = !DILocalVariable(name: "tmp", scope: !629, file: !62, line: 86, type: !83)
!629 = distinct !DILexicalBlock(scope: !624, file: !62, line: 84, column: 9)
!630 = !DILocation(line: 0, scope: !618, inlinedAt: !631)
!631 = distinct !DILocation(line: 430, column: 5, scope: !632)
!632 = distinct !DILexicalBlock(scope: !611, file: !62, line: 429, column: 60)
!633 = !DILocation(line: 64, column: 18, scope: !618, inlinedAt: !631)
!634 = !DILocation(line: 66, column: 20, scope: !624, inlinedAt: !631)
!635 = !DILocation(line: 66, column: 6, scope: !618, inlinedAt: !631)
!636 = !DILocation(line: 68, column: 3, scope: !623, inlinedAt: !631)
!637 = !DILocation(line: 0, scope: !623, inlinedAt: !631)
!638 = !DILocation(line: 70, column: 9, scope: !623, inlinedAt: !631)
!639 = !{!418, !418, i64 0}
!640 = !DILocation(line: 70, column: 24, scope: !623, inlinedAt: !631)
!641 = !DILocation(line: 70, column: 7, scope: !623, inlinedAt: !631)
!642 = !DILocation(line: 72, column: 3, scope: !623, inlinedAt: !631)
!643 = !DILocation(line: 74, column: 7, scope: !627, inlinedAt: !631)
!644 = !DILocation(line: 74, column: 11, scope: !627, inlinedAt: !631)
!645 = !DILocation(line: 74, column: 7, scope: !623, inlinedAt: !631)
!646 = !DILocation(line: 76, column: 4, scope: !626, inlinedAt: !631)
!647 = !DILocation(line: 0, scope: !626, inlinedAt: !631)
!648 = !DILocation(line: 76, column: 9, scope: !626, inlinedAt: !631)
!649 = !DILocation(line: 77, column: 4, scope: !626, inlinedAt: !631)
!650 = !DILocation(line: 79, column: 8, scope: !626, inlinedAt: !631)
!651 = !DILocation(line: 80, column: 4, scope: !626, inlinedAt: !631)
!652 = !DILocation(line: 82, column: 3, scope: !627, inlinedAt: !631)
!653 = !DILocation(line: 82, column: 3, scope: !626, inlinedAt: !631)
!654 = !DILocation(line: 84, column: 2, scope: !624, inlinedAt: !631)
!655 = !DILocation(line: 84, column: 2, scope: !623, inlinedAt: !631)
!656 = !DILocation(line: 86, column: 3, scope: !629, inlinedAt: !631)
!657 = !DILocation(line: 0, scope: !629, inlinedAt: !631)
!658 = !DILocation(line: 86, column: 8, scope: !629, inlinedAt: !631)
!659 = !DILocation(line: 88, column: 3, scope: !629, inlinedAt: !631)
!660 = !DILocation(line: 90, column: 2, scope: !624, inlinedAt: !631)
!661 = !DILocation(line: 433, column: 36, scope: !298)
!662 = !{!603, !453, i64 0}
!663 = !DILocation(line: 0, scope: !546, inlinedAt: !664)
!664 = distinct !DILocation(line: 436, column: 8, scope: !665)
!665 = distinct !DILexicalBlock(scope: !298, file: !62, line: 436, column: 8)
!666 = !DILocation(line: 164, column: 17, scope: !546, inlinedAt: !664)
!667 = !DILocation(line: 166, column: 19, scope: !556, inlinedAt: !664)
!668 = !DILocation(line: 172, column: 1, scope: !546, inlinedAt: !664)
!669 = !DILocation(line: 436, column: 8, scope: !298)
!670 = !DILocation(line: 440, column: 34, scope: !298)
!671 = !{!603, !453, i64 2}
!672 = !DILocation(line: 0, scope: !546, inlinedAt: !673)
!673 = distinct !DILocation(line: 443, column: 8, scope: !674)
!674 = distinct !DILexicalBlock(scope: !298, file: !62, line: 443, column: 8)
!675 = !DILocation(line: 164, column: 17, scope: !546, inlinedAt: !673)
!676 = !DILocation(line: 166, column: 19, scope: !556, inlinedAt: !673)
!677 = !DILocation(line: 172, column: 1, scope: !546, inlinedAt: !673)
!678 = !DILocation(line: 0, scope: !325)
!679 = !DILocalVariable(name: "nh", arg: 1, scope: !680, file: !187, line: 214, type: !434)
!680 = distinct !DISubprogram(name: "parse_icmphdr", scope: !187, file: !187, line: 214, type: !681, scopeLine: 214, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !684)
!681 = !DISubroutineType(cc: DW_CC_nocall, types: !682)
!682 = !{!68, !434, !53, !683}
!683 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !327, size: 64)
!684 = !{!679, !685, !686, !687}
!685 = !DILocalVariable(name: "data_end", arg: 2, scope: !680, file: !187, line: 214, type: !53)
!686 = !DILocalVariable(name: "icmphdr", arg: 3, scope: !680, file: !187, line: 214, type: !683)
!687 = !DILocalVariable(name: "icmph", scope: !680, file: !187, line: 216, type: !327)
!688 = !DILocation(line: 0, scope: !680, inlinedAt: !689)
!689 = distinct !DILocation(line: 469, column: 4, scope: !325)
!690 = !DILocation(line: 218, column: 12, scope: !691, inlinedAt: !689)
!691 = distinct !DILexicalBlock(scope: !680, file: !187, line: 218, column: 6)
!692 = !DILocation(line: 218, column: 16, scope: !691, inlinedAt: !689)
!693 = !DILocation(line: 218, column: 6, scope: !680, inlinedAt: !689)
!694 = !DILocalVariable(name: "icmp_header", arg: 1, scope: !695, file: !62, line: 174, type: !327)
!695 = distinct !DISubprogram(name: "is_filtered_icmp_packet", scope: !62, file: !62, line: 174, type: !696, scopeLine: 174, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !698)
!696 = !DISubroutineType(types: !697)
!697 = !{!509, !327}
!698 = !{!694, !699}
!699 = !DILocalVariable(name: "type", scope: !695, file: !62, line: 176, type: !68)
!700 = !DILocation(line: 0, scope: !695, inlinedAt: !701)
!701 = distinct !DILocation(line: 471, column: 23, scope: !702)
!702 = distinct !DILexicalBlock(scope: !325, file: !62, line: 471, column: 8)
!703 = !DILocation(line: 176, column: 26, scope: !695, inlinedAt: !701)
!704 = !{!705, !418, i64 0}
!705 = !{!"icmphdr", !418, i64 0, !418, i64 1, !453, i64 2, !418, i64 4}
!706 = !DILocation(line: 179, column: 8, scope: !707, inlinedAt: !701)
!707 = distinct !DILexicalBlock(scope: !695, file: !62, line: 179, column: 3)
!708 = !DILocation(line: 180, column: 3, scope: !707, inlinedAt: !701)
!709 = !DILocation(line: 195, column: 18, scope: !707, inlinedAt: !701)
!710 = !DILocation(line: 483, column: 3, scope: !279)
!711 = !DILocation(line: 485, column: 2, scope: !280)
!712 = !DILocalVariable(name: "nh", arg: 1, scope: !713, file: !187, line: 229, type: !434)
!713 = distinct !DISubprogram(name: "parse_ipv6hdr", scope: !187, file: !187, line: 229, type: !714, scopeLine: 229, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !717)
!714 = !DISubroutineType(types: !715)
!715 = !{!68, !434, !53, !716}
!716 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !236, size: 64)
!717 = !{!712, !718, !719, !720}
!718 = !DILocalVariable(name: "data_end", arg: 2, scope: !713, file: !187, line: 229, type: !53)
!719 = !DILocalVariable(name: "ip6hdr", arg: 3, scope: !713, file: !187, line: 229, type: !716)
!720 = !DILocalVariable(name: "ip6h", scope: !713, file: !187, line: 231, type: !236)
!721 = !DILocation(line: 0, scope: !713, inlinedAt: !722)
!722 = distinct !DILocation(line: 487, column: 18, scope: !351)
!723 = !DILocation(line: 233, column: 11, scope: !724, inlinedAt: !722)
!724 = distinct !DILexicalBlock(scope: !713, file: !187, line: 233, column: 6)
!725 = !DILocation(line: 233, column: 15, scope: !724, inlinedAt: !722)
!726 = !DILocation(line: 233, column: 6, scope: !713, inlinedAt: !722)
!727 = !DILocalVariable(name: "nh", arg: 1, scope: !728, file: !187, line: 113, type: !434)
!728 = distinct !DISubprogram(name: "skip_ip6hdrext", scope: !187, file: !187, line: 113, type: !729, scopeLine: 113, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !731)
!729 = !DISubroutineType(types: !730)
!730 = !{!68, !434, !53, !83}
!731 = !{!727, !732, !733, !734, !736}
!732 = !DILocalVariable(name: "data_end", arg: 2, scope: !728, file: !187, line: 113, type: !53)
!733 = !DILocalVariable(name: "next_hdr_type", arg: 3, scope: !728, file: !187, line: 113, type: !83)
!734 = !DILocalVariable(name: "i", scope: !735, file: !187, line: 115, type: !68)
!735 = distinct !DILexicalBlock(scope: !728, file: !187, line: 115, column: 2)
!736 = !DILocalVariable(name: "hdr", scope: !737, file: !187, line: 117, type: !739)
!737 = distinct !DILexicalBlock(scope: !738, file: !187, line: 115, column: 46)
!738 = distinct !DILexicalBlock(scope: !735, file: !187, line: 115, column: 2)
!739 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !740, size: 64)
!740 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipv6_opt_hdr", file: !238, line: 63, size: 16, elements: !741)
!741 = !{!742, !743}
!742 = !DIDerivedType(tag: DW_TAG_member, name: "nexthdr", scope: !740, file: !238, line: 64, baseType: !210, size: 8)
!743 = !DIDerivedType(tag: DW_TAG_member, name: "hdrlen", scope: !740, file: !238, line: 65, baseType: !210, size: 8, offset: 8)
!744 = !DILocation(line: 0, scope: !728, inlinedAt: !745)
!745 = distinct !DILocation(line: 240, column: 9, scope: !713, inlinedAt: !722)
!746 = !DILocation(line: 0, scope: !735, inlinedAt: !745)
!747 = !DILocation(line: 0, scope: !737, inlinedAt: !745)
!748 = !DILocation(line: 119, column: 11, scope: !749, inlinedAt: !745)
!749 = distinct !DILexicalBlock(scope: !737, file: !187, line: 119, column: 7)
!750 = !DILocation(line: 119, column: 15, scope: !749, inlinedAt: !745)
!751 = !DILocation(line: 119, column: 7, scope: !737, inlinedAt: !745)
!752 = !DILocation(line: 240, column: 44, scope: !713, inlinedAt: !722)
!753 = !{!754, !418, i64 6}
!754 = !{!"ipv6hdr", !418, i64 0, !418, i64 0, !418, i64 1, !453, i64 4, !418, i64 6, !418, i64 7, !418, i64 8}
!755 = !DILocation(line: 123, column: 3, scope: !737, inlinedAt: !745)
!756 = !DILocation(line: 135, column: 5, scope: !757, inlinedAt: !745)
!757 = distinct !DILexicalBlock(scope: !737, file: !187, line: 123, column: 26)
!758 = !DILocation(line: 123, column: 11, scope: !737, inlinedAt: !745)
!759 = !DILocation(line: 141, column: 5, scope: !757, inlinedAt: !745)
!760 = !DILocation(line: 0, scope: !757, inlinedAt: !745)
!761 = !{!762, !418, i64 1}
!762 = !{!"ipv6_opt_hdr", !418, i64 0, !418, i64 1}
!763 = !{!762, !418, i64 0}
!764 = !DILocation(line: 131, column: 5, scope: !757, inlinedAt: !745)
!765 = !DILocation(line: 137, column: 27, scope: !757, inlinedAt: !745)
!766 = !DILocation(line: 139, column: 5, scope: !757, inlinedAt: !745)
!767 = !DILocation(line: 133, column: 35, scope: !757, inlinedAt: !745)
!768 = !DILocation(line: 133, column: 30, scope: !757, inlinedAt: !745)
!769 = !DILocation(line: 133, column: 47, scope: !757, inlinedAt: !745)
!770 = !DILocation(line: 133, column: 27, scope: !757, inlinedAt: !745)
!771 = !DILocation(line: 129, column: 35, scope: !757, inlinedAt: !745)
!772 = !DILocation(line: 129, column: 30, scope: !757, inlinedAt: !745)
!773 = !DILocation(line: 129, column: 47, scope: !757, inlinedAt: !745)
!774 = !DILocation(line: 129, column: 27, scope: !757, inlinedAt: !745)
!775 = !DILocation(line: 0, scope: !351)
!776 = !DILocation(line: 489, column: 3, scope: !351)
!777 = !DILocation(line: 511, column: 7, scope: !351)
!778 = !DILocation(line: 493, column: 4, scope: !779)
!779 = distinct !DILexicalBlock(scope: !780, file: !62, line: 492, column: 20)
!780 = distinct !DILexicalBlock(scope: !351, file: !62, line: 492, column: 7)
!781 = !DILocation(line: 497, column: 7, scope: !782)
!782 = distinct !DILexicalBlock(scope: !351, file: !62, line: 497, column: 7)
!783 = !{!784, !784, i64 0}
!784 = !{!"__int128", !418, i64 0}
!785 = !DILocation(line: 497, column: 19, scope: !782)
!786 = !DILocation(line: 497, column: 7, scope: !351)
!787 = !DILocalVariable(name: "address", arg: 1, scope: !788, file: !62, line: 146, type: !118)
!788 = distinct !DISubprogram(name: "is_filtered_ipv6", scope: !62, file: !62, line: 146, type: !789, scopeLine: 146, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !791)
!789 = !DISubroutineType(types: !790)
!790 = !{!509, !118}
!791 = !{!787, !792}
!792 = !DILocalVariable(name: "banned", scope: !788, file: !62, line: 148, type: !82)
!793 = !DILocation(line: 0, scope: !788, inlinedAt: !794)
!794 = distinct !DILocation(line: 499, column: 8, scope: !795)
!795 = distinct !DILexicalBlock(scope: !796, file: !62, line: 499, column: 8)
!796 = distinct !DILexicalBlock(scope: !782, file: !62, line: 497, column: 25)
!797 = !DILocation(line: 150, column: 11, scope: !788, inlinedAt: !794)
!798 = !DILocation(line: 152, column: 13, scope: !799, inlinedAt: !794)
!799 = distinct !DILexicalBlock(scope: !788, file: !62, line: 152, column: 6)
!800 = !DILocation(line: 499, column: 8, scope: !796)
!801 = !DILocation(line: 0, scope: !356)
!802 = !DILocation(line: 0, scope: !522, inlinedAt: !803)
!803 = distinct !DILocation(line: 515, column: 17, scope: !356)
!804 = !DILocation(line: 264, column: 11, scope: !534, inlinedAt: !803)
!805 = !DILocation(line: 264, column: 15, scope: !534, inlinedAt: !803)
!806 = !DILocation(line: 264, column: 6, scope: !522, inlinedAt: !803)
!807 = !DILocation(line: 271, column: 8, scope: !522, inlinedAt: !803)
!808 = !DILocation(line: 272, column: 10, scope: !541, inlinedAt: !803)
!809 = !DILocation(line: 272, column: 6, scope: !522, inlinedAt: !803)
!810 = !DILocation(line: 520, column: 36, scope: !356)
!811 = !DILocation(line: 0, scope: !546, inlinedAt: !812)
!812 = distinct !DILocation(line: 523, column: 8, scope: !813)
!813 = distinct !DILexicalBlock(scope: !356, file: !62, line: 523, column: 8)
!814 = !DILocation(line: 164, column: 17, scope: !546, inlinedAt: !812)
!815 = !DILocation(line: 166, column: 19, scope: !556, inlinedAt: !812)
!816 = !DILocation(line: 172, column: 1, scope: !546, inlinedAt: !812)
!817 = !DILocation(line: 523, column: 8, scope: !356)
!818 = !DILocation(line: 527, column: 34, scope: !356)
!819 = !DILocation(line: 0, scope: !546, inlinedAt: !820)
!820 = distinct !DILocation(line: 530, column: 8, scope: !821)
!821 = distinct !DILexicalBlock(scope: !356, file: !62, line: 530, column: 8)
!822 = !DILocation(line: 164, column: 17, scope: !546, inlinedAt: !820)
!823 = !DILocation(line: 166, column: 19, scope: !556, inlinedAt: !820)
!824 = !DILocation(line: 172, column: 1, scope: !546, inlinedAt: !820)
!825 = !DILocation(line: 0, scope: !362)
!826 = !DILocation(line: 0, scope: !569, inlinedAt: !827)
!827 = distinct !DILocation(line: 555, column: 17, scope: !362)
!828 = !DILocation(line: 303, column: 11, scope: !581, inlinedAt: !827)
!829 = !DILocation(line: 303, column: 15, scope: !581, inlinedAt: !827)
!830 = !DILocation(line: 303, column: 6, scope: !569, inlinedAt: !827)
!831 = !DILocation(line: 307, column: 14, scope: !569, inlinedAt: !827)
!832 = !DILocation(line: 307, column: 19, scope: !569, inlinedAt: !827)
!833 = !DILocation(line: 308, column: 20, scope: !587, inlinedAt: !827)
!834 = !DILocation(line: 308, column: 26, scope: !587, inlinedAt: !827)
!835 = !DILocation(line: 308, column: 6, scope: !569, inlinedAt: !827)
!836 = !DILocation(line: 0, scope: !591, inlinedAt: !837)
!837 = distinct !DILocation(line: 561, column: 8, scope: !838)
!838 = distinct !DILexicalBlock(scope: !362, file: !62, line: 561, column: 8)
!839 = !DILocation(line: 256, column: 3, scope: !599, inlinedAt: !837)
!840 = !DILocation(line: 277, column: 18, scope: !601, inlinedAt: !837)
!841 = !DILocation(line: 277, column: 25, scope: !601, inlinedAt: !837)
!842 = !DILocation(line: 269, column: 3, scope: !591, inlinedAt: !837)
!843 = !DILocation(line: 0, scope: !607, inlinedAt: !844)
!844 = distinct !DILocation(line: 563, column: 15, scope: !845)
!845 = distinct !DILexicalBlock(scope: !838, file: !62, line: 563, column: 15)
!846 = !DILocation(line: 292, column: 3, scope: !613, inlinedAt: !844)
!847 = !DILocation(line: 298, column: 18, scope: !613, inlinedAt: !844)
!848 = !DILocation(line: 298, column: 25, scope: !613, inlinedAt: !844)
!849 = !DILocation(line: 291, column: 3, scope: !607, inlinedAt: !844)
!850 = !DILocalVariable(name: "address", arg: 1, scope: !851, file: !62, line: 96, type: !118)
!851 = distinct !DISubprogram(name: "warn_ipv6", scope: !62, file: !62, line: 96, type: !852, scopeLine: 96, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !853)
!852 = !DISubroutineType(cc: DW_CC_nocall, types: !790)
!853 = !{!850, !854, !855, !858, !861}
!854 = !DILocalVariable(name: "warnings_ipv6", scope: !851, file: !62, line: 98, type: !82)
!855 = !DILocalVariable(name: "tmp", scope: !856, file: !62, line: 104, type: !83)
!856 = distinct !DILexicalBlock(scope: !857, file: !62, line: 102, column: 29)
!857 = distinct !DILexicalBlock(scope: !851, file: !62, line: 102, column: 6)
!858 = !DILocalVariable(name: "banned", scope: !859, file: !62, line: 112, type: !83)
!859 = distinct !DILexicalBlock(scope: !860, file: !62, line: 110, column: 17)
!860 = distinct !DILexicalBlock(scope: !856, file: !62, line: 110, column: 7)
!861 = !DILocalVariable(name: "tmp", scope: !862, file: !62, line: 122, type: !83)
!862 = distinct !DILexicalBlock(scope: !857, file: !62, line: 120, column: 9)
!863 = !DILocation(line: 0, scope: !851, inlinedAt: !864)
!864 = distinct !DILocation(line: 564, column: 5, scope: !865)
!865 = distinct !DILexicalBlock(scope: !845, file: !62, line: 563, column: 60)
!866 = !DILocation(line: 100, column: 18, scope: !851, inlinedAt: !864)
!867 = !DILocation(line: 102, column: 20, scope: !857, inlinedAt: !864)
!868 = !DILocation(line: 102, column: 6, scope: !851, inlinedAt: !864)
!869 = !DILocation(line: 104, column: 3, scope: !856, inlinedAt: !864)
!870 = !DILocation(line: 0, scope: !856, inlinedAt: !864)
!871 = !DILocation(line: 106, column: 9, scope: !856, inlinedAt: !864)
!872 = !DILocation(line: 106, column: 24, scope: !856, inlinedAt: !864)
!873 = !DILocation(line: 106, column: 7, scope: !856, inlinedAt: !864)
!874 = !DILocation(line: 108, column: 3, scope: !856, inlinedAt: !864)
!875 = !DILocation(line: 110, column: 7, scope: !860, inlinedAt: !864)
!876 = !DILocation(line: 110, column: 11, scope: !860, inlinedAt: !864)
!877 = !DILocation(line: 110, column: 7, scope: !856, inlinedAt: !864)
!878 = !DILocation(line: 112, column: 4, scope: !859, inlinedAt: !864)
!879 = !DILocation(line: 0, scope: !859, inlinedAt: !864)
!880 = !DILocation(line: 112, column: 9, scope: !859, inlinedAt: !864)
!881 = !DILocation(line: 113, column: 4, scope: !859, inlinedAt: !864)
!882 = !DILocation(line: 115, column: 8, scope: !859, inlinedAt: !864)
!883 = !DILocation(line: 116, column: 4, scope: !859, inlinedAt: !864)
!884 = !DILocation(line: 118, column: 3, scope: !860, inlinedAt: !864)
!885 = !DILocation(line: 118, column: 3, scope: !859, inlinedAt: !864)
!886 = !DILocation(line: 120, column: 2, scope: !857, inlinedAt: !864)
!887 = !DILocation(line: 120, column: 2, scope: !856, inlinedAt: !864)
!888 = !DILocation(line: 122, column: 3, scope: !862, inlinedAt: !864)
!889 = !DILocation(line: 0, scope: !862, inlinedAt: !864)
!890 = !DILocation(line: 122, column: 8, scope: !862, inlinedAt: !864)
!891 = !DILocation(line: 124, column: 3, scope: !862, inlinedAt: !864)
!892 = !DILocation(line: 126, column: 2, scope: !857, inlinedAt: !864)
!893 = !DILocation(line: 567, column: 36, scope: !362)
!894 = !DILocation(line: 0, scope: !546, inlinedAt: !895)
!895 = distinct !DILocation(line: 570, column: 8, scope: !896)
!896 = distinct !DILexicalBlock(scope: !362, file: !62, line: 570, column: 8)
!897 = !DILocation(line: 164, column: 17, scope: !546, inlinedAt: !895)
!898 = !DILocation(line: 166, column: 19, scope: !556, inlinedAt: !895)
!899 = !DILocation(line: 172, column: 1, scope: !546, inlinedAt: !895)
!900 = !DILocation(line: 570, column: 8, scope: !362)
!901 = !DILocation(line: 574, column: 34, scope: !362)
!902 = !DILocation(line: 0, scope: !546, inlinedAt: !903)
!903 = distinct !DILocation(line: 577, column: 8, scope: !904)
!904 = distinct !DILexicalBlock(scope: !362, file: !62, line: 577, column: 8)
!905 = !DILocation(line: 164, column: 17, scope: !546, inlinedAt: !903)
!906 = !DILocation(line: 166, column: 19, scope: !556, inlinedAt: !903)
!907 = !DILocation(line: 172, column: 1, scope: !546, inlinedAt: !903)
!908 = !DILocation(line: 0, scope: !368)
!909 = !DILocation(line: 0, scope: !680, inlinedAt: !910)
!910 = distinct !DILocation(line: 602, column: 4, scope: !368)
!911 = !DILocation(line: 218, column: 12, scope: !691, inlinedAt: !910)
!912 = !DILocation(line: 218, column: 16, scope: !691, inlinedAt: !910)
!913 = !DILocation(line: 218, column: 6, scope: !680, inlinedAt: !910)
!914 = !DILocation(line: 0, scope: !695, inlinedAt: !915)
!915 = distinct !DILocation(line: 604, column: 23, scope: !916)
!916 = distinct !DILexicalBlock(scope: !368, file: !62, line: 604, column: 8)
!917 = !DILocation(line: 176, column: 26, scope: !695, inlinedAt: !915)
!918 = !DILocation(line: 179, column: 8, scope: !707, inlinedAt: !915)
!919 = !DILocation(line: 180, column: 3, scope: !707, inlinedAt: !915)
!920 = !DILocation(line: 195, column: 18, scope: !707, inlinedAt: !915)
!921 = !DILocation(line: 0, scope: !371)
!922 = !DILocalVariable(name: "nh", arg: 1, scope: !923, file: !187, line: 244, type: !434)
!923 = distinct !DISubprogram(name: "parse_icmp6hdr", scope: !187, file: !187, line: 244, type: !924, scopeLine: 244, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !927)
!924 = !DISubroutineType(cc: DW_CC_nocall, types: !925)
!925 = !{!68, !434, !53, !926}
!926 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !373, size: 64)
!927 = !{!922, !928, !929, !930}
!928 = !DILocalVariable(name: "data_end", arg: 2, scope: !923, file: !187, line: 244, type: !53)
!929 = !DILocalVariable(name: "icmp6hdr", arg: 3, scope: !923, file: !187, line: 244, type: !926)
!930 = !DILocalVariable(name: "icmp6h", scope: !923, file: !187, line: 246, type: !373)
!931 = !DILocation(line: 0, scope: !923, inlinedAt: !932)
!932 = distinct !DILocation(line: 618, column: 4, scope: !371)
!933 = !DILocation(line: 248, column: 13, scope: !934, inlinedAt: !932)
!934 = distinct !DILexicalBlock(scope: !923, file: !187, line: 248, column: 6)
!935 = !DILocation(line: 248, column: 17, scope: !934, inlinedAt: !932)
!936 = !DILocation(line: 248, column: 6, scope: !923, inlinedAt: !932)
!937 = !DILocalVariable(name: "icmp6_header", arg: 1, scope: !938, file: !62, line: 207, type: !373)
!938 = distinct !DISubprogram(name: "is_filtered_icmp6_packet", scope: !62, file: !62, line: 207, type: !939, scopeLine: 207, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !941)
!939 = !DISubroutineType(types: !940)
!940 = !{!509, !373}
!941 = !{!937, !942}
!942 = !DILocalVariable(name: "type", scope: !938, file: !62, line: 209, type: !68)
!943 = !DILocation(line: 0, scope: !938, inlinedAt: !944)
!944 = distinct !DILocation(line: 620, column: 24, scope: !945)
!945 = distinct !DILexicalBlock(scope: !371, file: !62, line: 620, column: 8)
!946 = !DILocation(line: 209, column: 27, scope: !938, inlinedAt: !944)
!947 = !{!948, !418, i64 0}
!948 = !{!"icmp6hdr", !418, i64 0, !418, i64 1, !453, i64 2, !418, i64 4}
!949 = !DILocation(line: 212, column: 8, scope: !950, inlinedAt: !944)
!950 = distinct !DILexicalBlock(scope: !938, file: !62, line: 212, column: 3)
!951 = !DILocation(line: 213, column: 3, scope: !950, inlinedAt: !944)
!952 = !DILocation(line: 228, column: 18, scope: !950, inlinedAt: !944)
!953 = !DILocation(line: 231, column: 18, scope: !950, inlinedAt: !944)
!954 = !DILocation(line: 243, column: 12, scope: !950, inlinedAt: !944)
!955 = !DILocation(line: 243, column: 19, scope: !950, inlinedAt: !944)
!956 = !DILocation(line: 632, column: 2, scope: !352)
!957 = !DILocation(line: 636, column: 1, scope: !168)
