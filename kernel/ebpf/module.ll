; ModuleID = '/home/cookiengineer/Software/cookiengineer/ebpf-firewall/kernel/ebpf/module.c'
source_filename = "/home/cookiengineer/Software/cookiengineer/ebpf-firewall/kernel/ebpf/module.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.anon.9 = type { ptr, ptr, ptr, ptr }
%struct.anon.10 = type { ptr, ptr, ptr, ptr }
%struct.anon.11 = type { ptr, ptr, ptr, ptr }
%struct.anon.12 = type { ptr, ptr, ptr, ptr }
%struct.anon.13 = type { ptr, ptr, ptr, ptr }
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
@port_bans = dso_local global %struct.anon.9 zeroinitializer, section ".maps", align 8, !dbg !60
@ipv4_bans = dso_local global %struct.anon.10 zeroinitializer, section ".maps", align 8, !dbg !82
@ipv4_warnings = dso_local global %struct.anon.11 zeroinitializer, section ".maps", align 8, !dbg !96
@ipv6_bans = dso_local global %struct.anon.12 zeroinitializer, section ".maps", align 8, !dbg !112
@ipv6_warnings = dso_local global %struct.anon.13 zeroinitializer, section ".maps", align 8, !dbg !124
@llvm.compiler.used = appending global [7 x ptr] [ptr @_license, ptr @ipv4_bans, ptr @ipv4_warnings, ptr @ipv6_bans, ptr @ipv6_warnings, ptr @port_bans, ptr @xdp_prog_main], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @xdp_prog_main(ptr nocapture noundef readonly %0) #0 section "xdp" !dbg !156 {
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
  call void @llvm.dbg.value(metadata ptr %0, metadata !169, metadata !DIExpression()), !dbg !401
  %18 = getelementptr inbounds %struct.xdp_md, ptr %0, i64 0, i32 1, !dbg !402
  %19 = load i32, ptr %18, align 4, !dbg !402, !tbaa !403
  %20 = zext i32 %19 to i64, !dbg !408
  %21 = inttoptr i64 %20 to ptr, !dbg !409
  call void @llvm.dbg.value(metadata ptr %21, metadata !170, metadata !DIExpression()), !dbg !401
  %22 = load i32, ptr %0, align 4, !dbg !410, !tbaa !411
  %23 = zext i32 %22 to i64, !dbg !412
  %24 = inttoptr i64 %23 to ptr, !dbg !413
  call void @llvm.dbg.value(metadata ptr %24, metadata !171, metadata !DIExpression()), !dbg !401
  %25 = getelementptr i8, ptr %24, i64 14, !dbg !414
  %26 = icmp ugt ptr %25, %21, !dbg !416
  br i1 %26, label %385, label %27, !dbg !417

27:                                               ; preds = %1
  call void @llvm.dbg.value(metadata ptr null, metadata !178, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.value(metadata ptr null, metadata !192, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.value(metadata ptr null, metadata !223, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.value(metadata ptr %24, metadata !173, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.value(metadata ptr undef, metadata !418, metadata !DIExpression()), !dbg !437
  call void @llvm.dbg.value(metadata ptr %21, metadata !425, metadata !DIExpression()), !dbg !437
  call void @llvm.dbg.value(metadata ptr undef, metadata !426, metadata !DIExpression()), !dbg !437
  call void @llvm.dbg.value(metadata ptr %24, metadata !427, metadata !DIExpression()), !dbg !437
  call void @llvm.dbg.value(metadata ptr %25, metadata !173, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.value(metadata ptr %25, metadata !428, metadata !DIExpression()), !dbg !437
  %28 = getelementptr inbounds %struct.ethhdr, ptr %24, i64 0, i32 2, !dbg !439
  call void @llvm.dbg.value(metadata i16 undef, metadata !435, metadata !DIExpression()), !dbg !437
  call void @llvm.dbg.value(metadata i32 0, metadata !436, metadata !DIExpression()), !dbg !437
  %29 = load i16, ptr %28, align 1, !dbg !437, !tbaa !440
  call void @llvm.dbg.value(metadata i16 %29, metadata !435, metadata !DIExpression()), !dbg !437
  call void @llvm.dbg.value(metadata i16 %29, metadata !442, metadata !DIExpression()), !dbg !447
  %30 = icmp eq i16 %29, 129, !dbg !453
  %31 = icmp eq i16 %29, -22392, !dbg !454
  %32 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 2, i1 %30)
  %33 = or i1 %31, %32, !dbg !454
  %34 = xor i1 %33, true, !dbg !455
  %35 = getelementptr inbounds %struct.ethhdr, ptr %24, i64 1, i32 0, i64 4
  %36 = icmp ugt ptr %35, %21
  %37 = select i1 %34, i1 true, i1 %36, !dbg !456
  br i1 %37, label %74, label %38, !dbg !456

38:                                               ; preds = %27
  %39 = getelementptr inbounds %struct.ethhdr, ptr %24, i64 1, i32 0, i64 2, !dbg !457
  call void @llvm.dbg.value(metadata i16 undef, metadata !435, metadata !DIExpression()), !dbg !437
  call void @llvm.dbg.value(metadata ptr %35, metadata !428, metadata !DIExpression()), !dbg !437
  call void @llvm.dbg.value(metadata i32 1, metadata !436, metadata !DIExpression()), !dbg !437
  %40 = load i16, ptr %39, align 1, !dbg !437, !tbaa !440
  call void @llvm.dbg.value(metadata i16 %40, metadata !435, metadata !DIExpression()), !dbg !437
  call void @llvm.dbg.value(metadata i16 %40, metadata !442, metadata !DIExpression()), !dbg !447
  %41 = icmp eq i16 %40, 129, !dbg !453
  %42 = icmp eq i16 %40, -22392, !dbg !454
  %43 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 2, i1 %41)
  %44 = or i1 %42, %43, !dbg !454
  %45 = xor i1 %44, true, !dbg !455
  %46 = getelementptr inbounds %struct.ethhdr, ptr %24, i64 1, i32 1, i64 2
  %47 = icmp ugt ptr %46, %21
  %48 = select i1 %45, i1 true, i1 %47, !dbg !456
  br i1 %48, label %74, label %49, !dbg !456

49:                                               ; preds = %38
  %50 = getelementptr inbounds %struct.ethhdr, ptr %24, i64 1, i32 1, !dbg !457
  call void @llvm.dbg.value(metadata i16 undef, metadata !435, metadata !DIExpression()), !dbg !437
  call void @llvm.dbg.value(metadata ptr %46, metadata !428, metadata !DIExpression()), !dbg !437
  call void @llvm.dbg.value(metadata i32 2, metadata !436, metadata !DIExpression()), !dbg !437
  %51 = load i16, ptr %50, align 1, !dbg !437, !tbaa !440
  call void @llvm.dbg.value(metadata i16 %51, metadata !435, metadata !DIExpression()), !dbg !437
  call void @llvm.dbg.value(metadata i16 %51, metadata !442, metadata !DIExpression()), !dbg !447
  %52 = icmp eq i16 %51, 129, !dbg !453
  %53 = icmp eq i16 %51, -22392, !dbg !454
  %54 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 2, i1 %52)
  %55 = or i1 %53, %54, !dbg !454
  %56 = xor i1 %55, true, !dbg !455
  %57 = getelementptr inbounds %struct.ethhdr, ptr %24, i64 1, i32 2
  %58 = icmp ugt ptr %57, %21
  %59 = select i1 %56, i1 true, i1 %58, !dbg !456
  br i1 %59, label %74, label %60, !dbg !456

60:                                               ; preds = %49
  %61 = getelementptr inbounds %struct.ethhdr, ptr %24, i64 1, i32 1, i64 4, !dbg !457
  call void @llvm.dbg.value(metadata i16 undef, metadata !435, metadata !DIExpression()), !dbg !437
  call void @llvm.dbg.value(metadata ptr %57, metadata !428, metadata !DIExpression()), !dbg !437
  call void @llvm.dbg.value(metadata i32 3, metadata !436, metadata !DIExpression()), !dbg !437
  %62 = load i16, ptr %61, align 1, !dbg !437, !tbaa !440
  call void @llvm.dbg.value(metadata i16 %62, metadata !435, metadata !DIExpression()), !dbg !437
  call void @llvm.dbg.value(metadata i16 %62, metadata !442, metadata !DIExpression()), !dbg !447
  %63 = icmp eq i16 %62, 129, !dbg !453
  %64 = icmp eq i16 %62, -22392, !dbg !454
  %65 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 2, i1 %63)
  %66 = or i1 %64, %65, !dbg !454
  %67 = xor i1 %66, true, !dbg !455
  %68 = getelementptr inbounds %struct.ethhdr, ptr %24, i64 2, i32 0, i64 2
  %69 = icmp ugt ptr %68, %21
  %70 = select i1 %67, i1 true, i1 %69, !dbg !456
  br i1 %70, label %74, label %71, !dbg !456

71:                                               ; preds = %60
  %72 = getelementptr inbounds %struct.ethhdr, ptr %24, i64 2, !dbg !457
  call void @llvm.dbg.value(metadata i16 undef, metadata !435, metadata !DIExpression()), !dbg !437
  call void @llvm.dbg.value(metadata ptr %68, metadata !428, metadata !DIExpression()), !dbg !437
  call void @llvm.dbg.value(metadata i32 4, metadata !436, metadata !DIExpression()), !dbg !437
  %73 = load i16, ptr %72, align 1, !dbg !437, !tbaa !440
  call void @llvm.dbg.value(metadata i16 %73, metadata !435, metadata !DIExpression()), !dbg !437
  br label %74

74:                                               ; preds = %27, %38, %49, %60, %71
  %75 = phi ptr [ %25, %27 ], [ %35, %38 ], [ %46, %49 ], [ %57, %60 ], [ %68, %71 ], !dbg !437
  %76 = phi i16 [ %29, %27 ], [ %40, %38 ], [ %51, %49 ], [ %62, %60 ], [ %73, %71 ], !dbg !437
  call void @llvm.dbg.value(metadata ptr %75, metadata !173, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.value(metadata i16 %76, metadata !172, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_signed, DW_OP_LLVM_convert, 32, DW_ATE_signed, DW_OP_stack_value)), !dbg !401
  switch i16 %76, label %385 [
    i16 8, label %77
    i16 -8826, label %178
  ], !dbg !458

77:                                               ; preds = %74
  call void @llvm.dbg.value(metadata ptr undef, metadata !459, metadata !DIExpression()), !dbg !469
  call void @llvm.dbg.value(metadata ptr %21, metadata !465, metadata !DIExpression()), !dbg !469
  call void @llvm.dbg.value(metadata ptr undef, metadata !466, metadata !DIExpression()), !dbg !469
  call void @llvm.dbg.value(metadata ptr %75, metadata !467, metadata !DIExpression()), !dbg !469
  %78 = getelementptr inbounds %struct.iphdr, ptr %75, i64 1, !dbg !471
  %79 = icmp ugt ptr %78, %21, !dbg !473
  br i1 %79, label %87, label %80, !dbg !474

80:                                               ; preds = %77
  %81 = load i8, ptr %75, align 4, !dbg !475
  %82 = shl i8 %81, 2, !dbg !476
  %83 = and i8 %82, 60, !dbg !476
  %84 = zext i8 %83 to i64
  call void @llvm.dbg.value(metadata i64 %84, metadata !468, metadata !DIExpression()), !dbg !469
  %85 = getelementptr i8, ptr %75, i64 %84, !dbg !477
  %86 = icmp ugt ptr %85, %21, !dbg !479
  br i1 %86, label %87, label %88, !dbg !480

87:                                               ; preds = %77, %80
  call void @llvm.dbg.value(metadata ptr %85, metadata !173, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.value(metadata i8 undef, metadata !266, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !481
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %16) #6, !dbg !482
  call void @llvm.dbg.value(metadata i32 0, metadata !269, metadata !DIExpression()), !dbg !481
  call void @llvm.dbg.value(metadata i32 0, metadata !270, metadata !DIExpression()), !dbg !481
  call void @llvm.dbg.value(metadata ptr %75, metadata !192, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.value(metadata i32 %92, metadata !269, metadata !DIExpression()), !dbg !481
  br label %175, !dbg !483

88:                                               ; preds = %80
  call void @llvm.dbg.value(metadata ptr %85, metadata !173, metadata !DIExpression()), !dbg !401
  %89 = getelementptr inbounds %struct.iphdr, ptr %75, i64 0, i32 6, !dbg !484
  %90 = load i8, ptr %89, align 1, !dbg !484, !tbaa !485
  call void @llvm.dbg.value(metadata i8 undef, metadata !266, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !481
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %16) #6, !dbg !482
  call void @llvm.dbg.value(metadata i32 0, metadata !269, metadata !DIExpression()), !dbg !481
  call void @llvm.dbg.value(metadata i32 0, metadata !270, metadata !DIExpression()), !dbg !481
  call void @llvm.dbg.value(metadata ptr %75, metadata !192, metadata !DIExpression()), !dbg !401
  %91 = getelementptr inbounds %struct.iphdr, ptr %75, i64 0, i32 8, !dbg !487
  call void @llvm.dbg.value(metadata ptr %16, metadata !269, metadata !DIExpression(DW_OP_deref)), !dbg !481
  %92 = load i32, ptr %91, align 4, !dbg !487
  store i32 %92, ptr %16, align 4, !dbg !487
  call void @llvm.dbg.value(metadata ptr undef, metadata !192, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.value(metadata i32 undef, metadata !270, metadata !DIExpression()), !dbg !481
  call void @llvm.dbg.value(metadata i32 %92, metadata !269, metadata !DIExpression()), !dbg !481
  %93 = icmp eq i32 %92, 0, !dbg !490
  br i1 %93, label %97, label %94, !dbg !492

94:                                               ; preds = %88
  call void @llvm.dbg.value(metadata ptr %16, metadata !269, metadata !DIExpression(DW_OP_deref)), !dbg !481
  call void @llvm.dbg.value(metadata ptr %16, metadata !493, metadata !DIExpression()), !dbg !500
  call void @llvm.dbg.value(metadata ptr null, metadata !499, metadata !DIExpression()), !dbg !500
  %95 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @ipv4_bans, ptr noundef nonnull %16) #6, !dbg !504
  call void @llvm.dbg.value(metadata ptr %95, metadata !499, metadata !DIExpression()), !dbg !500
  %96 = icmp eq ptr %95, null, !dbg !505
  br i1 %96, label %97, label %176, !dbg !507

97:                                               ; preds = %94, %88
  switch i8 %90, label %175 [
    i8 17, label %98
    i8 6, label %115
    i8 1, label %162
  ], !dbg !483

98:                                               ; preds = %97
  call void @llvm.dbg.value(metadata ptr null, metadata !271, metadata !DIExpression()), !dbg !508
  call void @llvm.dbg.value(metadata ptr undef, metadata !509, metadata !DIExpression()), !dbg !519
  call void @llvm.dbg.value(metadata ptr %21, metadata !515, metadata !DIExpression()), !dbg !519
  call void @llvm.dbg.value(metadata ptr undef, metadata !516, metadata !DIExpression()), !dbg !519
  call void @llvm.dbg.value(metadata ptr %85, metadata !518, metadata !DIExpression()), !dbg !519
  %99 = getelementptr inbounds %struct.udphdr, ptr %85, i64 1, !dbg !521
  %100 = icmp ugt ptr %99, %21, !dbg !523
  br i1 %100, label %176, label %101, !dbg !524

101:                                              ; preds = %98
  call void @llvm.dbg.value(metadata ptr %99, metadata !173, metadata !DIExpression()), !dbg !401
  %102 = getelementptr inbounds %struct.udphdr, ptr %85, i64 0, i32 2, !dbg !525
  %103 = load i16, ptr %102, align 2, !dbg !525, !tbaa !526
  %104 = call i16 @llvm.bswap.i16(i16 %103), !dbg !525
  call void @llvm.dbg.value(metadata i16 %104, metadata !517, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_constu, 8, DW_OP_minus, DW_OP_stack_value)), !dbg !519
  %105 = icmp ult i16 %104, 8, !dbg !528
  br i1 %105, label %176, label %106, !dbg !530

106:                                              ; preds = %101
  call void @llvm.dbg.value(metadata i16 %104, metadata !517, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_constu, 8, DW_OP_minus, DW_OP_stack_value)), !dbg !519
  call void @llvm.dbg.value(metadata i16 %104, metadata !517, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_constu, 8, DW_OP_minus, DW_OP_stack_value)), !dbg !519
  call void @llvm.dbg.value(metadata i16 %104, metadata !282, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_constu, 8, DW_OP_minus, DW_OP_stack_value)), !dbg !508
  call void @llvm.dbg.value(metadata ptr %85, metadata !271, metadata !DIExpression()), !dbg !508
  %107 = load i16, ptr %85, align 2, !dbg !531, !tbaa !532
  call void @llvm.dbg.value(metadata i16 %107, metadata !283, metadata !DIExpression()), !dbg !508
  call void @llvm.lifetime.start.p0(i64 2, ptr nonnull %15), !dbg !533
  call void @llvm.dbg.value(metadata i16 %107, metadata !538, metadata !DIExpression()), !dbg !533
  store i16 %107, ptr %15, align 2, !tbaa !440
  call void @llvm.dbg.value(metadata ptr null, metadata !539, metadata !DIExpression()), !dbg !533
  call void @llvm.dbg.value(metadata ptr %15, metadata !538, metadata !DIExpression(DW_OP_deref)), !dbg !533
  %108 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @port_bans, ptr noundef nonnull %15) #6, !dbg !542
  call void @llvm.dbg.value(metadata ptr %108, metadata !539, metadata !DIExpression()), !dbg !533
  %109 = icmp eq ptr %108, null, !dbg !543
  call void @llvm.lifetime.end.p0(i64 2, ptr nonnull %15), !dbg !545
  br i1 %109, label %110, label %176, !dbg !546

110:                                              ; preds = %106
  call void @llvm.dbg.value(metadata ptr %85, metadata !271, metadata !DIExpression()), !dbg !508
  %111 = getelementptr inbounds %struct.udphdr, ptr %85, i64 0, i32 1, !dbg !547
  %112 = load i16, ptr %111, align 2, !dbg !547, !tbaa !548
  call void @llvm.dbg.value(metadata i16 %112, metadata !284, metadata !DIExpression()), !dbg !508
  call void @llvm.lifetime.start.p0(i64 2, ptr nonnull %14), !dbg !549
  call void @llvm.dbg.value(metadata i16 %112, metadata !538, metadata !DIExpression()), !dbg !549
  store i16 %112, ptr %14, align 2, !tbaa !440
  call void @llvm.dbg.value(metadata ptr null, metadata !539, metadata !DIExpression()), !dbg !549
  call void @llvm.dbg.value(metadata ptr %14, metadata !538, metadata !DIExpression(DW_OP_deref)), !dbg !549
  %113 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @port_bans, ptr noundef nonnull %14) #6, !dbg !552
  call void @llvm.dbg.value(metadata ptr %113, metadata !539, metadata !DIExpression()), !dbg !549
  %114 = icmp eq ptr %113, null, !dbg !553
  call void @llvm.lifetime.end.p0(i64 2, ptr nonnull %14), !dbg !554
  br i1 %114, label %175, label %176

115:                                              ; preds = %97
  call void @llvm.dbg.value(metadata ptr null, metadata !285, metadata !DIExpression()), !dbg !555
  call void @llvm.dbg.value(metadata ptr undef, metadata !556, metadata !DIExpression()), !dbg !566
  call void @llvm.dbg.value(metadata ptr %21, metadata !562, metadata !DIExpression()), !dbg !566
  call void @llvm.dbg.value(metadata ptr undef, metadata !563, metadata !DIExpression()), !dbg !566
  call void @llvm.dbg.value(metadata ptr %85, metadata !565, metadata !DIExpression()), !dbg !566
  %116 = getelementptr inbounds %struct.tcphdr, ptr %85, i64 1, !dbg !568
  %117 = icmp ugt ptr %116, %21, !dbg !570
  br i1 %117, label %176, label %118, !dbg !571

118:                                              ; preds = %115
  %119 = getelementptr inbounds %struct.tcphdr, ptr %85, i64 0, i32 4, !dbg !572
  %120 = load i16, ptr %119, align 4, !dbg !572
  %121 = lshr i16 %120, 2, !dbg !573
  %122 = and i16 %121, 60, !dbg !573
  call void @llvm.dbg.value(metadata i16 %122, metadata !564, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !566
  %123 = zext i16 %122 to i64
  %124 = getelementptr i8, ptr %85, i64 %123, !dbg !574
  %125 = icmp ugt ptr %124, %21, !dbg !576
  br i1 %125, label %176, label %126, !dbg !577

126:                                              ; preds = %118
  call void @llvm.dbg.value(metadata i16 %122, metadata !564, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !566
  call void @llvm.dbg.value(metadata ptr %116, metadata !173, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.value(metadata i16 %122, metadata !309, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !555
  call void @llvm.dbg.value(metadata ptr %85, metadata !285, metadata !DIExpression()), !dbg !555
  call void @llvm.dbg.value(metadata ptr %85, metadata !578, metadata !DIExpression()), !dbg !583
  %127 = and i16 %120, -256, !dbg !586
  switch i16 %127, label %132 [
    i16 256, label %176
    i16 5120, label %128
  ], !dbg !586

128:                                              ; preds = %126
  %129 = getelementptr inbounds %struct.tcphdr, ptr %85, i64 0, i32 5, !dbg !588
  %130 = load i16, ptr %129, align 2, !dbg !588, !tbaa !590
  %131 = icmp eq i16 %130, 0, !dbg !592
  br i1 %131, label %176, label %132, !dbg !593

132:                                              ; preds = %128, %126
  call void @llvm.dbg.value(metadata ptr %85, metadata !285, metadata !DIExpression()), !dbg !555
  call void @llvm.dbg.value(metadata ptr %85, metadata !594, metadata !DIExpression()), !dbg !597
  %133 = and i16 %120, -8448, !dbg !600
  %134 = icmp eq i16 %133, 512, !dbg !600
  br i1 %134, label %135, label %153, !dbg !600

135:                                              ; preds = %132
  %136 = getelementptr inbounds %struct.tcphdr, ptr %85, i64 0, i32 5, !dbg !602
  %137 = load i16, ptr %136, align 2, !dbg !602, !tbaa !590
  %138 = icmp eq i16 %137, -3846, !dbg !603
  br i1 %138, label %139, label %153, !dbg !604

139:                                              ; preds = %135
  call void @llvm.dbg.value(metadata ptr %16, metadata !269, metadata !DIExpression(DW_OP_deref)), !dbg !481
  call void @llvm.dbg.value(metadata ptr %16, metadata !605, metadata !DIExpression()), !dbg !618
  call void @llvm.dbg.value(metadata ptr null, metadata !609, metadata !DIExpression()), !dbg !618
  %140 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @ipv4_warnings, ptr noundef nonnull %16) #6, !dbg !621
  call void @llvm.dbg.value(metadata ptr %140, metadata !609, metadata !DIExpression()), !dbg !618
  %141 = icmp eq ptr %140, null, !dbg !622
  br i1 %141, label %151, label %142, !dbg !623

142:                                              ; preds = %139
  call void @llvm.lifetime.start.p0(i64 1, ptr nonnull %11) #6, !dbg !624
  call void @llvm.dbg.value(metadata i8 0, metadata !610, metadata !DIExpression()), !dbg !625
  %143 = load i8, ptr %140, align 1, !dbg !626, !tbaa !627
  %144 = add i8 %143, 1, !dbg !628
  call void @llvm.dbg.value(metadata i8 %144, metadata !610, metadata !DIExpression()), !dbg !625
  store i8 %144, ptr %11, align 1, !dbg !629, !tbaa !627
  call void @llvm.dbg.value(metadata ptr %11, metadata !610, metadata !DIExpression(DW_OP_deref)), !dbg !625
  %145 = call i64 inttoptr (i64 2 to ptr)(ptr noundef nonnull @ipv4_warnings, ptr noundef nonnull %16, ptr noundef nonnull %11, i64 noundef 0) #6, !dbg !630
  %146 = load i8, ptr %11, align 1, !dbg !631, !tbaa !627
  call void @llvm.dbg.value(metadata i8 %146, metadata !610, metadata !DIExpression()), !dbg !625
  %147 = icmp ugt i8 %146, 16, !dbg !632
  br i1 %147, label %148, label %150, !dbg !633

148:                                              ; preds = %142
  call void @llvm.lifetime.start.p0(i64 1, ptr nonnull %12) #6, !dbg !634
  call void @llvm.dbg.value(metadata i8 1, metadata !613, metadata !DIExpression()), !dbg !635
  store i8 1, ptr %12, align 1, !dbg !636, !tbaa !627
  call void @llvm.dbg.value(metadata ptr %12, metadata !613, metadata !DIExpression(DW_OP_deref)), !dbg !635
  %149 = call i64 inttoptr (i64 2 to ptr)(ptr noundef nonnull @ipv4_bans, ptr noundef nonnull %16, ptr noundef nonnull %12, i64 noundef 0) #6, !dbg !637
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %12) #6, !dbg !638
  br label %150, !dbg !639

150:                                              ; preds = %148, %142
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %11) #6, !dbg !640
  br label %153, !dbg !641

151:                                              ; preds = %139
  call void @llvm.lifetime.start.p0(i64 1, ptr nonnull %13) #6, !dbg !642
  call void @llvm.dbg.value(metadata i8 1, metadata !616, metadata !DIExpression()), !dbg !643
  store i8 1, ptr %13, align 1, !dbg !644, !tbaa !627
  call void @llvm.dbg.value(metadata ptr %13, metadata !616, metadata !DIExpression(DW_OP_deref)), !dbg !643
  %152 = call i64 inttoptr (i64 2 to ptr)(ptr noundef nonnull @ipv4_warnings, ptr noundef nonnull %16, ptr noundef nonnull %13, i64 noundef 0) #6, !dbg !645
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %13) #6, !dbg !646
  br label %153

153:                                              ; preds = %151, %150, %135, %132
  call void @llvm.dbg.value(metadata ptr %85, metadata !285, metadata !DIExpression()), !dbg !555
  %154 = load i16, ptr %85, align 4, !dbg !647, !tbaa !648
  call void @llvm.dbg.value(metadata i16 %154, metadata !310, metadata !DIExpression()), !dbg !555
  call void @llvm.lifetime.start.p0(i64 2, ptr nonnull %10), !dbg !649
  call void @llvm.dbg.value(metadata i16 %154, metadata !538, metadata !DIExpression()), !dbg !649
  store i16 %154, ptr %10, align 2, !tbaa !440
  call void @llvm.dbg.value(metadata ptr null, metadata !539, metadata !DIExpression()), !dbg !649
  call void @llvm.dbg.value(metadata ptr %10, metadata !538, metadata !DIExpression(DW_OP_deref)), !dbg !649
  %155 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @port_bans, ptr noundef nonnull %10) #6, !dbg !652
  call void @llvm.dbg.value(metadata ptr %155, metadata !539, metadata !DIExpression()), !dbg !649
  %156 = icmp eq ptr %155, null, !dbg !653
  call void @llvm.lifetime.end.p0(i64 2, ptr nonnull %10), !dbg !654
  br i1 %156, label %157, label %176, !dbg !655

157:                                              ; preds = %153
  call void @llvm.dbg.value(metadata ptr %85, metadata !285, metadata !DIExpression()), !dbg !555
  %158 = getelementptr inbounds %struct.tcphdr, ptr %85, i64 0, i32 1, !dbg !656
  %159 = load i16, ptr %158, align 2, !dbg !656, !tbaa !657
  call void @llvm.dbg.value(metadata i16 %159, metadata !311, metadata !DIExpression()), !dbg !555
  call void @llvm.lifetime.start.p0(i64 2, ptr nonnull %9), !dbg !658
  call void @llvm.dbg.value(metadata i16 %159, metadata !538, metadata !DIExpression()), !dbg !658
  store i16 %159, ptr %9, align 2, !tbaa !440
  call void @llvm.dbg.value(metadata ptr null, metadata !539, metadata !DIExpression()), !dbg !658
  call void @llvm.dbg.value(metadata ptr %9, metadata !538, metadata !DIExpression(DW_OP_deref)), !dbg !658
  %160 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @port_bans, ptr noundef nonnull %9) #6, !dbg !661
  call void @llvm.dbg.value(metadata ptr %160, metadata !539, metadata !DIExpression()), !dbg !658
  %161 = icmp eq ptr %160, null, !dbg !662
  call void @llvm.lifetime.end.p0(i64 2, ptr nonnull %9), !dbg !663
  br i1 %161, label %175, label %176

162:                                              ; preds = %97
  call void @llvm.dbg.value(metadata ptr null, metadata !312, metadata !DIExpression()), !dbg !664
  call void @llvm.dbg.value(metadata ptr undef, metadata !665, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata ptr %21, metadata !671, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata ptr undef, metadata !672, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.value(metadata ptr %85, metadata !673, metadata !DIExpression()), !dbg !674
  %163 = getelementptr inbounds %struct.icmphdr, ptr %85, i64 1, !dbg !676
  %164 = icmp ugt ptr %163, %21, !dbg !678
  %165 = icmp eq ptr %85, null
  %166 = or i1 %165, %164, !dbg !679
  call void @llvm.dbg.value(metadata ptr %163, metadata !173, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.value(metadata ptr %85, metadata !312, metadata !DIExpression()), !dbg !664
  br i1 %166, label %175, label %167, !dbg !679

167:                                              ; preds = %162
  call void @llvm.dbg.value(metadata ptr %85, metadata !680, metadata !DIExpression()), !dbg !686
  %168 = load i8, ptr %85, align 4, !dbg !689, !tbaa !690
  call void @llvm.dbg.value(metadata i8 %168, metadata !685, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !686
  %169 = icmp eq i8 %168, 0, !dbg !692
  %170 = call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %169)
  %171 = freeze i1 %170, !dbg !694
  br i1 %171, label %176, label %172, !dbg !694

172:                                              ; preds = %167
  switch i8 %168, label %173 [
    i8 19, label %176
    i8 18, label %176
    i8 17, label %176
    i8 16, label %176
    i8 15, label %176
    i8 14, label %176
    i8 13, label %176
    i8 10, label %176
    i8 9, label %176
    i8 8, label %176
    i8 7, label %176
    i8 6, label %176
    i8 4, label %176
    i8 2, label %176
    i8 1, label %176
  ], !dbg !694

173:                                              ; preds = %172
  %174 = icmp ugt i8 %168, 19, !dbg !695
  br i1 %174, label %176, label %175, !dbg !695

175:                                              ; preds = %162, %173, %157, %110, %87, %97
  br label %176, !dbg !696

176:                                              ; preds = %157, %128, %126, %118, %115, %153, %110, %101, %98, %106, %173, %167, %172, %172, %172, %172, %172, %172, %172, %172, %172, %172, %172, %172, %172, %172, %172, %94, %175
  %177 = phi i32 [ 2, %175 ], [ 1, %94 ], [ 1, %172 ], [ 1, %172 ], [ 1, %172 ], [ 1, %172 ], [ 1, %172 ], [ 1, %172 ], [ 1, %172 ], [ 1, %172 ], [ 1, %172 ], [ 1, %172 ], [ 1, %172 ], [ 1, %172 ], [ 1, %172 ], [ 1, %172 ], [ 1, %172 ], [ 1, %167 ], [ 1, %173 ], [ 1, %106 ], [ 1, %98 ], [ 1, %101 ], [ 1, %110 ], [ 1, %153 ], [ 1, %115 ], [ 1, %118 ], [ 1, %126 ], [ 1, %128 ], [ 1, %157 ], !dbg !481
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %16) #6, !dbg !697
  br label %385

178:                                              ; preds = %74
  call void @llvm.dbg.value(metadata ptr undef, metadata !698, metadata !DIExpression()), !dbg !707
  call void @llvm.dbg.value(metadata ptr %21, metadata !704, metadata !DIExpression()), !dbg !707
  call void @llvm.dbg.value(metadata ptr undef, metadata !705, metadata !DIExpression()), !dbg !707
  call void @llvm.dbg.value(metadata ptr %75, metadata !706, metadata !DIExpression()), !dbg !707
  %179 = getelementptr inbounds %struct.ipv6hdr, ptr %75, i64 1, !dbg !709
  %180 = icmp ugt ptr %179, %21, !dbg !711
  br i1 %180, label %282, label %181, !dbg !712

181:                                              ; preds = %178
  call void @llvm.dbg.value(metadata ptr %179, metadata !173, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.value(metadata ptr undef, metadata !713, metadata !DIExpression()), !dbg !730
  call void @llvm.dbg.value(metadata ptr %21, metadata !718, metadata !DIExpression()), !dbg !730
  call void @llvm.dbg.value(metadata i32 0, metadata !720, metadata !DIExpression()), !dbg !732
  call void @llvm.dbg.value(metadata i8 undef, metadata !719, metadata !DIExpression()), !dbg !730
  call void @llvm.dbg.value(metadata ptr %179, metadata !722, metadata !DIExpression()), !dbg !733
  %182 = getelementptr inbounds %struct.ipv6hdr, ptr %75, i64 1, i32 1, i64 1, !dbg !734
  %183 = icmp ugt ptr %182, %21, !dbg !736
  br i1 %183, label %283, label %184, !dbg !737

184:                                              ; preds = %181
  %185 = getelementptr inbounds %struct.ipv6hdr, ptr %75, i64 0, i32 3, !dbg !738
  %186 = load i8, ptr %185, align 2, !dbg !738, !tbaa !739
  call void @llvm.dbg.value(metadata i8 %186, metadata !719, metadata !DIExpression()), !dbg !730
  switch i8 %186, label %188 [
    i8 0, label %192
    i8 60, label %192
    i8 43, label %192
    i8 -121, label %192
    i8 51, label %187
    i8 44, label %199
  ], !dbg !741

187:                                              ; preds = %184
  call void @llvm.dbg.value(metadata i8 undef, metadata !719, metadata !DIExpression()), !dbg !730
  br label %192, !dbg !742

188:                                              ; preds = %264, %249, %234, %219, %204, %184
  %189 = phi ptr [ %179, %184 ], [ %201, %204 ], [ %216, %219 ], [ %231, %234 ], [ %246, %249 ], [ %261, %264 ], !dbg !707
  %190 = phi i8 [ %186, %184 ], [ %205, %204 ], [ %220, %219 ], [ %235, %234 ], [ %250, %249 ], [ %265, %264 ]
  call void @llvm.dbg.value(metadata ptr %189, metadata !173, metadata !DIExpression()), !dbg !401
  %191 = zext i8 %190 to i32, !dbg !744
  br label %283, !dbg !745

192:                                              ; preds = %187, %184, %184, %184, %184
  %193 = phi i64 [ 2, %187 ], [ 3, %184 ], [ 3, %184 ], [ 3, %184 ], [ 3, %184 ]
  %194 = getelementptr inbounds %struct.ipv6hdr, ptr %75, i64 1, i32 1, !dbg !746
  %195 = load i8, ptr %194, align 1, !dbg !746, !tbaa !747
  %196 = zext i8 %195 to i64, !dbg !746
  %197 = shl nuw nsw i64 %196, %193, !dbg !746
  %198 = add nuw nsw i64 %197, 8, !dbg !746
  br label %199, !dbg !746

199:                                              ; preds = %192, %184
  %200 = phi i64 [ 8, %184 ], [ %198, %192 ]
  %201 = getelementptr inbounds i8, ptr %179, i64 %200, !dbg !746
  call void @llvm.dbg.value(metadata ptr %201, metadata !173, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.value(metadata i32 1, metadata !720, metadata !DIExpression()), !dbg !732
  call void @llvm.dbg.value(metadata i8 undef, metadata !719, metadata !DIExpression()), !dbg !730
  call void @llvm.dbg.value(metadata ptr %201, metadata !722, metadata !DIExpression()), !dbg !733
  %202 = getelementptr inbounds %struct.ipv6_opt_hdr, ptr %201, i64 1, !dbg !734
  %203 = icmp ugt ptr %202, %21, !dbg !736
  br i1 %203, label %283, label %204, !dbg !737

204:                                              ; preds = %199
  %205 = load i8, ptr %179, align 1, !dbg !746, !tbaa !749
  call void @llvm.dbg.value(metadata i8 %205, metadata !719, metadata !DIExpression()), !dbg !730
  switch i8 %205, label %188 [
    i8 0, label %206
    i8 60, label %206
    i8 43, label %206
    i8 -121, label %206
    i8 51, label %207
    i8 44, label %214
  ], !dbg !741

206:                                              ; preds = %204, %204, %204, %204
  call void @llvm.dbg.value(metadata i8 undef, metadata !719, metadata !DIExpression()), !dbg !730
  br label %207, !dbg !750

207:                                              ; preds = %206, %204
  %208 = phi i64 [ 3, %206 ], [ 2, %204 ]
  %209 = getelementptr inbounds %struct.ipv6_opt_hdr, ptr %201, i64 0, i32 1, !dbg !746
  %210 = load i8, ptr %209, align 1, !dbg !746, !tbaa !747
  %211 = zext i8 %210 to i64, !dbg !746
  %212 = shl nuw nsw i64 %211, %208, !dbg !746
  %213 = add nuw nsw i64 %212, 8, !dbg !746
  br label %214, !dbg !746

214:                                              ; preds = %207, %204
  %215 = phi i64 [ 8, %204 ], [ %213, %207 ]
  %216 = getelementptr inbounds i8, ptr %201, i64 %215, !dbg !746
  call void @llvm.dbg.value(metadata ptr %216, metadata !173, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.value(metadata i32 2, metadata !720, metadata !DIExpression()), !dbg !732
  call void @llvm.dbg.value(metadata i8 undef, metadata !719, metadata !DIExpression()), !dbg !730
  call void @llvm.dbg.value(metadata ptr %216, metadata !722, metadata !DIExpression()), !dbg !733
  %217 = getelementptr inbounds %struct.ipv6_opt_hdr, ptr %216, i64 1, !dbg !734
  %218 = icmp ugt ptr %217, %21, !dbg !736
  br i1 %218, label %283, label %219, !dbg !737

219:                                              ; preds = %214
  %220 = load i8, ptr %201, align 1, !dbg !746, !tbaa !749
  call void @llvm.dbg.value(metadata i8 %220, metadata !719, metadata !DIExpression()), !dbg !730
  switch i8 %220, label %188 [
    i8 0, label %221
    i8 60, label %221
    i8 43, label %221
    i8 -121, label %221
    i8 51, label %222
    i8 44, label %229
  ], !dbg !741

221:                                              ; preds = %219, %219, %219, %219
  call void @llvm.dbg.value(metadata i8 undef, metadata !719, metadata !DIExpression()), !dbg !730
  br label %222, !dbg !750

222:                                              ; preds = %221, %219
  %223 = phi i64 [ 3, %221 ], [ 2, %219 ]
  %224 = getelementptr inbounds %struct.ipv6_opt_hdr, ptr %216, i64 0, i32 1, !dbg !746
  %225 = load i8, ptr %224, align 1, !dbg !746, !tbaa !747
  %226 = zext i8 %225 to i64, !dbg !746
  %227 = shl nuw nsw i64 %226, %223, !dbg !746
  %228 = add nuw nsw i64 %227, 8, !dbg !746
  br label %229, !dbg !746

229:                                              ; preds = %222, %219
  %230 = phi i64 [ 8, %219 ], [ %228, %222 ]
  %231 = getelementptr inbounds i8, ptr %216, i64 %230, !dbg !746
  call void @llvm.dbg.value(metadata ptr %231, metadata !173, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.value(metadata i32 3, metadata !720, metadata !DIExpression()), !dbg !732
  call void @llvm.dbg.value(metadata i8 undef, metadata !719, metadata !DIExpression()), !dbg !730
  call void @llvm.dbg.value(metadata ptr %231, metadata !722, metadata !DIExpression()), !dbg !733
  %232 = getelementptr inbounds %struct.ipv6_opt_hdr, ptr %231, i64 1, !dbg !734
  %233 = icmp ugt ptr %232, %21, !dbg !736
  br i1 %233, label %283, label %234, !dbg !737

234:                                              ; preds = %229
  %235 = load i8, ptr %216, align 1, !dbg !746, !tbaa !749
  call void @llvm.dbg.value(metadata i8 %235, metadata !719, metadata !DIExpression()), !dbg !730
  switch i8 %235, label %188 [
    i8 0, label %236
    i8 60, label %236
    i8 43, label %236
    i8 -121, label %236
    i8 51, label %237
    i8 44, label %244
  ], !dbg !741

236:                                              ; preds = %234, %234, %234, %234
  call void @llvm.dbg.value(metadata i8 undef, metadata !719, metadata !DIExpression()), !dbg !730
  br label %237, !dbg !750

237:                                              ; preds = %236, %234
  %238 = phi i64 [ 3, %236 ], [ 2, %234 ]
  %239 = getelementptr inbounds %struct.ipv6_opt_hdr, ptr %231, i64 0, i32 1, !dbg !746
  %240 = load i8, ptr %239, align 1, !dbg !746, !tbaa !747
  %241 = zext i8 %240 to i64, !dbg !746
  %242 = shl nuw nsw i64 %241, %238, !dbg !746
  %243 = add nuw nsw i64 %242, 8, !dbg !746
  br label %244, !dbg !746

244:                                              ; preds = %237, %234
  %245 = phi i64 [ 8, %234 ], [ %243, %237 ]
  %246 = getelementptr inbounds i8, ptr %231, i64 %245, !dbg !746
  call void @llvm.dbg.value(metadata ptr %246, metadata !173, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.value(metadata i32 4, metadata !720, metadata !DIExpression()), !dbg !732
  call void @llvm.dbg.value(metadata i8 undef, metadata !719, metadata !DIExpression()), !dbg !730
  call void @llvm.dbg.value(metadata ptr %246, metadata !722, metadata !DIExpression()), !dbg !733
  %247 = getelementptr inbounds %struct.ipv6_opt_hdr, ptr %246, i64 1, !dbg !734
  %248 = icmp ugt ptr %247, %21, !dbg !736
  br i1 %248, label %283, label %249, !dbg !737

249:                                              ; preds = %244
  %250 = load i8, ptr %231, align 1, !dbg !746, !tbaa !749
  call void @llvm.dbg.value(metadata i8 %250, metadata !719, metadata !DIExpression()), !dbg !730
  switch i8 %250, label %188 [
    i8 0, label %251
    i8 60, label %251
    i8 43, label %251
    i8 -121, label %251
    i8 51, label %252
    i8 44, label %259
  ], !dbg !741

251:                                              ; preds = %249, %249, %249, %249
  call void @llvm.dbg.value(metadata i8 undef, metadata !719, metadata !DIExpression()), !dbg !730
  br label %252, !dbg !750

252:                                              ; preds = %251, %249
  %253 = phi i64 [ 3, %251 ], [ 2, %249 ]
  %254 = getelementptr inbounds %struct.ipv6_opt_hdr, ptr %246, i64 0, i32 1, !dbg !746
  %255 = load i8, ptr %254, align 1, !dbg !746, !tbaa !747
  %256 = zext i8 %255 to i64, !dbg !746
  %257 = shl nuw nsw i64 %256, %253, !dbg !746
  %258 = add nuw nsw i64 %257, 8, !dbg !746
  br label %259, !dbg !746

259:                                              ; preds = %252, %249
  %260 = phi i64 [ 8, %249 ], [ %258, %252 ]
  %261 = getelementptr inbounds i8, ptr %246, i64 %260, !dbg !746
  call void @llvm.dbg.value(metadata ptr %261, metadata !173, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.value(metadata i32 5, metadata !720, metadata !DIExpression()), !dbg !732
  call void @llvm.dbg.value(metadata i8 undef, metadata !719, metadata !DIExpression()), !dbg !730
  call void @llvm.dbg.value(metadata ptr %261, metadata !722, metadata !DIExpression()), !dbg !733
  %262 = getelementptr inbounds %struct.ipv6_opt_hdr, ptr %261, i64 1, !dbg !734
  %263 = icmp ugt ptr %262, %21, !dbg !736
  br i1 %263, label %283, label %264, !dbg !737

264:                                              ; preds = %259
  %265 = load i8, ptr %246, align 1, !dbg !746, !tbaa !749
  call void @llvm.dbg.value(metadata i8 %265, metadata !719, metadata !DIExpression()), !dbg !730
  switch i8 %265, label %188 [
    i8 0, label %275
    i8 60, label %275
    i8 43, label %275
    i8 -121, label %275
    i8 51, label %268
    i8 44, label %266
  ], !dbg !741

266:                                              ; preds = %264
  %267 = getelementptr inbounds i8, ptr %261, i64 8, !dbg !751
  call void @llvm.dbg.value(metadata ptr %267, metadata !173, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.value(metadata i8 undef, metadata !719, metadata !DIExpression()), !dbg !730
  br label %283, !dbg !752

268:                                              ; preds = %264
  %269 = getelementptr inbounds %struct.ipv6_opt_hdr, ptr %261, i64 0, i32 1, !dbg !753
  %270 = load i8, ptr %269, align 1, !dbg !753, !tbaa !747
  %271 = zext i8 %270 to i64, !dbg !754
  %272 = shl nuw nsw i64 %271, 2, !dbg !755
  %273 = add nuw nsw i64 %272, 8, !dbg !755
  %274 = getelementptr inbounds i8, ptr %261, i64 %273, !dbg !756
  call void @llvm.dbg.value(metadata ptr %274, metadata !173, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.value(metadata i8 undef, metadata !719, metadata !DIExpression()), !dbg !730
  br label %283, !dbg !742

275:                                              ; preds = %264, %264, %264, %264
  %276 = getelementptr inbounds %struct.ipv6_opt_hdr, ptr %261, i64 0, i32 1, !dbg !757
  %277 = load i8, ptr %276, align 1, !dbg !757, !tbaa !747
  %278 = zext i8 %277 to i64, !dbg !758
  %279 = shl nuw nsw i64 %278, 3, !dbg !759
  %280 = add nuw nsw i64 %279, 8, !dbg !759
  %281 = getelementptr inbounds i8, ptr %261, i64 %280, !dbg !760
  call void @llvm.dbg.value(metadata ptr %281, metadata !173, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.value(metadata i8 undef, metadata !719, metadata !DIExpression()), !dbg !730
  br label %283, !dbg !750

282:                                              ; preds = %178
  call void @llvm.dbg.value(metadata ptr undef, metadata !173, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.value(metadata i32 undef, metadata !338, metadata !DIExpression()), !dbg !761
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %17) #6, !dbg !762
  call void @llvm.dbg.value(metadata i128 0, metadata !341, metadata !DIExpression()), !dbg !761
  call void @llvm.dbg.value(metadata i128 0, metadata !342, metadata !DIExpression()), !dbg !761
  call void @llvm.dbg.value(metadata ptr null, metadata !223, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.value(metadata i128 %287, metadata !341, metadata !DIExpression()), !dbg !761
  br label %383, !dbg !763

283:                                              ; preds = %275, %268, %266, %259, %244, %229, %214, %199, %188, %181
  %284 = phi ptr [ %281, %275 ], [ %274, %268 ], [ %267, %266 ], [ %261, %259 ], [ %246, %244 ], [ %231, %229 ], [ %216, %214 ], [ %201, %199 ], [ %189, %188 ], [ %179, %181 ]
  %285 = phi i32 [ -1, %275 ], [ -1, %268 ], [ -1, %266 ], [ -1, %259 ], [ -1, %244 ], [ -1, %229 ], [ -1, %214 ], [ -1, %199 ], [ %191, %188 ], [ -1, %181 ]
  call void @llvm.dbg.value(metadata ptr undef, metadata !173, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.value(metadata i32 undef, metadata !338, metadata !DIExpression()), !dbg !761
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %17) #6, !dbg !762
  call void @llvm.dbg.value(metadata i128 0, metadata !341, metadata !DIExpression()), !dbg !761
  call void @llvm.dbg.value(metadata i128 0, metadata !342, metadata !DIExpression()), !dbg !761
  call void @llvm.dbg.value(metadata ptr null, metadata !223, metadata !DIExpression()), !dbg !401
  %286 = getelementptr inbounds %struct.ipv6hdr, ptr %75, i64 0, i32 5, !dbg !764
  call void @llvm.dbg.value(metadata ptr %17, metadata !341, metadata !DIExpression(DW_OP_deref)), !dbg !761
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(16) %17, ptr noundef nonnull align 4 dereferenceable(16) %286, i64 16, i1 false), !dbg !764
  call void @llvm.dbg.value(metadata ptr undef, metadata !223, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.value(metadata i128 undef, metadata !342, metadata !DIExpression()), !dbg !761
  %287 = load i128, ptr %17, align 16, !dbg !767, !tbaa !769
  call void @llvm.dbg.value(metadata i128 %287, metadata !341, metadata !DIExpression()), !dbg !761
  %288 = icmp eq i128 %287, 0, !dbg !771
  br i1 %288, label %292, label %289, !dbg !772

289:                                              ; preds = %283
  call void @llvm.dbg.value(metadata ptr %17, metadata !341, metadata !DIExpression(DW_OP_deref)), !dbg !761
  call void @llvm.dbg.value(metadata ptr %17, metadata !773, metadata !DIExpression()), !dbg !779
  call void @llvm.dbg.value(metadata ptr null, metadata !778, metadata !DIExpression()), !dbg !779
  %290 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @ipv6_bans, ptr noundef nonnull %17) #6, !dbg !783
  call void @llvm.dbg.value(metadata ptr %290, metadata !778, metadata !DIExpression()), !dbg !779
  %291 = icmp eq ptr %290, null, !dbg !784
  br i1 %291, label %292, label %384, !dbg !786

292:                                              ; preds = %289, %283
  switch i32 %285, label %383 [
    i32 17, label %293
    i32 6, label %310
    i32 1, label %357
    i32 58, label %368
  ], !dbg !763

293:                                              ; preds = %292
  call void @llvm.dbg.value(metadata ptr null, metadata !343, metadata !DIExpression()), !dbg !787
  call void @llvm.dbg.value(metadata ptr undef, metadata !509, metadata !DIExpression()), !dbg !788
  call void @llvm.dbg.value(metadata ptr %21, metadata !515, metadata !DIExpression()), !dbg !788
  call void @llvm.dbg.value(metadata ptr undef, metadata !516, metadata !DIExpression()), !dbg !788
  call void @llvm.dbg.value(metadata ptr undef, metadata !518, metadata !DIExpression()), !dbg !788
  %294 = getelementptr inbounds %struct.udphdr, ptr %284, i64 1, !dbg !790
  %295 = icmp ugt ptr %294, %21, !dbg !791
  br i1 %295, label %384, label %296, !dbg !792

296:                                              ; preds = %293
  call void @llvm.dbg.value(metadata ptr %294, metadata !173, metadata !DIExpression()), !dbg !401
  %297 = getelementptr inbounds %struct.udphdr, ptr %284, i64 0, i32 2, !dbg !793
  %298 = load i16, ptr %297, align 2, !dbg !793, !tbaa !526
  %299 = call i16 @llvm.bswap.i16(i16 %298), !dbg !793
  call void @llvm.dbg.value(metadata i16 %299, metadata !517, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_constu, 8, DW_OP_minus, DW_OP_stack_value)), !dbg !788
  %300 = icmp ult i16 %299, 8, !dbg !794
  br i1 %300, label %384, label %301, !dbg !795

301:                                              ; preds = %296
  call void @llvm.dbg.value(metadata i16 %299, metadata !517, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_constu, 8, DW_OP_minus, DW_OP_stack_value)), !dbg !788
  call void @llvm.dbg.value(metadata i16 %299, metadata !517, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_constu, 8, DW_OP_minus, DW_OP_stack_value)), !dbg !788
  call void @llvm.dbg.value(metadata i16 %299, metadata !346, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_constu, 8, DW_OP_minus, DW_OP_stack_value)), !dbg !787
  call void @llvm.dbg.value(metadata ptr %284, metadata !343, metadata !DIExpression()), !dbg !787
  %302 = load i16, ptr %284, align 2, !dbg !796, !tbaa !532
  call void @llvm.dbg.value(metadata i16 %302, metadata !347, metadata !DIExpression()), !dbg !787
  call void @llvm.lifetime.start.p0(i64 2, ptr nonnull %8), !dbg !797
  call void @llvm.dbg.value(metadata i16 %302, metadata !538, metadata !DIExpression()), !dbg !797
  store i16 %302, ptr %8, align 2, !tbaa !440
  call void @llvm.dbg.value(metadata ptr null, metadata !539, metadata !DIExpression()), !dbg !797
  call void @llvm.dbg.value(metadata ptr %8, metadata !538, metadata !DIExpression(DW_OP_deref)), !dbg !797
  %303 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @port_bans, ptr noundef nonnull %8) #6, !dbg !800
  call void @llvm.dbg.value(metadata ptr %303, metadata !539, metadata !DIExpression()), !dbg !797
  %304 = icmp eq ptr %303, null, !dbg !801
  call void @llvm.lifetime.end.p0(i64 2, ptr nonnull %8), !dbg !802
  br i1 %304, label %305, label %384, !dbg !803

305:                                              ; preds = %301
  call void @llvm.dbg.value(metadata ptr %284, metadata !343, metadata !DIExpression()), !dbg !787
  %306 = getelementptr inbounds %struct.udphdr, ptr %284, i64 0, i32 1, !dbg !804
  %307 = load i16, ptr %306, align 2, !dbg !804, !tbaa !548
  call void @llvm.dbg.value(metadata i16 %307, metadata !348, metadata !DIExpression()), !dbg !787
  call void @llvm.lifetime.start.p0(i64 2, ptr nonnull %7), !dbg !805
  call void @llvm.dbg.value(metadata i16 %307, metadata !538, metadata !DIExpression()), !dbg !805
  store i16 %307, ptr %7, align 2, !tbaa !440
  call void @llvm.dbg.value(metadata ptr null, metadata !539, metadata !DIExpression()), !dbg !805
  call void @llvm.dbg.value(metadata ptr %7, metadata !538, metadata !DIExpression(DW_OP_deref)), !dbg !805
  %308 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @port_bans, ptr noundef nonnull %7) #6, !dbg !808
  call void @llvm.dbg.value(metadata ptr %308, metadata !539, metadata !DIExpression()), !dbg !805
  %309 = icmp eq ptr %308, null, !dbg !809
  call void @llvm.lifetime.end.p0(i64 2, ptr nonnull %7), !dbg !810
  br i1 %309, label %383, label %384

310:                                              ; preds = %292
  call void @llvm.dbg.value(metadata ptr null, metadata !349, metadata !DIExpression()), !dbg !811
  call void @llvm.dbg.value(metadata ptr undef, metadata !556, metadata !DIExpression()), !dbg !812
  call void @llvm.dbg.value(metadata ptr %21, metadata !562, metadata !DIExpression()), !dbg !812
  call void @llvm.dbg.value(metadata ptr undef, metadata !563, metadata !DIExpression()), !dbg !812
  call void @llvm.dbg.value(metadata ptr undef, metadata !565, metadata !DIExpression()), !dbg !812
  %311 = getelementptr inbounds %struct.tcphdr, ptr %284, i64 1, !dbg !814
  %312 = icmp ugt ptr %311, %21, !dbg !815
  br i1 %312, label %384, label %313, !dbg !816

313:                                              ; preds = %310
  %314 = getelementptr inbounds %struct.tcphdr, ptr %284, i64 0, i32 4, !dbg !817
  %315 = load i16, ptr %314, align 4, !dbg !817
  %316 = lshr i16 %315, 2, !dbg !818
  %317 = and i16 %316, 60, !dbg !818
  call void @llvm.dbg.value(metadata i16 %317, metadata !564, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !812
  %318 = zext i16 %317 to i64
  %319 = getelementptr i8, ptr %284, i64 %318, !dbg !819
  %320 = icmp ugt ptr %319, %21, !dbg !820
  br i1 %320, label %384, label %321, !dbg !821

321:                                              ; preds = %313
  call void @llvm.dbg.value(metadata i16 %317, metadata !564, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !812
  call void @llvm.dbg.value(metadata ptr %311, metadata !173, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.value(metadata i16 %317, metadata !352, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !811
  call void @llvm.dbg.value(metadata ptr %284, metadata !349, metadata !DIExpression()), !dbg !811
  call void @llvm.dbg.value(metadata ptr %284, metadata !578, metadata !DIExpression()), !dbg !822
  %322 = and i16 %315, -256, !dbg !825
  switch i16 %322, label %327 [
    i16 256, label %384
    i16 5120, label %323
  ], !dbg !825

323:                                              ; preds = %321
  %324 = getelementptr inbounds %struct.tcphdr, ptr %284, i64 0, i32 5, !dbg !826
  %325 = load i16, ptr %324, align 2, !dbg !826, !tbaa !590
  %326 = icmp eq i16 %325, 0, !dbg !827
  br i1 %326, label %384, label %327, !dbg !828

327:                                              ; preds = %323, %321
  call void @llvm.dbg.value(metadata ptr %284, metadata !349, metadata !DIExpression()), !dbg !811
  call void @llvm.dbg.value(metadata ptr %284, metadata !594, metadata !DIExpression()), !dbg !829
  %328 = and i16 %315, -8448, !dbg !832
  %329 = icmp eq i16 %328, 512, !dbg !832
  br i1 %329, label %330, label %348, !dbg !832

330:                                              ; preds = %327
  %331 = getelementptr inbounds %struct.tcphdr, ptr %284, i64 0, i32 5, !dbg !833
  %332 = load i16, ptr %331, align 2, !dbg !833, !tbaa !590
  %333 = icmp eq i16 %332, -3846, !dbg !834
  br i1 %333, label %334, label %348, !dbg !835

334:                                              ; preds = %330
  call void @llvm.dbg.value(metadata ptr %17, metadata !341, metadata !DIExpression(DW_OP_deref)), !dbg !761
  call void @llvm.dbg.value(metadata ptr %17, metadata !836, metadata !DIExpression()), !dbg !849
  call void @llvm.dbg.value(metadata ptr null, metadata !840, metadata !DIExpression()), !dbg !849
  %335 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @ipv6_warnings, ptr noundef nonnull %17) #6, !dbg !852
  call void @llvm.dbg.value(metadata ptr %335, metadata !840, metadata !DIExpression()), !dbg !849
  %336 = icmp eq ptr %335, null, !dbg !853
  br i1 %336, label %346, label %337, !dbg !854

337:                                              ; preds = %334
  call void @llvm.lifetime.start.p0(i64 1, ptr nonnull %4) #6, !dbg !855
  call void @llvm.dbg.value(metadata i8 0, metadata !841, metadata !DIExpression()), !dbg !856
  %338 = load i8, ptr %335, align 1, !dbg !857, !tbaa !627
  %339 = add i8 %338, 1, !dbg !858
  call void @llvm.dbg.value(metadata i8 %339, metadata !841, metadata !DIExpression()), !dbg !856
  store i8 %339, ptr %4, align 1, !dbg !859, !tbaa !627
  call void @llvm.dbg.value(metadata ptr %4, metadata !841, metadata !DIExpression(DW_OP_deref)), !dbg !856
  %340 = call i64 inttoptr (i64 2 to ptr)(ptr noundef nonnull @ipv6_warnings, ptr noundef nonnull %17, ptr noundef nonnull %4, i64 noundef 0) #6, !dbg !860
  %341 = load i8, ptr %4, align 1, !dbg !861, !tbaa !627
  call void @llvm.dbg.value(metadata i8 %341, metadata !841, metadata !DIExpression()), !dbg !856
  %342 = icmp ugt i8 %341, 16, !dbg !862
  br i1 %342, label %343, label %345, !dbg !863

343:                                              ; preds = %337
  call void @llvm.lifetime.start.p0(i64 1, ptr nonnull %5) #6, !dbg !864
  call void @llvm.dbg.value(metadata i8 1, metadata !844, metadata !DIExpression()), !dbg !865
  store i8 1, ptr %5, align 1, !dbg !866, !tbaa !627
  call void @llvm.dbg.value(metadata ptr %5, metadata !844, metadata !DIExpression(DW_OP_deref)), !dbg !865
  %344 = call i64 inttoptr (i64 2 to ptr)(ptr noundef nonnull @ipv6_bans, ptr noundef nonnull %17, ptr noundef nonnull %5, i64 noundef 0) #6, !dbg !867
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %5) #6, !dbg !868
  br label %345, !dbg !869

345:                                              ; preds = %343, %337
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %4) #6, !dbg !870
  br label %348, !dbg !871

346:                                              ; preds = %334
  call void @llvm.lifetime.start.p0(i64 1, ptr nonnull %6) #6, !dbg !872
  call void @llvm.dbg.value(metadata i8 1, metadata !847, metadata !DIExpression()), !dbg !873
  store i8 1, ptr %6, align 1, !dbg !874, !tbaa !627
  call void @llvm.dbg.value(metadata ptr %6, metadata !847, metadata !DIExpression(DW_OP_deref)), !dbg !873
  %347 = call i64 inttoptr (i64 2 to ptr)(ptr noundef nonnull @ipv6_warnings, ptr noundef nonnull %17, ptr noundef nonnull %6, i64 noundef 0) #6, !dbg !875
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %6) #6, !dbg !876
  br label %348

348:                                              ; preds = %346, %345, %330, %327
  call void @llvm.dbg.value(metadata ptr %284, metadata !349, metadata !DIExpression()), !dbg !811
  %349 = load i16, ptr %284, align 4, !dbg !877, !tbaa !648
  call void @llvm.dbg.value(metadata i16 %349, metadata !353, metadata !DIExpression()), !dbg !811
  call void @llvm.lifetime.start.p0(i64 2, ptr nonnull %3), !dbg !878
  call void @llvm.dbg.value(metadata i16 %349, metadata !538, metadata !DIExpression()), !dbg !878
  store i16 %349, ptr %3, align 2, !tbaa !440
  call void @llvm.dbg.value(metadata ptr null, metadata !539, metadata !DIExpression()), !dbg !878
  call void @llvm.dbg.value(metadata ptr %3, metadata !538, metadata !DIExpression(DW_OP_deref)), !dbg !878
  %350 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @port_bans, ptr noundef nonnull %3) #6, !dbg !881
  call void @llvm.dbg.value(metadata ptr %350, metadata !539, metadata !DIExpression()), !dbg !878
  %351 = icmp eq ptr %350, null, !dbg !882
  call void @llvm.lifetime.end.p0(i64 2, ptr nonnull %3), !dbg !883
  br i1 %351, label %352, label %384, !dbg !884

352:                                              ; preds = %348
  call void @llvm.dbg.value(metadata ptr %284, metadata !349, metadata !DIExpression()), !dbg !811
  %353 = getelementptr inbounds %struct.tcphdr, ptr %284, i64 0, i32 1, !dbg !885
  %354 = load i16, ptr %353, align 2, !dbg !885, !tbaa !657
  call void @llvm.dbg.value(metadata i16 %354, metadata !354, metadata !DIExpression()), !dbg !811
  call void @llvm.lifetime.start.p0(i64 2, ptr nonnull %2), !dbg !886
  call void @llvm.dbg.value(metadata i16 %354, metadata !538, metadata !DIExpression()), !dbg !886
  store i16 %354, ptr %2, align 2, !tbaa !440
  call void @llvm.dbg.value(metadata ptr null, metadata !539, metadata !DIExpression()), !dbg !886
  call void @llvm.dbg.value(metadata ptr %2, metadata !538, metadata !DIExpression(DW_OP_deref)), !dbg !886
  %355 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @port_bans, ptr noundef nonnull %2) #6, !dbg !889
  call void @llvm.dbg.value(metadata ptr %355, metadata !539, metadata !DIExpression()), !dbg !886
  %356 = icmp eq ptr %355, null, !dbg !890
  call void @llvm.lifetime.end.p0(i64 2, ptr nonnull %2), !dbg !891
  br i1 %356, label %383, label %384

357:                                              ; preds = %292
  call void @llvm.dbg.value(metadata ptr null, metadata !355, metadata !DIExpression()), !dbg !892
  call void @llvm.dbg.value(metadata ptr undef, metadata !665, metadata !DIExpression()), !dbg !893
  call void @llvm.dbg.value(metadata ptr %21, metadata !671, metadata !DIExpression()), !dbg !893
  call void @llvm.dbg.value(metadata ptr undef, metadata !672, metadata !DIExpression()), !dbg !893
  call void @llvm.dbg.value(metadata ptr undef, metadata !673, metadata !DIExpression()), !dbg !893
  %358 = getelementptr inbounds %struct.icmphdr, ptr %284, i64 1, !dbg !895
  %359 = icmp ugt ptr %358, %21, !dbg !896
  br i1 %359, label %383, label %360, !dbg !897

360:                                              ; preds = %357
  call void @llvm.dbg.value(metadata ptr %358, metadata !173, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.value(metadata ptr %284, metadata !355, metadata !DIExpression()), !dbg !892
  call void @llvm.dbg.value(metadata ptr %284, metadata !680, metadata !DIExpression()), !dbg !898
  %361 = load i8, ptr %284, align 4, !dbg !901, !tbaa !690
  call void @llvm.dbg.value(metadata i8 %361, metadata !685, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !898
  %362 = icmp eq i8 %361, 0, !dbg !902
  %363 = call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %362)
  %364 = freeze i1 %363, !dbg !903
  br i1 %364, label %384, label %365, !dbg !903

365:                                              ; preds = %360
  switch i8 %361, label %366 [
    i8 19, label %384
    i8 18, label %384
    i8 17, label %384
    i8 16, label %384
    i8 15, label %384
    i8 14, label %384
    i8 13, label %384
    i8 10, label %384
    i8 9, label %384
    i8 8, label %384
    i8 7, label %384
    i8 6, label %384
    i8 4, label %384
    i8 2, label %384
    i8 1, label %384
  ], !dbg !903

366:                                              ; preds = %365
  %367 = icmp ugt i8 %361, 19, !dbg !904
  br i1 %367, label %384, label %383, !dbg !904

368:                                              ; preds = %292
  call void @llvm.dbg.value(metadata ptr null, metadata !358, metadata !DIExpression()), !dbg !905
  call void @llvm.dbg.value(metadata ptr undef, metadata !906, metadata !DIExpression()), !dbg !915
  call void @llvm.dbg.value(metadata ptr %21, metadata !912, metadata !DIExpression()), !dbg !915
  call void @llvm.dbg.value(metadata ptr undef, metadata !913, metadata !DIExpression()), !dbg !915
  call void @llvm.dbg.value(metadata ptr undef, metadata !914, metadata !DIExpression()), !dbg !915
  %369 = getelementptr inbounds %struct.icmp6hdr, ptr %284, i64 1, !dbg !917
  %370 = icmp ugt ptr %369, %21, !dbg !919
  br i1 %370, label %383, label %371, !dbg !920

371:                                              ; preds = %368
  call void @llvm.dbg.value(metadata ptr %369, metadata !173, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.value(metadata ptr %284, metadata !358, metadata !DIExpression()), !dbg !905
  call void @llvm.dbg.value(metadata ptr %284, metadata !921, metadata !DIExpression()), !dbg !927
  %372 = load i8, ptr %284, align 4, !dbg !930, !tbaa !931
  call void @llvm.dbg.value(metadata i8 %372, metadata !926, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !927
  %373 = icmp eq i8 %372, 0, !dbg !933
  %374 = call i1 @llvm.bpf.passthrough.i1.i1(i32 1, i1 %373)
  %375 = freeze i1 %374, !dbg !935
  br i1 %375, label %384, label %376, !dbg !935

376:                                              ; preds = %371
  switch i8 %372, label %377 [
    i8 19, label %384
    i8 18, label %384
    i8 17, label %384
    i8 16, label %384
    i8 15, label %384
    i8 14, label %384
    i8 13, label %384
    i8 10, label %384
    i8 9, label %384
    i8 8, label %384
    i8 7, label %384
    i8 6, label %384
    i8 4, label %384
    i8 2, label %384
    i8 1, label %384
  ], !dbg !935

377:                                              ; preds = %376
  %378 = add i8 %372, -20, !dbg !936
  %379 = icmp ult i8 %378, 110, !dbg !936
  br i1 %379, label %384, label %380, !dbg !936

380:                                              ; preds = %377
  switch i8 %372, label %381 [
    i8 -102, label %384
    i8 -103, label %384
    i8 -104, label %384
    i8 -105, label %384
    i8 -106, label %384
    i8 -120, label %384
    i8 -121, label %384
    i8 -122, label %384
    i8 -123, label %384
  ], !dbg !937

381:                                              ; preds = %380
  %382 = icmp ugt i8 %372, -101, !dbg !938
  br i1 %382, label %384, label %383, !dbg !939

383:                                              ; preds = %368, %357, %381, %366, %352, %305, %282, %292
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %17) #6, !dbg !940
  br label %385

384:                                              ; preds = %352, %323, %321, %313, %310, %348, %305, %296, %293, %301, %377, %381, %371, %376, %376, %376, %376, %376, %376, %376, %376, %376, %376, %376, %376, %376, %376, %376, %380, %380, %380, %380, %380, %380, %380, %380, %380, %366, %360, %365, %365, %365, %365, %365, %365, %365, %365, %365, %365, %365, %365, %365, %365, %365, %289
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %17) #6, !dbg !940
  br label %385

385:                                              ; preds = %176, %384, %383, %74, %1
  %386 = phi i32 [ 1, %1 ], [ %177, %176 ], [ 1, %384 ], [ 2, %383 ], [ 2, %74 ], !dbg !401
  ret i32 %386, !dbg !941
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
!llvm.module.flags = !{!151, !152, !153, !154}
!llvm.ident = !{!155}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !62, line: 625, type: !148, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 15.0.7", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !52, globals: !59, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/cookiengineer/Software/cookiengineer/ebpf-firewall/kernel/ebpf/module.c", directory: "/home/cookiengineer/Software/cookiengineer/ebpf-firewall/kernel", checksumkind: CSK_MD5, checksum: "da37557a86780204cc21c71a2f50af29")
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
!59 = !{!0, !60, !82, !96, !112, !124, !132, !140}
!60 = !DIGlobalVariableExpression(var: !61, expr: !DIExpression())
!61 = distinct !DIGlobalVariable(name: "port_bans", scope: !2, file: !62, line: 21, type: !63, isLocal: false, isDefinition: true)
!62 = !DIFile(filename: "ebpf/module.c", directory: "/home/cookiengineer/Software/cookiengineer/ebpf-firewall/kernel", checksumkind: CSK_MD5, checksum: "da37557a86780204cc21c71a2f50af29")
!63 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !62, line: 16, size: 256, elements: !64)
!64 = !{!65, !71, !76, !78}
!65 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !63, file: !62, line: 17, baseType: !66, size: 64)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DICompositeType(tag: DW_TAG_array_type, baseType: !68, size: 32, elements: !69)
!68 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!69 = !{!70}
!70 = !DISubrange(count: 1)
!71 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !63, file: !62, line: 18, baseType: !72, size: 64, offset: 64)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DICompositeType(tag: DW_TAG_array_type, baseType: !68, size: 2097120, elements: !74)
!74 = !{!75}
!75 = !DISubrange(count: 65535)
!76 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !63, file: !62, line: 19, baseType: !77, size: 64, offset: 128)
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!78 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !63, file: !62, line: 20, baseType: !79, size: 64, offset: 192)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !6, line: 5, baseType: !81)
!81 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!82 = !DIGlobalVariableExpression(var: !83, expr: !DIExpression())
!83 = distinct !DIGlobalVariable(name: "ipv4_bans", scope: !2, file: !62, line: 28, type: !84, isLocal: false, isDefinition: true)
!84 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !62, line: 23, size: 256, elements: !85)
!85 = !{!86, !87, !92, !95}
!86 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !84, file: !62, line: 24, baseType: !66, size: 64)
!87 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !84, file: !62, line: 25, baseType: !88, size: 64, offset: 64)
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DICompositeType(tag: DW_TAG_array_type, baseType: !68, size: 16000000, elements: !90)
!90 = !{!91}
!91 = !DISubrange(count: 500000)
!92 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !84, file: !62, line: 26, baseType: !93, size: 64, offset: 128)
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !94, size: 64)
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !6, line: 9, baseType: !7)
!95 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !84, file: !62, line: 27, baseType: !79, size: 64, offset: 192)
!96 = !DIGlobalVariableExpression(var: !97, expr: !DIExpression())
!97 = distinct !DIGlobalVariable(name: "ipv4_warnings", scope: !2, file: !62, line: 35, type: !98, isLocal: false, isDefinition: true)
!98 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !62, line: 30, size: 256, elements: !99)
!99 = !{!100, !105, !110, !111}
!100 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !98, file: !62, line: 31, baseType: !101, size: 64)
!101 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !102, size: 64)
!102 = !DICompositeType(tag: DW_TAG_array_type, baseType: !68, size: 288, elements: !103)
!103 = !{!104}
!104 = !DISubrange(count: 9)
!105 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !98, file: !62, line: 32, baseType: !106, size: 64, offset: 64)
!106 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !107, size: 64)
!107 = !DICompositeType(tag: DW_TAG_array_type, baseType: !68, size: 4096, elements: !108)
!108 = !{!109}
!109 = !DISubrange(count: 128)
!110 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !98, file: !62, line: 33, baseType: !93, size: 64, offset: 128)
!111 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !98, file: !62, line: 34, baseType: !79, size: 64, offset: 192)
!112 = !DIGlobalVariableExpression(var: !113, expr: !DIExpression())
!113 = distinct !DIGlobalVariable(name: "ipv6_bans", scope: !2, file: !62, line: 42, type: !114, isLocal: false, isDefinition: true)
!114 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !62, line: 37, size: 256, elements: !115)
!115 = !{!116, !117, !118, !123}
!116 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !114, file: !62, line: 38, baseType: !66, size: 64)
!117 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !114, file: !62, line: 39, baseType: !88, size: 64, offset: 64)
!118 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !114, file: !62, line: 40, baseType: !119, size: 64, offset: 128)
!119 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !120, size: 64)
!120 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint128_t", file: !121, baseType: !122)
!121 = !DIFile(filename: "ebpf/module.c", directory: "/home/cookiengineer/Software/cookiengineer/ebpf-firewall/kernel")
!122 = !DIBasicType(name: "unsigned __int128", size: 128, encoding: DW_ATE_unsigned)
!123 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !114, file: !62, line: 41, baseType: !79, size: 64, offset: 192)
!124 = !DIGlobalVariableExpression(var: !125, expr: !DIExpression())
!125 = distinct !DIGlobalVariable(name: "ipv6_warnings", scope: !2, file: !62, line: 49, type: !126, isLocal: false, isDefinition: true)
!126 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !62, line: 44, size: 256, elements: !127)
!127 = !{!128, !129, !130, !131}
!128 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !126, file: !62, line: 45, baseType: !101, size: 64)
!129 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !126, file: !62, line: 46, baseType: !106, size: 64, offset: 64)
!130 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !126, file: !62, line: 47, baseType: !119, size: 64, offset: 128)
!131 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !126, file: !62, line: 48, baseType: !79, size: 64, offset: 192)
!132 = !DIGlobalVariableExpression(var: !133, expr: !DIExpression())
!133 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !2, file: !134, line: 51, type: !135, isLocal: true, isDefinition: true)
!134 = !DIFile(filename: "headers/bpf_helper_defs.h", directory: "/home/cookiengineer/Software/cookiengineer/ebpf-firewall/kernel", checksumkind: CSK_MD5, checksum: "67458ddab14190d1ab39602394f9ecef")
!135 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !136, size: 64)
!136 = !DISubroutineType(types: !137)
!137 = !{!53, !53, !138}
!138 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !139, size: 64)
!139 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!140 = !DIGlobalVariableExpression(var: !141, expr: !DIExpression())
!141 = distinct !DIGlobalVariable(name: "bpf_map_update_elem", scope: !2, file: !134, line: 73, type: !142, isLocal: true, isDefinition: true)
!142 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !143, size: 64)
!143 = !DISubroutineType(types: !144)
!144 = !{!54, !53, !138, !138, !145}
!145 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !146, line: 31, baseType: !147)
!146 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "", checksumkind: CSK_MD5, checksum: "b810f270733e106319b67ef512c6246e")
!147 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!148 = !DICompositeType(tag: DW_TAG_array_type, baseType: !58, size: 32, elements: !149)
!149 = !{!150}
!150 = !DISubrange(count: 4)
!151 = !{i32 7, !"Dwarf Version", i32 5}
!152 = !{i32 2, !"Debug Info Version", i32 3}
!153 = !{i32 1, !"wchar_size", i32 4}
!154 = !{i32 7, !"frame-pointer", i32 2}
!155 = !{!"clang version 15.0.7"}
!156 = distinct !DISubprogram(name: "xdp_prog_main", scope: !62, file: !62, line: 301, type: !157, scopeLine: 301, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !168)
!157 = !DISubroutineType(types: !158)
!158 = !{!68, !159}
!159 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !160, size: 64)
!160 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !6, line: 67, size: 192, elements: !161)
!161 = !{!162, !163, !164, !165, !166, !167}
!162 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !160, file: !6, line: 68, baseType: !94, size: 32)
!163 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !160, file: !6, line: 69, baseType: !94, size: 32, offset: 32)
!164 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !160, file: !6, line: 70, baseType: !94, size: 32, offset: 64)
!165 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !160, file: !6, line: 71, baseType: !94, size: 32, offset: 96)
!166 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !160, file: !6, line: 72, baseType: !94, size: 32, offset: 128)
!167 = !DIDerivedType(tag: DW_TAG_member, name: "egress_ifindex", scope: !160, file: !6, line: 73, baseType: !94, size: 32, offset: 160)
!168 = !{!169, !170, !171, !172, !173, !178, !192, !223, !266, !269, !270, !271, !282, !283, !284, !285, !309, !310, !311, !312, !338, !341, !342, !343, !346, !347, !348, !349, !352, !353, !354, !355, !358}
!169 = !DILocalVariable(name: "ctx", arg: 1, scope: !156, file: !62, line: 301, type: !159)
!170 = !DILocalVariable(name: "data_end", scope: !156, file: !62, line: 304, type: !53)
!171 = !DILocalVariable(name: "data", scope: !156, file: !62, line: 305, type: !53)
!172 = !DILocalVariable(name: "ethernet_protocol", scope: !156, file: !62, line: 311, type: !68)
!173 = !DILocalVariable(name: "cursor", scope: !156, file: !62, line: 312, type: !174)
!174 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "hdr_cursor", file: !175, line: 28, size: 64, elements: !176)
!175 = !DIFile(filename: "ebpf/module.h", directory: "/home/cookiengineer/Software/cookiengineer/ebpf-firewall/kernel", checksumkind: CSK_MD5, checksum: "5718562f868ed1a81948ae74a5df083a")
!176 = !{!177}
!177 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !174, file: !175, line: 29, baseType: !53, size: 64)
!178 = !DILocalVariable(name: "ethernet_header", scope: !156, file: !62, line: 313, type: !179)
!179 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !180, size: 64)
!180 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !181, line: 173, size: 112, elements: !182)
!181 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "", checksumkind: CSK_MD5, checksum: "163f54fb1af2e21fea410f14eb18fa76")
!182 = !{!183, !187, !188}
!183 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !180, file: !181, line: 174, baseType: !184, size: 48)
!184 = !DICompositeType(tag: DW_TAG_array_type, baseType: !81, size: 48, elements: !185)
!185 = !{!186}
!186 = !DISubrange(count: 6)
!187 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !180, file: !181, line: 175, baseType: !184, size: 48, offset: 48)
!188 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !180, file: !181, line: 176, baseType: !189, size: 16, offset: 96)
!189 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !190, line: 28, baseType: !191)
!190 = !DIFile(filename: "/usr/include/linux/types.h", directory: "", checksumkind: CSK_MD5, checksum: "64bcf4b731906682de6e750679b9f4a2")
!191 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !146, line: 24, baseType: !56)
!192 = !DILocalVariable(name: "ipv4_header", scope: !156, file: !62, line: 314, type: !193)
!193 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !194, size: 64)
!194 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !195, line: 87, size: 160, elements: !196)
!195 = !DIFile(filename: "/usr/include/linux/ip.h", directory: "", checksumkind: CSK_MD5, checksum: "149778ace30a1ff208adc8783fd04b29")
!196 = !{!197, !199, !200, !201, !202, !203, !204, !205, !206, !208}
!197 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !194, file: !195, line: 89, baseType: !198, size: 4, flags: DIFlagBitField, extraData: i64 0)
!198 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !146, line: 21, baseType: !81)
!199 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !194, file: !195, line: 90, baseType: !198, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!200 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !194, file: !195, line: 97, baseType: !198, size: 8, offset: 8)
!201 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !194, file: !195, line: 98, baseType: !189, size: 16, offset: 16)
!202 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !194, file: !195, line: 99, baseType: !189, size: 16, offset: 32)
!203 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !194, file: !195, line: 100, baseType: !189, size: 16, offset: 48)
!204 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !194, file: !195, line: 101, baseType: !198, size: 8, offset: 64)
!205 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !194, file: !195, line: 102, baseType: !198, size: 8, offset: 72)
!206 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !194, file: !195, line: 103, baseType: !207, size: 16, offset: 80)
!207 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !190, line: 34, baseType: !191)
!208 = !DIDerivedType(tag: DW_TAG_member, scope: !194, file: !195, line: 104, baseType: !209, size: 64, offset: 96)
!209 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !194, file: !195, line: 104, size: 64, elements: !210)
!210 = !{!211, !218}
!211 = !DIDerivedType(tag: DW_TAG_member, scope: !209, file: !195, line: 104, baseType: !212, size: 64)
!212 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !209, file: !195, line: 104, size: 64, elements: !213)
!213 = !{!214, !217}
!214 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !212, file: !195, line: 104, baseType: !215, size: 32)
!215 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !190, line: 30, baseType: !216)
!216 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !146, line: 27, baseType: !7)
!217 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !212, file: !195, line: 104, baseType: !215, size: 32, offset: 32)
!218 = !DIDerivedType(tag: DW_TAG_member, name: "addrs", scope: !209, file: !195, line: 104, baseType: !219, size: 64)
!219 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !209, file: !195, line: 104, size: 64, elements: !220)
!220 = !{!221, !222}
!221 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !219, file: !195, line: 104, baseType: !215, size: 32)
!222 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !219, file: !195, line: 104, baseType: !215, size: 32, offset: 32)
!223 = !DILocalVariable(name: "ipv6_header", scope: !156, file: !62, line: 315, type: !224)
!224 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !225, size: 64)
!225 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipv6hdr", file: !226, line: 118, size: 320, elements: !227)
!226 = !DIFile(filename: "/usr/include/linux/ipv6.h", directory: "", checksumkind: CSK_MD5, checksum: "deff6bca6b519042089ed906aa3655c3")
!227 = !{!228, !229, !230, !234, !235, !236, !237}
!228 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !225, file: !226, line: 120, baseType: !198, size: 4, flags: DIFlagBitField, extraData: i64 0)
!229 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !225, file: !226, line: 121, baseType: !198, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!230 = !DIDerivedType(tag: DW_TAG_member, name: "flow_lbl", scope: !225, file: !226, line: 128, baseType: !231, size: 24, offset: 8)
!231 = !DICompositeType(tag: DW_TAG_array_type, baseType: !198, size: 24, elements: !232)
!232 = !{!233}
!233 = !DISubrange(count: 3)
!234 = !DIDerivedType(tag: DW_TAG_member, name: "payload_len", scope: !225, file: !226, line: 130, baseType: !189, size: 16, offset: 32)
!235 = !DIDerivedType(tag: DW_TAG_member, name: "nexthdr", scope: !225, file: !226, line: 131, baseType: !198, size: 8, offset: 48)
!236 = !DIDerivedType(tag: DW_TAG_member, name: "hop_limit", scope: !225, file: !226, line: 132, baseType: !198, size: 8, offset: 56)
!237 = !DIDerivedType(tag: DW_TAG_member, scope: !225, file: !226, line: 134, baseType: !238, size: 256, offset: 64)
!238 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !225, file: !226, line: 134, size: 256, elements: !239)
!239 = !{!240, !261}
!240 = !DIDerivedType(tag: DW_TAG_member, scope: !238, file: !226, line: 134, baseType: !241, size: 256)
!241 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !238, file: !226, line: 134, size: 256, elements: !242)
!242 = !{!243, !260}
!243 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !241, file: !226, line: 134, baseType: !244, size: 128)
!244 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in6_addr", file: !245, line: 33, size: 128, elements: !246)
!245 = !DIFile(filename: "/usr/include/linux/in6.h", directory: "", checksumkind: CSK_MD5, checksum: "8bebb780b45d3fe932cc1d934fa5f5fe")
!246 = !{!247}
!247 = !DIDerivedType(tag: DW_TAG_member, name: "in6_u", scope: !244, file: !245, line: 40, baseType: !248, size: 128)
!248 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !244, file: !245, line: 34, size: 128, elements: !249)
!249 = !{!250, !254, !258}
!250 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr8", scope: !248, file: !245, line: 35, baseType: !251, size: 128)
!251 = !DICompositeType(tag: DW_TAG_array_type, baseType: !198, size: 128, elements: !252)
!252 = !{!253}
!253 = !DISubrange(count: 16)
!254 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr16", scope: !248, file: !245, line: 37, baseType: !255, size: 128)
!255 = !DICompositeType(tag: DW_TAG_array_type, baseType: !189, size: 128, elements: !256)
!256 = !{!257}
!257 = !DISubrange(count: 8)
!258 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr32", scope: !248, file: !245, line: 38, baseType: !259, size: 128)
!259 = !DICompositeType(tag: DW_TAG_array_type, baseType: !215, size: 128, elements: !149)
!260 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !241, file: !226, line: 134, baseType: !244, size: 128, offset: 128)
!261 = !DIDerivedType(tag: DW_TAG_member, name: "addrs", scope: !238, file: !226, line: 134, baseType: !262, size: 256)
!262 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !238, file: !226, line: 134, size: 256, elements: !263)
!263 = !{!264, !265}
!264 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !262, file: !226, line: 134, baseType: !244, size: 128)
!265 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !262, file: !226, line: 134, baseType: !244, size: 128, offset: 128)
!266 = !DILocalVariable(name: "protocol", scope: !267, file: !62, line: 331, type: !68)
!267 = distinct !DILexicalBlock(scope: !268, file: !62, line: 329, column: 48)
!268 = distinct !DILexicalBlock(scope: !156, file: !62, line: 329, column: 6)
!269 = !DILocalVariable(name: "ipv4_source", scope: !267, file: !62, line: 333, type: !94)
!270 = !DILocalVariable(name: "ipv4_dest", scope: !267, file: !62, line: 334, type: !94)
!271 = !DILocalVariable(name: "udp_header", scope: !272, file: !62, line: 357, type: !274)
!272 = distinct !DILexicalBlock(scope: !273, file: !62, line: 355, column: 32)
!273 = distinct !DILexicalBlock(scope: !267, file: !62, line: 355, column: 7)
!274 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !275, size: 64)
!275 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "udphdr", file: !276, line: 23, size: 64, elements: !277)
!276 = !DIFile(filename: "/usr/include/linux/udp.h", directory: "", checksumkind: CSK_MD5, checksum: "53c0d42e1bf6d93b39151764be2d20fb")
!277 = !{!278, !279, !280, !281}
!278 = !DIDerivedType(tag: DW_TAG_member, name: "source", scope: !275, file: !276, line: 24, baseType: !189, size: 16)
!279 = !DIDerivedType(tag: DW_TAG_member, name: "dest", scope: !275, file: !276, line: 25, baseType: !189, size: 16, offset: 16)
!280 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !275, file: !276, line: 26, baseType: !189, size: 16, offset: 32)
!281 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !275, file: !276, line: 27, baseType: !207, size: 16, offset: 48)
!282 = !DILocalVariable(name: "length", scope: !272, file: !62, line: 359, type: !68)
!283 = !DILocalVariable(name: "port_source", scope: !272, file: !62, line: 364, type: !55)
!284 = !DILocalVariable(name: "port_dest", scope: !272, file: !62, line: 371, type: !55)
!285 = !DILocalVariable(name: "tcp_header", scope: !286, file: !62, line: 406, type: !288)
!286 = distinct !DILexicalBlock(scope: !287, file: !62, line: 404, column: 39)
!287 = distinct !DILexicalBlock(scope: !273, file: !62, line: 404, column: 14)
!288 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !289, size: 64)
!289 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tcphdr", file: !290, line: 25, size: 160, elements: !291)
!290 = !DIFile(filename: "/usr/include/linux/tcp.h", directory: "", checksumkind: CSK_MD5, checksum: "0fb7164446a017a2406c1e3b94b6d7a6")
!291 = !{!292, !293, !294, !295, !296, !297, !298, !299, !300, !301, !302, !303, !304, !305, !306, !307, !308}
!292 = !DIDerivedType(tag: DW_TAG_member, name: "source", scope: !289, file: !290, line: 26, baseType: !189, size: 16)
!293 = !DIDerivedType(tag: DW_TAG_member, name: "dest", scope: !289, file: !290, line: 27, baseType: !189, size: 16, offset: 16)
!294 = !DIDerivedType(tag: DW_TAG_member, name: "seq", scope: !289, file: !290, line: 28, baseType: !215, size: 32, offset: 32)
!295 = !DIDerivedType(tag: DW_TAG_member, name: "ack_seq", scope: !289, file: !290, line: 29, baseType: !215, size: 32, offset: 64)
!296 = !DIDerivedType(tag: DW_TAG_member, name: "res1", scope: !289, file: !290, line: 31, baseType: !191, size: 4, offset: 96, flags: DIFlagBitField, extraData: i64 96)
!297 = !DIDerivedType(tag: DW_TAG_member, name: "doff", scope: !289, file: !290, line: 32, baseType: !191, size: 4, offset: 100, flags: DIFlagBitField, extraData: i64 96)
!298 = !DIDerivedType(tag: DW_TAG_member, name: "fin", scope: !289, file: !290, line: 33, baseType: !191, size: 1, offset: 104, flags: DIFlagBitField, extraData: i64 96)
!299 = !DIDerivedType(tag: DW_TAG_member, name: "syn", scope: !289, file: !290, line: 34, baseType: !191, size: 1, offset: 105, flags: DIFlagBitField, extraData: i64 96)
!300 = !DIDerivedType(tag: DW_TAG_member, name: "rst", scope: !289, file: !290, line: 35, baseType: !191, size: 1, offset: 106, flags: DIFlagBitField, extraData: i64 96)
!301 = !DIDerivedType(tag: DW_TAG_member, name: "psh", scope: !289, file: !290, line: 36, baseType: !191, size: 1, offset: 107, flags: DIFlagBitField, extraData: i64 96)
!302 = !DIDerivedType(tag: DW_TAG_member, name: "ack", scope: !289, file: !290, line: 37, baseType: !191, size: 1, offset: 108, flags: DIFlagBitField, extraData: i64 96)
!303 = !DIDerivedType(tag: DW_TAG_member, name: "urg", scope: !289, file: !290, line: 38, baseType: !191, size: 1, offset: 109, flags: DIFlagBitField, extraData: i64 96)
!304 = !DIDerivedType(tag: DW_TAG_member, name: "ece", scope: !289, file: !290, line: 39, baseType: !191, size: 1, offset: 110, flags: DIFlagBitField, extraData: i64 96)
!305 = !DIDerivedType(tag: DW_TAG_member, name: "cwr", scope: !289, file: !290, line: 40, baseType: !191, size: 1, offset: 111, flags: DIFlagBitField, extraData: i64 96)
!306 = !DIDerivedType(tag: DW_TAG_member, name: "window", scope: !289, file: !290, line: 55, baseType: !189, size: 16, offset: 112)
!307 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !289, file: !290, line: 56, baseType: !207, size: 16, offset: 128)
!308 = !DIDerivedType(tag: DW_TAG_member, name: "urg_ptr", scope: !289, file: !290, line: 57, baseType: !189, size: 16, offset: 144)
!309 = !DILocalVariable(name: "length", scope: !286, file: !62, line: 408, type: !68)
!310 = !DILocalVariable(name: "port_source", scope: !286, file: !62, line: 420, type: !55)
!311 = !DILocalVariable(name: "port_dest", scope: !286, file: !62, line: 427, type: !55)
!312 = !DILocalVariable(name: "icmp_header", scope: !313, file: !62, line: 454, type: !315)
!313 = distinct !DILexicalBlock(scope: !314, file: !62, line: 452, column: 40)
!314 = distinct !DILexicalBlock(scope: !287, file: !62, line: 452, column: 14)
!315 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !316, size: 64)
!316 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmphdr", file: !317, line: 89, size: 64, elements: !318)
!317 = !DIFile(filename: "/usr/include/linux/icmp.h", directory: "", checksumkind: CSK_MD5, checksum: "a505632898dce546638b3344627d334b")
!318 = !{!319, !320, !321, !322}
!319 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !316, file: !317, line: 90, baseType: !198, size: 8)
!320 = !DIDerivedType(tag: DW_TAG_member, name: "code", scope: !316, file: !317, line: 91, baseType: !198, size: 8, offset: 8)
!321 = !DIDerivedType(tag: DW_TAG_member, name: "checksum", scope: !316, file: !317, line: 92, baseType: !207, size: 16, offset: 16)
!322 = !DIDerivedType(tag: DW_TAG_member, name: "un", scope: !316, file: !317, line: 104, baseType: !323, size: 32, offset: 32)
!323 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !316, file: !317, line: 93, size: 32, elements: !324)
!324 = !{!325, !330, !331, !336}
!325 = !DIDerivedType(tag: DW_TAG_member, name: "echo", scope: !323, file: !317, line: 97, baseType: !326, size: 32)
!326 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !323, file: !317, line: 94, size: 32, elements: !327)
!327 = !{!328, !329}
!328 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !326, file: !317, line: 95, baseType: !189, size: 16)
!329 = !DIDerivedType(tag: DW_TAG_member, name: "sequence", scope: !326, file: !317, line: 96, baseType: !189, size: 16, offset: 16)
!330 = !DIDerivedType(tag: DW_TAG_member, name: "gateway", scope: !323, file: !317, line: 98, baseType: !215, size: 32)
!331 = !DIDerivedType(tag: DW_TAG_member, name: "frag", scope: !323, file: !317, line: 102, baseType: !332, size: 32)
!332 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !323, file: !317, line: 99, size: 32, elements: !333)
!333 = !{!334, !335}
!334 = !DIDerivedType(tag: DW_TAG_member, name: "__unused", scope: !332, file: !317, line: 100, baseType: !189, size: 16)
!335 = !DIDerivedType(tag: DW_TAG_member, name: "mtu", scope: !332, file: !317, line: 101, baseType: !189, size: 16, offset: 16)
!336 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !323, file: !317, line: 103, baseType: !337, size: 32)
!337 = !DICompositeType(tag: DW_TAG_array_type, baseType: !198, size: 32, elements: !149)
!338 = !DILocalVariable(name: "protocol", scope: !339, file: !62, line: 474, type: !68)
!339 = distinct !DILexicalBlock(scope: !340, file: !62, line: 472, column: 57)
!340 = distinct !DILexicalBlock(scope: !268, file: !62, line: 472, column: 13)
!341 = !DILocalVariable(name: "ipv6_source", scope: !339, file: !62, line: 476, type: !120)
!342 = !DILocalVariable(name: "ipv6_dest", scope: !339, file: !62, line: 477, type: !120)
!343 = !DILocalVariable(name: "udp_header", scope: !344, file: !62, line: 500, type: !274)
!344 = distinct !DILexicalBlock(scope: !345, file: !62, line: 498, column: 32)
!345 = distinct !DILexicalBlock(scope: !339, file: !62, line: 498, column: 7)
!346 = !DILocalVariable(name: "length", scope: !344, file: !62, line: 502, type: !68)
!347 = !DILocalVariable(name: "port_source", scope: !344, file: !62, line: 507, type: !55)
!348 = !DILocalVariable(name: "port_dest", scope: !344, file: !62, line: 514, type: !55)
!349 = !DILocalVariable(name: "tcp_header", scope: !350, file: !62, line: 540, type: !288)
!350 = distinct !DILexicalBlock(scope: !351, file: !62, line: 538, column: 39)
!351 = distinct !DILexicalBlock(scope: !345, file: !62, line: 538, column: 14)
!352 = !DILocalVariable(name: "length", scope: !350, file: !62, line: 542, type: !68)
!353 = !DILocalVariable(name: "port_source", scope: !350, file: !62, line: 554, type: !55)
!354 = !DILocalVariable(name: "port_dest", scope: !350, file: !62, line: 561, type: !55)
!355 = !DILocalVariable(name: "icmp_header", scope: !356, file: !62, line: 587, type: !315)
!356 = distinct !DILexicalBlock(scope: !357, file: !62, line: 585, column: 40)
!357 = distinct !DILexicalBlock(scope: !351, file: !62, line: 585, column: 14)
!358 = !DILocalVariable(name: "icmp6_header", scope: !359, file: !62, line: 603, type: !361)
!359 = distinct !DILexicalBlock(scope: !360, file: !62, line: 601, column: 42)
!360 = distinct !DILexicalBlock(scope: !357, file: !62, line: 601, column: 14)
!361 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !362, size: 64)
!362 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmp6hdr", file: !363, line: 8, size: 64, elements: !364)
!363 = !DIFile(filename: "/usr/include/linux/icmpv6.h", directory: "", checksumkind: CSK_MD5, checksum: "0310ca5584e6f44f6eea6cf040ee84b9")
!364 = !{!365, !366, !367, !368}
!365 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_type", scope: !362, file: !363, line: 10, baseType: !198, size: 8)
!366 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_code", scope: !362, file: !363, line: 11, baseType: !198, size: 8, offset: 8)
!367 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_cksum", scope: !362, file: !363, line: 12, baseType: !207, size: 16, offset: 16)
!368 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_dataun", scope: !362, file: !363, line: 63, baseType: !369, size: 32, offset: 32)
!369 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !362, file: !363, line: 15, size: 32, elements: !370)
!370 = !{!371, !373, !377, !378, !383, !391}
!371 = !DIDerivedType(tag: DW_TAG_member, name: "un_data32", scope: !369, file: !363, line: 16, baseType: !372, size: 32)
!372 = !DICompositeType(tag: DW_TAG_array_type, baseType: !215, size: 32, elements: !69)
!373 = !DIDerivedType(tag: DW_TAG_member, name: "un_data16", scope: !369, file: !363, line: 17, baseType: !374, size: 32)
!374 = !DICompositeType(tag: DW_TAG_array_type, baseType: !189, size: 32, elements: !375)
!375 = !{!376}
!376 = !DISubrange(count: 2)
!377 = !DIDerivedType(tag: DW_TAG_member, name: "un_data8", scope: !369, file: !363, line: 18, baseType: !337, size: 32)
!378 = !DIDerivedType(tag: DW_TAG_member, name: "u_echo", scope: !369, file: !363, line: 23, baseType: !379, size: 32)
!379 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmpv6_echo", file: !363, line: 20, size: 32, elements: !380)
!380 = !{!381, !382}
!381 = !DIDerivedType(tag: DW_TAG_member, name: "identifier", scope: !379, file: !363, line: 21, baseType: !189, size: 16)
!382 = !DIDerivedType(tag: DW_TAG_member, name: "sequence", scope: !379, file: !363, line: 22, baseType: !189, size: 16, offset: 16)
!383 = !DIDerivedType(tag: DW_TAG_member, name: "u_nd_advt", scope: !369, file: !363, line: 40, baseType: !384, size: 32)
!384 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmpv6_nd_advt", file: !363, line: 25, size: 32, elements: !385)
!385 = !{!386, !387, !388, !389, !390}
!386 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !384, file: !363, line: 27, baseType: !216, size: 5, flags: DIFlagBitField, extraData: i64 0)
!387 = !DIDerivedType(tag: DW_TAG_member, name: "override", scope: !384, file: !363, line: 28, baseType: !216, size: 1, offset: 5, flags: DIFlagBitField, extraData: i64 0)
!388 = !DIDerivedType(tag: DW_TAG_member, name: "solicited", scope: !384, file: !363, line: 29, baseType: !216, size: 1, offset: 6, flags: DIFlagBitField, extraData: i64 0)
!389 = !DIDerivedType(tag: DW_TAG_member, name: "router", scope: !384, file: !363, line: 30, baseType: !216, size: 1, offset: 7, flags: DIFlagBitField, extraData: i64 0)
!390 = !DIDerivedType(tag: DW_TAG_member, name: "reserved2", scope: !384, file: !363, line: 31, baseType: !216, size: 24, offset: 8, flags: DIFlagBitField, extraData: i64 0)
!391 = !DIDerivedType(tag: DW_TAG_member, name: "u_nd_ra", scope: !369, file: !363, line: 61, baseType: !392, size: 32)
!392 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmpv6_nd_ra", file: !363, line: 42, size: 32, elements: !393)
!393 = !{!394, !395, !396, !397, !398, !399, !400}
!394 = !DIDerivedType(tag: DW_TAG_member, name: "hop_limit", scope: !392, file: !363, line: 43, baseType: !198, size: 8)
!395 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !392, file: !363, line: 45, baseType: !198, size: 3, offset: 8, flags: DIFlagBitField, extraData: i64 8)
!396 = !DIDerivedType(tag: DW_TAG_member, name: "router_pref", scope: !392, file: !363, line: 46, baseType: !198, size: 2, offset: 11, flags: DIFlagBitField, extraData: i64 8)
!397 = !DIDerivedType(tag: DW_TAG_member, name: "home_agent", scope: !392, file: !363, line: 47, baseType: !198, size: 1, offset: 13, flags: DIFlagBitField, extraData: i64 8)
!398 = !DIDerivedType(tag: DW_TAG_member, name: "other", scope: !392, file: !363, line: 48, baseType: !198, size: 1, offset: 14, flags: DIFlagBitField, extraData: i64 8)
!399 = !DIDerivedType(tag: DW_TAG_member, name: "managed", scope: !392, file: !363, line: 49, baseType: !198, size: 1, offset: 15, flags: DIFlagBitField, extraData: i64 8)
!400 = !DIDerivedType(tag: DW_TAG_member, name: "rt_lifetime", scope: !392, file: !363, line: 60, baseType: !189, size: 16, offset: 16)
!401 = !DILocation(line: 0, scope: !156)
!402 = !DILocation(line: 304, column: 38, scope: !156)
!403 = !{!404, !405, i64 4}
!404 = !{!"xdp_md", !405, i64 0, !405, i64 4, !405, i64 8, !405, i64 12, !405, i64 16, !405, i64 20}
!405 = !{!"int", !406, i64 0}
!406 = !{!"omnipotent char", !407, i64 0}
!407 = !{!"Simple C/C++ TBAA"}
!408 = !DILocation(line: 304, column: 27, scope: !156)
!409 = !DILocation(line: 304, column: 19, scope: !156)
!410 = !DILocation(line: 305, column: 34, scope: !156)
!411 = !{!404, !405, i64 0}
!412 = !DILocation(line: 305, column: 23, scope: !156)
!413 = !DILocation(line: 305, column: 15, scope: !156)
!414 = !DILocation(line: 307, column: 11, scope: !415)
!415 = distinct !DILexicalBlock(scope: !156, file: !62, line: 307, column: 6)
!416 = !DILocation(line: 307, column: 35, scope: !415)
!417 = !DILocation(line: 307, column: 6, scope: !156)
!418 = !DILocalVariable(name: "nh", arg: 1, scope: !419, file: !175, line: 151, type: !422)
!419 = distinct !DISubprogram(name: "parse_ethhdr", scope: !175, file: !175, line: 151, type: !420, scopeLine: 151, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !424)
!420 = !DISubroutineType(types: !421)
!421 = !{!68, !422, !53, !423}
!422 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !174, size: 64)
!423 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !179, size: 64)
!424 = !{!418, !425, !426, !427, !428, !435, !436}
!425 = !DILocalVariable(name: "data_end", arg: 2, scope: !419, file: !175, line: 151, type: !53)
!426 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !419, file: !175, line: 151, type: !423)
!427 = !DILocalVariable(name: "eth", scope: !419, file: !175, line: 153, type: !179)
!428 = !DILocalVariable(name: "vlh", scope: !419, file: !175, line: 154, type: !429)
!429 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !430, size: 64)
!430 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vlanhdr", file: !175, line: 38, size: 32, elements: !431)
!431 = !{!432, !434}
!432 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_TCI", scope: !430, file: !175, line: 39, baseType: !433, size: 16)
!433 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !6, line: 20, baseType: !55)
!434 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_encapsulated_proto", scope: !430, file: !175, line: 40, baseType: !433, size: 16, offset: 16)
!435 = !DILocalVariable(name: "h_proto", scope: !419, file: !175, line: 155, type: !55)
!436 = !DILocalVariable(name: "i", scope: !419, file: !175, line: 156, type: !68)
!437 = !DILocation(line: 0, scope: !419, inlinedAt: !438)
!438 = distinct !DILocation(line: 318, column: 22, scope: !156)
!439 = !DILocation(line: 164, column: 17, scope: !419, inlinedAt: !438)
!440 = !{!441, !441, i64 0}
!441 = !{!"short", !406, i64 0}
!442 = !DILocalVariable(name: "h_proto", arg: 1, scope: !443, file: !175, line: 109, type: !55)
!443 = distinct !DISubprogram(name: "proto_is_vlan", scope: !175, file: !175, line: 109, type: !444, scopeLine: 109, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !446)
!444 = !DISubroutineType(types: !445)
!445 = !{!68, !55}
!446 = !{!442}
!447 = !DILocation(line: 0, scope: !443, inlinedAt: !448)
!448 = distinct !DILocation(line: 172, column: 8, scope: !449, inlinedAt: !438)
!449 = distinct !DILexicalBlock(scope: !450, file: !175, line: 172, column: 7)
!450 = distinct !DILexicalBlock(scope: !451, file: !175, line: 170, column: 39)
!451 = distinct !DILexicalBlock(scope: !452, file: !175, line: 170, column: 2)
!452 = distinct !DILexicalBlock(scope: !419, file: !175, line: 170, column: 2)
!453 = !DILocation(line: 110, column: 20, scope: !443, inlinedAt: !448)
!454 = !DILocation(line: 110, column: 46, scope: !443, inlinedAt: !448)
!455 = !DILocation(line: 172, column: 8, scope: !449, inlinedAt: !438)
!456 = !DILocation(line: 172, column: 7, scope: !450, inlinedAt: !438)
!457 = !DILocation(line: 180, column: 18, scope: !450, inlinedAt: !438)
!458 = !DILocation(line: 329, column: 6, scope: !156)
!459 = !DILocalVariable(name: "nh", arg: 1, scope: !460, file: !175, line: 191, type: !422)
!460 = distinct !DISubprogram(name: "parse_iphdr", scope: !175, file: !175, line: 191, type: !461, scopeLine: 191, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !464)
!461 = !DISubroutineType(types: !462)
!462 = !{!68, !422, !53, !463}
!463 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !193, size: 64)
!464 = !{!459, !465, !466, !467, !468}
!465 = !DILocalVariable(name: "data_end", arg: 2, scope: !460, file: !175, line: 191, type: !53)
!466 = !DILocalVariable(name: "iphdr", arg: 3, scope: !460, file: !175, line: 191, type: !463)
!467 = !DILocalVariable(name: "iph", scope: !460, file: !175, line: 193, type: !193)
!468 = !DILocalVariable(name: "hdrsize", scope: !460, file: !175, line: 194, type: !68)
!469 = !DILocation(line: 0, scope: !460, inlinedAt: !470)
!470 = distinct !DILocation(line: 331, column: 18, scope: !267)
!471 = !DILocation(line: 196, column: 10, scope: !472, inlinedAt: !470)
!472 = distinct !DILexicalBlock(scope: !460, file: !175, line: 196, column: 6)
!473 = !DILocation(line: 196, column: 14, scope: !472, inlinedAt: !470)
!474 = !DILocation(line: 196, column: 6, scope: !460, inlinedAt: !470)
!475 = !DILocation(line: 200, column: 17, scope: !460, inlinedAt: !470)
!476 = !DILocation(line: 200, column: 21, scope: !460, inlinedAt: !470)
!477 = !DILocation(line: 203, column: 14, scope: !478, inlinedAt: !470)
!478 = distinct !DILexicalBlock(scope: !460, file: !175, line: 203, column: 6)
!479 = !DILocation(line: 203, column: 24, scope: !478, inlinedAt: !470)
!480 = !DILocation(line: 203, column: 6, scope: !460, inlinedAt: !470)
!481 = !DILocation(line: 0, scope: !267)
!482 = !DILocation(line: 333, column: 3, scope: !267)
!483 = !DILocation(line: 355, column: 7, scope: !267)
!484 = !DILocation(line: 210, column: 14, scope: !460, inlinedAt: !470)
!485 = !{!486, !406, i64 9}
!486 = !{!"iphdr", !406, i64 0, !406, i64 0, !406, i64 1, !441, i64 2, !441, i64 4, !441, i64 6, !406, i64 8, !406, i64 9, !441, i64 10, !406, i64 12}
!487 = !DILocation(line: 337, column: 4, scope: !488)
!488 = distinct !DILexicalBlock(scope: !489, file: !62, line: 336, column: 20)
!489 = distinct !DILexicalBlock(scope: !267, file: !62, line: 336, column: 7)
!490 = !DILocation(line: 341, column: 19, scope: !491)
!491 = distinct !DILexicalBlock(scope: !267, file: !62, line: 341, column: 7)
!492 = !DILocation(line: 341, column: 7, scope: !267)
!493 = !DILocalVariable(name: "address", arg: 1, scope: !494, file: !62, line: 119, type: !93)
!494 = distinct !DISubprogram(name: "is_filtered_ipv4", scope: !62, file: !62, line: 119, type: !495, scopeLine: 119, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !498)
!495 = !DISubroutineType(types: !496)
!496 = !{!497, !93}
!497 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!498 = !{!493, !499}
!499 = !DILocalVariable(name: "banned", scope: !494, file: !62, line: 121, type: !79)
!500 = !DILocation(line: 0, scope: !494, inlinedAt: !501)
!501 = distinct !DILocation(line: 343, column: 8, scope: !502)
!502 = distinct !DILexicalBlock(scope: !503, file: !62, line: 343, column: 8)
!503 = distinct !DILexicalBlock(scope: !491, file: !62, line: 341, column: 25)
!504 = !DILocation(line: 123, column: 11, scope: !494, inlinedAt: !501)
!505 = !DILocation(line: 125, column: 13, scope: !506, inlinedAt: !501)
!506 = distinct !DILexicalBlock(scope: !494, file: !62, line: 125, column: 6)
!507 = !DILocation(line: 343, column: 8, scope: !503)
!508 = !DILocation(line: 0, scope: !272)
!509 = !DILocalVariable(name: "nh", arg: 1, scope: !510, file: !175, line: 259, type: !422)
!510 = distinct !DISubprogram(name: "parse_udphdr", scope: !175, file: !175, line: 259, type: !511, scopeLine: 259, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !514)
!511 = !DISubroutineType(types: !512)
!512 = !{!68, !422, !53, !513}
!513 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !274, size: 64)
!514 = !{!509, !515, !516, !517, !518}
!515 = !DILocalVariable(name: "data_end", arg: 2, scope: !510, file: !175, line: 259, type: !53)
!516 = !DILocalVariable(name: "udphdr", arg: 3, scope: !510, file: !175, line: 259, type: !513)
!517 = !DILocalVariable(name: "len", scope: !510, file: !175, line: 261, type: !68)
!518 = !DILocalVariable(name: "udph", scope: !510, file: !175, line: 262, type: !274)
!519 = !DILocation(line: 0, scope: !510, inlinedAt: !520)
!520 = distinct !DILocation(line: 359, column: 17, scope: !272)
!521 = !DILocation(line: 264, column: 11, scope: !522, inlinedAt: !520)
!522 = distinct !DILexicalBlock(scope: !510, file: !175, line: 264, column: 6)
!523 = !DILocation(line: 264, column: 15, scope: !522, inlinedAt: !520)
!524 = !DILocation(line: 264, column: 6, scope: !510, inlinedAt: !520)
!525 = !DILocation(line: 271, column: 8, scope: !510, inlinedAt: !520)
!526 = !{!527, !441, i64 4}
!527 = !{!"udphdr", !441, i64 0, !441, i64 2, !441, i64 4, !441, i64 6}
!528 = !DILocation(line: 272, column: 10, scope: !529, inlinedAt: !520)
!529 = distinct !DILexicalBlock(scope: !510, file: !175, line: 272, column: 6)
!530 = !DILocation(line: 272, column: 6, scope: !510, inlinedAt: !520)
!531 = !DILocation(line: 364, column: 36, scope: !272)
!532 = !{!527, !441, i64 0}
!533 = !DILocation(line: 0, scope: !534, inlinedAt: !540)
!534 = distinct !DISubprogram(name: "is_filtered_port", scope: !62, file: !62, line: 147, type: !535, scopeLine: 147, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !537)
!535 = !DISubroutineType(types: !536)
!536 = !{!497, !55}
!537 = !{!538, !539}
!538 = !DILocalVariable(name: "port", arg: 1, scope: !534, file: !62, line: 147, type: !55)
!539 = !DILocalVariable(name: "blocked_port", scope: !534, file: !62, line: 149, type: !79)
!540 = distinct !DILocation(line: 367, column: 8, scope: !541)
!541 = distinct !DILexicalBlock(scope: !272, file: !62, line: 367, column: 8)
!542 = !DILocation(line: 151, column: 17, scope: !534, inlinedAt: !540)
!543 = !DILocation(line: 153, column: 19, scope: !544, inlinedAt: !540)
!544 = distinct !DILexicalBlock(scope: !534, file: !62, line: 153, column: 6)
!545 = !DILocation(line: 159, column: 1, scope: !534, inlinedAt: !540)
!546 = !DILocation(line: 367, column: 8, scope: !272)
!547 = !DILocation(line: 371, column: 34, scope: !272)
!548 = !{!527, !441, i64 2}
!549 = !DILocation(line: 0, scope: !534, inlinedAt: !550)
!550 = distinct !DILocation(line: 374, column: 8, scope: !551)
!551 = distinct !DILexicalBlock(scope: !272, file: !62, line: 374, column: 8)
!552 = !DILocation(line: 151, column: 17, scope: !534, inlinedAt: !550)
!553 = !DILocation(line: 153, column: 19, scope: !544, inlinedAt: !550)
!554 = !DILocation(line: 159, column: 1, scope: !534, inlinedAt: !550)
!555 = !DILocation(line: 0, scope: !286)
!556 = !DILocalVariable(name: "nh", arg: 1, scope: !557, file: !175, line: 318, type: !422)
!557 = distinct !DISubprogram(name: "parse_tcphdr", scope: !175, file: !175, line: 318, type: !558, scopeLine: 318, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !561)
!558 = !DISubroutineType(types: !559)
!559 = !{!68, !422, !53, !560}
!560 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !288, size: 64)
!561 = !{!556, !562, !563, !564, !565}
!562 = !DILocalVariable(name: "data_end", arg: 2, scope: !557, file: !175, line: 318, type: !53)
!563 = !DILocalVariable(name: "tcphdr", arg: 3, scope: !557, file: !175, line: 318, type: !560)
!564 = !DILocalVariable(name: "len", scope: !557, file: !175, line: 320, type: !68)
!565 = !DILocalVariable(name: "tcph", scope: !557, file: !175, line: 321, type: !288)
!566 = !DILocation(line: 0, scope: !557, inlinedAt: !567)
!567 = distinct !DILocation(line: 408, column: 17, scope: !286)
!568 = !DILocation(line: 323, column: 11, scope: !569, inlinedAt: !567)
!569 = distinct !DILexicalBlock(scope: !557, file: !175, line: 323, column: 6)
!570 = !DILocation(line: 323, column: 15, scope: !569, inlinedAt: !567)
!571 = !DILocation(line: 323, column: 6, scope: !557, inlinedAt: !567)
!572 = !DILocation(line: 327, column: 14, scope: !557, inlinedAt: !567)
!573 = !DILocation(line: 327, column: 19, scope: !557, inlinedAt: !567)
!574 = !DILocation(line: 328, column: 20, scope: !575, inlinedAt: !567)
!575 = distinct !DILexicalBlock(scope: !557, file: !175, line: 328, column: 6)
!576 = !DILocation(line: 328, column: 26, scope: !575, inlinedAt: !567)
!577 = !DILocation(line: 328, column: 6, scope: !557, inlinedAt: !567)
!578 = !DILocalVariable(name: "tcp_header", arg: 1, scope: !579, file: !62, line: 239, type: !288)
!579 = distinct !DISubprogram(name: "is_filtered_nmap_tcp_scan", scope: !62, file: !62, line: 239, type: !580, scopeLine: 239, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !582)
!580 = !DISubroutineType(types: !581)
!581 = !{!497, !288}
!582 = !{!578}
!583 = !DILocation(line: 0, scope: !579, inlinedAt: !584)
!584 = distinct !DILocation(line: 414, column: 8, scope: !585)
!585 = distinct !DILexicalBlock(scope: !286, file: !62, line: 414, column: 8)
!586 = !DILocation(line: 243, column: 3, scope: !587, inlinedAt: !584)
!587 = distinct !DILexicalBlock(scope: !579, file: !62, line: 242, column: 3)
!588 = !DILocation(line: 264, column: 18, scope: !589, inlinedAt: !584)
!589 = distinct !DILexicalBlock(scope: !579, file: !62, line: 256, column: 3)
!590 = !{!591, !441, i64 14}
!591 = !{!"tcphdr", !441, i64 0, !441, i64 2, !405, i64 4, !405, i64 8, !441, i64 12, !441, i64 12, !441, i64 13, !441, i64 13, !441, i64 13, !441, i64 13, !441, i64 13, !441, i64 13, !441, i64 13, !441, i64 13, !441, i64 14, !441, i64 16, !441, i64 18}
!592 = !DILocation(line: 264, column: 25, scope: !589, inlinedAt: !584)
!593 = !DILocation(line: 256, column: 3, scope: !579, inlinedAt: !584)
!594 = !DILocalVariable(name: "tcp_header", arg: 1, scope: !595, file: !62, line: 273, type: !288)
!595 = distinct !DISubprogram(name: "is_likely_nmap_tcp_scan", scope: !62, file: !62, line: 273, type: !580, scopeLine: 273, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !596)
!596 = !{!594}
!597 = !DILocation(line: 0, scope: !595, inlinedAt: !598)
!598 = distinct !DILocation(line: 416, column: 15, scope: !599)
!599 = distinct !DILexicalBlock(scope: !585, file: !62, line: 416, column: 15)
!600 = !DILocation(line: 279, column: 3, scope: !601, inlinedAt: !598)
!601 = distinct !DILexicalBlock(scope: !595, file: !62, line: 278, column: 3)
!602 = !DILocation(line: 285, column: 18, scope: !601, inlinedAt: !598)
!603 = !DILocation(line: 285, column: 25, scope: !601, inlinedAt: !598)
!604 = !DILocation(line: 278, column: 3, scope: !595, inlinedAt: !598)
!605 = !DILocalVariable(name: "address", arg: 1, scope: !606, file: !62, line: 51, type: !93)
!606 = distinct !DISubprogram(name: "warn_ipv4", scope: !62, file: !62, line: 51, type: !607, scopeLine: 51, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !608)
!607 = !DISubroutineType(cc: DW_CC_nocall, types: !496)
!608 = !{!605, !609, !610, !613, !616}
!609 = !DILocalVariable(name: "warnings_ipv4", scope: !606, file: !62, line: 53, type: !79)
!610 = !DILocalVariable(name: "tmp", scope: !611, file: !62, line: 59, type: !80)
!611 = distinct !DILexicalBlock(scope: !612, file: !62, line: 57, column: 29)
!612 = distinct !DILexicalBlock(scope: !606, file: !62, line: 57, column: 6)
!613 = !DILocalVariable(name: "banned", scope: !614, file: !62, line: 67, type: !80)
!614 = distinct !DILexicalBlock(scope: !615, file: !62, line: 65, column: 17)
!615 = distinct !DILexicalBlock(scope: !611, file: !62, line: 65, column: 7)
!616 = !DILocalVariable(name: "tmp", scope: !617, file: !62, line: 75, type: !80)
!617 = distinct !DILexicalBlock(scope: !612, file: !62, line: 73, column: 9)
!618 = !DILocation(line: 0, scope: !606, inlinedAt: !619)
!619 = distinct !DILocation(line: 417, column: 5, scope: !620)
!620 = distinct !DILexicalBlock(scope: !599, file: !62, line: 416, column: 60)
!621 = !DILocation(line: 55, column: 18, scope: !606, inlinedAt: !619)
!622 = !DILocation(line: 57, column: 20, scope: !612, inlinedAt: !619)
!623 = !DILocation(line: 57, column: 6, scope: !606, inlinedAt: !619)
!624 = !DILocation(line: 59, column: 3, scope: !611, inlinedAt: !619)
!625 = !DILocation(line: 0, scope: !611, inlinedAt: !619)
!626 = !DILocation(line: 61, column: 9, scope: !611, inlinedAt: !619)
!627 = !{!406, !406, i64 0}
!628 = !DILocation(line: 61, column: 24, scope: !611, inlinedAt: !619)
!629 = !DILocation(line: 61, column: 7, scope: !611, inlinedAt: !619)
!630 = !DILocation(line: 63, column: 3, scope: !611, inlinedAt: !619)
!631 = !DILocation(line: 65, column: 7, scope: !615, inlinedAt: !619)
!632 = !DILocation(line: 65, column: 11, scope: !615, inlinedAt: !619)
!633 = !DILocation(line: 65, column: 7, scope: !611, inlinedAt: !619)
!634 = !DILocation(line: 67, column: 4, scope: !614, inlinedAt: !619)
!635 = !DILocation(line: 0, scope: !614, inlinedAt: !619)
!636 = !DILocation(line: 67, column: 9, scope: !614, inlinedAt: !619)
!637 = !DILocation(line: 69, column: 4, scope: !614, inlinedAt: !619)
!638 = !DILocation(line: 71, column: 3, scope: !615, inlinedAt: !619)
!639 = !DILocation(line: 71, column: 3, scope: !614, inlinedAt: !619)
!640 = !DILocation(line: 73, column: 2, scope: !612, inlinedAt: !619)
!641 = !DILocation(line: 73, column: 2, scope: !611, inlinedAt: !619)
!642 = !DILocation(line: 75, column: 3, scope: !617, inlinedAt: !619)
!643 = !DILocation(line: 0, scope: !617, inlinedAt: !619)
!644 = !DILocation(line: 75, column: 8, scope: !617, inlinedAt: !619)
!645 = !DILocation(line: 77, column: 3, scope: !617, inlinedAt: !619)
!646 = !DILocation(line: 79, column: 2, scope: !612, inlinedAt: !619)
!647 = !DILocation(line: 420, column: 36, scope: !286)
!648 = !{!591, !441, i64 0}
!649 = !DILocation(line: 0, scope: !534, inlinedAt: !650)
!650 = distinct !DILocation(line: 423, column: 8, scope: !651)
!651 = distinct !DILexicalBlock(scope: !286, file: !62, line: 423, column: 8)
!652 = !DILocation(line: 151, column: 17, scope: !534, inlinedAt: !650)
!653 = !DILocation(line: 153, column: 19, scope: !544, inlinedAt: !650)
!654 = !DILocation(line: 159, column: 1, scope: !534, inlinedAt: !650)
!655 = !DILocation(line: 423, column: 8, scope: !286)
!656 = !DILocation(line: 427, column: 34, scope: !286)
!657 = !{!591, !441, i64 2}
!658 = !DILocation(line: 0, scope: !534, inlinedAt: !659)
!659 = distinct !DILocation(line: 430, column: 8, scope: !660)
!660 = distinct !DILexicalBlock(scope: !286, file: !62, line: 430, column: 8)
!661 = !DILocation(line: 151, column: 17, scope: !534, inlinedAt: !659)
!662 = !DILocation(line: 153, column: 19, scope: !544, inlinedAt: !659)
!663 = !DILocation(line: 159, column: 1, scope: !534, inlinedAt: !659)
!664 = !DILocation(line: 0, scope: !313)
!665 = !DILocalVariable(name: "nh", arg: 1, scope: !666, file: !175, line: 214, type: !422)
!666 = distinct !DISubprogram(name: "parse_icmphdr", scope: !175, file: !175, line: 214, type: !667, scopeLine: 214, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !670)
!667 = !DISubroutineType(cc: DW_CC_nocall, types: !668)
!668 = !{!68, !422, !53, !669}
!669 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !315, size: 64)
!670 = !{!665, !671, !672, !673}
!671 = !DILocalVariable(name: "data_end", arg: 2, scope: !666, file: !175, line: 214, type: !53)
!672 = !DILocalVariable(name: "icmphdr", arg: 3, scope: !666, file: !175, line: 214, type: !669)
!673 = !DILocalVariable(name: "icmph", scope: !666, file: !175, line: 216, type: !315)
!674 = !DILocation(line: 0, scope: !666, inlinedAt: !675)
!675 = distinct !DILocation(line: 456, column: 4, scope: !313)
!676 = !DILocation(line: 218, column: 12, scope: !677, inlinedAt: !675)
!677 = distinct !DILexicalBlock(scope: !666, file: !175, line: 218, column: 6)
!678 = !DILocation(line: 218, column: 16, scope: !677, inlinedAt: !675)
!679 = !DILocation(line: 218, column: 6, scope: !666, inlinedAt: !675)
!680 = !DILocalVariable(name: "icmp_header", arg: 1, scope: !681, file: !62, line: 161, type: !315)
!681 = distinct !DISubprogram(name: "is_filtered_icmp_packet", scope: !62, file: !62, line: 161, type: !682, scopeLine: 161, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !684)
!682 = !DISubroutineType(types: !683)
!683 = !{!497, !315}
!684 = !{!680, !685}
!685 = !DILocalVariable(name: "type", scope: !681, file: !62, line: 163, type: !68)
!686 = !DILocation(line: 0, scope: !681, inlinedAt: !687)
!687 = distinct !DILocation(line: 458, column: 23, scope: !688)
!688 = distinct !DILexicalBlock(scope: !313, file: !62, line: 458, column: 8)
!689 = !DILocation(line: 163, column: 26, scope: !681, inlinedAt: !687)
!690 = !{!691, !406, i64 0}
!691 = !{!"icmphdr", !406, i64 0, !406, i64 1, !441, i64 2, !406, i64 4}
!692 = !DILocation(line: 166, column: 8, scope: !693, inlinedAt: !687)
!693 = distinct !DILexicalBlock(scope: !681, file: !62, line: 166, column: 3)
!694 = !DILocation(line: 167, column: 3, scope: !693, inlinedAt: !687)
!695 = !DILocation(line: 182, column: 18, scope: !693, inlinedAt: !687)
!696 = !DILocation(line: 470, column: 3, scope: !267)
!697 = !DILocation(line: 472, column: 2, scope: !268)
!698 = !DILocalVariable(name: "nh", arg: 1, scope: !699, file: !175, line: 229, type: !422)
!699 = distinct !DISubprogram(name: "parse_ipv6hdr", scope: !175, file: !175, line: 229, type: !700, scopeLine: 229, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !703)
!700 = !DISubroutineType(types: !701)
!701 = !{!68, !422, !53, !702}
!702 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !224, size: 64)
!703 = !{!698, !704, !705, !706}
!704 = !DILocalVariable(name: "data_end", arg: 2, scope: !699, file: !175, line: 229, type: !53)
!705 = !DILocalVariable(name: "ip6hdr", arg: 3, scope: !699, file: !175, line: 229, type: !702)
!706 = !DILocalVariable(name: "ip6h", scope: !699, file: !175, line: 231, type: !224)
!707 = !DILocation(line: 0, scope: !699, inlinedAt: !708)
!708 = distinct !DILocation(line: 474, column: 18, scope: !339)
!709 = !DILocation(line: 233, column: 11, scope: !710, inlinedAt: !708)
!710 = distinct !DILexicalBlock(scope: !699, file: !175, line: 233, column: 6)
!711 = !DILocation(line: 233, column: 15, scope: !710, inlinedAt: !708)
!712 = !DILocation(line: 233, column: 6, scope: !699, inlinedAt: !708)
!713 = !DILocalVariable(name: "nh", arg: 1, scope: !714, file: !175, line: 113, type: !422)
!714 = distinct !DISubprogram(name: "skip_ip6hdrext", scope: !175, file: !175, line: 113, type: !715, scopeLine: 113, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !717)
!715 = !DISubroutineType(types: !716)
!716 = !{!68, !422, !53, !80}
!717 = !{!713, !718, !719, !720, !722}
!718 = !DILocalVariable(name: "data_end", arg: 2, scope: !714, file: !175, line: 113, type: !53)
!719 = !DILocalVariable(name: "next_hdr_type", arg: 3, scope: !714, file: !175, line: 113, type: !80)
!720 = !DILocalVariable(name: "i", scope: !721, file: !175, line: 115, type: !68)
!721 = distinct !DILexicalBlock(scope: !714, file: !175, line: 115, column: 2)
!722 = !DILocalVariable(name: "hdr", scope: !723, file: !175, line: 117, type: !725)
!723 = distinct !DILexicalBlock(scope: !724, file: !175, line: 115, column: 46)
!724 = distinct !DILexicalBlock(scope: !721, file: !175, line: 115, column: 2)
!725 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !726, size: 64)
!726 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipv6_opt_hdr", file: !226, line: 63, size: 16, elements: !727)
!727 = !{!728, !729}
!728 = !DIDerivedType(tag: DW_TAG_member, name: "nexthdr", scope: !726, file: !226, line: 64, baseType: !198, size: 8)
!729 = !DIDerivedType(tag: DW_TAG_member, name: "hdrlen", scope: !726, file: !226, line: 65, baseType: !198, size: 8, offset: 8)
!730 = !DILocation(line: 0, scope: !714, inlinedAt: !731)
!731 = distinct !DILocation(line: 240, column: 9, scope: !699, inlinedAt: !708)
!732 = !DILocation(line: 0, scope: !721, inlinedAt: !731)
!733 = !DILocation(line: 0, scope: !723, inlinedAt: !731)
!734 = !DILocation(line: 119, column: 11, scope: !735, inlinedAt: !731)
!735 = distinct !DILexicalBlock(scope: !723, file: !175, line: 119, column: 7)
!736 = !DILocation(line: 119, column: 15, scope: !735, inlinedAt: !731)
!737 = !DILocation(line: 119, column: 7, scope: !723, inlinedAt: !731)
!738 = !DILocation(line: 240, column: 44, scope: !699, inlinedAt: !708)
!739 = !{!740, !406, i64 6}
!740 = !{!"ipv6hdr", !406, i64 0, !406, i64 0, !406, i64 1, !441, i64 4, !406, i64 6, !406, i64 7, !406, i64 8}
!741 = !DILocation(line: 123, column: 3, scope: !723, inlinedAt: !731)
!742 = !DILocation(line: 135, column: 5, scope: !743, inlinedAt: !731)
!743 = distinct !DILexicalBlock(scope: !723, file: !175, line: 123, column: 26)
!744 = !DILocation(line: 123, column: 11, scope: !723, inlinedAt: !731)
!745 = !DILocation(line: 141, column: 5, scope: !743, inlinedAt: !731)
!746 = !DILocation(line: 0, scope: !743, inlinedAt: !731)
!747 = !{!748, !406, i64 1}
!748 = !{!"ipv6_opt_hdr", !406, i64 0, !406, i64 1}
!749 = !{!748, !406, i64 0}
!750 = !DILocation(line: 131, column: 5, scope: !743, inlinedAt: !731)
!751 = !DILocation(line: 137, column: 27, scope: !743, inlinedAt: !731)
!752 = !DILocation(line: 139, column: 5, scope: !743, inlinedAt: !731)
!753 = !DILocation(line: 133, column: 35, scope: !743, inlinedAt: !731)
!754 = !DILocation(line: 133, column: 30, scope: !743, inlinedAt: !731)
!755 = !DILocation(line: 133, column: 47, scope: !743, inlinedAt: !731)
!756 = !DILocation(line: 133, column: 27, scope: !743, inlinedAt: !731)
!757 = !DILocation(line: 129, column: 35, scope: !743, inlinedAt: !731)
!758 = !DILocation(line: 129, column: 30, scope: !743, inlinedAt: !731)
!759 = !DILocation(line: 129, column: 47, scope: !743, inlinedAt: !731)
!760 = !DILocation(line: 129, column: 27, scope: !743, inlinedAt: !731)
!761 = !DILocation(line: 0, scope: !339)
!762 = !DILocation(line: 476, column: 3, scope: !339)
!763 = !DILocation(line: 498, column: 7, scope: !339)
!764 = !DILocation(line: 480, column: 4, scope: !765)
!765 = distinct !DILexicalBlock(scope: !766, file: !62, line: 479, column: 20)
!766 = distinct !DILexicalBlock(scope: !339, file: !62, line: 479, column: 7)
!767 = !DILocation(line: 484, column: 7, scope: !768)
!768 = distinct !DILexicalBlock(scope: !339, file: !62, line: 484, column: 7)
!769 = !{!770, !770, i64 0}
!770 = !{!"__int128", !406, i64 0}
!771 = !DILocation(line: 484, column: 19, scope: !768)
!772 = !DILocation(line: 484, column: 7, scope: !339)
!773 = !DILocalVariable(name: "address", arg: 1, scope: !774, file: !62, line: 133, type: !119)
!774 = distinct !DISubprogram(name: "is_filtered_ipv6", scope: !62, file: !62, line: 133, type: !775, scopeLine: 133, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !777)
!775 = !DISubroutineType(types: !776)
!776 = !{!497, !119}
!777 = !{!773, !778}
!778 = !DILocalVariable(name: "banned", scope: !774, file: !62, line: 135, type: !79)
!779 = !DILocation(line: 0, scope: !774, inlinedAt: !780)
!780 = distinct !DILocation(line: 486, column: 8, scope: !781)
!781 = distinct !DILexicalBlock(scope: !782, file: !62, line: 486, column: 8)
!782 = distinct !DILexicalBlock(scope: !768, file: !62, line: 484, column: 25)
!783 = !DILocation(line: 137, column: 11, scope: !774, inlinedAt: !780)
!784 = !DILocation(line: 139, column: 13, scope: !785, inlinedAt: !780)
!785 = distinct !DILexicalBlock(scope: !774, file: !62, line: 139, column: 6)
!786 = !DILocation(line: 486, column: 8, scope: !782)
!787 = !DILocation(line: 0, scope: !344)
!788 = !DILocation(line: 0, scope: !510, inlinedAt: !789)
!789 = distinct !DILocation(line: 502, column: 17, scope: !344)
!790 = !DILocation(line: 264, column: 11, scope: !522, inlinedAt: !789)
!791 = !DILocation(line: 264, column: 15, scope: !522, inlinedAt: !789)
!792 = !DILocation(line: 264, column: 6, scope: !510, inlinedAt: !789)
!793 = !DILocation(line: 271, column: 8, scope: !510, inlinedAt: !789)
!794 = !DILocation(line: 272, column: 10, scope: !529, inlinedAt: !789)
!795 = !DILocation(line: 272, column: 6, scope: !510, inlinedAt: !789)
!796 = !DILocation(line: 507, column: 36, scope: !344)
!797 = !DILocation(line: 0, scope: !534, inlinedAt: !798)
!798 = distinct !DILocation(line: 510, column: 8, scope: !799)
!799 = distinct !DILexicalBlock(scope: !344, file: !62, line: 510, column: 8)
!800 = !DILocation(line: 151, column: 17, scope: !534, inlinedAt: !798)
!801 = !DILocation(line: 153, column: 19, scope: !544, inlinedAt: !798)
!802 = !DILocation(line: 159, column: 1, scope: !534, inlinedAt: !798)
!803 = !DILocation(line: 510, column: 8, scope: !344)
!804 = !DILocation(line: 514, column: 34, scope: !344)
!805 = !DILocation(line: 0, scope: !534, inlinedAt: !806)
!806 = distinct !DILocation(line: 517, column: 8, scope: !807)
!807 = distinct !DILexicalBlock(scope: !344, file: !62, line: 517, column: 8)
!808 = !DILocation(line: 151, column: 17, scope: !534, inlinedAt: !806)
!809 = !DILocation(line: 153, column: 19, scope: !544, inlinedAt: !806)
!810 = !DILocation(line: 159, column: 1, scope: !534, inlinedAt: !806)
!811 = !DILocation(line: 0, scope: !350)
!812 = !DILocation(line: 0, scope: !557, inlinedAt: !813)
!813 = distinct !DILocation(line: 542, column: 17, scope: !350)
!814 = !DILocation(line: 323, column: 11, scope: !569, inlinedAt: !813)
!815 = !DILocation(line: 323, column: 15, scope: !569, inlinedAt: !813)
!816 = !DILocation(line: 323, column: 6, scope: !557, inlinedAt: !813)
!817 = !DILocation(line: 327, column: 14, scope: !557, inlinedAt: !813)
!818 = !DILocation(line: 327, column: 19, scope: !557, inlinedAt: !813)
!819 = !DILocation(line: 328, column: 20, scope: !575, inlinedAt: !813)
!820 = !DILocation(line: 328, column: 26, scope: !575, inlinedAt: !813)
!821 = !DILocation(line: 328, column: 6, scope: !557, inlinedAt: !813)
!822 = !DILocation(line: 0, scope: !579, inlinedAt: !823)
!823 = distinct !DILocation(line: 548, column: 8, scope: !824)
!824 = distinct !DILexicalBlock(scope: !350, file: !62, line: 548, column: 8)
!825 = !DILocation(line: 243, column: 3, scope: !587, inlinedAt: !823)
!826 = !DILocation(line: 264, column: 18, scope: !589, inlinedAt: !823)
!827 = !DILocation(line: 264, column: 25, scope: !589, inlinedAt: !823)
!828 = !DILocation(line: 256, column: 3, scope: !579, inlinedAt: !823)
!829 = !DILocation(line: 0, scope: !595, inlinedAt: !830)
!830 = distinct !DILocation(line: 550, column: 15, scope: !831)
!831 = distinct !DILexicalBlock(scope: !824, file: !62, line: 550, column: 15)
!832 = !DILocation(line: 279, column: 3, scope: !601, inlinedAt: !830)
!833 = !DILocation(line: 285, column: 18, scope: !601, inlinedAt: !830)
!834 = !DILocation(line: 285, column: 25, scope: !601, inlinedAt: !830)
!835 = !DILocation(line: 278, column: 3, scope: !595, inlinedAt: !830)
!836 = !DILocalVariable(name: "address", arg: 1, scope: !837, file: !62, line: 85, type: !119)
!837 = distinct !DISubprogram(name: "warn_ipv6", scope: !62, file: !62, line: 85, type: !838, scopeLine: 85, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !839)
!838 = !DISubroutineType(cc: DW_CC_nocall, types: !776)
!839 = !{!836, !840, !841, !844, !847}
!840 = !DILocalVariable(name: "warnings_ipv6", scope: !837, file: !62, line: 87, type: !79)
!841 = !DILocalVariable(name: "tmp", scope: !842, file: !62, line: 93, type: !80)
!842 = distinct !DILexicalBlock(scope: !843, file: !62, line: 91, column: 29)
!843 = distinct !DILexicalBlock(scope: !837, file: !62, line: 91, column: 6)
!844 = !DILocalVariable(name: "banned", scope: !845, file: !62, line: 101, type: !80)
!845 = distinct !DILexicalBlock(scope: !846, file: !62, line: 99, column: 17)
!846 = distinct !DILexicalBlock(scope: !842, file: !62, line: 99, column: 7)
!847 = !DILocalVariable(name: "tmp", scope: !848, file: !62, line: 109, type: !80)
!848 = distinct !DILexicalBlock(scope: !843, file: !62, line: 107, column: 9)
!849 = !DILocation(line: 0, scope: !837, inlinedAt: !850)
!850 = distinct !DILocation(line: 551, column: 5, scope: !851)
!851 = distinct !DILexicalBlock(scope: !831, file: !62, line: 550, column: 60)
!852 = !DILocation(line: 89, column: 18, scope: !837, inlinedAt: !850)
!853 = !DILocation(line: 91, column: 20, scope: !843, inlinedAt: !850)
!854 = !DILocation(line: 91, column: 6, scope: !837, inlinedAt: !850)
!855 = !DILocation(line: 93, column: 3, scope: !842, inlinedAt: !850)
!856 = !DILocation(line: 0, scope: !842, inlinedAt: !850)
!857 = !DILocation(line: 95, column: 9, scope: !842, inlinedAt: !850)
!858 = !DILocation(line: 95, column: 24, scope: !842, inlinedAt: !850)
!859 = !DILocation(line: 95, column: 7, scope: !842, inlinedAt: !850)
!860 = !DILocation(line: 97, column: 3, scope: !842, inlinedAt: !850)
!861 = !DILocation(line: 99, column: 7, scope: !846, inlinedAt: !850)
!862 = !DILocation(line: 99, column: 11, scope: !846, inlinedAt: !850)
!863 = !DILocation(line: 99, column: 7, scope: !842, inlinedAt: !850)
!864 = !DILocation(line: 101, column: 4, scope: !845, inlinedAt: !850)
!865 = !DILocation(line: 0, scope: !845, inlinedAt: !850)
!866 = !DILocation(line: 101, column: 9, scope: !845, inlinedAt: !850)
!867 = !DILocation(line: 103, column: 4, scope: !845, inlinedAt: !850)
!868 = !DILocation(line: 105, column: 3, scope: !846, inlinedAt: !850)
!869 = !DILocation(line: 105, column: 3, scope: !845, inlinedAt: !850)
!870 = !DILocation(line: 107, column: 2, scope: !843, inlinedAt: !850)
!871 = !DILocation(line: 107, column: 2, scope: !842, inlinedAt: !850)
!872 = !DILocation(line: 109, column: 3, scope: !848, inlinedAt: !850)
!873 = !DILocation(line: 0, scope: !848, inlinedAt: !850)
!874 = !DILocation(line: 109, column: 8, scope: !848, inlinedAt: !850)
!875 = !DILocation(line: 111, column: 3, scope: !848, inlinedAt: !850)
!876 = !DILocation(line: 113, column: 2, scope: !843, inlinedAt: !850)
!877 = !DILocation(line: 554, column: 36, scope: !350)
!878 = !DILocation(line: 0, scope: !534, inlinedAt: !879)
!879 = distinct !DILocation(line: 557, column: 8, scope: !880)
!880 = distinct !DILexicalBlock(scope: !350, file: !62, line: 557, column: 8)
!881 = !DILocation(line: 151, column: 17, scope: !534, inlinedAt: !879)
!882 = !DILocation(line: 153, column: 19, scope: !544, inlinedAt: !879)
!883 = !DILocation(line: 159, column: 1, scope: !534, inlinedAt: !879)
!884 = !DILocation(line: 557, column: 8, scope: !350)
!885 = !DILocation(line: 561, column: 34, scope: !350)
!886 = !DILocation(line: 0, scope: !534, inlinedAt: !887)
!887 = distinct !DILocation(line: 564, column: 8, scope: !888)
!888 = distinct !DILexicalBlock(scope: !350, file: !62, line: 564, column: 8)
!889 = !DILocation(line: 151, column: 17, scope: !534, inlinedAt: !887)
!890 = !DILocation(line: 153, column: 19, scope: !544, inlinedAt: !887)
!891 = !DILocation(line: 159, column: 1, scope: !534, inlinedAt: !887)
!892 = !DILocation(line: 0, scope: !356)
!893 = !DILocation(line: 0, scope: !666, inlinedAt: !894)
!894 = distinct !DILocation(line: 589, column: 4, scope: !356)
!895 = !DILocation(line: 218, column: 12, scope: !677, inlinedAt: !894)
!896 = !DILocation(line: 218, column: 16, scope: !677, inlinedAt: !894)
!897 = !DILocation(line: 218, column: 6, scope: !666, inlinedAt: !894)
!898 = !DILocation(line: 0, scope: !681, inlinedAt: !899)
!899 = distinct !DILocation(line: 591, column: 23, scope: !900)
!900 = distinct !DILexicalBlock(scope: !356, file: !62, line: 591, column: 8)
!901 = !DILocation(line: 163, column: 26, scope: !681, inlinedAt: !899)
!902 = !DILocation(line: 166, column: 8, scope: !693, inlinedAt: !899)
!903 = !DILocation(line: 167, column: 3, scope: !693, inlinedAt: !899)
!904 = !DILocation(line: 182, column: 18, scope: !693, inlinedAt: !899)
!905 = !DILocation(line: 0, scope: !359)
!906 = !DILocalVariable(name: "nh", arg: 1, scope: !907, file: !175, line: 244, type: !422)
!907 = distinct !DISubprogram(name: "parse_icmp6hdr", scope: !175, file: !175, line: 244, type: !908, scopeLine: 244, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !911)
!908 = !DISubroutineType(cc: DW_CC_nocall, types: !909)
!909 = !{!68, !422, !53, !910}
!910 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !361, size: 64)
!911 = !{!906, !912, !913, !914}
!912 = !DILocalVariable(name: "data_end", arg: 2, scope: !907, file: !175, line: 244, type: !53)
!913 = !DILocalVariable(name: "icmp6hdr", arg: 3, scope: !907, file: !175, line: 244, type: !910)
!914 = !DILocalVariable(name: "icmp6h", scope: !907, file: !175, line: 246, type: !361)
!915 = !DILocation(line: 0, scope: !907, inlinedAt: !916)
!916 = distinct !DILocation(line: 605, column: 4, scope: !359)
!917 = !DILocation(line: 248, column: 13, scope: !918, inlinedAt: !916)
!918 = distinct !DILexicalBlock(scope: !907, file: !175, line: 248, column: 6)
!919 = !DILocation(line: 248, column: 17, scope: !918, inlinedAt: !916)
!920 = !DILocation(line: 248, column: 6, scope: !907, inlinedAt: !916)
!921 = !DILocalVariable(name: "icmp6_header", arg: 1, scope: !922, file: !62, line: 194, type: !361)
!922 = distinct !DISubprogram(name: "is_filtered_icmp6_packet", scope: !62, file: !62, line: 194, type: !923, scopeLine: 194, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !925)
!923 = !DISubroutineType(types: !924)
!924 = !{!497, !361}
!925 = !{!921, !926}
!926 = !DILocalVariable(name: "type", scope: !922, file: !62, line: 196, type: !68)
!927 = !DILocation(line: 0, scope: !922, inlinedAt: !928)
!928 = distinct !DILocation(line: 607, column: 24, scope: !929)
!929 = distinct !DILexicalBlock(scope: !359, file: !62, line: 607, column: 8)
!930 = !DILocation(line: 196, column: 27, scope: !922, inlinedAt: !928)
!931 = !{!932, !406, i64 0}
!932 = !{!"icmp6hdr", !406, i64 0, !406, i64 1, !441, i64 2, !406, i64 4}
!933 = !DILocation(line: 199, column: 8, scope: !934, inlinedAt: !928)
!934 = distinct !DILexicalBlock(scope: !922, file: !62, line: 199, column: 3)
!935 = !DILocation(line: 200, column: 3, scope: !934, inlinedAt: !928)
!936 = !DILocation(line: 215, column: 18, scope: !934, inlinedAt: !928)
!937 = !DILocation(line: 218, column: 18, scope: !934, inlinedAt: !928)
!938 = !DILocation(line: 230, column: 12, scope: !934, inlinedAt: !928)
!939 = !DILocation(line: 230, column: 19, scope: !934, inlinedAt: !928)
!940 = !DILocation(line: 619, column: 2, scope: !340)
!941 = !DILocation(line: 623, column: 1, scope: !156)
