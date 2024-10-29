; ModuleID = '/home/cookiengineer/Software/tholian-network/firewall/ebpf/module/module.c'
source_filename = "/home/cookiengineer/Software/tholian-network/firewall/ebpf/module/module.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.anon.5 = type { ptr, ptr, ptr, ptr }
%struct.anon.6 = type { ptr, ptr, ptr, ptr, ptr }
%struct.anon.7 = type { ptr, ptr, ptr, ptr }
%struct.anon.8 = type { ptr, ptr, ptr, ptr, ptr }
%struct.anon.9 = type { ptr, ptr, ptr, ptr }
%struct.anon.10 = type { ptr, ptr, ptr, ptr }
%struct.ipv4_subnet = type { i32, [4 x i8] }
%struct.ipv6_subnet = type { i32, [16 x i8] }
%struct.xdp_md = type { i32, i32, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, %union.anon }
%union.anon = type { %struct.anon }
%struct.anon = type { i32, i32 }
%struct.udphdr = type { i16, i16, i16, i16 }
%struct.tcphdr = type { i16, i16, i32, i32, i16, i16, i16, i16 }
%struct.icmphdr = type { i8, i8, i16, %union.anon.11 }
%union.anon.11 = type { i32 }
%struct.ipv6hdr = type { i8, [3 x i8], i16, i8, i8, %union.anon.1 }
%union.anon.1 = type { %struct.anon.2 }
%struct.anon.2 = type { %struct.in6_addr, %struct.in6_addr }
%struct.in6_addr = type { %union.anon.3 }
%union.anon.3 = type { [4 x i32] }
%struct.ipv6_opt_hdr = type { i8, i8 }
%struct.icmp6hdr = type { i8, i8, i16, %union.anon.14 }
%union.anon.14 = type { [1 x i32] }

@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !0
@domain_bans = dso_local global %struct.anon.5 zeroinitializer, section ".maps", align 8, !dbg !61
@ipv4_bans = dso_local global %struct.anon.6 zeroinitializer, section ".maps", align 8, !dbg !86
@ipv4_warnings = dso_local global %struct.anon.7 zeroinitializer, section ".maps", align 8, !dbg !108
@ipv6_bans = dso_local global %struct.anon.8 zeroinitializer, section ".maps", align 8, !dbg !124
@ipv6_warnings = dso_local global %struct.anon.9 zeroinitializer, section ".maps", align 8, !dbg !141
@port_bans = dso_local global %struct.anon.10 zeroinitializer, section ".maps", align 8, !dbg !149
@llvm.compiler.used = appending global [8 x ptr] [ptr @_license, ptr @domain_bans, ptr @ipv4_bans, ptr @ipv4_warnings, ptr @ipv6_bans, ptr @ipv6_warnings, ptr @port_bans, ptr @xdp_prog_main], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local noundef i32 @xdp_prog_main(ptr nocapture noundef readonly %0) #0 section "xdp" !dbg !185 {
  %2 = alloca i8, align 1, !DIAssignID !431
  %3 = alloca i8, align 1, !DIAssignID !432
  %4 = alloca i8, align 1, !DIAssignID !433
  %5 = alloca i8, align 1, !DIAssignID !434
  %6 = alloca i8, align 1, !DIAssignID !435
  %7 = alloca i8, align 1, !DIAssignID !436
  %8 = alloca i16, align 2, !DIAssignID !437
  %9 = alloca i16, align 2, !DIAssignID !438
  %10 = alloca i16, align 2, !DIAssignID !439
  %11 = alloca i16, align 2, !DIAssignID !440
  %12 = alloca i16, align 2, !DIAssignID !441
  %13 = alloca i16, align 2, !DIAssignID !442
  %14 = alloca i16, align 2, !DIAssignID !443
  %15 = alloca i16, align 2, !DIAssignID !444
  %16 = alloca %struct.ipv4_subnet, align 4, !DIAssignID !445
  call void @llvm.dbg.assign(metadata i1 undef, metadata !297, metadata !DIExpression(), metadata !445, metadata ptr %16, metadata !DIExpression()), !dbg !446
  %17 = alloca %struct.ipv4_subnet, align 4, !DIAssignID !447
  call void @llvm.dbg.assign(metadata i1 undef, metadata !298, metadata !DIExpression(), metadata !447, metadata ptr %17, metadata !DIExpression()), !dbg !446
  %18 = alloca %struct.ipv6_subnet, align 4, !DIAssignID !448
  call void @llvm.dbg.assign(metadata i1 undef, metadata !369, metadata !DIExpression(), metadata !448, metadata ptr %18, metadata !DIExpression()), !dbg !449
  %19 = alloca %struct.ipv6_subnet, align 4, !DIAssignID !450
  call void @llvm.dbg.assign(metadata i1 undef, metadata !370, metadata !DIExpression(), metadata !450, metadata ptr %19, metadata !DIExpression()), !dbg !449
  tail call void @llvm.dbg.value(metadata ptr %0, metadata !198, metadata !DIExpression()), !dbg !451
  %20 = getelementptr inbounds %struct.xdp_md, ptr %0, i64 0, i32 1, !dbg !452
  %21 = load i32, ptr %20, align 4, !dbg !452, !tbaa !453
  %22 = zext i32 %21 to i64, !dbg !458
  %23 = inttoptr i64 %22 to ptr, !dbg !459
  tail call void @llvm.dbg.value(metadata ptr %23, metadata !199, metadata !DIExpression()), !dbg !451
  %24 = load i32, ptr %0, align 4, !dbg !460, !tbaa !461
  %25 = zext i32 %24 to i64, !dbg !462
  %26 = inttoptr i64 %25 to ptr, !dbg !463
  tail call void @llvm.dbg.value(metadata ptr %26, metadata !200, metadata !DIExpression()), !dbg !451
  %27 = getelementptr inbounds i8, ptr %26, i64 14, !dbg !464
  %28 = icmp ugt ptr %27, %23, !dbg !466
  br i1 %28, label %322, label %29, !dbg !467

29:                                               ; preds = %1
  tail call void @llvm.dbg.value(metadata ptr null, metadata !222, metadata !DIExpression()), !dbg !451
  tail call void @llvm.dbg.value(metadata ptr null, metadata !253, metadata !DIExpression()), !dbg !451
  call void @llvm.dbg.value(metadata ptr undef, metadata !468, metadata !DIExpression()), !dbg !487
  call void @llvm.dbg.value(metadata ptr %23, metadata !475, metadata !DIExpression()), !dbg !487
  call void @llvm.dbg.value(metadata ptr undef, metadata !476, metadata !DIExpression()), !dbg !487
  call void @llvm.dbg.value(metadata ptr %26, metadata !477, metadata !DIExpression()), !dbg !487
  tail call void @llvm.dbg.value(metadata ptr %27, metadata !202, metadata !DIExpression()), !dbg !451
  tail call void @llvm.dbg.value(metadata ptr %26, metadata !207, metadata !DIExpression()), !dbg !451
  call void @llvm.dbg.value(metadata ptr %27, metadata !478, metadata !DIExpression()), !dbg !487
  %30 = getelementptr inbounds %struct.ethhdr, ptr %26, i64 0, i32 2, !dbg !489
  call void @llvm.dbg.value(metadata i16 poison, metadata !485, metadata !DIExpression()), !dbg !487
  call void @llvm.dbg.value(metadata i32 0, metadata !486, metadata !DIExpression()), !dbg !487
  %31 = load i16, ptr %30, align 1, !dbg !487, !tbaa !490
  call void @llvm.dbg.value(metadata i16 %31, metadata !485, metadata !DIExpression()), !dbg !487
  call void @llvm.dbg.value(metadata ptr %27, metadata !478, metadata !DIExpression()), !dbg !487
  call void @llvm.dbg.value(metadata i32 0, metadata !486, metadata !DIExpression()), !dbg !487
  call void @llvm.dbg.value(metadata ptr %27, metadata !478, metadata !DIExpression()), !dbg !487
  call void @llvm.dbg.value(metadata i16 %31, metadata !492, metadata !DIExpression()), !dbg !497
  %32 = icmp eq i16 %31, 129, !dbg !503
  %33 = icmp eq i16 %31, -22392, !dbg !504
  %34 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 2, i1 %32)
  %35 = or i1 %33, %34, !dbg !504
  br i1 %35, label %36, label %72, !dbg !505

36:                                               ; preds = %29
  %37 = getelementptr inbounds i8, ptr %26, i64 18, !dbg !506
  %38 = icmp ugt ptr %37, %23, !dbg !508
  br i1 %38, label %72, label %39, !dbg !509

39:                                               ; preds = %36
  %40 = getelementptr inbounds i8, ptr %26, i64 16, !dbg !510
  call void @llvm.dbg.value(metadata i16 poison, metadata !485, metadata !DIExpression()), !dbg !487
  call void @llvm.dbg.value(metadata ptr %37, metadata !478, metadata !DIExpression()), !dbg !487
  call void @llvm.dbg.value(metadata i32 1, metadata !486, metadata !DIExpression()), !dbg !487
  %41 = load i16, ptr %40, align 1, !dbg !487, !tbaa !490
  call void @llvm.dbg.value(metadata i16 %41, metadata !485, metadata !DIExpression()), !dbg !487
  call void @llvm.dbg.value(metadata i32 1, metadata !486, metadata !DIExpression()), !dbg !487
  call void @llvm.dbg.value(metadata ptr %37, metadata !478, metadata !DIExpression()), !dbg !487
  call void @llvm.dbg.value(metadata i16 %41, metadata !492, metadata !DIExpression()), !dbg !497
  %42 = icmp eq i16 %41, 129, !dbg !503
  %43 = icmp eq i16 %41, -22392, !dbg !504
  %44 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 2, i1 %42)
  %45 = or i1 %43, %44, !dbg !504
  br i1 %45, label %46, label %72, !dbg !505

46:                                               ; preds = %39
  %47 = getelementptr inbounds i8, ptr %26, i64 22, !dbg !506
  %48 = icmp ugt ptr %47, %23, !dbg !508
  br i1 %48, label %72, label %49, !dbg !509

49:                                               ; preds = %46
  %50 = getelementptr inbounds i8, ptr %26, i64 20, !dbg !510
  call void @llvm.dbg.value(metadata i16 poison, metadata !485, metadata !DIExpression()), !dbg !487
  call void @llvm.dbg.value(metadata ptr %47, metadata !478, metadata !DIExpression()), !dbg !487
  call void @llvm.dbg.value(metadata i32 2, metadata !486, metadata !DIExpression()), !dbg !487
  %51 = load i16, ptr %50, align 1, !dbg !487, !tbaa !490
  call void @llvm.dbg.value(metadata i16 %51, metadata !485, metadata !DIExpression()), !dbg !487
  call void @llvm.dbg.value(metadata i32 2, metadata !486, metadata !DIExpression()), !dbg !487
  call void @llvm.dbg.value(metadata ptr %47, metadata !478, metadata !DIExpression()), !dbg !487
  call void @llvm.dbg.value(metadata i16 %51, metadata !492, metadata !DIExpression()), !dbg !497
  %52 = icmp eq i16 %51, 129, !dbg !503
  %53 = icmp eq i16 %51, -22392, !dbg !504
  %54 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 2, i1 %52)
  %55 = or i1 %53, %54, !dbg !504
  br i1 %55, label %56, label %72, !dbg !505

56:                                               ; preds = %49
  %57 = getelementptr inbounds i8, ptr %26, i64 26, !dbg !506
  %58 = icmp ugt ptr %57, %23, !dbg !508
  br i1 %58, label %72, label %59, !dbg !509

59:                                               ; preds = %56
  %60 = getelementptr inbounds i8, ptr %26, i64 24, !dbg !510
  call void @llvm.dbg.value(metadata i16 poison, metadata !485, metadata !DIExpression()), !dbg !487
  call void @llvm.dbg.value(metadata ptr %57, metadata !478, metadata !DIExpression()), !dbg !487
  call void @llvm.dbg.value(metadata i32 3, metadata !486, metadata !DIExpression()), !dbg !487
  %61 = load i16, ptr %60, align 1, !dbg !487, !tbaa !490
  call void @llvm.dbg.value(metadata i16 %61, metadata !485, metadata !DIExpression()), !dbg !487
  call void @llvm.dbg.value(metadata i32 3, metadata !486, metadata !DIExpression()), !dbg !487
  call void @llvm.dbg.value(metadata ptr %57, metadata !478, metadata !DIExpression()), !dbg !487
  call void @llvm.dbg.value(metadata i16 %61, metadata !492, metadata !DIExpression()), !dbg !497
  %62 = icmp eq i16 %61, 129, !dbg !503
  %63 = icmp eq i16 %61, -22392, !dbg !504
  %64 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 2, i1 %62)
  %65 = or i1 %63, %64, !dbg !504
  br i1 %65, label %66, label %72, !dbg !505

66:                                               ; preds = %59
  %67 = getelementptr inbounds i8, ptr %26, i64 30, !dbg !506
  %68 = icmp ugt ptr %67, %23, !dbg !508
  br i1 %68, label %72, label %69, !dbg !509

69:                                               ; preds = %66
  %70 = getelementptr inbounds i8, ptr %26, i64 28, !dbg !510
  call void @llvm.dbg.value(metadata i16 poison, metadata !485, metadata !DIExpression()), !dbg !487
  call void @llvm.dbg.value(metadata ptr %67, metadata !478, metadata !DIExpression()), !dbg !487
  call void @llvm.dbg.value(metadata i32 4, metadata !486, metadata !DIExpression()), !dbg !487
  %71 = load i16, ptr %70, align 1, !dbg !487, !tbaa !490
  call void @llvm.dbg.value(metadata i16 %71, metadata !485, metadata !DIExpression()), !dbg !487
  br label %72

72:                                               ; preds = %69, %66, %59, %56, %49, %46, %39, %29, %36
  %73 = phi ptr [ %27, %29 ], [ %27, %36 ], [ %37, %39 ], [ %37, %46 ], [ %47, %49 ], [ %47, %56 ], [ %57, %59 ], [ %57, %66 ], [ %67, %69 ], !dbg !487
  %74 = phi i16 [ %31, %29 ], [ %31, %36 ], [ %41, %39 ], [ %41, %46 ], [ %51, %49 ], [ %51, %56 ], [ %61, %59 ], [ %61, %66 ], [ %71, %69 ], !dbg !487
  tail call void @llvm.dbg.value(metadata ptr %73, metadata !202, metadata !DIExpression()), !dbg !451
  tail call void @llvm.dbg.value(metadata i16 %74, metadata !201, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !451
  switch i16 %74, label %322 [
    i16 8, label %75
    i16 -8826, label %180
  ], !dbg !511

75:                                               ; preds = %72
  tail call void @llvm.dbg.value(metadata ptr undef, metadata !512, metadata !DIExpression()), !dbg !522
  tail call void @llvm.dbg.value(metadata ptr %23, metadata !518, metadata !DIExpression()), !dbg !522
  tail call void @llvm.dbg.value(metadata ptr undef, metadata !519, metadata !DIExpression()), !dbg !522
  tail call void @llvm.dbg.value(metadata ptr %73, metadata !520, metadata !DIExpression()), !dbg !522
  %76 = getelementptr inbounds %struct.iphdr, ptr %73, i64 1, !dbg !524
  %77 = icmp ugt ptr %76, %23, !dbg !526
  br i1 %77, label %85, label %78, !dbg !527

78:                                               ; preds = %75
  %79 = load i8, ptr %73, align 4, !dbg !528
  %80 = shl i8 %79, 2, !dbg !529
  %81 = and i8 %80, 60, !dbg !529
  %82 = zext nneg i8 %81 to i64
  tail call void @llvm.dbg.value(metadata i64 %82, metadata !521, metadata !DIExpression()), !dbg !522
  %83 = getelementptr inbounds i8, ptr %73, i64 %82, !dbg !530
  %84 = icmp ugt ptr %83, %23, !dbg !532
  br i1 %84, label %85, label %86, !dbg !533

85:                                               ; preds = %78, %75
  tail call void @llvm.dbg.value(metadata ptr null, metadata !222, metadata !DIExpression()), !dbg !451
  tail call void @llvm.dbg.value(metadata ptr %73, metadata !202, metadata !DIExpression()), !dbg !451
  tail call void @llvm.dbg.value(metadata i32 -1, metadata !294, metadata !DIExpression()), !dbg !446
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %16) #6, !dbg !534
  call void @llvm.dbg.assign(metadata i32 32, metadata !297, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 32), metadata !535, metadata ptr %16, metadata !DIExpression()), !dbg !446
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %17) #6, !dbg !536
  call void @llvm.dbg.assign(metadata i32 32, metadata !298, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 32), metadata !537, metadata ptr %17, metadata !DIExpression()), !dbg !446
  br label %177, !dbg !538

86:                                               ; preds = %78
  tail call void @llvm.dbg.value(metadata ptr %83, metadata !202, metadata !DIExpression()), !dbg !451
  tail call void @llvm.dbg.value(metadata ptr %73, metadata !222, metadata !DIExpression()), !dbg !451
  %87 = getelementptr inbounds %struct.iphdr, ptr %73, i64 0, i32 6, !dbg !539
  %88 = load i8, ptr %87, align 1, !dbg !539, !tbaa !540
  tail call void @llvm.dbg.value(metadata i8 %88, metadata !294, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !446
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %16) #6, !dbg !534
  store i32 32, ptr %16, align 4, !dbg !542, !tbaa !543, !DIAssignID !535
  call void @llvm.dbg.assign(metadata i32 32, metadata !297, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 32), metadata !535, metadata ptr %16, metadata !DIExpression()), !dbg !446
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %17) #6, !dbg !536
  store i32 32, ptr %17, align 4, !dbg !545, !tbaa !543, !DIAssignID !537
  call void @llvm.dbg.assign(metadata i32 32, metadata !298, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 32), metadata !537, metadata ptr %17, metadata !DIExpression()), !dbg !446
  %89 = getelementptr inbounds %struct.ipv4_subnet, ptr %16, i64 0, i32 1, !dbg !546
  %90 = getelementptr inbounds %struct.iphdr, ptr %73, i64 0, i32 8, !dbg !546
  %91 = load i32, ptr %90, align 4, !dbg !546
  store i32 %91, ptr %89, align 4, !dbg !546, !DIAssignID !549
  call void @llvm.dbg.assign(metadata i1 undef, metadata !297, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 32), metadata !549, metadata ptr %89, metadata !DIExpression()), !dbg !446
  %92 = getelementptr inbounds %struct.ipv4_subnet, ptr %17, i64 0, i32 1, !dbg !550
  %93 = getelementptr inbounds %struct.iphdr, ptr %73, i64 0, i32 8, i32 0, i32 1, !dbg !550
  %94 = load i32, ptr %93, align 4, !dbg !550
  store i32 %94, ptr %92, align 4, !dbg !550, !DIAssignID !551
  call void @llvm.dbg.assign(metadata i1 undef, metadata !298, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 32), metadata !551, metadata ptr %92, metadata !DIExpression()), !dbg !446
  call void @llvm.dbg.value(metadata ptr %16, metadata !552, metadata !DIExpression()), !dbg !559
  call void @llvm.dbg.value(metadata ptr null, metadata !558, metadata !DIExpression()), !dbg !559
  %95 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @ipv4_bans, ptr noundef nonnull %16) #6, !dbg !562
  call void @llvm.dbg.value(metadata ptr %95, metadata !558, metadata !DIExpression()), !dbg !559
  %96 = icmp eq ptr %95, null, !dbg !563
  br i1 %96, label %97, label %178, !dbg !565

97:                                               ; preds = %86
  call void @llvm.dbg.value(metadata ptr %17, metadata !552, metadata !DIExpression()), !dbg !566
  call void @llvm.dbg.value(metadata ptr null, metadata !558, metadata !DIExpression()), !dbg !566
  %98 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @ipv4_bans, ptr noundef nonnull %17) #6, !dbg !569
  call void @llvm.dbg.value(metadata ptr %98, metadata !558, metadata !DIExpression()), !dbg !566
  %99 = icmp eq ptr %98, null, !dbg !570
  br i1 %99, label %100, label %178, !dbg !571

100:                                              ; preds = %97
  switch i8 %88, label %177 [
    i8 17, label %101
    i8 6, label %118
    i8 1, label %166
  ], !dbg !538

101:                                              ; preds = %100
  tail call void @llvm.dbg.value(metadata ptr null, metadata !299, metadata !DIExpression()), !dbg !572
  call void @llvm.dbg.value(metadata ptr undef, metadata !573, metadata !DIExpression()), !dbg !583
  call void @llvm.dbg.value(metadata ptr %23, metadata !579, metadata !DIExpression()), !dbg !583
  call void @llvm.dbg.value(metadata ptr undef, metadata !580, metadata !DIExpression()), !dbg !583
  call void @llvm.dbg.value(metadata ptr %83, metadata !582, metadata !DIExpression()), !dbg !583
  %102 = getelementptr inbounds %struct.udphdr, ptr %83, i64 1, !dbg !585
  %103 = icmp ugt ptr %102, %23, !dbg !587
  br i1 %103, label %178, label %104, !dbg !588

104:                                              ; preds = %101
  tail call void @llvm.dbg.value(metadata ptr %102, metadata !202, metadata !DIExpression()), !dbg !451
  tail call void @llvm.dbg.value(metadata ptr %83, metadata !299, metadata !DIExpression()), !dbg !572
  %105 = getelementptr inbounds %struct.udphdr, ptr %83, i64 0, i32 2, !dbg !589
  %106 = load i16, ptr %105, align 2, !dbg !589, !tbaa !590
  %107 = call i16 @llvm.bswap.i16(i16 %106), !dbg !589
  call void @llvm.dbg.value(metadata i16 %107, metadata !581, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_constu, 8, DW_OP_minus, DW_OP_stack_value)), !dbg !583
  %108 = icmp ult i16 %107, 8, !dbg !592
  br i1 %108, label %178, label %109, !dbg !594

109:                                              ; preds = %104
  call void @llvm.dbg.value(metadata i16 %107, metadata !581, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_constu, 8, DW_OP_minus, DW_OP_stack_value)), !dbg !583
  call void @llvm.dbg.value(metadata i16 %107, metadata !581, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_constu, 8, DW_OP_minus, DW_OP_stack_value)), !dbg !583
  tail call void @llvm.dbg.value(metadata ptr %83, metadata !299, metadata !DIExpression()), !dbg !572
  tail call void @llvm.dbg.value(metadata i16 %107, metadata !310, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_constu, 8, DW_OP_minus, DW_OP_stack_value)), !dbg !572
  %110 = load i16, ptr %83, align 2, !dbg !595, !tbaa !596
  tail call void @llvm.dbg.value(metadata i16 %110, metadata !311, metadata !DIExpression()), !dbg !572
  call void @llvm.lifetime.start.p0(i64 2, ptr nonnull %8)
  call void @llvm.dbg.assign(metadata i1 undef, metadata !597, metadata !DIExpression(), metadata !437, metadata ptr %8, metadata !DIExpression()), !dbg !603
  store i16 %110, ptr %8, align 2, !tbaa !490, !DIAssignID !606
  call void @llvm.dbg.assign(metadata i16 %110, metadata !597, metadata !DIExpression(), metadata !606, metadata ptr %8, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.value(metadata ptr null, metadata !602, metadata !DIExpression()), !dbg !603
  %111 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @port_bans, ptr noundef nonnull %8) #6, !dbg !607
  call void @llvm.dbg.value(metadata ptr %111, metadata !602, metadata !DIExpression()), !dbg !603
  %112 = icmp eq ptr %111, null, !dbg !608
  call void @llvm.lifetime.end.p0(i64 2, ptr nonnull %8), !dbg !610
  br i1 %112, label %113, label %178, !dbg !611

113:                                              ; preds = %109
  %114 = getelementptr inbounds %struct.udphdr, ptr %83, i64 0, i32 1, !dbg !612
  %115 = load i16, ptr %114, align 2, !dbg !612, !tbaa !613
  tail call void @llvm.dbg.value(metadata i16 %115, metadata !312, metadata !DIExpression()), !dbg !572
  call void @llvm.lifetime.start.p0(i64 2, ptr nonnull %9)
  call void @llvm.dbg.assign(metadata i1 undef, metadata !597, metadata !DIExpression(), metadata !438, metadata ptr %9, metadata !DIExpression()), !dbg !614
  store i16 %115, ptr %9, align 2, !tbaa !490, !DIAssignID !617
  call void @llvm.dbg.assign(metadata i16 %115, metadata !597, metadata !DIExpression(), metadata !617, metadata ptr %9, metadata !DIExpression()), !dbg !614
  call void @llvm.dbg.value(metadata ptr null, metadata !602, metadata !DIExpression()), !dbg !614
  %116 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @port_bans, ptr noundef nonnull %9) #6, !dbg !618
  call void @llvm.dbg.value(metadata ptr %116, metadata !602, metadata !DIExpression()), !dbg !614
  %117 = icmp eq ptr %116, null, !dbg !619
  call void @llvm.lifetime.end.p0(i64 2, ptr nonnull %9), !dbg !620
  br i1 %117, label %177, label %178

118:                                              ; preds = %100
  tail call void @llvm.dbg.value(metadata ptr null, metadata !313, metadata !DIExpression()), !dbg !621
  tail call void @llvm.dbg.value(metadata ptr undef, metadata !622, metadata !DIExpression()), !dbg !632
  tail call void @llvm.dbg.value(metadata ptr %23, metadata !628, metadata !DIExpression()), !dbg !632
  tail call void @llvm.dbg.value(metadata ptr undef, metadata !629, metadata !DIExpression()), !dbg !632
  tail call void @llvm.dbg.value(metadata ptr %83, metadata !631, metadata !DIExpression()), !dbg !632
  %119 = getelementptr inbounds %struct.tcphdr, ptr %83, i64 1, !dbg !634
  %120 = icmp ugt ptr %119, %23, !dbg !636
  br i1 %120, label %178, label %121, !dbg !637

121:                                              ; preds = %118
  %122 = getelementptr inbounds %struct.tcphdr, ptr %83, i64 0, i32 4, !dbg !638
  %123 = load i16, ptr %122, align 4, !dbg !638
  %124 = lshr i16 %123, 2, !dbg !639
  %125 = and i16 %124, 60, !dbg !639
  tail call void @llvm.dbg.value(metadata i16 %125, metadata !630, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !632
  %126 = zext nneg i16 %125 to i64
  %127 = getelementptr inbounds i8, ptr %83, i64 %126, !dbg !640
  %128 = icmp ugt ptr %127, %23, !dbg !642
  br i1 %128, label %178, label %129, !dbg !643

129:                                              ; preds = %121
  tail call void @llvm.dbg.value(metadata i16 %125, metadata !630, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !632
  tail call void @llvm.dbg.value(metadata ptr %119, metadata !202, metadata !DIExpression()), !dbg !451
  tail call void @llvm.dbg.value(metadata ptr %83, metadata !313, metadata !DIExpression()), !dbg !621
  tail call void @llvm.dbg.value(metadata i16 %125, metadata !337, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !621
  tail call void @llvm.dbg.value(metadata ptr %83, metadata !644, metadata !DIExpression()), !dbg !649
  %130 = and i16 %123, -256, !dbg !652
  switch i16 %130, label %135 [
    i16 256, label %178
    i16 5120, label %131
  ], !dbg !652

131:                                              ; preds = %129
  %132 = getelementptr inbounds %struct.tcphdr, ptr %83, i64 0, i32 5, !dbg !654
  %133 = load i16, ptr %132, align 2, !dbg !654, !tbaa !656
  %134 = icmp eq i16 %133, 0, !dbg !658
  br i1 %134, label %178, label %135, !dbg !659

135:                                              ; preds = %129, %131
  tail call void @llvm.dbg.value(metadata ptr %83, metadata !660, metadata !DIExpression()), !dbg !663
  %136 = and i16 %123, -8448, !dbg !666
  %137 = icmp eq i16 %136, 512, !dbg !666
  br i1 %137, label %138, label %157, !dbg !666

138:                                              ; preds = %135
  %139 = getelementptr inbounds %struct.tcphdr, ptr %83, i64 0, i32 5, !dbg !668
  %140 = load i16, ptr %139, align 2, !dbg !668, !tbaa !656
  %141 = icmp eq i16 %140, -3846, !dbg !669
  br i1 %141, label %142, label %157, !dbg !670

142:                                              ; preds = %138
  call void @llvm.dbg.assign(metadata i1 undef, metadata !671, metadata !DIExpression(), metadata !434, metadata ptr %5, metadata !DIExpression()), !dbg !683
  call void @llvm.dbg.assign(metadata i1 undef, metadata !678, metadata !DIExpression(), metadata !435, metadata ptr %6, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.assign(metadata i1 undef, metadata !681, metadata !DIExpression(), metadata !436, metadata ptr %7, metadata !DIExpression()), !dbg !687
  call void @llvm.dbg.value(metadata ptr %16, metadata !676, metadata !DIExpression()), !dbg !688
  call void @llvm.dbg.value(metadata ptr null, metadata !677, metadata !DIExpression()), !dbg !688
  %143 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @ipv4_warnings, ptr noundef nonnull %16) #6, !dbg !689
  call void @llvm.dbg.value(metadata ptr %143, metadata !677, metadata !DIExpression()), !dbg !688
  %144 = icmp eq ptr %143, null, !dbg !690
  br i1 %144, label %155, label %145, !dbg !691

145:                                              ; preds = %142
  call void @llvm.lifetime.start.p0(i64 1, ptr nonnull %5) #6, !dbg !692
  call void @llvm.dbg.assign(metadata i8 0, metadata !671, metadata !DIExpression(), metadata !693, metadata ptr %5, metadata !DIExpression()), !dbg !683
  %146 = load i8, ptr %143, align 1, !dbg !694, !tbaa !695
  %147 = add i8 %146, 1, !dbg !696
  store i8 %147, ptr %5, align 1, !dbg !697, !tbaa !695, !DIAssignID !698
  call void @llvm.dbg.assign(metadata i8 %147, metadata !671, metadata !DIExpression(), metadata !698, metadata ptr %5, metadata !DIExpression()), !dbg !683
  %148 = call i64 inttoptr (i64 2 to ptr)(ptr noundef nonnull @ipv4_warnings, ptr noundef nonnull %16, ptr noundef nonnull %5, i64 noundef 0) #6, !dbg !699
  %149 = load i8, ptr %5, align 1, !dbg !700, !tbaa !695
  %150 = icmp ugt i8 %149, 16, !dbg !701
  br i1 %150, label %151, label %154, !dbg !702

151:                                              ; preds = %145
  call void @llvm.lifetime.start.p0(i64 1, ptr nonnull %6) #6, !dbg !703
  store i8 1, ptr %6, align 1, !dbg !704, !tbaa !695, !DIAssignID !705
  call void @llvm.dbg.assign(metadata i8 1, metadata !678, metadata !DIExpression(), metadata !705, metadata ptr %6, metadata !DIExpression()), !dbg !686
  %152 = call i64 inttoptr (i64 2 to ptr)(ptr noundef nonnull @ipv4_bans, ptr noundef nonnull %16, ptr noundef nonnull %6, i64 noundef 0) #6, !dbg !706
  %153 = call i64 inttoptr (i64 3 to ptr)(ptr noundef nonnull @ipv4_warnings, ptr noundef nonnull %16) #6, !dbg !707
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %6) #6, !dbg !708
  br label %154, !dbg !709

154:                                              ; preds = %151, %145
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %5) #6, !dbg !710
  br label %157, !dbg !711

155:                                              ; preds = %142
  call void @llvm.lifetime.start.p0(i64 1, ptr nonnull %7) #6, !dbg !712
  store i8 1, ptr %7, align 1, !dbg !713, !tbaa !695, !DIAssignID !714
  call void @llvm.dbg.assign(metadata i8 1, metadata !681, metadata !DIExpression(), metadata !714, metadata ptr %7, metadata !DIExpression()), !dbg !687
  %156 = call i64 inttoptr (i64 2 to ptr)(ptr noundef nonnull @ipv4_warnings, ptr noundef nonnull %16, ptr noundef nonnull %7, i64 noundef 0) #6, !dbg !715
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %7) #6, !dbg !716
  br label %157

157:                                              ; preds = %155, %154, %138, %135
  %158 = load i16, ptr %83, align 4, !dbg !717, !tbaa !718
  tail call void @llvm.dbg.value(metadata i16 %158, metadata !338, metadata !DIExpression()), !dbg !621
  call void @llvm.lifetime.start.p0(i64 2, ptr nonnull %10)
  call void @llvm.dbg.assign(metadata i1 undef, metadata !597, metadata !DIExpression(), metadata !439, metadata ptr %10, metadata !DIExpression()), !dbg !719
  store i16 %158, ptr %10, align 2, !tbaa !490, !DIAssignID !722
  call void @llvm.dbg.assign(metadata i16 %158, metadata !597, metadata !DIExpression(), metadata !722, metadata ptr %10, metadata !DIExpression()), !dbg !719
  call void @llvm.dbg.value(metadata ptr null, metadata !602, metadata !DIExpression()), !dbg !719
  %159 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @port_bans, ptr noundef nonnull %10) #6, !dbg !723
  call void @llvm.dbg.value(metadata ptr %159, metadata !602, metadata !DIExpression()), !dbg !719
  %160 = icmp eq ptr %159, null, !dbg !724
  call void @llvm.lifetime.end.p0(i64 2, ptr nonnull %10), !dbg !725
  br i1 %160, label %161, label %178, !dbg !726

161:                                              ; preds = %157
  %162 = getelementptr inbounds %struct.tcphdr, ptr %83, i64 0, i32 1, !dbg !727
  %163 = load i16, ptr %162, align 2, !dbg !727, !tbaa !728
  tail call void @llvm.dbg.value(metadata i16 %163, metadata !339, metadata !DIExpression()), !dbg !621
  call void @llvm.lifetime.start.p0(i64 2, ptr nonnull %11)
  call void @llvm.dbg.assign(metadata i1 undef, metadata !597, metadata !DIExpression(), metadata !440, metadata ptr %11, metadata !DIExpression()), !dbg !729
  store i16 %163, ptr %11, align 2, !tbaa !490, !DIAssignID !732
  call void @llvm.dbg.assign(metadata i16 %163, metadata !597, metadata !DIExpression(), metadata !732, metadata ptr %11, metadata !DIExpression()), !dbg !729
  call void @llvm.dbg.value(metadata ptr null, metadata !602, metadata !DIExpression()), !dbg !729
  %164 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @port_bans, ptr noundef nonnull %11) #6, !dbg !733
  call void @llvm.dbg.value(metadata ptr %164, metadata !602, metadata !DIExpression()), !dbg !729
  %165 = icmp eq ptr %164, null, !dbg !734
  call void @llvm.lifetime.end.p0(i64 2, ptr nonnull %11), !dbg !735
  br i1 %165, label %177, label %178

166:                                              ; preds = %100
  tail call void @llvm.dbg.value(metadata ptr null, metadata !340, metadata !DIExpression()), !dbg !736
  tail call void @llvm.dbg.value(metadata ptr undef, metadata !737, metadata !DIExpression()), !dbg !746
  tail call void @llvm.dbg.value(metadata ptr %23, metadata !743, metadata !DIExpression()), !dbg !746
  tail call void @llvm.dbg.value(metadata ptr undef, metadata !744, metadata !DIExpression()), !dbg !746
  tail call void @llvm.dbg.value(metadata ptr %83, metadata !745, metadata !DIExpression()), !dbg !746
  %167 = getelementptr inbounds %struct.icmphdr, ptr %83, i64 1, !dbg !748
  %168 = icmp ugt ptr %167, %23, !dbg !750
  br i1 %168, label %177, label %169, !dbg !751

169:                                              ; preds = %166
  tail call void @llvm.dbg.value(metadata ptr %167, metadata !202, metadata !DIExpression()), !dbg !451
  tail call void @llvm.dbg.value(metadata ptr %83, metadata !340, metadata !DIExpression()), !dbg !736
  call void @llvm.dbg.value(metadata ptr %83, metadata !752, metadata !DIExpression()), !dbg !758
  %170 = load i8, ptr %83, align 4, !dbg !761, !tbaa !762
  call void @llvm.dbg.value(metadata i8 %170, metadata !757, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !758
  %171 = icmp eq i8 %170, 0, !dbg !764
  %172 = call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %171)
  %173 = freeze i1 %172, !dbg !766
  br i1 %173, label %178, label %174, !dbg !766

174:                                              ; preds = %169
  switch i8 %170, label %175 [
    i8 19, label %178
    i8 18, label %178
    i8 17, label %178
    i8 16, label %178
    i8 15, label %178
    i8 14, label %178
    i8 13, label %178
    i8 10, label %178
    i8 9, label %178
    i8 8, label %178
    i8 7, label %178
    i8 6, label %178
    i8 4, label %178
    i8 2, label %178
    i8 1, label %178
  ], !dbg !766

175:                                              ; preds = %174
  %176 = icmp ugt i8 %170, 19, !dbg !767
  br i1 %176, label %178, label %177, !dbg !767

177:                                              ; preds = %166, %175, %85, %100, %161, %113
  br label %178, !dbg !768

178:                                              ; preds = %129, %131, %121, %118, %104, %101, %157, %109, %175, %169, %174, %174, %174, %174, %174, %174, %174, %174, %174, %174, %174, %174, %174, %174, %174, %97, %86, %113, %161, %177
  %179 = phi i32 [ 2, %177 ], [ 1, %113 ], [ 1, %161 ], [ 1, %86 ], [ 1, %97 ], [ 1, %174 ], [ 1, %174 ], [ 1, %174 ], [ 1, %174 ], [ 1, %174 ], [ 1, %174 ], [ 1, %174 ], [ 1, %174 ], [ 1, %174 ], [ 1, %174 ], [ 1, %174 ], [ 1, %174 ], [ 1, %174 ], [ 1, %174 ], [ 1, %174 ], [ 1, %169 ], [ 1, %175 ], [ 1, %109 ], [ 1, %157 ], [ 1, %101 ], [ 1, %104 ], [ 1, %118 ], [ 1, %121 ], [ 1, %129 ], [ 1, %131 ], !dbg !446
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %17) #6, !dbg !769
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %16) #6, !dbg !769
  br label %322

180:                                              ; preds = %72
  call void @llvm.dbg.value(metadata ptr undef, metadata !770, metadata !DIExpression()), !dbg !779
  call void @llvm.dbg.value(metadata ptr %23, metadata !776, metadata !DIExpression()), !dbg !779
  call void @llvm.dbg.value(metadata ptr undef, metadata !777, metadata !DIExpression()), !dbg !779
  call void @llvm.dbg.value(metadata ptr %73, metadata !778, metadata !DIExpression()), !dbg !779
  %181 = getelementptr inbounds %struct.ipv6hdr, ptr %73, i64 1, !dbg !781
  %182 = icmp ugt ptr %181, %23, !dbg !783
  br i1 %182, label %183, label %184, !dbg !784

183:                                              ; preds = %180
  tail call void @llvm.dbg.value(metadata ptr null, metadata !253, metadata !DIExpression()), !dbg !451
  tail call void @llvm.dbg.value(metadata ptr poison, metadata !202, metadata !DIExpression()), !dbg !451
  tail call void @llvm.dbg.value(metadata i32 poison, metadata !366, metadata !DIExpression()), !dbg !449
  call void @llvm.lifetime.start.p0(i64 20, ptr nonnull %18) #6, !dbg !785
  call void @llvm.dbg.assign(metadata i32 128, metadata !369, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 32), metadata !786, metadata ptr %18, metadata !DIExpression()), !dbg !449
  call void @llvm.lifetime.start.p0(i64 20, ptr nonnull %19) #6, !dbg !787
  call void @llvm.dbg.assign(metadata i32 128, metadata !370, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 32), metadata !788, metadata ptr %19, metadata !DIExpression()), !dbg !449
  br label %320, !dbg !789

184:                                              ; preds = %180
  tail call void @llvm.dbg.value(metadata ptr %181, metadata !202, metadata !DIExpression()), !dbg !451
  tail call void @llvm.dbg.value(metadata ptr %73, metadata !253, metadata !DIExpression()), !dbg !451
  tail call void @llvm.dbg.value(metadata ptr undef, metadata !790, metadata !DIExpression()), !dbg !807
  tail call void @llvm.dbg.value(metadata ptr %23, metadata !795, metadata !DIExpression()), !dbg !807
  tail call void @llvm.dbg.value(metadata i8 poison, metadata !796, metadata !DIExpression()), !dbg !807
  tail call void @llvm.dbg.value(metadata i32 0, metadata !797, metadata !DIExpression()), !dbg !809
  tail call void @llvm.dbg.value(metadata ptr %181, metadata !202, metadata !DIExpression()), !dbg !451
  tail call void @llvm.dbg.value(metadata i8 poison, metadata !796, metadata !DIExpression()), !dbg !807
  tail call void @llvm.dbg.value(metadata ptr %181, metadata !799, metadata !DIExpression()), !dbg !810
  %185 = getelementptr inbounds %struct.ipv6hdr, ptr %73, i64 1, i32 1, i64 1
  %186 = icmp ugt ptr %185, %23
  br i1 %186, label %212, label %187, !dbg !811

187:                                              ; preds = %184
  %188 = getelementptr inbounds %struct.ipv6hdr, ptr %73, i64 0, i32 3, !dbg !812
  br label %189, !dbg !811

189:                                              ; preds = %187, %204
  %190 = phi ptr [ %192, %204 ], [ %188, %187 ]
  %191 = phi i32 [ %207, %204 ], [ 0, %187 ]
  %192 = phi ptr [ %206, %204 ], [ %181, %187 ]
  %193 = load i8, ptr %190, align 1, !dbg !813, !tbaa !695
  tail call void @llvm.dbg.value(metadata i32 %191, metadata !797, metadata !DIExpression()), !dbg !809
  tail call void @llvm.dbg.value(metadata ptr %192, metadata !202, metadata !DIExpression()), !dbg !451
  switch i8 %193, label %195 [
    i8 0, label %197
    i8 60, label %197
    i8 43, label %197
    i8 -121, label %197
    i8 51, label %194
    i8 44, label %204
  ], !dbg !814

194:                                              ; preds = %189
  tail call void @llvm.dbg.value(metadata ptr %206, metadata !202, metadata !DIExpression()), !dbg !451
  tail call void @llvm.dbg.value(metadata i8 poison, metadata !796, metadata !DIExpression()), !dbg !807
  br label %197, !dbg !815

195:                                              ; preds = %189
  %196 = zext i8 %193 to i32, !dbg !817
  br label %212, !dbg !818

197:                                              ; preds = %189, %189, %189, %189, %194
  %198 = phi i64 [ 2, %194 ], [ 3, %189 ], [ 3, %189 ], [ 3, %189 ], [ 3, %189 ]
  %199 = getelementptr inbounds %struct.ipv6_opt_hdr, ptr %192, i64 0, i32 1, !dbg !819
  %200 = load i8, ptr %199, align 1, !dbg !819, !tbaa !820
  %201 = zext i8 %200 to i64, !dbg !819
  %202 = shl nuw nsw i64 %201, %198, !dbg !819
  %203 = getelementptr i8, ptr %192, i64 %202, !dbg !819
  br label %204, !dbg !819

204:                                              ; preds = %197, %189
  %205 = phi ptr [ %192, %189 ], [ %203, %197 ]
  %206 = getelementptr i8, ptr %205, i64 8, !dbg !819
  tail call void @llvm.dbg.value(metadata ptr %206, metadata !202, metadata !DIExpression()), !dbg !451
  tail call void @llvm.dbg.value(metadata i8 poison, metadata !796, metadata !DIExpression()), !dbg !807
  %207 = add nuw nsw i32 %191, 1, !dbg !822
  tail call void @llvm.dbg.value(metadata i32 %207, metadata !797, metadata !DIExpression()), !dbg !809
  tail call void @llvm.dbg.value(metadata i8 poison, metadata !796, metadata !DIExpression()), !dbg !807
  %208 = icmp ugt i32 %191, 4, !dbg !823
  tail call void @llvm.dbg.value(metadata ptr %206, metadata !799, metadata !DIExpression()), !dbg !810
  %209 = getelementptr i8, ptr %205, i64 10
  %210 = icmp ugt ptr %209, %23
  %211 = select i1 %208, i1 true, i1 %210, !dbg !811
  br i1 %211, label %212, label %189, !dbg !811, !llvm.loop !824

212:                                              ; preds = %204, %184, %195
  %213 = phi ptr [ %192, %195 ], [ %181, %184 ], [ %206, %204 ]
  %214 = phi i32 [ %196, %195 ], [ -1, %184 ], [ -1, %204 ]
  tail call void @llvm.dbg.value(metadata ptr %213, metadata !202, metadata !DIExpression()), !dbg !451
  tail call void @llvm.dbg.value(metadata ptr %73, metadata !253, metadata !DIExpression()), !dbg !451
  tail call void @llvm.dbg.value(metadata i32 %214, metadata !366, metadata !DIExpression()), !dbg !449
  call void @llvm.lifetime.start.p0(i64 20, ptr nonnull %18) #6, !dbg !785
  store i32 128, ptr %18, align 4, !dbg !827, !tbaa !828, !DIAssignID !786
  call void @llvm.dbg.assign(metadata i32 128, metadata !369, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 32), metadata !786, metadata ptr %18, metadata !DIExpression()), !dbg !449
  call void @llvm.lifetime.start.p0(i64 20, ptr nonnull %19) #6, !dbg !787
  store i32 128, ptr %19, align 4, !dbg !830, !tbaa !828, !DIAssignID !788
  call void @llvm.dbg.assign(metadata i32 128, metadata !370, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 32), metadata !788, metadata ptr %19, metadata !DIExpression()), !dbg !449
  %215 = getelementptr inbounds %struct.ipv6_subnet, ptr %18, i64 0, i32 1, !dbg !831
  %216 = getelementptr inbounds %struct.ipv6hdr, ptr %73, i64 0, i32 5, !dbg !831
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 4 dereferenceable(16) %215, ptr noundef nonnull align 4 dereferenceable(16) %216, i64 16, i1 false), !dbg !831, !DIAssignID !832
  call void @llvm.dbg.assign(metadata i1 undef, metadata !369, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 128), metadata !832, metadata ptr %215, metadata !DIExpression()), !dbg !449
  %217 = getelementptr inbounds %struct.ipv6_subnet, ptr %19, i64 0, i32 1, !dbg !833
  %218 = getelementptr inbounds %struct.ipv6hdr, ptr %73, i64 0, i32 5, i32 0, i32 1, !dbg !833
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 4 dereferenceable(16) %217, ptr noundef nonnull align 4 dereferenceable(16) %218, i64 16, i1 false), !dbg !833, !DIAssignID !834
  call void @llvm.dbg.assign(metadata i1 undef, metadata !370, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 128), metadata !834, metadata ptr %217, metadata !DIExpression()), !dbg !449
  call void @llvm.dbg.value(metadata ptr %18, metadata !835, metadata !DIExpression()), !dbg !841
  call void @llvm.dbg.value(metadata ptr null, metadata !840, metadata !DIExpression()), !dbg !841
  %219 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @ipv6_bans, ptr noundef nonnull %18) #6, !dbg !844
  call void @llvm.dbg.value(metadata ptr %219, metadata !840, metadata !DIExpression()), !dbg !841
  %220 = icmp eq ptr %219, null, !dbg !845
  br i1 %220, label %221, label %321, !dbg !847

221:                                              ; preds = %212
  call void @llvm.dbg.value(metadata ptr %19, metadata !835, metadata !DIExpression()), !dbg !848
  call void @llvm.dbg.value(metadata ptr null, metadata !840, metadata !DIExpression()), !dbg !848
  %222 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @ipv6_bans, ptr noundef nonnull %19) #6, !dbg !851
  call void @llvm.dbg.value(metadata ptr %222, metadata !840, metadata !DIExpression()), !dbg !848
  %223 = icmp eq ptr %222, null, !dbg !852
  br i1 %223, label %224, label %321, !dbg !853

224:                                              ; preds = %221
  switch i32 %214, label %320 [
    i32 17, label %225
    i32 6, label %242
    i32 1, label %290
    i32 58, label %303
  ], !dbg !854

225:                                              ; preds = %224
  tail call void @llvm.dbg.value(metadata ptr null, metadata !371, metadata !DIExpression()), !dbg !855
  call void @llvm.dbg.value(metadata ptr undef, metadata !573, metadata !DIExpression()), !dbg !856
  call void @llvm.dbg.value(metadata ptr %23, metadata !579, metadata !DIExpression()), !dbg !856
  call void @llvm.dbg.value(metadata ptr undef, metadata !580, metadata !DIExpression()), !dbg !856
  call void @llvm.dbg.value(metadata ptr %213, metadata !582, metadata !DIExpression()), !dbg !856
  %226 = getelementptr inbounds %struct.udphdr, ptr %213, i64 1, !dbg !858
  %227 = icmp ugt ptr %226, %23, !dbg !859
  br i1 %227, label %321, label %228, !dbg !860

228:                                              ; preds = %225
  tail call void @llvm.dbg.value(metadata ptr %226, metadata !202, metadata !DIExpression()), !dbg !451
  tail call void @llvm.dbg.value(metadata ptr %213, metadata !371, metadata !DIExpression()), !dbg !855
  %229 = getelementptr inbounds %struct.udphdr, ptr %213, i64 0, i32 2, !dbg !861
  %230 = load i16, ptr %229, align 2, !dbg !861, !tbaa !590
  %231 = call i16 @llvm.bswap.i16(i16 %230), !dbg !861
  call void @llvm.dbg.value(metadata i16 %231, metadata !581, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_constu, 8, DW_OP_minus, DW_OP_stack_value)), !dbg !856
  %232 = icmp ult i16 %231, 8, !dbg !862
  br i1 %232, label %321, label %233, !dbg !863

233:                                              ; preds = %228
  call void @llvm.dbg.value(metadata i16 %231, metadata !581, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_constu, 8, DW_OP_minus, DW_OP_stack_value)), !dbg !856
  call void @llvm.dbg.value(metadata i16 %231, metadata !581, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_constu, 8, DW_OP_minus, DW_OP_stack_value)), !dbg !856
  tail call void @llvm.dbg.value(metadata ptr %213, metadata !371, metadata !DIExpression()), !dbg !855
  tail call void @llvm.dbg.value(metadata i16 %231, metadata !376, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_constu, 8, DW_OP_minus, DW_OP_stack_value)), !dbg !855
  %234 = load i16, ptr %213, align 2, !dbg !864, !tbaa !596
  tail call void @llvm.dbg.value(metadata i16 %234, metadata !377, metadata !DIExpression()), !dbg !855
  call void @llvm.lifetime.start.p0(i64 2, ptr nonnull %12)
  call void @llvm.dbg.assign(metadata i1 undef, metadata !597, metadata !DIExpression(), metadata !441, metadata ptr %12, metadata !DIExpression()), !dbg !865
  store i16 %234, ptr %12, align 2, !tbaa !490, !DIAssignID !868
  call void @llvm.dbg.assign(metadata i16 %234, metadata !597, metadata !DIExpression(), metadata !868, metadata ptr %12, metadata !DIExpression()), !dbg !865
  call void @llvm.dbg.value(metadata ptr null, metadata !602, metadata !DIExpression()), !dbg !865
  %235 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @port_bans, ptr noundef nonnull %12) #6, !dbg !869
  call void @llvm.dbg.value(metadata ptr %235, metadata !602, metadata !DIExpression()), !dbg !865
  %236 = icmp eq ptr %235, null, !dbg !870
  call void @llvm.lifetime.end.p0(i64 2, ptr nonnull %12), !dbg !871
  br i1 %236, label %237, label %321, !dbg !872

237:                                              ; preds = %233
  %238 = getelementptr inbounds %struct.udphdr, ptr %213, i64 0, i32 1, !dbg !873
  %239 = load i16, ptr %238, align 2, !dbg !873, !tbaa !613
  tail call void @llvm.dbg.value(metadata i16 %239, metadata !378, metadata !DIExpression()), !dbg !855
  call void @llvm.lifetime.start.p0(i64 2, ptr nonnull %13)
  call void @llvm.dbg.assign(metadata i1 undef, metadata !597, metadata !DIExpression(), metadata !442, metadata ptr %13, metadata !DIExpression()), !dbg !874
  store i16 %239, ptr %13, align 2, !tbaa !490, !DIAssignID !877
  call void @llvm.dbg.assign(metadata i16 %239, metadata !597, metadata !DIExpression(), metadata !877, metadata ptr %13, metadata !DIExpression()), !dbg !874
  call void @llvm.dbg.value(metadata ptr null, metadata !602, metadata !DIExpression()), !dbg !874
  %240 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @port_bans, ptr noundef nonnull %13) #6, !dbg !878
  call void @llvm.dbg.value(metadata ptr %240, metadata !602, metadata !DIExpression()), !dbg !874
  %241 = icmp eq ptr %240, null, !dbg !879
  call void @llvm.lifetime.end.p0(i64 2, ptr nonnull %13), !dbg !880
  br i1 %241, label %320, label %321

242:                                              ; preds = %224
  tail call void @llvm.dbg.value(metadata ptr null, metadata !379, metadata !DIExpression()), !dbg !881
  tail call void @llvm.dbg.value(metadata ptr undef, metadata !622, metadata !DIExpression()), !dbg !882
  tail call void @llvm.dbg.value(metadata ptr %23, metadata !628, metadata !DIExpression()), !dbg !882
  tail call void @llvm.dbg.value(metadata ptr undef, metadata !629, metadata !DIExpression()), !dbg !882
  tail call void @llvm.dbg.value(metadata ptr %213, metadata !631, metadata !DIExpression()), !dbg !882
  %243 = getelementptr inbounds %struct.tcphdr, ptr %213, i64 1, !dbg !884
  %244 = icmp ugt ptr %243, %23, !dbg !885
  br i1 %244, label %321, label %245, !dbg !886

245:                                              ; preds = %242
  %246 = getelementptr inbounds %struct.tcphdr, ptr %213, i64 0, i32 4, !dbg !887
  %247 = load i16, ptr %246, align 4, !dbg !887
  %248 = lshr i16 %247, 2, !dbg !888
  %249 = and i16 %248, 60, !dbg !888
  tail call void @llvm.dbg.value(metadata i16 %249, metadata !630, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !882
  %250 = zext nneg i16 %249 to i64
  %251 = getelementptr inbounds i8, ptr %213, i64 %250, !dbg !889
  %252 = icmp ugt ptr %251, %23, !dbg !890
  br i1 %252, label %321, label %253, !dbg !891

253:                                              ; preds = %245
  tail call void @llvm.dbg.value(metadata i16 %249, metadata !630, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !882
  tail call void @llvm.dbg.value(metadata ptr %243, metadata !202, metadata !DIExpression()), !dbg !451
  tail call void @llvm.dbg.value(metadata ptr %213, metadata !379, metadata !DIExpression()), !dbg !881
  tail call void @llvm.dbg.value(metadata i16 %249, metadata !382, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !881
  tail call void @llvm.dbg.value(metadata ptr %213, metadata !644, metadata !DIExpression()), !dbg !892
  %254 = and i16 %247, -256, !dbg !895
  switch i16 %254, label %259 [
    i16 256, label %321
    i16 5120, label %255
  ], !dbg !895

255:                                              ; preds = %253
  %256 = getelementptr inbounds %struct.tcphdr, ptr %213, i64 0, i32 5, !dbg !896
  %257 = load i16, ptr %256, align 2, !dbg !896, !tbaa !656
  %258 = icmp eq i16 %257, 0, !dbg !897
  br i1 %258, label %321, label %259, !dbg !898

259:                                              ; preds = %253, %255
  tail call void @llvm.dbg.value(metadata ptr %213, metadata !660, metadata !DIExpression()), !dbg !899
  %260 = and i16 %247, -8448, !dbg !902
  %261 = icmp eq i16 %260, 512, !dbg !902
  br i1 %261, label %262, label %281, !dbg !902

262:                                              ; preds = %259
  %263 = getelementptr inbounds %struct.tcphdr, ptr %213, i64 0, i32 5, !dbg !903
  %264 = load i16, ptr %263, align 2, !dbg !903, !tbaa !656
  %265 = icmp eq i16 %264, -3846, !dbg !904
  br i1 %265, label %266, label %281, !dbg !905

266:                                              ; preds = %262
  call void @llvm.dbg.assign(metadata i1 undef, metadata !906, metadata !DIExpression(), metadata !431, metadata ptr %2, metadata !DIExpression()), !dbg !918
  call void @llvm.dbg.assign(metadata i1 undef, metadata !913, metadata !DIExpression(), metadata !432, metadata ptr %3, metadata !DIExpression()), !dbg !921
  call void @llvm.dbg.assign(metadata i1 undef, metadata !916, metadata !DIExpression(), metadata !433, metadata ptr %4, metadata !DIExpression()), !dbg !922
  call void @llvm.dbg.value(metadata ptr %18, metadata !911, metadata !DIExpression()), !dbg !923
  call void @llvm.dbg.value(metadata ptr null, metadata !912, metadata !DIExpression()), !dbg !923
  %267 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @ipv6_warnings, ptr noundef nonnull %18) #6, !dbg !924
  call void @llvm.dbg.value(metadata ptr %267, metadata !912, metadata !DIExpression()), !dbg !923
  %268 = icmp eq ptr %267, null, !dbg !925
  br i1 %268, label %279, label %269, !dbg !926

269:                                              ; preds = %266
  call void @llvm.lifetime.start.p0(i64 1, ptr nonnull %2) #6, !dbg !927
  call void @llvm.dbg.assign(metadata i8 0, metadata !906, metadata !DIExpression(), metadata !928, metadata ptr %2, metadata !DIExpression()), !dbg !918
  %270 = load i8, ptr %267, align 1, !dbg !929, !tbaa !695
  %271 = add i8 %270, 1, !dbg !930
  store i8 %271, ptr %2, align 1, !dbg !931, !tbaa !695, !DIAssignID !932
  call void @llvm.dbg.assign(metadata i8 %271, metadata !906, metadata !DIExpression(), metadata !932, metadata ptr %2, metadata !DIExpression()), !dbg !918
  %272 = call i64 inttoptr (i64 2 to ptr)(ptr noundef nonnull @ipv6_warnings, ptr noundef nonnull %18, ptr noundef nonnull %2, i64 noundef 0) #6, !dbg !933
  %273 = load i8, ptr %2, align 1, !dbg !934, !tbaa !695
  %274 = icmp ugt i8 %273, 16, !dbg !935
  br i1 %274, label %275, label %278, !dbg !936

275:                                              ; preds = %269
  call void @llvm.lifetime.start.p0(i64 1, ptr nonnull %3) #6, !dbg !937
  store i8 1, ptr %3, align 1, !dbg !938, !tbaa !695, !DIAssignID !939
  call void @llvm.dbg.assign(metadata i8 1, metadata !913, metadata !DIExpression(), metadata !939, metadata ptr %3, metadata !DIExpression()), !dbg !921
  %276 = call i64 inttoptr (i64 2 to ptr)(ptr noundef nonnull @ipv6_bans, ptr noundef nonnull %18, ptr noundef nonnull %3, i64 noundef 0) #6, !dbg !940
  %277 = call i64 inttoptr (i64 3 to ptr)(ptr noundef nonnull @ipv6_warnings, ptr noundef nonnull %18) #6, !dbg !941
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %3) #6, !dbg !942
  br label %278, !dbg !943

278:                                              ; preds = %275, %269
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %2) #6, !dbg !944
  br label %281, !dbg !945

279:                                              ; preds = %266
  call void @llvm.lifetime.start.p0(i64 1, ptr nonnull %4) #6, !dbg !946
  store i8 1, ptr %4, align 1, !dbg !947, !tbaa !695, !DIAssignID !948
  call void @llvm.dbg.assign(metadata i8 1, metadata !916, metadata !DIExpression(), metadata !948, metadata ptr %4, metadata !DIExpression()), !dbg !922
  %280 = call i64 inttoptr (i64 2 to ptr)(ptr noundef nonnull @ipv6_warnings, ptr noundef nonnull %18, ptr noundef nonnull %4, i64 noundef 0) #6, !dbg !949
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %4) #6, !dbg !950
  br label %281

281:                                              ; preds = %279, %278, %262, %259
  %282 = load i16, ptr %213, align 4, !dbg !951, !tbaa !718
  tail call void @llvm.dbg.value(metadata i16 %282, metadata !383, metadata !DIExpression()), !dbg !881
  call void @llvm.lifetime.start.p0(i64 2, ptr nonnull %14)
  call void @llvm.dbg.assign(metadata i1 undef, metadata !597, metadata !DIExpression(), metadata !443, metadata ptr %14, metadata !DIExpression()), !dbg !952
  store i16 %282, ptr %14, align 2, !tbaa !490, !DIAssignID !955
  call void @llvm.dbg.assign(metadata i16 %282, metadata !597, metadata !DIExpression(), metadata !955, metadata ptr %14, metadata !DIExpression()), !dbg !952
  call void @llvm.dbg.value(metadata ptr null, metadata !602, metadata !DIExpression()), !dbg !952
  %283 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @port_bans, ptr noundef nonnull %14) #6, !dbg !956
  call void @llvm.dbg.value(metadata ptr %283, metadata !602, metadata !DIExpression()), !dbg !952
  %284 = icmp eq ptr %283, null, !dbg !957
  call void @llvm.lifetime.end.p0(i64 2, ptr nonnull %14), !dbg !958
  br i1 %284, label %285, label %321, !dbg !959

285:                                              ; preds = %281
  %286 = getelementptr inbounds %struct.tcphdr, ptr %213, i64 0, i32 1, !dbg !960
  %287 = load i16, ptr %286, align 2, !dbg !960, !tbaa !728
  tail call void @llvm.dbg.value(metadata i16 %287, metadata !384, metadata !DIExpression()), !dbg !881
  call void @llvm.lifetime.start.p0(i64 2, ptr nonnull %15)
  call void @llvm.dbg.assign(metadata i1 undef, metadata !597, metadata !DIExpression(), metadata !444, metadata ptr %15, metadata !DIExpression()), !dbg !961
  store i16 %287, ptr %15, align 2, !tbaa !490, !DIAssignID !964
  call void @llvm.dbg.assign(metadata i16 %287, metadata !597, metadata !DIExpression(), metadata !964, metadata ptr %15, metadata !DIExpression()), !dbg !961
  call void @llvm.dbg.value(metadata ptr null, metadata !602, metadata !DIExpression()), !dbg !961
  %288 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @port_bans, ptr noundef nonnull %15) #6, !dbg !965
  call void @llvm.dbg.value(metadata ptr %288, metadata !602, metadata !DIExpression()), !dbg !961
  %289 = icmp eq ptr %288, null, !dbg !966
  call void @llvm.lifetime.end.p0(i64 2, ptr nonnull %15), !dbg !967
  br i1 %289, label %320, label %321

290:                                              ; preds = %224
  tail call void @llvm.dbg.value(metadata ptr null, metadata !385, metadata !DIExpression()), !dbg !968
  tail call void @llvm.dbg.value(metadata ptr undef, metadata !737, metadata !DIExpression()), !dbg !969
  tail call void @llvm.dbg.value(metadata ptr %23, metadata !743, metadata !DIExpression()), !dbg !969
  tail call void @llvm.dbg.value(metadata ptr undef, metadata !744, metadata !DIExpression()), !dbg !969
  tail call void @llvm.dbg.value(metadata ptr %213, metadata !745, metadata !DIExpression()), !dbg !969
  %291 = getelementptr inbounds %struct.icmphdr, ptr %213, i64 1, !dbg !971
  %292 = icmp ugt ptr %291, %23, !dbg !972
  tail call void @llvm.dbg.value(metadata ptr %291, metadata !202, metadata !DIExpression()), !dbg !451
  tail call void @llvm.dbg.value(metadata ptr %213, metadata !385, metadata !DIExpression()), !dbg !968
  %293 = icmp eq ptr %213, null
  %294 = or i1 %293, %292, !dbg !973
  br i1 %294, label %320, label %295, !dbg !973

295:                                              ; preds = %290
  call void @llvm.dbg.value(metadata ptr %213, metadata !752, metadata !DIExpression()), !dbg !974
  %296 = load i8, ptr %213, align 4, !dbg !977, !tbaa !762
  call void @llvm.dbg.value(metadata i8 %296, metadata !757, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !974
  %297 = icmp eq i8 %296, 0, !dbg !978
  %298 = call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %297)
  %299 = freeze i1 %298, !dbg !979
  br i1 %299, label %321, label %300, !dbg !979

300:                                              ; preds = %295
  switch i8 %296, label %301 [
    i8 19, label %321
    i8 18, label %321
    i8 17, label %321
    i8 16, label %321
    i8 15, label %321
    i8 14, label %321
    i8 13, label %321
    i8 10, label %321
    i8 9, label %321
    i8 8, label %321
    i8 7, label %321
    i8 6, label %321
    i8 4, label %321
    i8 2, label %321
    i8 1, label %321
  ], !dbg !979

301:                                              ; preds = %300
  %302 = icmp ugt i8 %296, 19, !dbg !980
  br i1 %302, label %321, label %320, !dbg !980

303:                                              ; preds = %224
  tail call void @llvm.dbg.value(metadata ptr null, metadata !388, metadata !DIExpression()), !dbg !981
  tail call void @llvm.dbg.value(metadata ptr undef, metadata !982, metadata !DIExpression()), !dbg !991
  tail call void @llvm.dbg.value(metadata ptr %23, metadata !988, metadata !DIExpression()), !dbg !991
  tail call void @llvm.dbg.value(metadata ptr undef, metadata !989, metadata !DIExpression()), !dbg !991
  tail call void @llvm.dbg.value(metadata ptr %213, metadata !990, metadata !DIExpression()), !dbg !991
  %304 = getelementptr inbounds %struct.icmp6hdr, ptr %213, i64 1, !dbg !993
  %305 = icmp ugt ptr %304, %23, !dbg !995
  tail call void @llvm.dbg.value(metadata ptr %304, metadata !202, metadata !DIExpression()), !dbg !451
  tail call void @llvm.dbg.value(metadata ptr %213, metadata !388, metadata !DIExpression()), !dbg !981
  %306 = icmp eq ptr %213, null
  %307 = or i1 %306, %305, !dbg !996
  br i1 %307, label %320, label %308, !dbg !996

308:                                              ; preds = %303
  call void @llvm.dbg.value(metadata ptr %213, metadata !997, metadata !DIExpression()), !dbg !1003
  %309 = load i8, ptr %213, align 4, !dbg !1006, !tbaa !1007
  call void @llvm.dbg.value(metadata i8 %309, metadata !1002, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1003
  %310 = icmp eq i8 %309, 0, !dbg !1009
  %311 = call i1 @llvm.bpf.passthrough.i1.i1(i32 1, i1 %310)
  %312 = freeze i1 %311, !dbg !1011
  br i1 %312, label %321, label %313, !dbg !1011

313:                                              ; preds = %308
  switch i8 %309, label %314 [
    i8 19, label %321
    i8 18, label %321
    i8 17, label %321
    i8 16, label %321
    i8 15, label %321
    i8 14, label %321
    i8 13, label %321
    i8 10, label %321
    i8 9, label %321
    i8 8, label %321
    i8 7, label %321
    i8 6, label %321
    i8 4, label %321
    i8 2, label %321
    i8 1, label %321
  ], !dbg !1011

314:                                              ; preds = %313
  %315 = add i8 %309, -20, !dbg !1012
  %316 = icmp ult i8 %315, 110, !dbg !1012
  br i1 %316, label %321, label %317, !dbg !1012

317:                                              ; preds = %314
  switch i8 %309, label %318 [
    i8 -102, label %321
    i8 -103, label %321
    i8 -104, label %321
    i8 -105, label %321
    i8 -106, label %321
    i8 -120, label %321
    i8 -121, label %321
    i8 -122, label %321
    i8 -123, label %321
  ], !dbg !1013

318:                                              ; preds = %317
  %319 = icmp ugt i8 %309, -101, !dbg !1014
  br i1 %319, label %321, label %320, !dbg !1015

320:                                              ; preds = %303, %290, %318, %301, %183, %224, %237, %285
  call void @llvm.lifetime.end.p0(i64 20, ptr nonnull %19) #6, !dbg !1016
  call void @llvm.lifetime.end.p0(i64 20, ptr nonnull %18) #6, !dbg !1016
  br label %322

321:                                              ; preds = %253, %255, %245, %242, %228, %225, %281, %233, %314, %318, %308, %313, %313, %313, %313, %313, %313, %313, %313, %313, %313, %313, %313, %313, %313, %313, %317, %317, %317, %317, %317, %317, %317, %317, %317, %301, %295, %300, %300, %300, %300, %300, %300, %300, %300, %300, %300, %300, %300, %300, %300, %300, %221, %212, %237, %285
  call void @llvm.lifetime.end.p0(i64 20, ptr nonnull %19) #6, !dbg !1016
  call void @llvm.lifetime.end.p0(i64 20, ptr nonnull %18) #6, !dbg !1016
  br label %322

322:                                              ; preds = %178, %321, %320, %72, %1
  %323 = phi i32 [ 1, %1 ], [ %179, %178 ], [ 1, %321 ], [ 2, %320 ], [ 2, %72 ], !dbg !451
  ret i32 %323, !dbg !1017
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.bswap.i16(i16) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.assign(metadata, metadata, metadata, metadata, metadata, metadata) #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.value(metadata, metadata, metadata) #4

; Function Attrs: nounwind memory(none)
declare i1 @llvm.bpf.passthrough.i1.i1(i32, i1) #5

attributes #0 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #5 = { nounwind memory(none) }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!179, !180, !181, !182, !183}
!llvm.ident = !{!184}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !63, line: 659, type: !178, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "clang version 18.1.8", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !52, globals: !60, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/cookiengineer/Software/tholian-network/firewall/ebpf/module/module.c", directory: "/home/cookiengineer/Software/tholian-network/firewall/ebpf", checksumkind: CSK_MD5, checksum: "65f0b760f58ab0c36a472e9972303a8c")
!4 = !{!5, !14, !46}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "xdp_action", file: !6, line: 6312, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "module/../headers/bpf.h", directory: "/home/cookiengineer/Software/tholian-network/firewall/ebpf", checksumkind: CSK_MD5, checksum: "5915eac3bf7f25498b164b755f1ae9b7")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11, !12, !13}
!9 = !DIEnumerator(name: "XDP_ABORTED", value: 0)
!10 = !DIEnumerator(name: "XDP_DROP", value: 1)
!11 = !DIEnumerator(name: "XDP_PASS", value: 2)
!12 = !DIEnumerator(name: "XDP_TX", value: 3)
!13 = !DIEnumerator(name: "XDP_REDIRECT", value: 4)
!14 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !15, line: 29, baseType: !7, size: 32, elements: !16)
!15 = !DIFile(filename: "/usr/include/linux/in.h", directory: "", checksumkind: CSK_MD5, checksum: "fcee415bb19db8acb968eeda6f02fa29")
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
!46 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !6, line: 1277, baseType: !7, size: 32, elements: !47)
!47 = !{!48, !49, !50, !51}
!48 = !DIEnumerator(name: "BPF_ANY", value: 0)
!49 = !DIEnumerator(name: "BPF_NOEXIST", value: 1)
!50 = !DIEnumerator(name: "BPF_EXIST", value: 2)
!51 = !DIEnumerator(name: "BPF_F_LOCK", value: 4)
!52 = !{!53, !54, !55, !58}
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!54 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !56, line: 5, baseType: !57)
!56 = !DIFile(filename: "module/../headers/common.h", directory: "/home/cookiengineer/Software/tholian-network/firewall/ebpf", checksumkind: CSK_MD5, checksum: "26133999c1b887ae56aef26c8c215378")
!57 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!60 = !{!0, !61, !86, !108, !124, !141, !149, !158, !166, !173}
!61 = !DIGlobalVariableExpression(var: !62, expr: !DIExpression())
!62 = distinct !DIGlobalVariable(name: "domain_bans", scope: !2, file: !63, line: 33, type: !64, isLocal: false, isDefinition: true)
!63 = !DIFile(filename: "module/module.c", directory: "/home/cookiengineer/Software/tholian-network/firewall/ebpf", checksumkind: CSK_MD5, checksum: "65f0b760f58ab0c36a472e9972303a8c")
!64 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !63, line: 28, size: 256, elements: !65)
!65 = !{!66, !72, !77, !82}
!66 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !64, file: !63, line: 29, baseType: !67, size: 64)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DICompositeType(tag: DW_TAG_array_type, baseType: !69, size: 32, elements: !70)
!69 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!70 = !{!71}
!71 = !DISubrange(count: 1)
!72 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !64, file: !63, line: 30, baseType: !73, size: 64, offset: 64)
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DICompositeType(tag: DW_TAG_array_type, baseType: !69, size: 2097120, elements: !75)
!75 = !{!76}
!76 = !DISubrange(count: 65535)
!77 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !64, file: !63, line: 31, baseType: !78, size: 64, offset: 128)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DICompositeType(tag: DW_TAG_array_type, baseType: !69, size: 8128, elements: !80)
!80 = !{!81}
!81 = !DISubrange(count: 254)
!82 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !64, file: !63, line: 32, baseType: !83, size: 64, offset: 192)
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !56, line: 3, baseType: !85)
!85 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!86 = !DIGlobalVariableExpression(var: !87, expr: !DIExpression())
!87 = distinct !DIGlobalVariable(name: "ipv4_bans", scope: !2, file: !63, line: 42, type: !88, isLocal: false, isDefinition: true)
!88 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !63, line: 36, size: 320, elements: !89)
!89 = !{!90, !95, !96, !106, !107}
!90 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !88, file: !63, line: 37, baseType: !91, size: 64)
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !92, size: 64)
!92 = !DICompositeType(tag: DW_TAG_array_type, baseType: !69, size: 352, elements: !93)
!93 = !{!94}
!94 = !DISubrange(count: 11)
!95 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !88, file: !63, line: 38, baseType: !73, size: 64, offset: 64)
!96 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !88, file: !63, line: 39, baseType: !97, size: 64, offset: 128)
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !98, size: 64)
!98 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipv4_subnet", file: !63, line: 17, size: 64, elements: !99)
!99 = !{!100, !102}
!100 = !DIDerivedType(tag: DW_TAG_member, name: "prefixlen", scope: !98, file: !63, line: 18, baseType: !101, size: 32)
!101 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !56, line: 7, baseType: !7)
!102 = !DIDerivedType(tag: DW_TAG_member, name: "address", scope: !98, file: !63, line: 19, baseType: !103, size: 32, offset: 32)
!103 = !DICompositeType(tag: DW_TAG_array_type, baseType: !84, size: 32, elements: !104)
!104 = !{!105}
!105 = !DISubrange(count: 4)
!106 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !88, file: !63, line: 40, baseType: !83, size: 64, offset: 192)
!107 = !DIDerivedType(tag: DW_TAG_member, name: "map_flags", scope: !88, file: !63, line: 41, baseType: !67, size: 64, offset: 256)
!108 = !DIGlobalVariableExpression(var: !109, expr: !DIExpression())
!109 = distinct !DIGlobalVariable(name: "ipv4_warnings", scope: !2, file: !63, line: 50, type: !110, isLocal: false, isDefinition: true)
!110 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !63, line: 45, size: 256, elements: !111)
!111 = !{!112, !117, !122, !123}
!112 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !110, file: !63, line: 46, baseType: !113, size: 64)
!113 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !114, size: 64)
!114 = !DICompositeType(tag: DW_TAG_array_type, baseType: !69, size: 288, elements: !115)
!115 = !{!116}
!116 = !DISubrange(count: 9)
!117 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !110, file: !63, line: 47, baseType: !118, size: 64, offset: 64)
!118 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !119, size: 64)
!119 = !DICompositeType(tag: DW_TAG_array_type, baseType: !69, size: 4096, elements: !120)
!120 = !{!121}
!121 = !DISubrange(count: 128)
!122 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !110, file: !63, line: 48, baseType: !97, size: 64, offset: 128)
!123 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !110, file: !63, line: 49, baseType: !83, size: 64, offset: 192)
!124 = !DIGlobalVariableExpression(var: !125, expr: !DIExpression())
!125 = distinct !DIGlobalVariable(name: "ipv6_bans", scope: !2, file: !63, line: 59, type: !126, isLocal: false, isDefinition: true)
!126 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !63, line: 53, size: 320, elements: !127)
!127 = !{!128, !129, !130, !139, !140}
!128 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !126, file: !63, line: 54, baseType: !91, size: 64)
!129 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !126, file: !63, line: 55, baseType: !73, size: 64, offset: 64)
!130 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !126, file: !63, line: 56, baseType: !131, size: 64, offset: 128)
!131 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !132, size: 64)
!132 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipv6_subnet", file: !63, line: 22, size: 160, elements: !133)
!133 = !{!134, !135}
!134 = !DIDerivedType(tag: DW_TAG_member, name: "prefixlen", scope: !132, file: !63, line: 23, baseType: !101, size: 32)
!135 = !DIDerivedType(tag: DW_TAG_member, name: "address", scope: !132, file: !63, line: 24, baseType: !136, size: 128, offset: 32)
!136 = !DICompositeType(tag: DW_TAG_array_type, baseType: !84, size: 128, elements: !137)
!137 = !{!138}
!138 = !DISubrange(count: 16)
!139 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !126, file: !63, line: 57, baseType: !83, size: 64, offset: 192)
!140 = !DIDerivedType(tag: DW_TAG_member, name: "map_flags", scope: !126, file: !63, line: 58, baseType: !67, size: 64, offset: 256)
!141 = !DIGlobalVariableExpression(var: !142, expr: !DIExpression())
!142 = distinct !DIGlobalVariable(name: "ipv6_warnings", scope: !2, file: !63, line: 67, type: !143, isLocal: false, isDefinition: true)
!143 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !63, line: 62, size: 256, elements: !144)
!144 = !{!145, !146, !147, !148}
!145 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !143, file: !63, line: 63, baseType: !113, size: 64)
!146 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !143, file: !63, line: 64, baseType: !118, size: 64, offset: 64)
!147 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !143, file: !63, line: 65, baseType: !131, size: 64, offset: 128)
!148 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !143, file: !63, line: 66, baseType: !83, size: 64, offset: 192)
!149 = !DIGlobalVariableExpression(var: !150, expr: !DIExpression())
!150 = distinct !DIGlobalVariable(name: "port_bans", scope: !2, file: !63, line: 75, type: !151, isLocal: false, isDefinition: true)
!151 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !63, line: 70, size: 256, elements: !152)
!152 = !{!153, !154, !155, !157}
!153 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !151, file: !63, line: 71, baseType: !67, size: 64)
!154 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !151, file: !63, line: 72, baseType: !73, size: 64, offset: 64)
!155 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !151, file: !63, line: 73, baseType: !156, size: 64, offset: 128)
!156 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!157 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !151, file: !63, line: 74, baseType: !83, size: 64, offset: 192)
!158 = !DIGlobalVariableExpression(var: !159, expr: !DIExpression(DW_OP_constu, 1, DW_OP_stack_value))
!159 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !2, file: !160, line: 51, type: !161, isLocal: true, isDefinition: true)
!160 = !DIFile(filename: "module/../headers/bpf_helper_defs.h", directory: "/home/cookiengineer/Software/tholian-network/firewall/ebpf", checksumkind: CSK_MD5, checksum: "67458ddab14190d1ab39602394f9ecef")
!161 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !162, size: 64)
!162 = !DISubroutineType(types: !163)
!163 = !{!53, !53, !164}
!164 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !165, size: 64)
!165 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!166 = !DIGlobalVariableExpression(var: !167, expr: !DIExpression(DW_OP_constu, 2, DW_OP_stack_value))
!167 = distinct !DIGlobalVariable(name: "bpf_map_update_elem", scope: !2, file: !160, line: 73, type: !168, isLocal: true, isDefinition: true)
!168 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !169, size: 64)
!169 = !DISubroutineType(types: !170)
!170 = !{!54, !53, !164, !164, !171}
!171 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !56, line: 9, baseType: !172)
!172 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!173 = !DIGlobalVariableExpression(var: !174, expr: !DIExpression(DW_OP_constu, 3, DW_OP_stack_value))
!174 = distinct !DIGlobalVariable(name: "bpf_map_delete_elem", scope: !2, file: !160, line: 83, type: !175, isLocal: true, isDefinition: true)
!175 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !176, size: 64)
!176 = !DISubroutineType(types: !177)
!177 = !{!54, !53, !164}
!178 = !DICompositeType(tag: DW_TAG_array_type, baseType: !59, size: 32, elements: !104)
!179 = !{i32 7, !"Dwarf Version", i32 5}
!180 = !{i32 2, !"Debug Info Version", i32 3}
!181 = !{i32 1, !"wchar_size", i32 4}
!182 = !{i32 7, !"frame-pointer", i32 2}
!183 = !{i32 7, !"debug-info-assignment-tracking", i1 true}
!184 = !{!"clang version 18.1.8"}
!185 = distinct !DISubprogram(name: "xdp_prog_main", scope: !63, file: !63, line: 321, type: !186, scopeLine: 321, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !197)
!186 = !DISubroutineType(types: !187)
!187 = !{!69, !188}
!188 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !189, size: 64)
!189 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !6, line: 6323, size: 192, elements: !190)
!190 = !{!191, !192, !193, !194, !195, !196}
!191 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !189, file: !6, line: 6324, baseType: !101, size: 32)
!192 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !189, file: !6, line: 6325, baseType: !101, size: 32, offset: 32)
!193 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !189, file: !6, line: 6326, baseType: !101, size: 32, offset: 64)
!194 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !189, file: !6, line: 6328, baseType: !101, size: 32, offset: 96)
!195 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !189, file: !6, line: 6329, baseType: !101, size: 32, offset: 128)
!196 = !DIDerivedType(tag: DW_TAG_member, name: "egress_ifindex", scope: !189, file: !6, line: 6331, baseType: !101, size: 32, offset: 160)
!197 = !{!198, !199, !200, !201, !202, !207, !222, !253, !294, !297, !298, !299, !310, !311, !312, !313, !337, !338, !339, !340, !366, !369, !370, !371, !376, !377, !378, !379, !382, !383, !384, !385, !388}
!198 = !DILocalVariable(name: "ctx", arg: 1, scope: !185, file: !63, line: 321, type: !188)
!199 = !DILocalVariable(name: "data_end", scope: !185, file: !63, line: 324, type: !53)
!200 = !DILocalVariable(name: "data", scope: !185, file: !63, line: 325, type: !53)
!201 = !DILocalVariable(name: "ethernet_protocol", scope: !185, file: !63, line: 331, type: !69)
!202 = !DILocalVariable(name: "cursor", scope: !185, file: !63, line: 332, type: !203)
!203 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "hdr_cursor", file: !204, line: 28, size: 64, elements: !205)
!204 = !DIFile(filename: "module/module.h", directory: "/home/cookiengineer/Software/tholian-network/firewall/ebpf", checksumkind: CSK_MD5, checksum: "a8cb7812e84cb0d7626c35fc624fbe3c")
!205 = !{!206}
!206 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !203, file: !204, line: 29, baseType: !53, size: 64)
!207 = !DILocalVariable(name: "ethernet_header", scope: !185, file: !63, line: 333, type: !208)
!208 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !209, size: 64)
!209 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !210, line: 173, size: 112, elements: !211)
!210 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "", checksumkind: CSK_MD5, checksum: "163f54fb1af2e21fea410f14eb18fa76")
!211 = !{!212, !216, !217}
!212 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !209, file: !210, line: 174, baseType: !213, size: 48)
!213 = !DICompositeType(tag: DW_TAG_array_type, baseType: !85, size: 48, elements: !214)
!214 = !{!215}
!215 = !DISubrange(count: 6)
!216 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !209, file: !210, line: 175, baseType: !213, size: 48, offset: 48)
!217 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !209, file: !210, line: 176, baseType: !218, size: 16, offset: 96)
!218 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !219, line: 32, baseType: !220)
!219 = !DIFile(filename: "/usr/include/linux/types.h", directory: "", checksumkind: CSK_MD5, checksum: "bf9fbc0e8f60927fef9d8917535375a6")
!220 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !221, line: 24, baseType: !57)
!221 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "", checksumkind: CSK_MD5, checksum: "b810f270733e106319b67ef512c6246e")
!222 = !DILocalVariable(name: "ipv4_header", scope: !185, file: !63, line: 334, type: !223)
!223 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !224, size: 64)
!224 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !225, line: 87, size: 160, elements: !226)
!225 = !DIFile(filename: "/usr/include/linux/ip.h", directory: "", checksumkind: CSK_MD5, checksum: "149778ace30a1ff208adc8783fd04b29")
!226 = !{!227, !229, !230, !231, !232, !233, !234, !235, !236, !238}
!227 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !224, file: !225, line: 89, baseType: !228, size: 4, flags: DIFlagBitField, extraData: i64 0)
!228 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !221, line: 21, baseType: !85)
!229 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !224, file: !225, line: 90, baseType: !228, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!230 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !224, file: !225, line: 97, baseType: !228, size: 8, offset: 8)
!231 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !224, file: !225, line: 98, baseType: !218, size: 16, offset: 16)
!232 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !224, file: !225, line: 99, baseType: !218, size: 16, offset: 32)
!233 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !224, file: !225, line: 100, baseType: !218, size: 16, offset: 48)
!234 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !224, file: !225, line: 101, baseType: !228, size: 8, offset: 64)
!235 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !224, file: !225, line: 102, baseType: !228, size: 8, offset: 72)
!236 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !224, file: !225, line: 103, baseType: !237, size: 16, offset: 80)
!237 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !219, line: 38, baseType: !220)
!238 = !DIDerivedType(tag: DW_TAG_member, scope: !224, file: !225, line: 104, baseType: !239, size: 64, offset: 96)
!239 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !224, file: !225, line: 104, size: 64, elements: !240)
!240 = !{!241, !248}
!241 = !DIDerivedType(tag: DW_TAG_member, scope: !239, file: !225, line: 104, baseType: !242, size: 64)
!242 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !239, file: !225, line: 104, size: 64, elements: !243)
!243 = !{!244, !247}
!244 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !242, file: !225, line: 104, baseType: !245, size: 32)
!245 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !219, line: 34, baseType: !246)
!246 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !221, line: 27, baseType: !7)
!247 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !242, file: !225, line: 104, baseType: !245, size: 32, offset: 32)
!248 = !DIDerivedType(tag: DW_TAG_member, name: "addrs", scope: !239, file: !225, line: 104, baseType: !249, size: 64)
!249 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !239, file: !225, line: 104, size: 64, elements: !250)
!250 = !{!251, !252}
!251 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !249, file: !225, line: 104, baseType: !245, size: 32)
!252 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !249, file: !225, line: 104, baseType: !245, size: 32, offset: 32)
!253 = !DILocalVariable(name: "ipv6_header", scope: !185, file: !63, line: 335, type: !254)
!254 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !255, size: 64)
!255 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipv6hdr", file: !256, line: 118, size: 320, elements: !257)
!256 = !DIFile(filename: "/usr/include/linux/ipv6.h", directory: "", checksumkind: CSK_MD5, checksum: "d288e308e142e51c48e7422f4fbbaa3f")
!257 = !{!258, !259, !260, !264, !265, !266, !267}
!258 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !255, file: !256, line: 120, baseType: !228, size: 4, flags: DIFlagBitField, extraData: i64 0)
!259 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !255, file: !256, line: 121, baseType: !228, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!260 = !DIDerivedType(tag: DW_TAG_member, name: "flow_lbl", scope: !255, file: !256, line: 128, baseType: !261, size: 24, offset: 8)
!261 = !DICompositeType(tag: DW_TAG_array_type, baseType: !228, size: 24, elements: !262)
!262 = !{!263}
!263 = !DISubrange(count: 3)
!264 = !DIDerivedType(tag: DW_TAG_member, name: "payload_len", scope: !255, file: !256, line: 130, baseType: !218, size: 16, offset: 32)
!265 = !DIDerivedType(tag: DW_TAG_member, name: "nexthdr", scope: !255, file: !256, line: 131, baseType: !228, size: 8, offset: 48)
!266 = !DIDerivedType(tag: DW_TAG_member, name: "hop_limit", scope: !255, file: !256, line: 132, baseType: !228, size: 8, offset: 56)
!267 = !DIDerivedType(tag: DW_TAG_member, scope: !255, file: !256, line: 134, baseType: !268, size: 256, offset: 64)
!268 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !255, file: !256, line: 134, size: 256, elements: !269)
!269 = !{!270, !289}
!270 = !DIDerivedType(tag: DW_TAG_member, scope: !268, file: !256, line: 134, baseType: !271, size: 256)
!271 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !268, file: !256, line: 134, size: 256, elements: !272)
!272 = !{!273, !288}
!273 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !271, file: !256, line: 134, baseType: !274, size: 128)
!274 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in6_addr", file: !275, line: 33, size: 128, elements: !276)
!275 = !DIFile(filename: "/usr/include/linux/in6.h", directory: "", checksumkind: CSK_MD5, checksum: "fca1889f0274df066e49cf4d8db8011e")
!276 = !{!277}
!277 = !DIDerivedType(tag: DW_TAG_member, name: "in6_u", scope: !274, file: !275, line: 40, baseType: !278, size: 128)
!278 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !274, file: !275, line: 34, size: 128, elements: !279)
!279 = !{!280, !282, !286}
!280 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr8", scope: !278, file: !275, line: 35, baseType: !281, size: 128)
!281 = !DICompositeType(tag: DW_TAG_array_type, baseType: !228, size: 128, elements: !137)
!282 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr16", scope: !278, file: !275, line: 37, baseType: !283, size: 128)
!283 = !DICompositeType(tag: DW_TAG_array_type, baseType: !218, size: 128, elements: !284)
!284 = !{!285}
!285 = !DISubrange(count: 8)
!286 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr32", scope: !278, file: !275, line: 38, baseType: !287, size: 128)
!287 = !DICompositeType(tag: DW_TAG_array_type, baseType: !245, size: 128, elements: !104)
!288 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !271, file: !256, line: 134, baseType: !274, size: 128, offset: 128)
!289 = !DIDerivedType(tag: DW_TAG_member, name: "addrs", scope: !268, file: !256, line: 134, baseType: !290, size: 256)
!290 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !268, file: !256, line: 134, size: 256, elements: !291)
!291 = !{!292, !293}
!292 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !290, file: !256, line: 134, baseType: !274, size: 128)
!293 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !290, file: !256, line: 134, baseType: !274, size: 128, offset: 128)
!294 = !DILocalVariable(name: "protocol", scope: !295, file: !63, line: 347, type: !69)
!295 = distinct !DILexicalBlock(scope: !296, file: !63, line: 345, column: 48)
!296 = distinct !DILexicalBlock(scope: !185, file: !63, line: 345, column: 6)
!297 = !DILocalVariable(name: "ipv4_source", scope: !295, file: !63, line: 349, type: !98)
!298 = !DILocalVariable(name: "ipv4_dest", scope: !295, file: !63, line: 352, type: !98)
!299 = !DILocalVariable(name: "udp_header", scope: !300, file: !63, line: 382, type: !302)
!300 = distinct !DILexicalBlock(scope: !301, file: !63, line: 380, column: 32)
!301 = distinct !DILexicalBlock(scope: !295, file: !63, line: 380, column: 7)
!302 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !303, size: 64)
!303 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "udphdr", file: !304, line: 23, size: 64, elements: !305)
!304 = !DIFile(filename: "/usr/include/linux/udp.h", directory: "", checksumkind: CSK_MD5, checksum: "40b541977cf3a9ce2b2728b52f4091a4")
!305 = !{!306, !307, !308, !309}
!306 = !DIDerivedType(tag: DW_TAG_member, name: "source", scope: !303, file: !304, line: 24, baseType: !218, size: 16)
!307 = !DIDerivedType(tag: DW_TAG_member, name: "dest", scope: !303, file: !304, line: 25, baseType: !218, size: 16, offset: 16)
!308 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !303, file: !304, line: 26, baseType: !218, size: 16, offset: 32)
!309 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !303, file: !304, line: 27, baseType: !237, size: 16, offset: 48)
!310 = !DILocalVariable(name: "length", scope: !300, file: !63, line: 384, type: !69)
!311 = !DILocalVariable(name: "port_source", scope: !300, file: !63, line: 389, type: !55)
!312 = !DILocalVariable(name: "port_dest", scope: !300, file: !63, line: 396, type: !55)
!313 = !DILocalVariable(name: "tcp_header", scope: !314, file: !63, line: 431, type: !316)
!314 = distinct !DILexicalBlock(scope: !315, file: !63, line: 429, column: 39)
!315 = distinct !DILexicalBlock(scope: !301, file: !63, line: 429, column: 14)
!316 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !317, size: 64)
!317 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tcphdr", file: !318, line: 25, size: 160, elements: !319)
!318 = !DIFile(filename: "/usr/include/linux/tcp.h", directory: "", checksumkind: CSK_MD5, checksum: "1aa35012f509549bad9f3decb5d3e7a2")
!319 = !{!320, !321, !322, !323, !324, !325, !326, !327, !328, !329, !330, !331, !332, !333, !334, !335, !336}
!320 = !DIDerivedType(tag: DW_TAG_member, name: "source", scope: !317, file: !318, line: 26, baseType: !218, size: 16)
!321 = !DIDerivedType(tag: DW_TAG_member, name: "dest", scope: !317, file: !318, line: 27, baseType: !218, size: 16, offset: 16)
!322 = !DIDerivedType(tag: DW_TAG_member, name: "seq", scope: !317, file: !318, line: 28, baseType: !245, size: 32, offset: 32)
!323 = !DIDerivedType(tag: DW_TAG_member, name: "ack_seq", scope: !317, file: !318, line: 29, baseType: !245, size: 32, offset: 64)
!324 = !DIDerivedType(tag: DW_TAG_member, name: "res1", scope: !317, file: !318, line: 31, baseType: !220, size: 4, offset: 96, flags: DIFlagBitField, extraData: i64 96)
!325 = !DIDerivedType(tag: DW_TAG_member, name: "doff", scope: !317, file: !318, line: 32, baseType: !220, size: 4, offset: 100, flags: DIFlagBitField, extraData: i64 96)
!326 = !DIDerivedType(tag: DW_TAG_member, name: "fin", scope: !317, file: !318, line: 33, baseType: !220, size: 1, offset: 104, flags: DIFlagBitField, extraData: i64 96)
!327 = !DIDerivedType(tag: DW_TAG_member, name: "syn", scope: !317, file: !318, line: 34, baseType: !220, size: 1, offset: 105, flags: DIFlagBitField, extraData: i64 96)
!328 = !DIDerivedType(tag: DW_TAG_member, name: "rst", scope: !317, file: !318, line: 35, baseType: !220, size: 1, offset: 106, flags: DIFlagBitField, extraData: i64 96)
!329 = !DIDerivedType(tag: DW_TAG_member, name: "psh", scope: !317, file: !318, line: 36, baseType: !220, size: 1, offset: 107, flags: DIFlagBitField, extraData: i64 96)
!330 = !DIDerivedType(tag: DW_TAG_member, name: "ack", scope: !317, file: !318, line: 37, baseType: !220, size: 1, offset: 108, flags: DIFlagBitField, extraData: i64 96)
!331 = !DIDerivedType(tag: DW_TAG_member, name: "urg", scope: !317, file: !318, line: 38, baseType: !220, size: 1, offset: 109, flags: DIFlagBitField, extraData: i64 96)
!332 = !DIDerivedType(tag: DW_TAG_member, name: "ece", scope: !317, file: !318, line: 39, baseType: !220, size: 1, offset: 110, flags: DIFlagBitField, extraData: i64 96)
!333 = !DIDerivedType(tag: DW_TAG_member, name: "cwr", scope: !317, file: !318, line: 40, baseType: !220, size: 1, offset: 111, flags: DIFlagBitField, extraData: i64 96)
!334 = !DIDerivedType(tag: DW_TAG_member, name: "window", scope: !317, file: !318, line: 55, baseType: !218, size: 16, offset: 112)
!335 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !317, file: !318, line: 56, baseType: !237, size: 16, offset: 128)
!336 = !DIDerivedType(tag: DW_TAG_member, name: "urg_ptr", scope: !317, file: !318, line: 57, baseType: !218, size: 16, offset: 144)
!337 = !DILocalVariable(name: "length", scope: !314, file: !63, line: 433, type: !69)
!338 = !DILocalVariable(name: "port_source", scope: !314, file: !63, line: 445, type: !55)
!339 = !DILocalVariable(name: "port_dest", scope: !314, file: !63, line: 452, type: !55)
!340 = !DILocalVariable(name: "icmp_header", scope: !341, file: !63, line: 479, type: !343)
!341 = distinct !DILexicalBlock(scope: !342, file: !63, line: 477, column: 40)
!342 = distinct !DILexicalBlock(scope: !315, file: !63, line: 477, column: 14)
!343 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !344, size: 64)
!344 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmphdr", file: !345, line: 89, size: 64, elements: !346)
!345 = !DIFile(filename: "/usr/include/linux/icmp.h", directory: "", checksumkind: CSK_MD5, checksum: "a505632898dce546638b3344627d334b")
!346 = !{!347, !348, !349, !350}
!347 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !344, file: !345, line: 90, baseType: !228, size: 8)
!348 = !DIDerivedType(tag: DW_TAG_member, name: "code", scope: !344, file: !345, line: 91, baseType: !228, size: 8, offset: 8)
!349 = !DIDerivedType(tag: DW_TAG_member, name: "checksum", scope: !344, file: !345, line: 92, baseType: !237, size: 16, offset: 16)
!350 = !DIDerivedType(tag: DW_TAG_member, name: "un", scope: !344, file: !345, line: 104, baseType: !351, size: 32, offset: 32)
!351 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !344, file: !345, line: 93, size: 32, elements: !352)
!352 = !{!353, !358, !359, !364}
!353 = !DIDerivedType(tag: DW_TAG_member, name: "echo", scope: !351, file: !345, line: 97, baseType: !354, size: 32)
!354 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !351, file: !345, line: 94, size: 32, elements: !355)
!355 = !{!356, !357}
!356 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !354, file: !345, line: 95, baseType: !218, size: 16)
!357 = !DIDerivedType(tag: DW_TAG_member, name: "sequence", scope: !354, file: !345, line: 96, baseType: !218, size: 16, offset: 16)
!358 = !DIDerivedType(tag: DW_TAG_member, name: "gateway", scope: !351, file: !345, line: 98, baseType: !245, size: 32)
!359 = !DIDerivedType(tag: DW_TAG_member, name: "frag", scope: !351, file: !345, line: 102, baseType: !360, size: 32)
!360 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !351, file: !345, line: 99, size: 32, elements: !361)
!361 = !{!362, !363}
!362 = !DIDerivedType(tag: DW_TAG_member, name: "__unused", scope: !360, file: !345, line: 100, baseType: !218, size: 16)
!363 = !DIDerivedType(tag: DW_TAG_member, name: "mtu", scope: !360, file: !345, line: 101, baseType: !218, size: 16, offset: 16)
!364 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !351, file: !345, line: 103, baseType: !365, size: 32)
!365 = !DICompositeType(tag: DW_TAG_array_type, baseType: !228, size: 32, elements: !104)
!366 = !DILocalVariable(name: "protocol", scope: !367, file: !63, line: 499, type: !69)
!367 = distinct !DILexicalBlock(scope: !368, file: !63, line: 497, column: 57)
!368 = distinct !DILexicalBlock(scope: !296, file: !63, line: 497, column: 13)
!369 = !DILocalVariable(name: "ipv6_source", scope: !367, file: !63, line: 501, type: !132)
!370 = !DILocalVariable(name: "ipv6_dest", scope: !367, file: !63, line: 504, type: !132)
!371 = !DILocalVariable(name: "udp_header", scope: !372, file: !63, line: 532, type: !302)
!372 = distinct !DILexicalBlock(scope: !373, file: !63, line: 530, column: 33)
!373 = distinct !DILexicalBlock(scope: !374, file: !63, line: 530, column: 8)
!374 = distinct !DILexicalBlock(scope: !375, file: !63, line: 507, column: 20)
!375 = distinct !DILexicalBlock(scope: !367, file: !63, line: 507, column: 7)
!376 = !DILocalVariable(name: "length", scope: !372, file: !63, line: 534, type: !69)
!377 = !DILocalVariable(name: "port_source", scope: !372, file: !63, line: 539, type: !55)
!378 = !DILocalVariable(name: "port_dest", scope: !372, file: !63, line: 546, type: !55)
!379 = !DILocalVariable(name: "tcp_header", scope: !380, file: !63, line: 572, type: !316)
!380 = distinct !DILexicalBlock(scope: !381, file: !63, line: 570, column: 40)
!381 = distinct !DILexicalBlock(scope: !373, file: !63, line: 570, column: 15)
!382 = !DILocalVariable(name: "length", scope: !380, file: !63, line: 574, type: !69)
!383 = !DILocalVariable(name: "port_source", scope: !380, file: !63, line: 586, type: !55)
!384 = !DILocalVariable(name: "port_dest", scope: !380, file: !63, line: 593, type: !55)
!385 = !DILocalVariable(name: "icmp_header", scope: !386, file: !63, line: 619, type: !343)
!386 = distinct !DILexicalBlock(scope: !387, file: !63, line: 617, column: 41)
!387 = distinct !DILexicalBlock(scope: !381, file: !63, line: 617, column: 15)
!388 = !DILocalVariable(name: "icmp6_header", scope: !389, file: !63, line: 635, type: !391)
!389 = distinct !DILexicalBlock(scope: !390, file: !63, line: 633, column: 43)
!390 = distinct !DILexicalBlock(scope: !387, file: !63, line: 633, column: 15)
!391 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !392, size: 64)
!392 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmp6hdr", file: !393, line: 8, size: 64, elements: !394)
!393 = !DIFile(filename: "/usr/include/linux/icmpv6.h", directory: "", checksumkind: CSK_MD5, checksum: "c573774d0b3c9a61b5510be75a6ff374")
!394 = !{!395, !396, !397, !398}
!395 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_type", scope: !392, file: !393, line: 10, baseType: !228, size: 8)
!396 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_code", scope: !392, file: !393, line: 11, baseType: !228, size: 8, offset: 8)
!397 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_cksum", scope: !392, file: !393, line: 12, baseType: !237, size: 16, offset: 16)
!398 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_dataun", scope: !392, file: !393, line: 63, baseType: !399, size: 32, offset: 32)
!399 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !392, file: !393, line: 15, size: 32, elements: !400)
!400 = !{!401, !403, !407, !408, !413, !421}
!401 = !DIDerivedType(tag: DW_TAG_member, name: "un_data32", scope: !399, file: !393, line: 16, baseType: !402, size: 32)
!402 = !DICompositeType(tag: DW_TAG_array_type, baseType: !245, size: 32, elements: !70)
!403 = !DIDerivedType(tag: DW_TAG_member, name: "un_data16", scope: !399, file: !393, line: 17, baseType: !404, size: 32)
!404 = !DICompositeType(tag: DW_TAG_array_type, baseType: !218, size: 32, elements: !405)
!405 = !{!406}
!406 = !DISubrange(count: 2)
!407 = !DIDerivedType(tag: DW_TAG_member, name: "un_data8", scope: !399, file: !393, line: 18, baseType: !365, size: 32)
!408 = !DIDerivedType(tag: DW_TAG_member, name: "u_echo", scope: !399, file: !393, line: 23, baseType: !409, size: 32)
!409 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmpv6_echo", file: !393, line: 20, size: 32, elements: !410)
!410 = !{!411, !412}
!411 = !DIDerivedType(tag: DW_TAG_member, name: "identifier", scope: !409, file: !393, line: 21, baseType: !218, size: 16)
!412 = !DIDerivedType(tag: DW_TAG_member, name: "sequence", scope: !409, file: !393, line: 22, baseType: !218, size: 16, offset: 16)
!413 = !DIDerivedType(tag: DW_TAG_member, name: "u_nd_advt", scope: !399, file: !393, line: 40, baseType: !414, size: 32)
!414 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmpv6_nd_advt", file: !393, line: 25, size: 32, elements: !415)
!415 = !{!416, !417, !418, !419, !420}
!416 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !414, file: !393, line: 27, baseType: !246, size: 5, flags: DIFlagBitField, extraData: i64 0)
!417 = !DIDerivedType(tag: DW_TAG_member, name: "override", scope: !414, file: !393, line: 28, baseType: !246, size: 1, offset: 5, flags: DIFlagBitField, extraData: i64 0)
!418 = !DIDerivedType(tag: DW_TAG_member, name: "solicited", scope: !414, file: !393, line: 29, baseType: !246, size: 1, offset: 6, flags: DIFlagBitField, extraData: i64 0)
!419 = !DIDerivedType(tag: DW_TAG_member, name: "router", scope: !414, file: !393, line: 30, baseType: !246, size: 1, offset: 7, flags: DIFlagBitField, extraData: i64 0)
!420 = !DIDerivedType(tag: DW_TAG_member, name: "reserved2", scope: !414, file: !393, line: 31, baseType: !246, size: 24, offset: 8, flags: DIFlagBitField, extraData: i64 0)
!421 = !DIDerivedType(tag: DW_TAG_member, name: "u_nd_ra", scope: !399, file: !393, line: 61, baseType: !422, size: 32)
!422 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmpv6_nd_ra", file: !393, line: 42, size: 32, elements: !423)
!423 = !{!424, !425, !426, !427, !428, !429, !430}
!424 = !DIDerivedType(tag: DW_TAG_member, name: "hop_limit", scope: !422, file: !393, line: 43, baseType: !228, size: 8)
!425 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !422, file: !393, line: 45, baseType: !228, size: 3, offset: 8, flags: DIFlagBitField, extraData: i64 8)
!426 = !DIDerivedType(tag: DW_TAG_member, name: "router_pref", scope: !422, file: !393, line: 46, baseType: !228, size: 2, offset: 11, flags: DIFlagBitField, extraData: i64 8)
!427 = !DIDerivedType(tag: DW_TAG_member, name: "home_agent", scope: !422, file: !393, line: 47, baseType: !228, size: 1, offset: 13, flags: DIFlagBitField, extraData: i64 8)
!428 = !DIDerivedType(tag: DW_TAG_member, name: "other", scope: !422, file: !393, line: 48, baseType: !228, size: 1, offset: 14, flags: DIFlagBitField, extraData: i64 8)
!429 = !DIDerivedType(tag: DW_TAG_member, name: "managed", scope: !422, file: !393, line: 49, baseType: !228, size: 1, offset: 15, flags: DIFlagBitField, extraData: i64 8)
!430 = !DIDerivedType(tag: DW_TAG_member, name: "rt_lifetime", scope: !422, file: !393, line: 60, baseType: !218, size: 16, offset: 16)
!431 = distinct !DIAssignID()
!432 = distinct !DIAssignID()
!433 = distinct !DIAssignID()
!434 = distinct !DIAssignID()
!435 = distinct !DIAssignID()
!436 = distinct !DIAssignID()
!437 = distinct !DIAssignID()
!438 = distinct !DIAssignID()
!439 = distinct !DIAssignID()
!440 = distinct !DIAssignID()
!441 = distinct !DIAssignID()
!442 = distinct !DIAssignID()
!443 = distinct !DIAssignID()
!444 = distinct !DIAssignID()
!445 = distinct !DIAssignID()
!446 = !DILocation(line: 0, scope: !295)
!447 = distinct !DIAssignID()
!448 = distinct !DIAssignID()
!449 = !DILocation(line: 0, scope: !367)
!450 = distinct !DIAssignID()
!451 = !DILocation(line: 0, scope: !185)
!452 = !DILocation(line: 324, column: 38, scope: !185)
!453 = !{!454, !455, i64 4}
!454 = !{!"xdp_md", !455, i64 0, !455, i64 4, !455, i64 8, !455, i64 12, !455, i64 16, !455, i64 20}
!455 = !{!"int", !456, i64 0}
!456 = !{!"omnipotent char", !457, i64 0}
!457 = !{!"Simple C/C++ TBAA"}
!458 = !DILocation(line: 324, column: 27, scope: !185)
!459 = !DILocation(line: 324, column: 19, scope: !185)
!460 = !DILocation(line: 325, column: 34, scope: !185)
!461 = !{!454, !455, i64 0}
!462 = !DILocation(line: 325, column: 23, scope: !185)
!463 = !DILocation(line: 325, column: 15, scope: !185)
!464 = !DILocation(line: 327, column: 11, scope: !465)
!465 = distinct !DILexicalBlock(scope: !185, file: !63, line: 327, column: 6)
!466 = !DILocation(line: 327, column: 35, scope: !465)
!467 = !DILocation(line: 327, column: 6, scope: !185)
!468 = !DILocalVariable(name: "nh", arg: 1, scope: !469, file: !204, line: 151, type: !472)
!469 = distinct !DISubprogram(name: "parse_ethhdr", scope: !204, file: !204, line: 151, type: !470, scopeLine: 151, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !474)
!470 = !DISubroutineType(types: !471)
!471 = !{!69, !472, !53, !473}
!472 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !203, size: 64)
!473 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !208, size: 64)
!474 = !{!468, !475, !476, !477, !478, !485, !486}
!475 = !DILocalVariable(name: "data_end", arg: 2, scope: !469, file: !204, line: 151, type: !53)
!476 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !469, file: !204, line: 151, type: !473)
!477 = !DILocalVariable(name: "eth", scope: !469, file: !204, line: 153, type: !208)
!478 = !DILocalVariable(name: "vlh", scope: !469, file: !204, line: 154, type: !479)
!479 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !480, size: 64)
!480 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vlanhdr", file: !204, line: 38, size: 32, elements: !481)
!481 = !{!482, !484}
!482 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_TCI", scope: !480, file: !204, line: 39, baseType: !483, size: 16)
!483 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !56, line: 18, baseType: !55)
!484 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_encapsulated_proto", scope: !480, file: !204, line: 40, baseType: !483, size: 16, offset: 16)
!485 = !DILocalVariable(name: "h_proto", scope: !469, file: !204, line: 155, type: !55)
!486 = !DILocalVariable(name: "i", scope: !469, file: !204, line: 156, type: !69)
!487 = !DILocation(line: 0, scope: !469, inlinedAt: !488)
!488 = distinct !DILocation(line: 338, column: 22, scope: !185)
!489 = !DILocation(line: 164, column: 17, scope: !469, inlinedAt: !488)
!490 = !{!491, !491, i64 0}
!491 = !{!"short", !456, i64 0}
!492 = !DILocalVariable(name: "h_proto", arg: 1, scope: !493, file: !204, line: 109, type: !55)
!493 = distinct !DISubprogram(name: "proto_is_vlan", scope: !204, file: !204, line: 109, type: !494, scopeLine: 109, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !496)
!494 = !DISubroutineType(types: !495)
!495 = !{!69, !55}
!496 = !{!492}
!497 = !DILocation(line: 0, scope: !493, inlinedAt: !498)
!498 = distinct !DILocation(line: 172, column: 8, scope: !499, inlinedAt: !488)
!499 = distinct !DILexicalBlock(scope: !500, file: !204, line: 172, column: 7)
!500 = distinct !DILexicalBlock(scope: !501, file: !204, line: 170, column: 39)
!501 = distinct !DILexicalBlock(scope: !502, file: !204, line: 170, column: 2)
!502 = distinct !DILexicalBlock(scope: !469, file: !204, line: 170, column: 2)
!503 = !DILocation(line: 110, column: 20, scope: !493, inlinedAt: !498)
!504 = !DILocation(line: 110, column: 46, scope: !493, inlinedAt: !498)
!505 = !DILocation(line: 172, column: 7, scope: !500, inlinedAt: !488)
!506 = !DILocation(line: 176, column: 11, scope: !507, inlinedAt: !488)
!507 = distinct !DILexicalBlock(scope: !500, file: !204, line: 176, column: 7)
!508 = !DILocation(line: 176, column: 15, scope: !507, inlinedAt: !488)
!509 = !DILocation(line: 176, column: 7, scope: !500, inlinedAt: !488)
!510 = !DILocation(line: 180, column: 18, scope: !500, inlinedAt: !488)
!511 = !DILocation(line: 345, column: 6, scope: !185)
!512 = !DILocalVariable(name: "nh", arg: 1, scope: !513, file: !204, line: 191, type: !472)
!513 = distinct !DISubprogram(name: "parse_iphdr", scope: !204, file: !204, line: 191, type: !514, scopeLine: 191, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !517)
!514 = !DISubroutineType(types: !515)
!515 = !{!69, !472, !53, !516}
!516 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !223, size: 64)
!517 = !{!512, !518, !519, !520, !521}
!518 = !DILocalVariable(name: "data_end", arg: 2, scope: !513, file: !204, line: 191, type: !53)
!519 = !DILocalVariable(name: "iphdr", arg: 3, scope: !513, file: !204, line: 191, type: !516)
!520 = !DILocalVariable(name: "iph", scope: !513, file: !204, line: 193, type: !223)
!521 = !DILocalVariable(name: "hdrsize", scope: !513, file: !204, line: 194, type: !69)
!522 = !DILocation(line: 0, scope: !513, inlinedAt: !523)
!523 = distinct !DILocation(line: 347, column: 18, scope: !295)
!524 = !DILocation(line: 196, column: 10, scope: !525, inlinedAt: !523)
!525 = distinct !DILexicalBlock(scope: !513, file: !204, line: 196, column: 6)
!526 = !DILocation(line: 196, column: 14, scope: !525, inlinedAt: !523)
!527 = !DILocation(line: 196, column: 6, scope: !513, inlinedAt: !523)
!528 = !DILocation(line: 200, column: 17, scope: !513, inlinedAt: !523)
!529 = !DILocation(line: 200, column: 21, scope: !513, inlinedAt: !523)
!530 = !DILocation(line: 203, column: 14, scope: !531, inlinedAt: !523)
!531 = distinct !DILexicalBlock(scope: !513, file: !204, line: 203, column: 6)
!532 = !DILocation(line: 203, column: 24, scope: !531, inlinedAt: !523)
!533 = !DILocation(line: 203, column: 6, scope: !513, inlinedAt: !523)
!534 = !DILocation(line: 349, column: 3, scope: !295)
!535 = distinct !DIAssignID()
!536 = !DILocation(line: 352, column: 3, scope: !295)
!537 = distinct !DIAssignID()
!538 = !DILocation(line: 380, column: 7, scope: !295)
!539 = !DILocation(line: 210, column: 14, scope: !513, inlinedAt: !523)
!540 = !{!541, !456, i64 9}
!541 = !{!"iphdr", !456, i64 0, !456, i64 0, !456, i64 1, !491, i64 2, !491, i64 4, !491, i64 6, !456, i64 8, !456, i64 9, !491, i64 10, !456, i64 12}
!542 = !DILocation(line: 350, column: 25, scope: !295)
!543 = !{!544, !455, i64 0}
!544 = !{!"ipv4_subnet", !455, i64 0, !456, i64 4}
!545 = !DILocation(line: 353, column: 23, scope: !295)
!546 = !DILocation(line: 357, column: 4, scope: !547)
!547 = distinct !DILexicalBlock(scope: !548, file: !63, line: 355, column: 20)
!548 = distinct !DILexicalBlock(scope: !295, file: !63, line: 355, column: 7)
!549 = distinct !DIAssignID()
!550 = !DILocation(line: 358, column: 4, scope: !547)
!551 = distinct !DIAssignID()
!552 = !DILocalVariable(name: "subnet", arg: 1, scope: !553, file: !63, line: 143, type: !97)
!553 = distinct !DISubprogram(name: "is_filtered_ipv4", scope: !63, file: !63, line: 143, type: !554, scopeLine: 143, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !557)
!554 = !DISubroutineType(types: !555)
!555 = !{!556, !97}
!556 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!557 = !{!552, !558}
!558 = !DILocalVariable(name: "banned", scope: !553, file: !63, line: 145, type: !83)
!559 = !DILocation(line: 0, scope: !553, inlinedAt: !560)
!560 = distinct !DILocation(line: 360, column: 8, scope: !561)
!561 = distinct !DILexicalBlock(scope: !547, file: !63, line: 360, column: 8)
!562 = !DILocation(line: 147, column: 11, scope: !553, inlinedAt: !560)
!563 = !DILocation(line: 149, column: 13, scope: !564, inlinedAt: !560)
!564 = distinct !DILexicalBlock(scope: !553, file: !63, line: 149, column: 6)
!565 = !DILocation(line: 360, column: 8, scope: !547)
!566 = !DILocation(line: 0, scope: !553, inlinedAt: !567)
!567 = distinct !DILocation(line: 368, column: 15, scope: !568)
!568 = distinct !DILexicalBlock(scope: !561, file: !63, line: 368, column: 15)
!569 = !DILocation(line: 147, column: 11, scope: !553, inlinedAt: !567)
!570 = !DILocation(line: 149, column: 13, scope: !564, inlinedAt: !567)
!571 = !DILocation(line: 368, column: 15, scope: !561)
!572 = !DILocation(line: 0, scope: !300)
!573 = !DILocalVariable(name: "nh", arg: 1, scope: !574, file: !204, line: 259, type: !472)
!574 = distinct !DISubprogram(name: "parse_udphdr", scope: !204, file: !204, line: 259, type: !575, scopeLine: 259, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !578)
!575 = !DISubroutineType(types: !576)
!576 = !{!69, !472, !53, !577}
!577 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !302, size: 64)
!578 = !{!573, !579, !580, !581, !582}
!579 = !DILocalVariable(name: "data_end", arg: 2, scope: !574, file: !204, line: 259, type: !53)
!580 = !DILocalVariable(name: "udphdr", arg: 3, scope: !574, file: !204, line: 259, type: !577)
!581 = !DILocalVariable(name: "len", scope: !574, file: !204, line: 261, type: !69)
!582 = !DILocalVariable(name: "udph", scope: !574, file: !204, line: 262, type: !302)
!583 = !DILocation(line: 0, scope: !574, inlinedAt: !584)
!584 = distinct !DILocation(line: 384, column: 17, scope: !300)
!585 = !DILocation(line: 264, column: 11, scope: !586, inlinedAt: !584)
!586 = distinct !DILexicalBlock(scope: !574, file: !204, line: 264, column: 6)
!587 = !DILocation(line: 264, column: 15, scope: !586, inlinedAt: !584)
!588 = !DILocation(line: 264, column: 6, scope: !574, inlinedAt: !584)
!589 = !DILocation(line: 271, column: 8, scope: !574, inlinedAt: !584)
!590 = !{!591, !491, i64 4}
!591 = !{!"udphdr", !491, i64 0, !491, i64 2, !491, i64 4, !491, i64 6}
!592 = !DILocation(line: 272, column: 10, scope: !593, inlinedAt: !584)
!593 = distinct !DILexicalBlock(scope: !574, file: !204, line: 272, column: 6)
!594 = !DILocation(line: 272, column: 6, scope: !574, inlinedAt: !584)
!595 = !DILocation(line: 389, column: 36, scope: !300)
!596 = !{!591, !491, i64 0}
!597 = !DILocalVariable(name: "port", arg: 1, scope: !598, file: !63, line: 171, type: !55)
!598 = distinct !DISubprogram(name: "is_filtered_port", scope: !63, file: !63, line: 171, type: !599, scopeLine: 171, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !601)
!599 = !DISubroutineType(types: !600)
!600 = !{!556, !55}
!601 = !{!597, !602}
!602 = !DILocalVariable(name: "blocked_port", scope: !598, file: !63, line: 173, type: !83)
!603 = !DILocation(line: 0, scope: !598, inlinedAt: !604)
!604 = distinct !DILocation(line: 392, column: 8, scope: !605)
!605 = distinct !DILexicalBlock(scope: !300, file: !63, line: 392, column: 8)
!606 = distinct !DIAssignID()
!607 = !DILocation(line: 175, column: 17, scope: !598, inlinedAt: !604)
!608 = !DILocation(line: 177, column: 19, scope: !609, inlinedAt: !604)
!609 = distinct !DILexicalBlock(scope: !598, file: !63, line: 177, column: 6)
!610 = !DILocation(line: 183, column: 1, scope: !598, inlinedAt: !604)
!611 = !DILocation(line: 392, column: 8, scope: !300)
!612 = !DILocation(line: 396, column: 34, scope: !300)
!613 = !{!591, !491, i64 2}
!614 = !DILocation(line: 0, scope: !598, inlinedAt: !615)
!615 = distinct !DILocation(line: 399, column: 8, scope: !616)
!616 = distinct !DILexicalBlock(scope: !300, file: !63, line: 399, column: 8)
!617 = distinct !DIAssignID()
!618 = !DILocation(line: 175, column: 17, scope: !598, inlinedAt: !615)
!619 = !DILocation(line: 177, column: 19, scope: !609, inlinedAt: !615)
!620 = !DILocation(line: 183, column: 1, scope: !598, inlinedAt: !615)
!621 = !DILocation(line: 0, scope: !314)
!622 = !DILocalVariable(name: "nh", arg: 1, scope: !623, file: !204, line: 298, type: !472)
!623 = distinct !DISubprogram(name: "parse_tcphdr", scope: !204, file: !204, line: 298, type: !624, scopeLine: 298, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !627)
!624 = !DISubroutineType(types: !625)
!625 = !{!69, !472, !53, !626}
!626 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !316, size: 64)
!627 = !{!622, !628, !629, !630, !631}
!628 = !DILocalVariable(name: "data_end", arg: 2, scope: !623, file: !204, line: 298, type: !53)
!629 = !DILocalVariable(name: "tcphdr", arg: 3, scope: !623, file: !204, line: 298, type: !626)
!630 = !DILocalVariable(name: "len", scope: !623, file: !204, line: 300, type: !69)
!631 = !DILocalVariable(name: "tcph", scope: !623, file: !204, line: 301, type: !316)
!632 = !DILocation(line: 0, scope: !623, inlinedAt: !633)
!633 = distinct !DILocation(line: 433, column: 17, scope: !314)
!634 = !DILocation(line: 303, column: 11, scope: !635, inlinedAt: !633)
!635 = distinct !DILexicalBlock(scope: !623, file: !204, line: 303, column: 6)
!636 = !DILocation(line: 303, column: 15, scope: !635, inlinedAt: !633)
!637 = !DILocation(line: 303, column: 6, scope: !623, inlinedAt: !633)
!638 = !DILocation(line: 307, column: 14, scope: !623, inlinedAt: !633)
!639 = !DILocation(line: 307, column: 19, scope: !623, inlinedAt: !633)
!640 = !DILocation(line: 308, column: 20, scope: !641, inlinedAt: !633)
!641 = distinct !DILexicalBlock(scope: !623, file: !204, line: 308, column: 6)
!642 = !DILocation(line: 308, column: 26, scope: !641, inlinedAt: !633)
!643 = !DILocation(line: 308, column: 6, scope: !623, inlinedAt: !633)
!644 = !DILocalVariable(name: "tcp_header", arg: 1, scope: !645, file: !63, line: 263, type: !316)
!645 = distinct !DISubprogram(name: "is_filtered_nmap_tcp_scan", scope: !63, file: !63, line: 263, type: !646, scopeLine: 263, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !648)
!646 = !DISubroutineType(types: !647)
!647 = !{!556, !316}
!648 = !{!644}
!649 = !DILocation(line: 0, scope: !645, inlinedAt: !650)
!650 = distinct !DILocation(line: 439, column: 8, scope: !651)
!651 = distinct !DILexicalBlock(scope: !314, file: !63, line: 439, column: 8)
!652 = !DILocation(line: 267, column: 3, scope: !653, inlinedAt: !650)
!653 = distinct !DILexicalBlock(scope: !645, file: !63, line: 266, column: 3)
!654 = !DILocation(line: 288, column: 18, scope: !655, inlinedAt: !650)
!655 = distinct !DILexicalBlock(scope: !645, file: !63, line: 280, column: 3)
!656 = !{!657, !491, i64 14}
!657 = !{!"tcphdr", !491, i64 0, !491, i64 2, !455, i64 4, !455, i64 8, !491, i64 12, !491, i64 12, !491, i64 13, !491, i64 13, !491, i64 13, !491, i64 13, !491, i64 13, !491, i64 13, !491, i64 13, !491, i64 13, !491, i64 14, !491, i64 16, !491, i64 18}
!658 = !DILocation(line: 288, column: 25, scope: !655, inlinedAt: !650)
!659 = !DILocation(line: 280, column: 3, scope: !645, inlinedAt: !650)
!660 = !DILocalVariable(name: "tcp_header", arg: 1, scope: !661, file: !63, line: 297, type: !316)
!661 = distinct !DISubprogram(name: "is_likely_nmap_tcp_scan", scope: !63, file: !63, line: 297, type: !646, scopeLine: 297, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !662)
!662 = !{!660}
!663 = !DILocation(line: 0, scope: !661, inlinedAt: !664)
!664 = distinct !DILocation(line: 441, column: 15, scope: !665)
!665 = distinct !DILexicalBlock(scope: !651, file: !63, line: 441, column: 15)
!666 = !DILocation(line: 303, column: 3, scope: !667, inlinedAt: !664)
!667 = distinct !DILexicalBlock(scope: !661, file: !63, line: 302, column: 3)
!668 = !DILocation(line: 309, column: 18, scope: !667, inlinedAt: !664)
!669 = !DILocation(line: 309, column: 25, scope: !667, inlinedAt: !664)
!670 = !DILocation(line: 302, column: 3, scope: !661, inlinedAt: !664)
!671 = !DILocalVariable(name: "value", scope: !672, file: !63, line: 87, type: !84)
!672 = distinct !DILexicalBlock(scope: !673, file: !63, line: 85, column: 24)
!673 = distinct !DILexicalBlock(scope: !674, file: !63, line: 85, column: 6)
!674 = distinct !DISubprogram(name: "warn_ipv4", scope: !63, file: !63, line: 79, type: !554, scopeLine: 79, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !675)
!675 = !{!676, !677, !671, !678, !681}
!676 = !DILocalVariable(name: "subnet", arg: 1, scope: !674, file: !63, line: 79, type: !97)
!677 = !DILocalVariable(name: "warnings", scope: !674, file: !63, line: 81, type: !83)
!678 = !DILocalVariable(name: "banned", scope: !679, file: !63, line: 94, type: !84)
!679 = distinct !DILexicalBlock(scope: !680, file: !63, line: 92, column: 19)
!680 = distinct !DILexicalBlock(scope: !672, file: !63, line: 92, column: 7)
!681 = !DILocalVariable(name: "value", scope: !682, file: !63, line: 102, type: !84)
!682 = distinct !DILexicalBlock(scope: !673, file: !63, line: 100, column: 9)
!683 = !DILocation(line: 0, scope: !672, inlinedAt: !684)
!684 = distinct !DILocation(line: 442, column: 5, scope: !685)
!685 = distinct !DILexicalBlock(scope: !665, file: !63, line: 441, column: 60)
!686 = !DILocation(line: 0, scope: !679, inlinedAt: !684)
!687 = !DILocation(line: 0, scope: !682, inlinedAt: !684)
!688 = !DILocation(line: 0, scope: !674, inlinedAt: !684)
!689 = !DILocation(line: 83, column: 13, scope: !674, inlinedAt: !684)
!690 = !DILocation(line: 85, column: 15, scope: !673, inlinedAt: !684)
!691 = !DILocation(line: 85, column: 6, scope: !674, inlinedAt: !684)
!692 = !DILocation(line: 87, column: 3, scope: !672, inlinedAt: !684)
!693 = distinct !DIAssignID()
!694 = !DILocation(line: 88, column: 11, scope: !672, inlinedAt: !684)
!695 = !{!456, !456, i64 0}
!696 = !DILocation(line: 88, column: 21, scope: !672, inlinedAt: !684)
!697 = !DILocation(line: 88, column: 9, scope: !672, inlinedAt: !684)
!698 = distinct !DIAssignID()
!699 = !DILocation(line: 90, column: 3, scope: !672, inlinedAt: !684)
!700 = !DILocation(line: 92, column: 7, scope: !680, inlinedAt: !684)
!701 = !DILocation(line: 92, column: 13, scope: !680, inlinedAt: !684)
!702 = !DILocation(line: 92, column: 7, scope: !672, inlinedAt: !684)
!703 = !DILocation(line: 94, column: 4, scope: !679, inlinedAt: !684)
!704 = !DILocation(line: 94, column: 9, scope: !679, inlinedAt: !684)
!705 = distinct !DIAssignID()
!706 = !DILocation(line: 95, column: 4, scope: !679, inlinedAt: !684)
!707 = !DILocation(line: 96, column: 4, scope: !679, inlinedAt: !684)
!708 = !DILocation(line: 98, column: 3, scope: !680, inlinedAt: !684)
!709 = !DILocation(line: 98, column: 3, scope: !679, inlinedAt: !684)
!710 = !DILocation(line: 100, column: 2, scope: !673, inlinedAt: !684)
!711 = !DILocation(line: 100, column: 2, scope: !672, inlinedAt: !684)
!712 = !DILocation(line: 102, column: 3, scope: !682, inlinedAt: !684)
!713 = !DILocation(line: 102, column: 8, scope: !682, inlinedAt: !684)
!714 = distinct !DIAssignID()
!715 = !DILocation(line: 103, column: 3, scope: !682, inlinedAt: !684)
!716 = !DILocation(line: 105, column: 2, scope: !673, inlinedAt: !684)
!717 = !DILocation(line: 445, column: 36, scope: !314)
!718 = !{!657, !491, i64 0}
!719 = !DILocation(line: 0, scope: !598, inlinedAt: !720)
!720 = distinct !DILocation(line: 448, column: 8, scope: !721)
!721 = distinct !DILexicalBlock(scope: !314, file: !63, line: 448, column: 8)
!722 = distinct !DIAssignID()
!723 = !DILocation(line: 175, column: 17, scope: !598, inlinedAt: !720)
!724 = !DILocation(line: 177, column: 19, scope: !609, inlinedAt: !720)
!725 = !DILocation(line: 183, column: 1, scope: !598, inlinedAt: !720)
!726 = !DILocation(line: 448, column: 8, scope: !314)
!727 = !DILocation(line: 452, column: 34, scope: !314)
!728 = !{!657, !491, i64 2}
!729 = !DILocation(line: 0, scope: !598, inlinedAt: !730)
!730 = distinct !DILocation(line: 455, column: 8, scope: !731)
!731 = distinct !DILexicalBlock(scope: !314, file: !63, line: 455, column: 8)
!732 = distinct !DIAssignID()
!733 = !DILocation(line: 175, column: 17, scope: !598, inlinedAt: !730)
!734 = !DILocation(line: 177, column: 19, scope: !609, inlinedAt: !730)
!735 = !DILocation(line: 183, column: 1, scope: !598, inlinedAt: !730)
!736 = !DILocation(line: 0, scope: !341)
!737 = !DILocalVariable(name: "nh", arg: 1, scope: !738, file: !204, line: 214, type: !472)
!738 = distinct !DISubprogram(name: "parse_icmphdr", scope: !204, file: !204, line: 214, type: !739, scopeLine: 214, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !742)
!739 = !DISubroutineType(types: !740)
!740 = !{!69, !472, !53, !741}
!741 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !343, size: 64)
!742 = !{!737, !743, !744, !745}
!743 = !DILocalVariable(name: "data_end", arg: 2, scope: !738, file: !204, line: 214, type: !53)
!744 = !DILocalVariable(name: "icmphdr", arg: 3, scope: !738, file: !204, line: 214, type: !741)
!745 = !DILocalVariable(name: "icmph", scope: !738, file: !204, line: 216, type: !343)
!746 = !DILocation(line: 0, scope: !738, inlinedAt: !747)
!747 = distinct !DILocation(line: 481, column: 4, scope: !341)
!748 = !DILocation(line: 218, column: 12, scope: !749, inlinedAt: !747)
!749 = distinct !DILexicalBlock(scope: !738, file: !204, line: 218, column: 6)
!750 = !DILocation(line: 218, column: 16, scope: !749, inlinedAt: !747)
!751 = !DILocation(line: 218, column: 6, scope: !738, inlinedAt: !747)
!752 = !DILocalVariable(name: "icmp_header", arg: 1, scope: !753, file: !63, line: 185, type: !343)
!753 = distinct !DISubprogram(name: "is_filtered_icmp_packet", scope: !63, file: !63, line: 185, type: !754, scopeLine: 185, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !756)
!754 = !DISubroutineType(types: !755)
!755 = !{!556, !343}
!756 = !{!752, !757}
!757 = !DILocalVariable(name: "type", scope: !753, file: !63, line: 187, type: !69)
!758 = !DILocation(line: 0, scope: !753, inlinedAt: !759)
!759 = distinct !DILocation(line: 483, column: 23, scope: !760)
!760 = distinct !DILexicalBlock(scope: !341, file: !63, line: 483, column: 8)
!761 = !DILocation(line: 187, column: 26, scope: !753, inlinedAt: !759)
!762 = !{!763, !456, i64 0}
!763 = !{!"icmphdr", !456, i64 0, !456, i64 1, !491, i64 2, !456, i64 4}
!764 = !DILocation(line: 190, column: 8, scope: !765, inlinedAt: !759)
!765 = distinct !DILexicalBlock(scope: !753, file: !63, line: 190, column: 3)
!766 = !DILocation(line: 191, column: 3, scope: !765, inlinedAt: !759)
!767 = !DILocation(line: 206, column: 18, scope: !765, inlinedAt: !759)
!768 = !DILocation(line: 495, column: 3, scope: !295)
!769 = !DILocation(line: 497, column: 2, scope: !296)
!770 = !DILocalVariable(name: "nh", arg: 1, scope: !771, file: !204, line: 229, type: !472)
!771 = distinct !DISubprogram(name: "parse_ipv6hdr", scope: !204, file: !204, line: 229, type: !772, scopeLine: 229, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !775)
!772 = !DISubroutineType(types: !773)
!773 = !{!69, !472, !53, !774}
!774 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !254, size: 64)
!775 = !{!770, !776, !777, !778}
!776 = !DILocalVariable(name: "data_end", arg: 2, scope: !771, file: !204, line: 229, type: !53)
!777 = !DILocalVariable(name: "ip6hdr", arg: 3, scope: !771, file: !204, line: 229, type: !774)
!778 = !DILocalVariable(name: "ip6h", scope: !771, file: !204, line: 231, type: !254)
!779 = !DILocation(line: 0, scope: !771, inlinedAt: !780)
!780 = distinct !DILocation(line: 499, column: 18, scope: !367)
!781 = !DILocation(line: 233, column: 11, scope: !782, inlinedAt: !780)
!782 = distinct !DILexicalBlock(scope: !771, file: !204, line: 233, column: 6)
!783 = !DILocation(line: 233, column: 15, scope: !782, inlinedAt: !780)
!784 = !DILocation(line: 233, column: 6, scope: !771, inlinedAt: !780)
!785 = !DILocation(line: 501, column: 3, scope: !367)
!786 = distinct !DIAssignID()
!787 = !DILocation(line: 504, column: 3, scope: !367)
!788 = distinct !DIAssignID()
!789 = !DILocation(line: 507, column: 7, scope: !367)
!790 = !DILocalVariable(name: "nh", arg: 1, scope: !791, file: !204, line: 113, type: !472)
!791 = distinct !DISubprogram(name: "skip_ip6hdrext", scope: !204, file: !204, line: 113, type: !792, scopeLine: 113, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !794)
!792 = !DISubroutineType(types: !793)
!793 = !{!69, !472, !53, !84}
!794 = !{!790, !795, !796, !797, !799}
!795 = !DILocalVariable(name: "data_end", arg: 2, scope: !791, file: !204, line: 113, type: !53)
!796 = !DILocalVariable(name: "next_hdr_type", arg: 3, scope: !791, file: !204, line: 113, type: !84)
!797 = !DILocalVariable(name: "i", scope: !798, file: !204, line: 115, type: !69)
!798 = distinct !DILexicalBlock(scope: !791, file: !204, line: 115, column: 2)
!799 = !DILocalVariable(name: "hdr", scope: !800, file: !204, line: 117, type: !802)
!800 = distinct !DILexicalBlock(scope: !801, file: !204, line: 115, column: 46)
!801 = distinct !DILexicalBlock(scope: !798, file: !204, line: 115, column: 2)
!802 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !803, size: 64)
!803 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipv6_opt_hdr", file: !256, line: 63, size: 16, elements: !804)
!804 = !{!805, !806}
!805 = !DIDerivedType(tag: DW_TAG_member, name: "nexthdr", scope: !803, file: !256, line: 64, baseType: !228, size: 8)
!806 = !DIDerivedType(tag: DW_TAG_member, name: "hdrlen", scope: !803, file: !256, line: 65, baseType: !228, size: 8, offset: 8)
!807 = !DILocation(line: 0, scope: !791, inlinedAt: !808)
!808 = distinct !DILocation(line: 240, column: 9, scope: !771, inlinedAt: !780)
!809 = !DILocation(line: 0, scope: !798, inlinedAt: !808)
!810 = !DILocation(line: 0, scope: !800, inlinedAt: !808)
!811 = !DILocation(line: 115, column: 2, scope: !798, inlinedAt: !808)
!812 = !DILocation(line: 240, column: 44, scope: !771, inlinedAt: !780)
!813 = !DILocation(line: 240, scope: !771, inlinedAt: !780)
!814 = !DILocation(line: 123, column: 3, scope: !800, inlinedAt: !808)
!815 = !DILocation(line: 135, column: 5, scope: !816, inlinedAt: !808)
!816 = distinct !DILexicalBlock(scope: !800, file: !204, line: 123, column: 26)
!817 = !DILocation(line: 123, column: 11, scope: !800, inlinedAt: !808)
!818 = !DILocation(line: 141, column: 5, scope: !816, inlinedAt: !808)
!819 = !DILocation(line: 0, scope: !816, inlinedAt: !808)
!820 = !{!821, !456, i64 1}
!821 = !{!"ipv6_opt_hdr", !456, i64 0, !456, i64 1}
!822 = !DILocation(line: 115, column: 41, scope: !801, inlinedAt: !808)
!823 = !DILocation(line: 115, column: 20, scope: !801, inlinedAt: !808)
!824 = distinct !{!824, !811, !825, !826}
!825 = !DILocation(line: 145, column: 2, scope: !798, inlinedAt: !808)
!826 = !{!"llvm.loop.mustprogress"}
!827 = !DILocation(line: 502, column: 31, scope: !367)
!828 = !{!829, !455, i64 0}
!829 = !{!"ipv6_subnet", !455, i64 0, !456, i64 4}
!830 = !DILocation(line: 505, column: 23, scope: !367)
!831 = !DILocation(line: 509, column: 4, scope: !374)
!832 = distinct !DIAssignID()
!833 = !DILocation(line: 510, column: 4, scope: !374)
!834 = distinct !DIAssignID()
!835 = !DILocalVariable(name: "subnet", arg: 1, scope: !836, file: !63, line: 157, type: !131)
!836 = distinct !DISubprogram(name: "is_filtered_ipv6", scope: !63, file: !63, line: 157, type: !837, scopeLine: 157, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !839)
!837 = !DISubroutineType(types: !838)
!838 = !{!556, !131}
!839 = !{!835, !840}
!840 = !DILocalVariable(name: "banned", scope: !836, file: !63, line: 159, type: !83)
!841 = !DILocation(line: 0, scope: !836, inlinedAt: !842)
!842 = distinct !DILocation(line: 512, column: 8, scope: !843)
!843 = distinct !DILexicalBlock(scope: !374, file: !63, line: 512, column: 8)
!844 = !DILocation(line: 161, column: 11, scope: !836, inlinedAt: !842)
!845 = !DILocation(line: 163, column: 13, scope: !846, inlinedAt: !842)
!846 = distinct !DILexicalBlock(scope: !836, file: !63, line: 163, column: 6)
!847 = !DILocation(line: 512, column: 8, scope: !374)
!848 = !DILocation(line: 0, scope: !836, inlinedAt: !849)
!849 = distinct !DILocation(line: 520, column: 15, scope: !850)
!850 = distinct !DILexicalBlock(scope: !843, file: !63, line: 520, column: 15)
!851 = !DILocation(line: 161, column: 11, scope: !836, inlinedAt: !849)
!852 = !DILocation(line: 163, column: 13, scope: !846, inlinedAt: !849)
!853 = !DILocation(line: 520, column: 15, scope: !843)
!854 = !DILocation(line: 530, column: 8, scope: !374)
!855 = !DILocation(line: 0, scope: !372)
!856 = !DILocation(line: 0, scope: !574, inlinedAt: !857)
!857 = distinct !DILocation(line: 534, column: 18, scope: !372)
!858 = !DILocation(line: 264, column: 11, scope: !586, inlinedAt: !857)
!859 = !DILocation(line: 264, column: 15, scope: !586, inlinedAt: !857)
!860 = !DILocation(line: 264, column: 6, scope: !574, inlinedAt: !857)
!861 = !DILocation(line: 271, column: 8, scope: !574, inlinedAt: !857)
!862 = !DILocation(line: 272, column: 10, scope: !593, inlinedAt: !857)
!863 = !DILocation(line: 272, column: 6, scope: !574, inlinedAt: !857)
!864 = !DILocation(line: 539, column: 37, scope: !372)
!865 = !DILocation(line: 0, scope: !598, inlinedAt: !866)
!866 = distinct !DILocation(line: 542, column: 9, scope: !867)
!867 = distinct !DILexicalBlock(scope: !372, file: !63, line: 542, column: 9)
!868 = distinct !DIAssignID()
!869 = !DILocation(line: 175, column: 17, scope: !598, inlinedAt: !866)
!870 = !DILocation(line: 177, column: 19, scope: !609, inlinedAt: !866)
!871 = !DILocation(line: 183, column: 1, scope: !598, inlinedAt: !866)
!872 = !DILocation(line: 542, column: 9, scope: !372)
!873 = !DILocation(line: 546, column: 35, scope: !372)
!874 = !DILocation(line: 0, scope: !598, inlinedAt: !875)
!875 = distinct !DILocation(line: 549, column: 9, scope: !876)
!876 = distinct !DILexicalBlock(scope: !372, file: !63, line: 549, column: 9)
!877 = distinct !DIAssignID()
!878 = !DILocation(line: 175, column: 17, scope: !598, inlinedAt: !875)
!879 = !DILocation(line: 177, column: 19, scope: !609, inlinedAt: !875)
!880 = !DILocation(line: 183, column: 1, scope: !598, inlinedAt: !875)
!881 = !DILocation(line: 0, scope: !380)
!882 = !DILocation(line: 0, scope: !623, inlinedAt: !883)
!883 = distinct !DILocation(line: 574, column: 18, scope: !380)
!884 = !DILocation(line: 303, column: 11, scope: !635, inlinedAt: !883)
!885 = !DILocation(line: 303, column: 15, scope: !635, inlinedAt: !883)
!886 = !DILocation(line: 303, column: 6, scope: !623, inlinedAt: !883)
!887 = !DILocation(line: 307, column: 14, scope: !623, inlinedAt: !883)
!888 = !DILocation(line: 307, column: 19, scope: !623, inlinedAt: !883)
!889 = !DILocation(line: 308, column: 20, scope: !641, inlinedAt: !883)
!890 = !DILocation(line: 308, column: 26, scope: !641, inlinedAt: !883)
!891 = !DILocation(line: 308, column: 6, scope: !623, inlinedAt: !883)
!892 = !DILocation(line: 0, scope: !645, inlinedAt: !893)
!893 = distinct !DILocation(line: 580, column: 9, scope: !894)
!894 = distinct !DILexicalBlock(scope: !380, file: !63, line: 580, column: 9)
!895 = !DILocation(line: 267, column: 3, scope: !653, inlinedAt: !893)
!896 = !DILocation(line: 288, column: 18, scope: !655, inlinedAt: !893)
!897 = !DILocation(line: 288, column: 25, scope: !655, inlinedAt: !893)
!898 = !DILocation(line: 280, column: 3, scope: !645, inlinedAt: !893)
!899 = !DILocation(line: 0, scope: !661, inlinedAt: !900)
!900 = distinct !DILocation(line: 582, column: 16, scope: !901)
!901 = distinct !DILexicalBlock(scope: !894, file: !63, line: 582, column: 16)
!902 = !DILocation(line: 303, column: 3, scope: !667, inlinedAt: !900)
!903 = !DILocation(line: 309, column: 18, scope: !667, inlinedAt: !900)
!904 = !DILocation(line: 309, column: 25, scope: !667, inlinedAt: !900)
!905 = !DILocation(line: 302, column: 3, scope: !661, inlinedAt: !900)
!906 = !DILocalVariable(name: "value", scope: !907, file: !63, line: 119, type: !84)
!907 = distinct !DILexicalBlock(scope: !908, file: !63, line: 117, column: 24)
!908 = distinct !DILexicalBlock(scope: !909, file: !63, line: 117, column: 6)
!909 = distinct !DISubprogram(name: "warn_ipv6", scope: !63, file: !63, line: 111, type: !837, scopeLine: 111, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !910)
!910 = !{!911, !912, !906, !913, !916}
!911 = !DILocalVariable(name: "subnet", arg: 1, scope: !909, file: !63, line: 111, type: !131)
!912 = !DILocalVariable(name: "warnings", scope: !909, file: !63, line: 113, type: !83)
!913 = !DILocalVariable(name: "banned", scope: !914, file: !63, line: 126, type: !84)
!914 = distinct !DILexicalBlock(scope: !915, file: !63, line: 124, column: 19)
!915 = distinct !DILexicalBlock(scope: !907, file: !63, line: 124, column: 7)
!916 = !DILocalVariable(name: "value", scope: !917, file: !63, line: 134, type: !84)
!917 = distinct !DILexicalBlock(scope: !908, file: !63, line: 132, column: 9)
!918 = !DILocation(line: 0, scope: !907, inlinedAt: !919)
!919 = distinct !DILocation(line: 583, column: 6, scope: !920)
!920 = distinct !DILexicalBlock(scope: !901, file: !63, line: 582, column: 61)
!921 = !DILocation(line: 0, scope: !914, inlinedAt: !919)
!922 = !DILocation(line: 0, scope: !917, inlinedAt: !919)
!923 = !DILocation(line: 0, scope: !909, inlinedAt: !919)
!924 = !DILocation(line: 115, column: 13, scope: !909, inlinedAt: !919)
!925 = !DILocation(line: 117, column: 15, scope: !908, inlinedAt: !919)
!926 = !DILocation(line: 117, column: 6, scope: !909, inlinedAt: !919)
!927 = !DILocation(line: 119, column: 3, scope: !907, inlinedAt: !919)
!928 = distinct !DIAssignID()
!929 = !DILocation(line: 120, column: 11, scope: !907, inlinedAt: !919)
!930 = !DILocation(line: 120, column: 21, scope: !907, inlinedAt: !919)
!931 = !DILocation(line: 120, column: 9, scope: !907, inlinedAt: !919)
!932 = distinct !DIAssignID()
!933 = !DILocation(line: 122, column: 3, scope: !907, inlinedAt: !919)
!934 = !DILocation(line: 124, column: 7, scope: !915, inlinedAt: !919)
!935 = !DILocation(line: 124, column: 13, scope: !915, inlinedAt: !919)
!936 = !DILocation(line: 124, column: 7, scope: !907, inlinedAt: !919)
!937 = !DILocation(line: 126, column: 4, scope: !914, inlinedAt: !919)
!938 = !DILocation(line: 126, column: 9, scope: !914, inlinedAt: !919)
!939 = distinct !DIAssignID()
!940 = !DILocation(line: 127, column: 4, scope: !914, inlinedAt: !919)
!941 = !DILocation(line: 128, column: 4, scope: !914, inlinedAt: !919)
!942 = !DILocation(line: 130, column: 3, scope: !915, inlinedAt: !919)
!943 = !DILocation(line: 130, column: 3, scope: !914, inlinedAt: !919)
!944 = !DILocation(line: 132, column: 2, scope: !908, inlinedAt: !919)
!945 = !DILocation(line: 132, column: 2, scope: !907, inlinedAt: !919)
!946 = !DILocation(line: 134, column: 3, scope: !917, inlinedAt: !919)
!947 = !DILocation(line: 134, column: 8, scope: !917, inlinedAt: !919)
!948 = distinct !DIAssignID()
!949 = !DILocation(line: 135, column: 3, scope: !917, inlinedAt: !919)
!950 = !DILocation(line: 137, column: 2, scope: !908, inlinedAt: !919)
!951 = !DILocation(line: 586, column: 37, scope: !380)
!952 = !DILocation(line: 0, scope: !598, inlinedAt: !953)
!953 = distinct !DILocation(line: 589, column: 9, scope: !954)
!954 = distinct !DILexicalBlock(scope: !380, file: !63, line: 589, column: 9)
!955 = distinct !DIAssignID()
!956 = !DILocation(line: 175, column: 17, scope: !598, inlinedAt: !953)
!957 = !DILocation(line: 177, column: 19, scope: !609, inlinedAt: !953)
!958 = !DILocation(line: 183, column: 1, scope: !598, inlinedAt: !953)
!959 = !DILocation(line: 589, column: 9, scope: !380)
!960 = !DILocation(line: 593, column: 35, scope: !380)
!961 = !DILocation(line: 0, scope: !598, inlinedAt: !962)
!962 = distinct !DILocation(line: 596, column: 9, scope: !963)
!963 = distinct !DILexicalBlock(scope: !380, file: !63, line: 596, column: 9)
!964 = distinct !DIAssignID()
!965 = !DILocation(line: 175, column: 17, scope: !598, inlinedAt: !962)
!966 = !DILocation(line: 177, column: 19, scope: !609, inlinedAt: !962)
!967 = !DILocation(line: 183, column: 1, scope: !598, inlinedAt: !962)
!968 = !DILocation(line: 0, scope: !386)
!969 = !DILocation(line: 0, scope: !738, inlinedAt: !970)
!970 = distinct !DILocation(line: 621, column: 5, scope: !386)
!971 = !DILocation(line: 218, column: 12, scope: !749, inlinedAt: !970)
!972 = !DILocation(line: 218, column: 16, scope: !749, inlinedAt: !970)
!973 = !DILocation(line: 218, column: 6, scope: !738, inlinedAt: !970)
!974 = !DILocation(line: 0, scope: !753, inlinedAt: !975)
!975 = distinct !DILocation(line: 623, column: 24, scope: !976)
!976 = distinct !DILexicalBlock(scope: !386, file: !63, line: 623, column: 9)
!977 = !DILocation(line: 187, column: 26, scope: !753, inlinedAt: !975)
!978 = !DILocation(line: 190, column: 8, scope: !765, inlinedAt: !975)
!979 = !DILocation(line: 191, column: 3, scope: !765, inlinedAt: !975)
!980 = !DILocation(line: 206, column: 18, scope: !765, inlinedAt: !975)
!981 = !DILocation(line: 0, scope: !389)
!982 = !DILocalVariable(name: "nh", arg: 1, scope: !983, file: !204, line: 244, type: !472)
!983 = distinct !DISubprogram(name: "parse_icmp6hdr", scope: !204, file: !204, line: 244, type: !984, scopeLine: 244, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !987)
!984 = !DISubroutineType(types: !985)
!985 = !{!69, !472, !53, !986}
!986 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !391, size: 64)
!987 = !{!982, !988, !989, !990}
!988 = !DILocalVariable(name: "data_end", arg: 2, scope: !983, file: !204, line: 244, type: !53)
!989 = !DILocalVariable(name: "icmp6hdr", arg: 3, scope: !983, file: !204, line: 244, type: !986)
!990 = !DILocalVariable(name: "icmp6h", scope: !983, file: !204, line: 246, type: !391)
!991 = !DILocation(line: 0, scope: !983, inlinedAt: !992)
!992 = distinct !DILocation(line: 637, column: 5, scope: !389)
!993 = !DILocation(line: 248, column: 13, scope: !994, inlinedAt: !992)
!994 = distinct !DILexicalBlock(scope: !983, file: !204, line: 248, column: 6)
!995 = !DILocation(line: 248, column: 17, scope: !994, inlinedAt: !992)
!996 = !DILocation(line: 248, column: 6, scope: !983, inlinedAt: !992)
!997 = !DILocalVariable(name: "icmp6_header", arg: 1, scope: !998, file: !63, line: 218, type: !391)
!998 = distinct !DISubprogram(name: "is_filtered_icmp6_packet", scope: !63, file: !63, line: 218, type: !999, scopeLine: 218, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1001)
!999 = !DISubroutineType(types: !1000)
!1000 = !{!556, !391}
!1001 = !{!997, !1002}
!1002 = !DILocalVariable(name: "type", scope: !998, file: !63, line: 220, type: !69)
!1003 = !DILocation(line: 0, scope: !998, inlinedAt: !1004)
!1004 = distinct !DILocation(line: 639, column: 25, scope: !1005)
!1005 = distinct !DILexicalBlock(scope: !389, file: !63, line: 639, column: 9)
!1006 = !DILocation(line: 220, column: 27, scope: !998, inlinedAt: !1004)
!1007 = !{!1008, !456, i64 0}
!1008 = !{!"icmp6hdr", !456, i64 0, !456, i64 1, !491, i64 2, !456, i64 4}
!1009 = !DILocation(line: 223, column: 8, scope: !1010, inlinedAt: !1004)
!1010 = distinct !DILexicalBlock(scope: !998, file: !63, line: 223, column: 3)
!1011 = !DILocation(line: 224, column: 3, scope: !1010, inlinedAt: !1004)
!1012 = !DILocation(line: 239, column: 18, scope: !1010, inlinedAt: !1004)
!1013 = !DILocation(line: 242, column: 18, scope: !1010, inlinedAt: !1004)
!1014 = !DILocation(line: 254, column: 12, scope: !1010, inlinedAt: !1004)
!1015 = !DILocation(line: 254, column: 19, scope: !1010, inlinedAt: !1004)
!1016 = !DILocation(line: 653, column: 2, scope: !368)
!1017 = !DILocation(line: 657, column: 1, scope: !185)
