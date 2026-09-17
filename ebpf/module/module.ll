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

@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !0
@domain_bans = dso_local global %struct.anon.5 zeroinitializer, section ".maps", align 8, !dbg !70
@ipv4_bans = dso_local global %struct.anon.6 zeroinitializer, section ".maps", align 8, !dbg !91
@ipv4_warnings = dso_local global %struct.anon.7 zeroinitializer, section ".maps", align 8, !dbg !113
@ipv6_bans = dso_local global %struct.anon.8 zeroinitializer, section ".maps", align 8, !dbg !129
@ipv6_warnings = dso_local global %struct.anon.9 zeroinitializer, section ".maps", align 8, !dbg !146
@port_bans = dso_local global %struct.anon.10 zeroinitializer, section ".maps", align 8, !dbg !154
@llvm.compiler.used = appending global [8 x ptr] [ptr @_license, ptr @domain_bans, ptr @ipv4_bans, ptr @ipv4_warnings, ptr @ipv6_bans, ptr @ipv6_warnings, ptr @port_bans, ptr @xdp_prog_main], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local range(i32 1, 3) i32 @xdp_prog_main(ptr noundef readonly captures(none) %0) #0 section "xdp" !dbg !192 {
  %2 = alloca i64, align 8, !DIAssignID !452
  %3 = alloca i8, align 1, !DIAssignID !453
    #dbg_assign(i1 poison, !454, !DIExpression(), !453, ptr %3, !DIExpression(), !469)
  %4 = alloca i8, align 1, !DIAssignID !474
    #dbg_assign(i1 poison, !464, !DIExpression(), !474, ptr %4, !DIExpression(), !475)
  %5 = alloca i8, align 1, !DIAssignID !476
  %6 = alloca i8, align 1, !DIAssignID !477
    #dbg_assign(i1 poison, !478, !DIExpression(), !477, ptr %6, !DIExpression(), !492)
  %7 = alloca i8, align 1, !DIAssignID !497
    #dbg_assign(i1 poison, !487, !DIExpression(), !497, ptr %7, !DIExpression(), !498)
  %8 = alloca i8, align 1, !DIAssignID !499
  %9 = alloca i16, align 2, !DIAssignID !500
  %10 = alloca i16, align 2, !DIAssignID !501
  %11 = alloca i16, align 2, !DIAssignID !502
  %12 = alloca i16, align 2, !DIAssignID !503
  %13 = alloca i16, align 2, !DIAssignID !504
  %14 = alloca i16, align 2, !DIAssignID !505
  %15 = alloca i16, align 2, !DIAssignID !506
  %16 = alloca i16, align 2, !DIAssignID !507
    #dbg_value(ptr poison, !508, !DIExpression(), !526)
    #dbg_value(ptr poison, !538, !DIExpression(), !547)
    #dbg_value(ptr poison, !533, !DIExpression(), !549)
    #dbg_value(ptr poison, !550, !DIExpression(), !559)
    #dbg_value(ptr poison, !550, !DIExpression(), !561)
    #dbg_value(ptr poison, !563, !DIExpression(), !573)
    #dbg_value(ptr poison, !563, !DIExpression(), !575)
    #dbg_value(ptr poison, !577, !DIExpression(), !588)
    #dbg_value(ptr poison, !593, !DIExpression(), !602)
    #dbg_value(ptr poison, !604, !DIExpression(), !614)
    #dbg_value(ptr poison, !604, !DIExpression(), !616)
    #dbg_value(ptr poison, !618, !DIExpression(), !628)
    #dbg_value(ptr poison, !630, !DIExpression(), !647)
  %17 = alloca %struct.ipv4_subnet, align 4, !DIAssignID !649
    #dbg_assign(i1 poison, !304, !DIExpression(), !649, ptr %17, !DIExpression(), !650)
  %18 = alloca %struct.ipv4_subnet, align 4, !DIAssignID !651
    #dbg_assign(i1 poison, !305, !DIExpression(), !651, ptr %18, !DIExpression(), !650)
  %19 = alloca %struct.ipv6_subnet, align 4, !DIAssignID !652
    #dbg_assign(i1 poison, !390, !DIExpression(), !652, ptr %19, !DIExpression(), !653)
  %20 = alloca %struct.ipv6_subnet, align 4, !DIAssignID !654
    #dbg_assign(i1 poison, !391, !DIExpression(), !654, ptr %20, !DIExpression(), !653)
    #dbg_value(ptr %0, !205, !DIExpression(), !655)
  %21 = getelementptr inbounds nuw i8, ptr %0, i64 4, !dbg !656
  %22 = load i32, ptr %21, align 4, !dbg !657, !tbaa !658
  %23 = zext i32 %22 to i64, !dbg !660
  %24 = inttoptr i64 %23 to ptr, !dbg !661
    #dbg_value(ptr %24, !206, !DIExpression(), !655)
  %25 = load i32, ptr %0, align 4, !dbg !662, !tbaa !663
  %26 = zext i32 %25 to i64, !dbg !664
  %27 = inttoptr i64 %26 to ptr, !dbg !665
    #dbg_value(ptr %27, !207, !DIExpression(), !655)
  %28 = getelementptr inbounds nuw i8, ptr %27, i64 14, !dbg !666
  %29 = icmp samesign ugt ptr %28, %24, !dbg !668
  br i1 %29, label %414, label %30, !dbg !669

30:                                               ; preds = %1
    #dbg_value(ptr null, !229, !DIExpression(), !655)
    #dbg_value(ptr null, !260, !DIExpression(), !655)
    #dbg_value(ptr undef, !630, !DIExpression(), !647)
    #dbg_value(ptr %24, !636, !DIExpression(), !647)
    #dbg_value(ptr poison, !637, !DIExpression(), !647)
    #dbg_value(ptr %27, !638, !DIExpression(), !647)
    #dbg_value(ptr %28, !209, !DIExpression(), !655)
    #dbg_value(ptr %27, !214, !DIExpression(), !655)
    #dbg_value(ptr %28, !639, !DIExpression(), !647)
  %31 = getelementptr inbounds nuw i8, ptr %27, i64 12, !dbg !670
    #dbg_value(i16 poison, !645, !DIExpression(), !647)
    #dbg_value(i32 0, !646, !DIExpression(), !647)
  %32 = load i16, ptr %31, align 1, !dbg !647, !tbaa !671
    #dbg_value(i32 0, !646, !DIExpression(), !647)
    #dbg_value(ptr %28, !639, !DIExpression(), !647)
    #dbg_value(i16 %32, !673, !DIExpression(), !678)
  %33 = icmp eq i16 %32, 129, !dbg !684
  %34 = icmp eq i16 %32, -22392, !dbg !685
  %35 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 3, i1 %33)
  %36 = or i1 %34, %35, !dbg !685
  br i1 %36, label %37, label %73, !dbg !686

37:                                               ; preds = %30
  %38 = getelementptr inbounds nuw i8, ptr %27, i64 18, !dbg !687
  %39 = icmp samesign ugt ptr %38, %24, !dbg !689
  br i1 %39, label %73, label %40, !dbg !690

40:                                               ; preds = %37
  %41 = getelementptr inbounds nuw i8, ptr %27, i64 16, !dbg !691
    #dbg_value(i16 poison, !645, !DIExpression(), !647)
    #dbg_value(ptr %38, !639, !DIExpression(), !647)
    #dbg_value(i32 1, !646, !DIExpression(), !647)
  %42 = load i16, ptr %41, align 1, !dbg !647, !tbaa !671
    #dbg_value(i16 %42, !645, !DIExpression(), !647)
    #dbg_value(i16 %42, !673, !DIExpression(), !678)
  %43 = icmp eq i16 %42, 129, !dbg !692
  %44 = icmp eq i16 %42, -22392, !dbg !693
  %45 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 3, i1 %43)
  %46 = or i1 %44, %45, !dbg !693
  br i1 %46, label %47, label %73, !dbg !694

47:                                               ; preds = %40
  %48 = getelementptr inbounds nuw i8, ptr %27, i64 22, !dbg !687
  %49 = icmp samesign ugt ptr %48, %24, !dbg !695
  br i1 %49, label %73, label %50, !dbg !696

50:                                               ; preds = %47
  %51 = getelementptr inbounds nuw i8, ptr %27, i64 20, !dbg !691
    #dbg_value(i16 poison, !645, !DIExpression(), !647)
    #dbg_value(ptr %48, !639, !DIExpression(), !647)
    #dbg_value(i32 2, !646, !DIExpression(), !647)
  %52 = load i16, ptr %51, align 1, !dbg !647, !tbaa !671
    #dbg_value(i16 %52, !645, !DIExpression(), !647)
    #dbg_value(i16 %52, !673, !DIExpression(), !678)
  %53 = icmp eq i16 %52, 129, !dbg !697
  %54 = icmp eq i16 %52, -22392, !dbg !698
  %55 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 3, i1 %53)
  %56 = or i1 %54, %55, !dbg !698
  br i1 %56, label %57, label %73, !dbg !699

57:                                               ; preds = %50
  %58 = getelementptr inbounds nuw i8, ptr %27, i64 26, !dbg !687
  %59 = icmp samesign ugt ptr %58, %24, !dbg !700
  br i1 %59, label %73, label %60, !dbg !701

60:                                               ; preds = %57
  %61 = getelementptr inbounds nuw i8, ptr %27, i64 24, !dbg !691
    #dbg_value(i16 poison, !645, !DIExpression(), !647)
    #dbg_value(ptr %58, !639, !DIExpression(), !647)
    #dbg_value(i32 3, !646, !DIExpression(), !647)
  %62 = load i16, ptr %61, align 1, !dbg !647, !tbaa !671
    #dbg_value(i16 %62, !645, !DIExpression(), !647)
    #dbg_value(i16 %62, !673, !DIExpression(), !678)
  %63 = icmp eq i16 %62, 129, !dbg !702
  %64 = icmp eq i16 %62, -22392, !dbg !703
  %65 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 3, i1 %63)
  %66 = or i1 %64, %65, !dbg !703
  br i1 %66, label %67, label %73, !dbg !704

67:                                               ; preds = %60
  %68 = getelementptr inbounds nuw i8, ptr %27, i64 30, !dbg !687
  %69 = icmp samesign ugt ptr %68, %24, !dbg !705
  br i1 %69, label %73, label %70, !dbg !706

70:                                               ; preds = %67
  %71 = getelementptr inbounds nuw i8, ptr %27, i64 28, !dbg !691
    #dbg_value(i16 poison, !645, !DIExpression(), !647)
    #dbg_value(ptr %68, !639, !DIExpression(), !647)
    #dbg_value(i32 4, !646, !DIExpression(), !647)
  %72 = load i16, ptr %71, align 1, !dbg !647, !tbaa !671
    #dbg_value(i16 %72, !645, !DIExpression(), !647)
  br label %73, !dbg !707

73:                                               ; preds = %70, %67, %60, %57, %50, %47, %40, %30, %37
  %74 = phi ptr [ %68, %70 ], [ %28, %30 ], [ %28, %37 ], [ %38, %40 ], [ %38, %47 ], [ %58, %67 ], [ %48, %50 ], [ %48, %57 ], [ %58, %60 ], !dbg !647
  %75 = phi i16 [ %72, %70 ], [ %32, %30 ], [ %32, %37 ], [ %42, %40 ], [ %42, %47 ], [ %62, %67 ], [ %52, %50 ], [ %52, %57 ], [ %62, %60 ], !dbg !647
    #dbg_value(ptr %74, !209, !DIExpression(), !655)
    #dbg_value(i16 %75, !208, !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value), !655)
  switch i16 %75, label %414 [
    i16 8, label %76
    i16 -8826, label %258
  ], !dbg !708

76:                                               ; preds = %73
    #dbg_value(ptr undef, !618, !DIExpression(), !628)
    #dbg_value(ptr %24, !624, !DIExpression(), !628)
    #dbg_value(ptr poison, !625, !DIExpression(), !628)
    #dbg_value(ptr %74, !626, !DIExpression(), !628)
  %77 = getelementptr inbounds nuw i8, ptr %74, i64 20, !dbg !709
  %78 = icmp ugt ptr %77, %24, !dbg !711
  br i1 %78, label %86, label %79, !dbg !712

79:                                               ; preds = %76
  %80 = load i8, ptr %74, align 4, !dbg !713
  %81 = shl i8 %80, 2, !dbg !714
  %82 = and i8 %81, 60, !dbg !714
  %83 = zext nneg i8 %82 to i64, !dbg !715
    #dbg_value(i64 %83, !627, !DIExpression(), !628)
  %84 = getelementptr inbounds nuw i8, ptr %74, i64 %83, !dbg !715
  %85 = icmp ugt ptr %84, %24, !dbg !717
  br i1 %85, label %86, label %87, !dbg !718

86:                                               ; preds = %79, %76
    #dbg_value(ptr null, !229, !DIExpression(), !655)
    #dbg_value(ptr %74, !209, !DIExpression(), !655)
    #dbg_value(i32 -1, !301, !DIExpression(), !650)
  call void @llvm.lifetime.start.p0(ptr nonnull %17) #5, !dbg !719
    #dbg_assign(i32 32, !304, !DIExpression(DW_OP_LLVM_fragment, 0, 32), !720, ptr %17, !DIExpression(), !650)
  call void @llvm.lifetime.start.p0(ptr nonnull %18) #5, !dbg !721
    #dbg_assign(i32 32, !305, !DIExpression(DW_OP_LLVM_fragment, 0, 32), !722, ptr %18, !DIExpression(), !650)
  br label %255, !dbg !723

87:                                               ; preds = %79
    #dbg_value(ptr %84, !209, !DIExpression(), !655)
    #dbg_value(ptr %74, !229, !DIExpression(), !655)
  %88 = getelementptr inbounds nuw i8, ptr %74, i64 9, !dbg !724
  %89 = load i8, ptr %88, align 1, !dbg !725, !tbaa !726
    #dbg_value(i8 %89, !301, !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value), !650)
  call void @llvm.lifetime.start.p0(ptr nonnull %17) #5, !dbg !719
  store i32 32, ptr %17, align 4, !dbg !728, !tbaa !729, !DIAssignID !720
    #dbg_assign(i32 32, !304, !DIExpression(DW_OP_LLVM_fragment, 0, 32), !720, ptr %17, !DIExpression(), !650)
  call void @llvm.lifetime.start.p0(ptr nonnull %18) #5, !dbg !721
  store i32 32, ptr %18, align 4, !dbg !731, !tbaa !729, !DIAssignID !722
    #dbg_assign(i32 32, !305, !DIExpression(DW_OP_LLVM_fragment, 0, 32), !722, ptr %18, !DIExpression(), !650)
  %90 = getelementptr inbounds nuw i8, ptr %17, i64 4, !dbg !732
  %91 = getelementptr inbounds nuw i8, ptr %74, i64 12, !dbg !735
  %92 = load i32, ptr %91, align 4, !dbg !736
  store i32 %92, ptr %90, align 4, !dbg !736, !DIAssignID !737
    #dbg_assign(i1 poison, !304, !DIExpression(DW_OP_LLVM_fragment, 32, 32), !737, ptr %90, !DIExpression(), !650)
  %93 = getelementptr inbounds nuw i8, ptr %18, i64 4, !dbg !738
  %94 = getelementptr inbounds nuw i8, ptr %74, i64 16, !dbg !739
  %95 = load i32, ptr %94, align 4, !dbg !740
  store i32 %95, ptr %93, align 4, !dbg !740, !DIAssignID !741
    #dbg_assign(i1 poison, !305, !DIExpression(DW_OP_LLVM_fragment, 32, 32), !741, ptr %93, !DIExpression(), !650)
    #dbg_value(ptr %17, !742, !DIExpression(), !746)
    #dbg_value(ptr null, !745, !DIExpression(), !746)
  %96 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @ipv4_bans, ptr noundef nonnull %17) #5, !dbg !749
    #dbg_value(ptr %96, !745, !DIExpression(), !746)
  %97 = icmp eq ptr %96, null, !dbg !750
  br i1 %97, label %101, label %98, !dbg !752

98:                                               ; preds = %87
  %99 = load i8, ptr %96, align 1, !dbg !753, !tbaa !754
  %100 = icmp eq i8 %99, 0, !dbg !755
  br i1 %100, label %101, label %256, !dbg !756

101:                                              ; preds = %98, %87
    #dbg_value(ptr %18, !742, !DIExpression(), !757)
    #dbg_value(ptr null, !745, !DIExpression(), !757)
  %102 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @ipv4_bans, ptr noundef nonnull %18) #5, !dbg !760
    #dbg_value(ptr %102, !745, !DIExpression(), !757)
  %103 = icmp eq ptr %102, null, !dbg !761
  br i1 %103, label %107, label %104, !dbg !762

104:                                              ; preds = %101
  %105 = load i8, ptr %102, align 1, !dbg !763, !tbaa !754
  %106 = icmp eq i8 %105, 0, !dbg !764
  br i1 %106, label %107, label %256, !dbg !765

107:                                              ; preds = %104, %101
  switch i8 %89, label %255 [
    i8 17, label %108
    i8 6, label %187
    i8 1, label %246
  ], !dbg !723

108:                                              ; preds = %107
    #dbg_value(ptr null, !306, !DIExpression(), !766)
    #dbg_value(ptr undef, !604, !DIExpression(), !614)
    #dbg_value(ptr %24, !610, !DIExpression(), !614)
    #dbg_value(ptr poison, !611, !DIExpression(), !614)
    #dbg_value(ptr %84, !613, !DIExpression(), !614)
  %109 = getelementptr inbounds nuw i8, ptr %84, i64 8, !dbg !767
  %110 = icmp ugt ptr %109, %24, !dbg !769
  br i1 %110, label %256, label %111, !dbg !770

111:                                              ; preds = %108
    #dbg_value(ptr %109, !209, !DIExpression(), !655)
    #dbg_value(ptr %84, !306, !DIExpression(), !766)
  %112 = getelementptr inbounds nuw i8, ptr %84, i64 4, !dbg !771
  %113 = load i16, ptr %112, align 2, !dbg !771, !tbaa !772
  %114 = call i16 @llvm.bswap.i16(i16 %113), !dbg !774
    #dbg_value(i16 %114, !612, !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_constu, 8, DW_OP_minus, DW_OP_stack_value), !614)
  %115 = icmp ult i16 %114, 8, !dbg !775
  br i1 %115, label %256, label %116, !dbg !777

116:                                              ; preds = %111
    #dbg_value(i16 %114, !612, !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_constu, 8, DW_OP_minus, DW_OP_stack_value), !614)
    #dbg_value(i16 %114, !612, !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_constu, 8, DW_OP_minus, DW_OP_stack_value), !614)
    #dbg_value(ptr %84, !306, !DIExpression(), !766)
    #dbg_value(ptr %109, !209, !DIExpression(), !655)
    #dbg_value(i16 %114, !317, !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_constu, 8, DW_OP_minus, DW_OP_stack_value), !766)
  %117 = load i16, ptr %84, align 2, !dbg !778, !tbaa !779
    #dbg_value(i16 %117, !318, !DIExpression(), !766)
  call void @llvm.lifetime.start.p0(ptr nonnull %9)
    #dbg_assign(i1 poison, !780, !DIExpression(), !500, ptr %9, !DIExpression(), !786)
  store i16 %117, ptr %9, align 2, !tbaa !671, !DIAssignID !789
    #dbg_assign(i16 %117, !780, !DIExpression(), !789, ptr %9, !DIExpression(), !786)
    #dbg_value(ptr null, !785, !DIExpression(), !786)
  %118 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @port_bans, ptr noundef nonnull %9) #5, !dbg !790
    #dbg_value(ptr %118, !785, !DIExpression(), !786)
  %119 = icmp eq ptr %118, null, !dbg !791
  br i1 %119, label %124, label %120, !dbg !793

120:                                              ; preds = %116
  %121 = load i8, ptr %118, align 1, !dbg !794, !tbaa !754
  %122 = icmp eq i8 %121, 0, !dbg !795
  br i1 %122, label %124, label %123, !dbg !796

123:                                              ; preds = %120
  call void @llvm.lifetime.end.p0(ptr nonnull %9), !dbg !797
  br label %256, !dbg !798

124:                                              ; preds = %120, %116
  call void @llvm.lifetime.end.p0(ptr nonnull %9), !dbg !799
  %125 = getelementptr inbounds nuw i8, ptr %84, i64 2, !dbg !800
  %126 = load i16, ptr %125, align 2, !dbg !801, !tbaa !802
    #dbg_value(i16 %126, !319, !DIExpression(), !766)
  call void @llvm.lifetime.start.p0(ptr nonnull %10)
    #dbg_assign(i1 poison, !780, !DIExpression(), !501, ptr %10, !DIExpression(), !803)
  store i16 %126, ptr %10, align 2, !tbaa !671, !DIAssignID !806
    #dbg_assign(i16 %126, !780, !DIExpression(), !806, ptr %10, !DIExpression(), !803)
    #dbg_value(ptr null, !785, !DIExpression(), !803)
  %127 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @port_bans, ptr noundef nonnull %10) #5, !dbg !807
    #dbg_value(ptr %127, !785, !DIExpression(), !803)
  %128 = icmp eq ptr %127, null, !dbg !808
  br i1 %128, label %133, label %129, !dbg !809

129:                                              ; preds = %124
  %130 = load i8, ptr %127, align 1, !dbg !810, !tbaa !754
  %131 = icmp eq i8 %130, 0, !dbg !811
  br i1 %131, label %133, label %132, !dbg !812

132:                                              ; preds = %129
  call void @llvm.lifetime.end.p0(ptr nonnull %10), !dbg !813
  br label %256, !dbg !814

133:                                              ; preds = %129, %124
  call void @llvm.lifetime.end.p0(ptr nonnull %10), !dbg !815
  %134 = icmp eq i16 %117, 13568, !dbg !816
  %135 = icmp eq i16 %117, -5868
  %136 = call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %134)
  %137 = or i1 %135, %136, !dbg !817
  %138 = icmp eq i16 %126, 13568
  %139 = or i1 %138, %137, !dbg !817
  %140 = icmp eq i16 %126, -5868
  %141 = or i1 %140, %139, !dbg !817
  br i1 %141, label %142, label %255, !dbg !817

142:                                              ; preds = %133
    #dbg_value(ptr null, !320, !DIExpression(), !818)
    #dbg_value(ptr undef, !593, !DIExpression(), !602)
    #dbg_value(ptr %24, !599, !DIExpression(), !602)
    #dbg_value(ptr poison, !600, !DIExpression(), !602)
    #dbg_value(ptr %109, !601, !DIExpression(), !602)
  %143 = getelementptr inbounds nuw i8, ptr %84, i64 20, !dbg !819
  %144 = icmp ugt ptr %143, %24, !dbg !821
  br i1 %144, label %255, label %145, !dbg !822

145:                                              ; preds = %142
    #dbg_value(ptr %109, !320, !DIExpression(), !818)
    #dbg_value(ptr %143, !209, !DIExpression(), !655)
    #dbg_value(ptr undef, !577, !DIExpression(), !588)
    #dbg_value(ptr %24, !582, !DIExpression(), !588)
    #dbg_value(ptr %109, !583, !DIExpression(), !588)
  %146 = getelementptr inbounds nuw i8, ptr %84, i64 10, !dbg !823
  %147 = load i16, ptr %146, align 2, !dbg !823, !tbaa !824
    #dbg_value(i16 poison, !584, !DIExpression(), !588)
  %148 = and i16 %147, 128, !dbg !826
  %149 = icmp eq i16 %148, 0, !dbg !826
  br i1 %149, label %255, label %150, !dbg !828

150:                                              ; preds = %145
  %151 = getelementptr inbounds nuw i8, ptr %84, i64 12, !dbg !829
  %152 = load i16, ptr %151, align 2, !dbg !829, !tbaa !830
    #dbg_value(i16 poison, !585, !DIExpression(), !588)
  %153 = icmp eq i16 %152, 0, !dbg !831
  br i1 %153, label %255, label %157, !dbg !833

154:                                              ; preds = %169
  %155 = add nuw nsw i64 %158, 1, !dbg !834
    #dbg_value(i64 %155, !846, !DIExpression(), !851)
    #dbg_value(i64 0, !586, !DIExpression(), !588)
    #dbg_value(i64 %155, !846, !DIExpression(), !851)
    #dbg_value(i64 %176, !844, !DIExpression(), !852)
  %156 = icmp eq i64 %155, 128, !dbg !853
  br i1 %156, label %255, label %157, !dbg !854, !llvm.loop !855

157:                                              ; preds = %150, %154
  %158 = phi i64 [ %155, %154 ], [ 0, %150 ]
  %159 = phi i64 [ %176, %154 ], [ -3750763034362895579, %150 ]
    #dbg_value(i64 %158, !846, !DIExpression(), !851)
    #dbg_value(i64 %159, !844, !DIExpression(), !852)
  %160 = getelementptr inbounds nuw i8, ptr %143, i64 %158, !dbg !859
  %161 = getelementptr inbounds nuw i8, ptr %160, i64 1, !dbg !861
  %162 = icmp samesign ugt ptr %161, %24, !dbg !862
  br i1 %162, label %255, label %163, !dbg !863

163:                                              ; preds = %157
  %164 = load i8, ptr %160, align 1, !dbg !864, !tbaa !754
    #dbg_value(i8 %164, !847, !DIExpression(), !865)
  %165 = icmp ugt i8 %164, -65, !dbg !866
  br i1 %165, label %166, label %169, !dbg !868

166:                                              ; preds = %163
  %167 = getelementptr inbounds nuw i8, ptr %160, i64 2, !dbg !869
  %168 = icmp ugt ptr %167, %24, !dbg !872
  br i1 %168, label %255, label %178, !dbg !873

169:                                              ; preds = %163
    #dbg_value(i8 %164, !849, !DIExpression(), !865)
  %170 = add i8 %164, -65, !dbg !874
  %171 = icmp ult i8 %170, 26, !dbg !874
  %172 = or disjoint i8 %164, 32, !dbg !874
  %173 = select i1 %171, i8 %172, i8 %164, !dbg !874
    #dbg_value(i8 %173, !849, !DIExpression(), !865)
  %174 = zext i8 %173 to i64, !dbg !876
  %175 = xor i64 %159, %174, !dbg !877
    #dbg_value(i64 %175, !844, !DIExpression(), !852)
  %176 = mul i64 %175, 1099511628211, !dbg !878
    #dbg_value(i64 %176, !844, !DIExpression(), !852)
  %177 = icmp eq i8 %164, 0, !dbg !879
    #dbg_value(i64 0, !586, !DIExpression(), !588)
    #dbg_value(i64 %176, !844, !DIExpression(), !852)
    #dbg_value(i64 %158, !846, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !851)
  br i1 %177, label %178, label %154, !dbg !881

178:                                              ; preds = %169, %166
  %179 = phi i64 [ 0, %166 ], [ %176, %169 ], !dbg !882
    #dbg_value(i64 %179, !586, !DIExpression(), !588)
    #dbg_value(ptr poison, !587, !DIExpression(), !588)
  call void @llvm.lifetime.start.p0(ptr nonnull %2)
    #dbg_assign(i1 poison, !883, !DIExpression(), !452, ptr %2, !DIExpression(), !889)
  store i64 %179, ptr %2, align 8, !tbaa !891, !DIAssignID !893
    #dbg_assign(i64 %179, !883, !DIExpression(), !893, ptr %2, !DIExpression(), !889)
    #dbg_value(ptr null, !888, !DIExpression(), !889)
  %180 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @domain_bans, ptr noundef nonnull %2) #5, !dbg !894
    #dbg_value(ptr %180, !888, !DIExpression(), !889)
  %181 = icmp eq ptr %180, null, !dbg !895
  br i1 %181, label %185, label %182, !dbg !897

182:                                              ; preds = %178
  %183 = load i8, ptr %180, align 1, !dbg !898, !tbaa !754
  %184 = icmp eq i8 %183, 0, !dbg !899
  br i1 %184, label %185, label %186, !dbg !900

185:                                              ; preds = %178, %182
  call void @llvm.lifetime.end.p0(ptr nonnull %2), !dbg !901
  br label %255, !dbg !902

186:                                              ; preds = %182
  call void @llvm.lifetime.end.p0(ptr nonnull %2), !dbg !903
  br label %256

187:                                              ; preds = %107
    #dbg_value(ptr null, !333, !DIExpression(), !904)
    #dbg_value(ptr undef, !563, !DIExpression(), !573)
    #dbg_value(ptr %24, !569, !DIExpression(), !573)
    #dbg_value(ptr poison, !570, !DIExpression(), !573)
    #dbg_value(ptr %84, !572, !DIExpression(), !573)
  %188 = getelementptr inbounds nuw i8, ptr %84, i64 20, !dbg !905
  %189 = icmp ugt ptr %188, %24, !dbg !907
  br i1 %189, label %256, label %190, !dbg !908

190:                                              ; preds = %187
  %191 = getelementptr inbounds nuw i8, ptr %84, i64 12, !dbg !909
  %192 = load i16, ptr %191, align 4, !dbg !909
  %193 = lshr i16 %192, 2, !dbg !910
  %194 = and i16 %193, 60, !dbg !910
    #dbg_value(i16 %194, !571, !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value), !573)
  %195 = icmp samesign ult i16 %194, 20, !dbg !911
  %196 = zext nneg i16 %194 to i64
  %197 = getelementptr inbounds nuw i8, ptr %84, i64 %196
  %198 = icmp ugt ptr %197, %24
  %199 = select i1 %195, i1 true, i1 %198, !dbg !913
  br i1 %199, label %256, label %200, !dbg !913

200:                                              ; preds = %190
    #dbg_value(ptr poison, !209, !DIExpression(), !655)
    #dbg_value(ptr %84, !333, !DIExpression(), !904)
    #dbg_value(i16 %194, !358, !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value), !904)
    #dbg_value(ptr %84, !914, !DIExpression(), !919)
  %201 = and i16 %192, -256, !dbg !921
  switch i16 %201, label %206 [
    i16 256, label %256
    i16 5120, label %202
  ], !dbg !921

202:                                              ; preds = %200
  %203 = getelementptr inbounds nuw i8, ptr %84, i64 14, !dbg !923
  %204 = load i16, ptr %203, align 2, !dbg !923, !tbaa !925
  %205 = icmp eq i16 %204, 0, !dbg !927
  br i1 %205, label %256, label %206, !dbg !928

206:                                              ; preds = %200, %202
    #dbg_value(ptr %84, !929, !DIExpression(), !932)
  %207 = and i16 %192, -8448, !dbg !934
  %208 = icmp eq i16 %207, 512, !dbg !934
  br i1 %208, label %209, label %228, !dbg !934

209:                                              ; preds = %206
  %210 = getelementptr inbounds nuw i8, ptr %84, i64 14, !dbg !936
  %211 = load i16, ptr %210, align 2, !dbg !936, !tbaa !925
  %212 = icmp eq i16 %211, -1296, !dbg !937
  br i1 %212, label %213, label %228, !dbg !938

213:                                              ; preds = %209
    #dbg_assign(i1 poison, !490, !DIExpression(), !499, ptr %8, !DIExpression(), !939)
    #dbg_value(ptr %17, !485, !DIExpression(), !940)
    #dbg_value(ptr null, !486, !DIExpression(), !940)
  %214 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @ipv4_warnings, ptr noundef nonnull %17) #5, !dbg !941
    #dbg_value(ptr %214, !486, !DIExpression(), !940)
  %215 = icmp eq ptr %214, null, !dbg !942
  br i1 %215, label %226, label %216, !dbg !943

216:                                              ; preds = %213
  call void @llvm.lifetime.start.p0(ptr nonnull %6) #5, !dbg !944
    #dbg_assign(i8 0, !478, !DIExpression(), !945, ptr %6, !DIExpression(), !492)
  %217 = load i8, ptr %214, align 1, !dbg !946, !tbaa !754
  %218 = add i8 %217, 1, !dbg !947
  store i8 %218, ptr %6, align 1, !dbg !948, !tbaa !754, !DIAssignID !949
    #dbg_assign(i8 %218, !478, !DIExpression(), !949, ptr %6, !DIExpression(), !492)
  %219 = call i64 inttoptr (i64 2 to ptr)(ptr noundef nonnull @ipv4_warnings, ptr noundef nonnull %17, ptr noundef nonnull %6, i64 noundef 0) #5, !dbg !950
  %220 = load i8, ptr %6, align 1, !dbg !951, !tbaa !754
  %221 = icmp ugt i8 %220, 16, !dbg !952
  br i1 %221, label %222, label %225, !dbg !953

222:                                              ; preds = %216
  call void @llvm.lifetime.start.p0(ptr nonnull %7) #5, !dbg !954
  store i8 1, ptr %7, align 1, !dbg !955, !tbaa !754, !DIAssignID !956
    #dbg_assign(i8 1, !487, !DIExpression(), !956, ptr %7, !DIExpression(), !498)
  %223 = call i64 inttoptr (i64 2 to ptr)(ptr noundef nonnull @ipv4_bans, ptr noundef nonnull %17, ptr noundef nonnull %7, i64 noundef 0) #5, !dbg !957
  %224 = call i64 inttoptr (i64 3 to ptr)(ptr noundef nonnull @ipv4_warnings, ptr noundef nonnull %17) #5, !dbg !958
  call void @llvm.lifetime.end.p0(ptr nonnull %7) #5, !dbg !959
  br label %225, !dbg !960

225:                                              ; preds = %222, %216
  call void @llvm.lifetime.end.p0(ptr nonnull %6) #5, !dbg !961
  br label %228, !dbg !962

226:                                              ; preds = %213
  call void @llvm.lifetime.start.p0(ptr nonnull %8) #5, !dbg !963
  store i8 1, ptr %8, align 1, !dbg !964, !tbaa !754, !DIAssignID !965
    #dbg_assign(i8 1, !490, !DIExpression(), !965, ptr %8, !DIExpression(), !939)
  %227 = call i64 inttoptr (i64 2 to ptr)(ptr noundef nonnull @ipv4_warnings, ptr noundef nonnull %17, ptr noundef nonnull %8, i64 noundef 0) #5, !dbg !966
  call void @llvm.lifetime.end.p0(ptr nonnull %8) #5, !dbg !967
  br label %228

228:                                              ; preds = %226, %225, %209, %206
  %229 = load i16, ptr %84, align 4, !dbg !968, !tbaa !969
    #dbg_value(i16 %229, !359, !DIExpression(), !904)
  call void @llvm.lifetime.start.p0(ptr nonnull %11)
    #dbg_assign(i1 poison, !780, !DIExpression(), !502, ptr %11, !DIExpression(), !970)
  store i16 %229, ptr %11, align 2, !tbaa !671, !DIAssignID !973
    #dbg_assign(i16 %229, !780, !DIExpression(), !973, ptr %11, !DIExpression(), !970)
    #dbg_value(ptr null, !785, !DIExpression(), !970)
  %230 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @port_bans, ptr noundef nonnull %11) #5, !dbg !974
    #dbg_value(ptr %230, !785, !DIExpression(), !970)
  %231 = icmp eq ptr %230, null, !dbg !975
  br i1 %231, label %236, label %232, !dbg !976

232:                                              ; preds = %228
  %233 = load i8, ptr %230, align 1, !dbg !977, !tbaa !754
  %234 = icmp eq i8 %233, 0, !dbg !978
  br i1 %234, label %236, label %235, !dbg !979

235:                                              ; preds = %232
  call void @llvm.lifetime.end.p0(ptr nonnull %11), !dbg !980
  br label %256, !dbg !981

236:                                              ; preds = %232, %228
  call void @llvm.lifetime.end.p0(ptr nonnull %11), !dbg !982
  %237 = getelementptr inbounds nuw i8, ptr %84, i64 2, !dbg !983
  %238 = load i16, ptr %237, align 2, !dbg !984, !tbaa !985
    #dbg_value(i16 %238, !360, !DIExpression(), !904)
  call void @llvm.lifetime.start.p0(ptr nonnull %12)
    #dbg_assign(i1 poison, !780, !DIExpression(), !503, ptr %12, !DIExpression(), !986)
  store i16 %238, ptr %12, align 2, !tbaa !671, !DIAssignID !989
    #dbg_assign(i16 %238, !780, !DIExpression(), !989, ptr %12, !DIExpression(), !986)
    #dbg_value(ptr null, !785, !DIExpression(), !986)
  %239 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @port_bans, ptr noundef nonnull %12) #5, !dbg !990
    #dbg_value(ptr %239, !785, !DIExpression(), !986)
  %240 = icmp eq ptr %239, null, !dbg !991
  br i1 %240, label %244, label %241, !dbg !992

241:                                              ; preds = %236
  %242 = load i8, ptr %239, align 1, !dbg !993, !tbaa !754
  %243 = icmp eq i8 %242, 0, !dbg !994
  br i1 %243, label %244, label %245, !dbg !995

244:                                              ; preds = %236, %241
  call void @llvm.lifetime.end.p0(ptr nonnull %12), !dbg !996
  br label %255

245:                                              ; preds = %241
  call void @llvm.lifetime.end.p0(ptr nonnull %12), !dbg !997
  br label %256

246:                                              ; preds = %107
    #dbg_value(ptr null, !361, !DIExpression(), !998)
    #dbg_value(ptr undef, !550, !DIExpression(), !559)
    #dbg_value(ptr %24, !556, !DIExpression(), !559)
    #dbg_value(ptr poison, !557, !DIExpression(), !559)
    #dbg_value(ptr %84, !558, !DIExpression(), !559)
  %247 = getelementptr inbounds nuw i8, ptr %84, i64 8, !dbg !999
  %248 = icmp ugt ptr %247, %24, !dbg !1001
  br i1 %248, label %255, label %249, !dbg !1002

249:                                              ; preds = %246
    #dbg_value(ptr %247, !209, !DIExpression(), !655)
    #dbg_value(ptr %84, !361, !DIExpression(), !998)
    #dbg_value(ptr %84, !1003, !DIExpression(), !1009)
  %250 = load i8, ptr %84, align 4, !dbg !1012, !tbaa !1013
    #dbg_value(i8 %250, !1008, !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value), !1009)
  %251 = icmp eq i8 %250, 0, !dbg !1015
  %252 = call i1 @llvm.bpf.passthrough.i1.i1(i32 1, i1 %251)
  %253 = freeze i1 %252, !dbg !1017
  br i1 %253, label %255, label %254, !dbg !1017

254:                                              ; preds = %249
  switch i8 %250, label %256 [
    i8 12, label %255
    i8 11, label %255
    i8 8, label %255
    i8 5, label %255
    i8 3, label %255
  ], !dbg !1018

255:                                              ; preds = %154, %157, %166, %254, %254, %254, %254, %254, %249, %246, %145, %150, %244, %133, %185, %142, %86, %107
  br label %256, !dbg !1019

256:                                              ; preds = %200, %254, %202, %190, %187, %111, %108, %104, %98, %235, %186, %123, %132, %245, %255
  %257 = phi i32 [ 1, %202 ], [ 1, %111 ], [ 2, %255 ], [ 1, %254 ], [ 1, %245 ], [ 1, %98 ], [ 1, %132 ], [ 1, %123 ], [ 1, %104 ], [ 1, %186 ], [ 1, %235 ], [ 1, %200 ], [ 1, %108 ], [ 1, %187 ], [ 1, %190 ], !dbg !650
  call void @llvm.lifetime.end.p0(ptr nonnull %18) #5, !dbg !1020
  call void @llvm.lifetime.end.p0(ptr nonnull %17) #5, !dbg !1020
  br label %414

258:                                              ; preds = %73
    #dbg_value(ptr undef, !533, !DIExpression(), !549)
    #dbg_value(ptr %24, !534, !DIExpression(), !549)
    #dbg_value(ptr poison, !535, !DIExpression(), !549)
    #dbg_value(ptr %74, !536, !DIExpression(), !549)
  %259 = getelementptr inbounds nuw i8, ptr %74, i64 40, !dbg !1021
  %260 = icmp ugt ptr %259, %24, !dbg !1023
  br i1 %260, label %289, label %261, !dbg !1024

261:                                              ; preds = %258
    #dbg_value(ptr %259, !209, !DIExpression(), !655)
    #dbg_value(ptr %74, !260, !DIExpression(), !655)
    #dbg_value(ptr undef, !508, !DIExpression(), !526)
    #dbg_value(ptr %24, !514, !DIExpression(), !526)
    #dbg_value(i8 poison, !515, !DIExpression(), !526)
    #dbg_value(i32 0, !516, !DIExpression(), !1025)
  %262 = getelementptr inbounds nuw i8, ptr %74, i64 42
  %263 = icmp ugt ptr %262, %24
  br i1 %263, label %290, label %264, !dbg !1026

264:                                              ; preds = %261
  %265 = getelementptr inbounds nuw i8, ptr %74, i64 6, !dbg !1027
  br label %266, !dbg !1028

266:                                              ; preds = %264, %281
  %267 = phi ptr [ %269, %281 ], [ %265, %264 ]
  %268 = phi i32 [ %284, %281 ], [ 0, %264 ]
  %269 = phi ptr [ %283, %281 ], [ %259, %264 ]
  %270 = load i8, ptr %267, align 1, !dbg !1029, !tbaa !754
    #dbg_value(i32 %268, !516, !DIExpression(), !1025)
    #dbg_value(ptr %269, !209, !DIExpression(), !655)
  switch i8 %270, label %272 [
    i8 0, label %274
    i8 60, label %274
    i8 43, label %274
    i8 -121, label %274
    i8 51, label %271
    i8 44, label %281
  ], !dbg !1030

271:                                              ; preds = %266
    #dbg_value(ptr %283, !209, !DIExpression(), !655)
    #dbg_value(i8 poison, !515, !DIExpression(), !526)
  br label %274, !dbg !1031

272:                                              ; preds = %266
  %273 = zext i8 %270 to i32, !dbg !1033
  br label %290, !dbg !1034

274:                                              ; preds = %266, %266, %266, %266, %271
  %275 = phi i64 [ 2, %271 ], [ 3, %266 ], [ 3, %266 ], [ 3, %266 ], [ 3, %266 ]
  %276 = getelementptr inbounds nuw i8, ptr %269, i64 1, !dbg !1035
  %277 = load i8, ptr %276, align 1, !dbg !1035, !tbaa !1036
  %278 = zext i8 %277 to i64, !dbg !1035
  %279 = shl nuw nsw i64 %278, %275, !dbg !1035
  %280 = getelementptr inbounds nuw i8, ptr %269, i64 %279, !dbg !1035
  br label %281, !dbg !1035

281:                                              ; preds = %274, %266
  %282 = phi ptr [ %269, %266 ], [ %280, %274 ]
  %283 = getelementptr inbounds nuw i8, ptr %282, i64 8, !dbg !1035
    #dbg_value(ptr %283, !209, !DIExpression(), !655)
    #dbg_value(i8 poison, !515, !DIExpression(), !526)
  %284 = add nuw nsw i32 %268, 1, !dbg !1038
    #dbg_value(i32 %284, !516, !DIExpression(), !1025)
    #dbg_value(i8 poison, !515, !DIExpression(), !526)
  %285 = icmp samesign ugt i32 %268, 4, !dbg !1039
    #dbg_value(ptr %283, !518, !DIExpression(), !1040)
  %286 = getelementptr inbounds nuw i8, ptr %282, i64 10
  %287 = icmp ugt ptr %286, %24
  %288 = select i1 %285, i1 true, i1 %287, !dbg !1041
  br i1 %288, label %290, label %266, !dbg !1041, !llvm.loop !1042

289:                                              ; preds = %258
    #dbg_value(ptr null, !260, !DIExpression(), !655)
    #dbg_value(ptr %74, !209, !DIExpression(), !655)
    #dbg_value(i32 -1, !387, !DIExpression(), !653)
  call void @llvm.lifetime.start.p0(ptr nonnull %19) #5, !dbg !1044
    #dbg_assign(i32 128, !390, !DIExpression(DW_OP_LLVM_fragment, 0, 32), !1045, ptr %19, !DIExpression(), !653)
  call void @llvm.lifetime.start.p0(ptr nonnull %20) #5, !dbg !1046
    #dbg_assign(i32 128, !391, !DIExpression(DW_OP_LLVM_fragment, 0, 32), !1047, ptr %20, !DIExpression(), !653)
  br label %412, !dbg !1048

290:                                              ; preds = %281, %261, %272
  %291 = phi ptr [ %269, %272 ], [ %259, %261 ], [ %283, %281 ]
  %292 = phi i32 [ %273, %272 ], [ -1, %261 ], [ -1, %281 ]
    #dbg_value(ptr %74, !260, !DIExpression(), !655)
    #dbg_value(ptr %291, !209, !DIExpression(), !655)
    #dbg_value(i32 %292, !387, !DIExpression(), !653)
  call void @llvm.lifetime.start.p0(ptr nonnull %19) #5, !dbg !1044
  store i32 128, ptr %19, align 4, !dbg !1049, !tbaa !1050, !DIAssignID !1045
    #dbg_assign(i32 128, !390, !DIExpression(DW_OP_LLVM_fragment, 0, 32), !1045, ptr %19, !DIExpression(), !653)
  call void @llvm.lifetime.start.p0(ptr nonnull %20) #5, !dbg !1046
  store i32 128, ptr %20, align 4, !dbg !1052, !tbaa !1050, !DIAssignID !1047
    #dbg_assign(i32 128, !391, !DIExpression(DW_OP_LLVM_fragment, 0, 32), !1047, ptr %20, !DIExpression(), !653)
  %293 = getelementptr inbounds nuw i8, ptr %19, i64 4, !dbg !1053
  %294 = getelementptr inbounds nuw i8, ptr %74, i64 8, !dbg !1054
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 4 dereferenceable(16) %293, ptr noundef nonnull align 4 dereferenceable(16) %294, i64 16, i1 false), !dbg !1055, !DIAssignID !1056
    #dbg_assign(i1 poison, !390, !DIExpression(DW_OP_LLVM_fragment, 32, 128), !1056, ptr %293, !DIExpression(), !653)
  %295 = getelementptr inbounds nuw i8, ptr %20, i64 4, !dbg !1057
  %296 = getelementptr inbounds nuw i8, ptr %74, i64 24, !dbg !1058
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 4 dereferenceable(16) %295, ptr noundef nonnull align 4 dereferenceable(16) %296, i64 16, i1 false), !dbg !1059, !DIAssignID !1060
    #dbg_assign(i1 poison, !391, !DIExpression(DW_OP_LLVM_fragment, 32, 128), !1060, ptr %295, !DIExpression(), !653)
    #dbg_value(ptr %19, !1061, !DIExpression(), !1065)
    #dbg_value(ptr null, !1064, !DIExpression(), !1065)
  %297 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @ipv6_bans, ptr noundef nonnull %19) #5, !dbg !1068
    #dbg_value(ptr %297, !1064, !DIExpression(), !1065)
  %298 = icmp eq ptr %297, null, !dbg !1069
  br i1 %298, label %302, label %299, !dbg !1071

299:                                              ; preds = %290
  %300 = load i8, ptr %297, align 1, !dbg !1072, !tbaa !754
  %301 = icmp eq i8 %300, 0, !dbg !1073
  br i1 %301, label %302, label %413, !dbg !1074

302:                                              ; preds = %299, %290
    #dbg_value(ptr %20, !1061, !DIExpression(), !1075)
    #dbg_value(ptr null, !1064, !DIExpression(), !1075)
  %303 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @ipv6_bans, ptr noundef nonnull %20) #5, !dbg !1078
    #dbg_value(ptr %303, !1064, !DIExpression(), !1075)
  %304 = icmp eq ptr %303, null, !dbg !1079
  br i1 %304, label %308, label %305, !dbg !1080

305:                                              ; preds = %302
  %306 = load i8, ptr %303, align 1, !dbg !1081, !tbaa !754
  %307 = icmp eq i8 %306, 0, !dbg !1082
  br i1 %307, label %308, label %413, !dbg !1083

308:                                              ; preds = %305, %302
  switch i32 %292, label %412 [
    i32 17, label %309
    i32 6, label %335
    i32 1, label %394
    i32 58, label %403
  ], !dbg !1084

309:                                              ; preds = %308
    #dbg_value(ptr null, !392, !DIExpression(), !1085)
    #dbg_value(ptr undef, !604, !DIExpression(), !616)
    #dbg_value(ptr %24, !610, !DIExpression(), !616)
    #dbg_value(ptr poison, !611, !DIExpression(), !616)
    #dbg_value(ptr %291, !613, !DIExpression(), !616)
  %310 = getelementptr inbounds nuw i8, ptr %291, i64 8, !dbg !1086
  %311 = icmp ugt ptr %310, %24, !dbg !1087
  br i1 %311, label %413, label %312, !dbg !1088

312:                                              ; preds = %309
    #dbg_value(ptr %310, !209, !DIExpression(), !655)
    #dbg_value(ptr %291, !392, !DIExpression(), !1085)
  %313 = getelementptr inbounds nuw i8, ptr %291, i64 4, !dbg !1089
  %314 = load i16, ptr %313, align 2, !dbg !1089, !tbaa !772
  %315 = call i16 @llvm.bswap.i16(i16 %314), !dbg !1090
    #dbg_value(i16 %315, !612, !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_constu, 8, DW_OP_minus, DW_OP_stack_value), !616)
  %316 = icmp ult i16 %315, 8, !dbg !1091
  br i1 %316, label %413, label %317, !dbg !1092

317:                                              ; preds = %312
    #dbg_value(i16 %315, !612, !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_constu, 8, DW_OP_minus, DW_OP_stack_value), !616)
    #dbg_value(i16 %315, !612, !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_constu, 8, DW_OP_minus, DW_OP_stack_value), !616)
    #dbg_value(ptr %291, !392, !DIExpression(), !1085)
    #dbg_value(i16 %315, !397, !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_constu, 8, DW_OP_minus, DW_OP_stack_value), !1085)
  %318 = load i16, ptr %291, align 2, !dbg !1093, !tbaa !779
    #dbg_value(i16 %318, !398, !DIExpression(), !1085)
  call void @llvm.lifetime.start.p0(ptr nonnull %13)
    #dbg_assign(i1 poison, !780, !DIExpression(), !504, ptr %13, !DIExpression(), !1094)
  store i16 %318, ptr %13, align 2, !tbaa !671, !DIAssignID !1097
    #dbg_assign(i16 %318, !780, !DIExpression(), !1097, ptr %13, !DIExpression(), !1094)
    #dbg_value(ptr null, !785, !DIExpression(), !1094)
  %319 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @port_bans, ptr noundef nonnull %13) #5, !dbg !1098
    #dbg_value(ptr %319, !785, !DIExpression(), !1094)
  %320 = icmp eq ptr %319, null, !dbg !1099
  br i1 %320, label %325, label %321, !dbg !1100

321:                                              ; preds = %317
  %322 = load i8, ptr %319, align 1, !dbg !1101, !tbaa !754
  %323 = icmp eq i8 %322, 0, !dbg !1102
  br i1 %323, label %325, label %324, !dbg !1103

324:                                              ; preds = %321
  call void @llvm.lifetime.end.p0(ptr nonnull %13), !dbg !1104
  br label %413, !dbg !1105

325:                                              ; preds = %321, %317
  call void @llvm.lifetime.end.p0(ptr nonnull %13), !dbg !1106
  %326 = getelementptr inbounds nuw i8, ptr %291, i64 2, !dbg !1107
  %327 = load i16, ptr %326, align 2, !dbg !1108, !tbaa !802
    #dbg_value(i16 %327, !399, !DIExpression(), !1085)
  call void @llvm.lifetime.start.p0(ptr nonnull %14)
    #dbg_assign(i1 poison, !780, !DIExpression(), !505, ptr %14, !DIExpression(), !1109)
  store i16 %327, ptr %14, align 2, !tbaa !671, !DIAssignID !1112
    #dbg_assign(i16 %327, !780, !DIExpression(), !1112, ptr %14, !DIExpression(), !1109)
    #dbg_value(ptr null, !785, !DIExpression(), !1109)
  %328 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @port_bans, ptr noundef nonnull %14) #5, !dbg !1113
    #dbg_value(ptr %328, !785, !DIExpression(), !1109)
  %329 = icmp eq ptr %328, null, !dbg !1114
  br i1 %329, label %333, label %330, !dbg !1115

330:                                              ; preds = %325
  %331 = load i8, ptr %328, align 1, !dbg !1116, !tbaa !754
  %332 = icmp eq i8 %331, 0, !dbg !1117
  br i1 %332, label %333, label %334, !dbg !1118

333:                                              ; preds = %325, %330
  call void @llvm.lifetime.end.p0(ptr nonnull %14), !dbg !1119
  br label %412

334:                                              ; preds = %330
  call void @llvm.lifetime.end.p0(ptr nonnull %14), !dbg !1120
  br label %413

335:                                              ; preds = %308
    #dbg_value(ptr null, !400, !DIExpression(), !1121)
    #dbg_value(ptr undef, !563, !DIExpression(), !575)
    #dbg_value(ptr %24, !569, !DIExpression(), !575)
    #dbg_value(ptr poison, !570, !DIExpression(), !575)
    #dbg_value(ptr %291, !572, !DIExpression(), !575)
  %336 = getelementptr inbounds nuw i8, ptr %291, i64 20, !dbg !1122
  %337 = icmp ugt ptr %336, %24, !dbg !1123
  br i1 %337, label %413, label %338, !dbg !1124

338:                                              ; preds = %335
  %339 = getelementptr inbounds nuw i8, ptr %291, i64 12, !dbg !1125
  %340 = load i16, ptr %339, align 4, !dbg !1125
  %341 = lshr i16 %340, 2, !dbg !1126
  %342 = and i16 %341, 60, !dbg !1126
    #dbg_value(i16 %342, !571, !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value), !575)
  %343 = icmp samesign ult i16 %342, 20, !dbg !1127
  %344 = zext nneg i16 %342 to i64
  %345 = getelementptr inbounds nuw i8, ptr %291, i64 %344
  %346 = icmp ugt ptr %345, %24
  %347 = select i1 %343, i1 true, i1 %346, !dbg !1128
  br i1 %347, label %413, label %348, !dbg !1128

348:                                              ; preds = %338
    #dbg_value(ptr poison, !209, !DIExpression(), !655)
    #dbg_value(ptr %291, !400, !DIExpression(), !1121)
    #dbg_value(i16 %342, !403, !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value), !1121)
    #dbg_value(ptr %291, !914, !DIExpression(), !1129)
  %349 = and i16 %340, -256, !dbg !1131
  switch i16 %349, label %354 [
    i16 256, label %413
    i16 5120, label %350
  ], !dbg !1131

350:                                              ; preds = %348
  %351 = getelementptr inbounds nuw i8, ptr %291, i64 14, !dbg !1132
  %352 = load i16, ptr %351, align 2, !dbg !1132, !tbaa !925
  %353 = icmp eq i16 %352, 0, !dbg !1133
  br i1 %353, label %413, label %354, !dbg !1134

354:                                              ; preds = %348, %350
    #dbg_value(ptr %291, !929, !DIExpression(), !1135)
  %355 = and i16 %340, -8448, !dbg !1137
  %356 = icmp eq i16 %355, 512, !dbg !1137
  br i1 %356, label %357, label %376, !dbg !1137

357:                                              ; preds = %354
  %358 = getelementptr inbounds nuw i8, ptr %291, i64 14, !dbg !1138
  %359 = load i16, ptr %358, align 2, !dbg !1138, !tbaa !925
  %360 = icmp eq i16 %359, -1296, !dbg !1139
  br i1 %360, label %361, label %376, !dbg !1140

361:                                              ; preds = %357
    #dbg_assign(i1 poison, !467, !DIExpression(), !476, ptr %5, !DIExpression(), !1141)
    #dbg_value(ptr %19, !462, !DIExpression(), !1142)
    #dbg_value(ptr null, !463, !DIExpression(), !1142)
  %362 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @ipv6_warnings, ptr noundef nonnull %19) #5, !dbg !1143
    #dbg_value(ptr %362, !463, !DIExpression(), !1142)
  %363 = icmp eq ptr %362, null, !dbg !1144
  br i1 %363, label %374, label %364, !dbg !1145

364:                                              ; preds = %361
  call void @llvm.lifetime.start.p0(ptr nonnull %3) #5, !dbg !1146
    #dbg_assign(i8 0, !454, !DIExpression(), !1147, ptr %3, !DIExpression(), !469)
  %365 = load i8, ptr %362, align 1, !dbg !1148, !tbaa !754
  %366 = add i8 %365, 1, !dbg !1149
  store i8 %366, ptr %3, align 1, !dbg !1150, !tbaa !754, !DIAssignID !1151
    #dbg_assign(i8 %366, !454, !DIExpression(), !1151, ptr %3, !DIExpression(), !469)
  %367 = call i64 inttoptr (i64 2 to ptr)(ptr noundef nonnull @ipv6_warnings, ptr noundef nonnull %19, ptr noundef nonnull %3, i64 noundef 0) #5, !dbg !1152
  %368 = load i8, ptr %3, align 1, !dbg !1153, !tbaa !754
  %369 = icmp ugt i8 %368, 16, !dbg !1154
  br i1 %369, label %370, label %373, !dbg !1155

370:                                              ; preds = %364
  call void @llvm.lifetime.start.p0(ptr nonnull %4) #5, !dbg !1156
  store i8 1, ptr %4, align 1, !dbg !1157, !tbaa !754, !DIAssignID !1158
    #dbg_assign(i8 1, !464, !DIExpression(), !1158, ptr %4, !DIExpression(), !475)
  %371 = call i64 inttoptr (i64 2 to ptr)(ptr noundef nonnull @ipv6_bans, ptr noundef nonnull %19, ptr noundef nonnull %4, i64 noundef 0) #5, !dbg !1159
  %372 = call i64 inttoptr (i64 3 to ptr)(ptr noundef nonnull @ipv6_warnings, ptr noundef nonnull %19) #5, !dbg !1160
  call void @llvm.lifetime.end.p0(ptr nonnull %4) #5, !dbg !1161
  br label %373, !dbg !1162

373:                                              ; preds = %370, %364
  call void @llvm.lifetime.end.p0(ptr nonnull %3) #5, !dbg !1163
  br label %376, !dbg !1164

374:                                              ; preds = %361
  call void @llvm.lifetime.start.p0(ptr nonnull %5) #5, !dbg !1165
  store i8 1, ptr %5, align 1, !dbg !1166, !tbaa !754, !DIAssignID !1167
    #dbg_assign(i8 1, !467, !DIExpression(), !1167, ptr %5, !DIExpression(), !1141)
  %375 = call i64 inttoptr (i64 2 to ptr)(ptr noundef nonnull @ipv6_warnings, ptr noundef nonnull %19, ptr noundef nonnull %5, i64 noundef 0) #5, !dbg !1168
  call void @llvm.lifetime.end.p0(ptr nonnull %5) #5, !dbg !1169
  br label %376

376:                                              ; preds = %374, %373, %357, %354
  %377 = load i16, ptr %291, align 4, !dbg !1170, !tbaa !969
    #dbg_value(i16 %377, !404, !DIExpression(), !1121)
  call void @llvm.lifetime.start.p0(ptr nonnull %15)
    #dbg_assign(i1 poison, !780, !DIExpression(), !506, ptr %15, !DIExpression(), !1171)
  store i16 %377, ptr %15, align 2, !tbaa !671, !DIAssignID !1174
    #dbg_assign(i16 %377, !780, !DIExpression(), !1174, ptr %15, !DIExpression(), !1171)
    #dbg_value(ptr null, !785, !DIExpression(), !1171)
  %378 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @port_bans, ptr noundef nonnull %15) #5, !dbg !1175
    #dbg_value(ptr %378, !785, !DIExpression(), !1171)
  %379 = icmp eq ptr %378, null, !dbg !1176
  br i1 %379, label %384, label %380, !dbg !1177

380:                                              ; preds = %376
  %381 = load i8, ptr %378, align 1, !dbg !1178, !tbaa !754
  %382 = icmp eq i8 %381, 0, !dbg !1179
  br i1 %382, label %384, label %383, !dbg !1180

383:                                              ; preds = %380
  call void @llvm.lifetime.end.p0(ptr nonnull %15), !dbg !1181
  br label %413, !dbg !1182

384:                                              ; preds = %380, %376
  call void @llvm.lifetime.end.p0(ptr nonnull %15), !dbg !1183
  %385 = getelementptr inbounds nuw i8, ptr %291, i64 2, !dbg !1184
  %386 = load i16, ptr %385, align 2, !dbg !1185, !tbaa !985
    #dbg_value(i16 %386, !405, !DIExpression(), !1121)
  call void @llvm.lifetime.start.p0(ptr nonnull %16)
    #dbg_assign(i1 poison, !780, !DIExpression(), !507, ptr %16, !DIExpression(), !1186)
  store i16 %386, ptr %16, align 2, !tbaa !671, !DIAssignID !1189
    #dbg_assign(i16 %386, !780, !DIExpression(), !1189, ptr %16, !DIExpression(), !1186)
    #dbg_value(ptr null, !785, !DIExpression(), !1186)
  %387 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @port_bans, ptr noundef nonnull %16) #5, !dbg !1190
    #dbg_value(ptr %387, !785, !DIExpression(), !1186)
  %388 = icmp eq ptr %387, null, !dbg !1191
  br i1 %388, label %392, label %389, !dbg !1192

389:                                              ; preds = %384
  %390 = load i8, ptr %387, align 1, !dbg !1193, !tbaa !754
  %391 = icmp eq i8 %390, 0, !dbg !1194
  br i1 %391, label %392, label %393, !dbg !1195

392:                                              ; preds = %384, %389
  call void @llvm.lifetime.end.p0(ptr nonnull %16), !dbg !1196
  br label %412

393:                                              ; preds = %389
  call void @llvm.lifetime.end.p0(ptr nonnull %16), !dbg !1197
  br label %413

394:                                              ; preds = %308
    #dbg_value(ptr null, !406, !DIExpression(), !1198)
    #dbg_value(ptr undef, !550, !DIExpression(), !561)
    #dbg_value(ptr %24, !556, !DIExpression(), !561)
    #dbg_value(ptr poison, !557, !DIExpression(), !561)
    #dbg_value(ptr %291, !558, !DIExpression(), !561)
  %395 = getelementptr inbounds nuw i8, ptr %291, i64 8, !dbg !1199
  %396 = icmp ugt ptr %395, %24, !dbg !1200
  br i1 %396, label %412, label %397, !dbg !1201

397:                                              ; preds = %394
    #dbg_value(ptr %395, !209, !DIExpression(), !655)
    #dbg_value(ptr %291, !406, !DIExpression(), !1198)
    #dbg_value(ptr %291, !1003, !DIExpression(), !1202)
  %398 = load i8, ptr %291, align 4, !dbg !1205, !tbaa !1013
    #dbg_value(i8 %398, !1008, !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value), !1202)
  %399 = icmp eq i8 %398, 0, !dbg !1206
  %400 = call i1 @llvm.bpf.passthrough.i1.i1(i32 1, i1 %399)
  %401 = freeze i1 %400, !dbg !1207
  br i1 %401, label %412, label %402, !dbg !1207

402:                                              ; preds = %397
  switch i8 %398, label %413 [
    i8 12, label %412
    i8 11, label %412
    i8 8, label %412
    i8 5, label %412
    i8 3, label %412
  ], !dbg !1208

403:                                              ; preds = %308
    #dbg_value(ptr null, !409, !DIExpression(), !1209)
    #dbg_value(ptr undef, !538, !DIExpression(), !547)
    #dbg_value(ptr %24, !544, !DIExpression(), !547)
    #dbg_value(ptr poison, !545, !DIExpression(), !547)
    #dbg_value(ptr %291, !546, !DIExpression(), !547)
  %404 = getelementptr inbounds nuw i8, ptr %291, i64 8, !dbg !1210
  %405 = icmp ugt ptr %404, %24, !dbg !1212
  br i1 %405, label %412, label %406, !dbg !1213

406:                                              ; preds = %403
    #dbg_value(ptr %404, !209, !DIExpression(), !655)
    #dbg_value(ptr %291, !409, !DIExpression(), !1209)
    #dbg_value(ptr %291, !1214, !DIExpression(), !1220)
  %407 = load i8, ptr %291, align 4, !dbg !1223, !tbaa !1224
    #dbg_value(i8 %407, !1219, !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value), !1220)
  %408 = icmp eq i8 %407, 1, !dbg !1226
  %409 = call i1 @llvm.bpf.passthrough.i1.i1(i32 2, i1 %408)
  %410 = freeze i1 %409, !dbg !1228
  br i1 %410, label %412, label %411, !dbg !1228

411:                                              ; preds = %406
  switch i8 %407, label %413 [
    i8 -119, label %412
    i8 -120, label %412
    i8 -121, label %412
    i8 -122, label %412
    i8 -123, label %412
    i8 -127, label %412
    i8 -128, label %412
    i8 4, label %412
    i8 3, label %412
    i8 2, label %412
  ], !dbg !1229

412:                                              ; preds = %411, %411, %411, %411, %411, %411, %411, %411, %411, %411, %406, %402, %402, %402, %402, %402, %397, %403, %394, %392, %333, %289, %308
  call void @llvm.lifetime.end.p0(ptr nonnull %20) #5, !dbg !1230
  call void @llvm.lifetime.end.p0(ptr nonnull %19) #5, !dbg !1230
  br label %414

413:                                              ; preds = %348, %411, %402, %350, %338, %335, %312, %309, %305, %299, %383, %324, %393, %334
  call void @llvm.lifetime.end.p0(ptr nonnull %20) #5, !dbg !1230
  call void @llvm.lifetime.end.p0(ptr nonnull %19) #5, !dbg !1230
  br label %414

414:                                              ; preds = %256, %413, %412, %73, %1
  %415 = phi i32 [ 1, %1 ], [ %257, %256 ], [ 1, %413 ], [ 2, %412 ], [ 2, %73 ], !dbg !655
  ret i32 %415, !dbg !1231
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #1

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i64, i1 immarg) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #1

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.bswap.i16(i16) #3

; Function Attrs: nounwind memory(none)
declare i1 @llvm.bpf.passthrough.i1.i1(i32, i1) #4

attributes #0 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { nounwind memory(none) }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!182, !183, !184, !185, !186}
!llvm.ident = !{!187}
!llvm.errno.tbaa = !{!188}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !72, line: 616, type: !181, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "clang version 22.1.8", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !54, globals: !69, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/cookiengineer/Software/tholian-network/firewall/ebpf/module/module.c", directory: "/home/cookiengineer/Software/tholian-network/firewall/ebpf", checksumkind: CSK_MD5, checksum: "66aa64571a7f015073be49df950dfbba")
!4 = !{!5, !14, !48}
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
!15 = !DIFile(filename: "/usr/include/linux/in.h", directory: "", checksumkind: CSK_MD5, checksum: "fcde28429fcbe66e109e5fe5b99ccd45")
!16 = !{!17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47}
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
!43 = !DIEnumerator(name: "IPPROTO_AGGFRAG", value: 144)
!44 = !DIEnumerator(name: "IPPROTO_RAW", value: 255)
!45 = !DIEnumerator(name: "IPPROTO_SMC", value: 256)
!46 = !DIEnumerator(name: "IPPROTO_MPTCP", value: 262)
!47 = !DIEnumerator(name: "IPPROTO_MAX", value: 263)
!48 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !6, line: 1277, baseType: !7, size: 32, elements: !49)
!49 = !{!50, !51, !52, !53}
!50 = !DIEnumerator(name: "BPF_ANY", value: 0)
!51 = !DIEnumerator(name: "BPF_NOEXIST", value: 1)
!52 = !DIEnumerator(name: "BPF_EXIST", value: 2)
!53 = !DIEnumerator(name: "BPF_F_LOCK", value: 4)
!54 = !{!55, !56, !57, !60, !61, !64, !68}
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!56 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!57 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !58, line: 5, baseType: !59)
!58 = !DIFile(filename: "module/../headers/common.h", directory: "/home/cookiengineer/Software/tholian-network/firewall/ebpf", checksumkind: CSK_MD5, checksum: "26133999c1b887ae56aef26c8c215378")
!59 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!60 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !63)
!63 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !66)
!66 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !58, line: 3, baseType: !67)
!67 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!69 = !{!0, !70, !91, !113, !129, !146, !154, !163, !171, !176}
!70 = !DIGlobalVariableExpression(var: !71, expr: !DIExpression())
!71 = distinct !DIGlobalVariable(name: "domain_bans", scope: !2, file: !72, line: 33, type: !73, isLocal: false, isDefinition: true)
!72 = !DIFile(filename: "module/module.c", directory: "/home/cookiengineer/Software/tholian-network/firewall/ebpf", checksumkind: CSK_MD5, checksum: "66aa64571a7f015073be49df950dfbba")
!73 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !72, line: 28, size: 256, elements: !74)
!74 = !{!75, !80, !85, !89}
!75 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !73, file: !72, line: 29, baseType: !76, size: 64)
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DICompositeType(tag: DW_TAG_array_type, baseType: !60, size: 32, elements: !78)
!78 = !{!79}
!79 = !DISubrange(count: 1)
!80 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !73, file: !72, line: 30, baseType: !81, size: 64, offset: 64)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DICompositeType(tag: DW_TAG_array_type, baseType: !60, size: 2097120, elements: !83)
!83 = !{!84}
!84 = !DISubrange(count: 65535)
!85 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !73, file: !72, line: 31, baseType: !86, size: 64, offset: 128)
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !58, line: 9, baseType: !88)
!88 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!89 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !73, file: !72, line: 32, baseType: !90, size: 64, offset: 192)
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!91 = !DIGlobalVariableExpression(var: !92, expr: !DIExpression())
!92 = distinct !DIGlobalVariable(name: "ipv4_bans", scope: !2, file: !72, line: 42, type: !93, isLocal: false, isDefinition: true)
!93 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !72, line: 36, size: 320, elements: !94)
!94 = !{!95, !100, !101, !111, !112}
!95 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !93, file: !72, line: 37, baseType: !96, size: 64)
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 64)
!97 = !DICompositeType(tag: DW_TAG_array_type, baseType: !60, size: 352, elements: !98)
!98 = !{!99}
!99 = !DISubrange(count: 11)
!100 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !93, file: !72, line: 38, baseType: !81, size: 64, offset: 64)
!101 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !93, file: !72, line: 39, baseType: !102, size: 64, offset: 128)
!102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !103, size: 64)
!103 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipv4_subnet", file: !72, line: 17, size: 64, elements: !104)
!104 = !{!105, !107}
!105 = !DIDerivedType(tag: DW_TAG_member, name: "prefixlen", scope: !103, file: !72, line: 18, baseType: !106, size: 32)
!106 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !58, line: 7, baseType: !7)
!107 = !DIDerivedType(tag: DW_TAG_member, name: "address", scope: !103, file: !72, line: 19, baseType: !108, size: 32, offset: 32)
!108 = !DICompositeType(tag: DW_TAG_array_type, baseType: !66, size: 32, elements: !109)
!109 = !{!110}
!110 = !DISubrange(count: 4)
!111 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !93, file: !72, line: 40, baseType: !90, size: 64, offset: 192)
!112 = !DIDerivedType(tag: DW_TAG_member, name: "map_flags", scope: !93, file: !72, line: 41, baseType: !76, size: 64, offset: 256)
!113 = !DIGlobalVariableExpression(var: !114, expr: !DIExpression())
!114 = distinct !DIGlobalVariable(name: "ipv4_warnings", scope: !2, file: !72, line: 50, type: !115, isLocal: false, isDefinition: true)
!115 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !72, line: 45, size: 256, elements: !116)
!116 = !{!117, !122, !127, !128}
!117 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !115, file: !72, line: 46, baseType: !118, size: 64)
!118 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !119, size: 64)
!119 = !DICompositeType(tag: DW_TAG_array_type, baseType: !60, size: 288, elements: !120)
!120 = !{!121}
!121 = !DISubrange(count: 9)
!122 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !115, file: !72, line: 47, baseType: !123, size: 64, offset: 64)
!123 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !124, size: 64)
!124 = !DICompositeType(tag: DW_TAG_array_type, baseType: !60, size: 4096, elements: !125)
!125 = !{!126}
!126 = !DISubrange(count: 128)
!127 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !115, file: !72, line: 48, baseType: !102, size: 64, offset: 128)
!128 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !115, file: !72, line: 49, baseType: !90, size: 64, offset: 192)
!129 = !DIGlobalVariableExpression(var: !130, expr: !DIExpression())
!130 = distinct !DIGlobalVariable(name: "ipv6_bans", scope: !2, file: !72, line: 59, type: !131, isLocal: false, isDefinition: true)
!131 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !72, line: 53, size: 320, elements: !132)
!132 = !{!133, !134, !135, !144, !145}
!133 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !131, file: !72, line: 54, baseType: !96, size: 64)
!134 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !131, file: !72, line: 55, baseType: !81, size: 64, offset: 64)
!135 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !131, file: !72, line: 56, baseType: !136, size: 64, offset: 128)
!136 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !137, size: 64)
!137 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipv6_subnet", file: !72, line: 22, size: 160, elements: !138)
!138 = !{!139, !140}
!139 = !DIDerivedType(tag: DW_TAG_member, name: "prefixlen", scope: !137, file: !72, line: 23, baseType: !106, size: 32)
!140 = !DIDerivedType(tag: DW_TAG_member, name: "address", scope: !137, file: !72, line: 24, baseType: !141, size: 128, offset: 32)
!141 = !DICompositeType(tag: DW_TAG_array_type, baseType: !66, size: 128, elements: !142)
!142 = !{!143}
!143 = !DISubrange(count: 16)
!144 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !131, file: !72, line: 57, baseType: !90, size: 64, offset: 192)
!145 = !DIDerivedType(tag: DW_TAG_member, name: "map_flags", scope: !131, file: !72, line: 58, baseType: !76, size: 64, offset: 256)
!146 = !DIGlobalVariableExpression(var: !147, expr: !DIExpression())
!147 = distinct !DIGlobalVariable(name: "ipv6_warnings", scope: !2, file: !72, line: 67, type: !148, isLocal: false, isDefinition: true)
!148 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !72, line: 62, size: 256, elements: !149)
!149 = !{!150, !151, !152, !153}
!150 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !148, file: !72, line: 63, baseType: !118, size: 64)
!151 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !148, file: !72, line: 64, baseType: !123, size: 64, offset: 64)
!152 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !148, file: !72, line: 65, baseType: !136, size: 64, offset: 128)
!153 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !148, file: !72, line: 66, baseType: !90, size: 64, offset: 192)
!154 = !DIGlobalVariableExpression(var: !155, expr: !DIExpression())
!155 = distinct !DIGlobalVariable(name: "port_bans", scope: !2, file: !72, line: 75, type: !156, isLocal: false, isDefinition: true)
!156 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !72, line: 70, size: 256, elements: !157)
!157 = !{!158, !159, !160, !162}
!158 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !156, file: !72, line: 71, baseType: !76, size: 64)
!159 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !156, file: !72, line: 72, baseType: !81, size: 64, offset: 64)
!160 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !156, file: !72, line: 73, baseType: !161, size: 64, offset: 128)
!161 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!162 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !156, file: !72, line: 74, baseType: !90, size: 64, offset: 192)
!163 = !DIGlobalVariableExpression(var: !164, expr: !DIExpression(DW_OP_constu, 1, DW_OP_stack_value))
!164 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !2, file: !165, line: 51, type: !166, isLocal: true, isDefinition: true)
!165 = !DIFile(filename: "module/../headers/bpf_helper_defs.h", directory: "/home/cookiengineer/Software/tholian-network/firewall/ebpf", checksumkind: CSK_MD5, checksum: "67458ddab14190d1ab39602394f9ecef")
!166 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !167, size: 64)
!167 = !DISubroutineType(types: !168)
!168 = !{!55, !55, !169}
!169 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !170, size: 64)
!170 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!171 = !DIGlobalVariableExpression(var: !172, expr: !DIExpression(DW_OP_constu, 2, DW_OP_stack_value))
!172 = distinct !DIGlobalVariable(name: "bpf_map_update_elem", scope: !2, file: !165, line: 73, type: !173, isLocal: true, isDefinition: true)
!173 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !174, size: 64)
!174 = !DISubroutineType(types: !175)
!175 = !{!56, !55, !169, !169, !87}
!176 = !DIGlobalVariableExpression(var: !177, expr: !DIExpression(DW_OP_constu, 3, DW_OP_stack_value))
!177 = distinct !DIGlobalVariable(name: "bpf_map_delete_elem", scope: !2, file: !165, line: 83, type: !178, isLocal: true, isDefinition: true)
!178 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !179, size: 64)
!179 = !DISubroutineType(types: !180)
!180 = !{!56, !55, !169}
!181 = !DICompositeType(tag: DW_TAG_array_type, baseType: !63, size: 32, elements: !109)
!182 = !{i32 7, !"Dwarf Version", i32 5}
!183 = !{i32 2, !"Debug Info Version", i32 3}
!184 = !{i32 1, !"wchar_size", i32 4}
!185 = !{i32 7, !"frame-pointer", i32 2}
!186 = !{i32 7, !"debug-info-assignment-tracking", i1 true}
!187 = !{!"clang version 22.1.8"}
!188 = !{!189, !189, i64 0}
!189 = !{!"int", !190, i64 0}
!190 = !{!"omnipotent char", !191, i64 0}
!191 = !{!"Simple C/C++ TBAA"}
!192 = distinct !DISubprogram(name: "xdp_prog_main", scope: !72, file: !72, line: 333, type: !193, scopeLine: 333, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !204, keyInstructions: true)
!193 = !DISubroutineType(types: !194)
!194 = !{!60, !195}
!195 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !196, size: 64)
!196 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !6, line: 6323, size: 192, elements: !197)
!197 = !{!198, !199, !200, !201, !202, !203}
!198 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !196, file: !6, line: 6324, baseType: !106, size: 32)
!199 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !196, file: !6, line: 6325, baseType: !106, size: 32, offset: 32)
!200 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !196, file: !6, line: 6326, baseType: !106, size: 32, offset: 64)
!201 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !196, file: !6, line: 6328, baseType: !106, size: 32, offset: 96)
!202 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !196, file: !6, line: 6329, baseType: !106, size: 32, offset: 128)
!203 = !DIDerivedType(tag: DW_TAG_member, name: "egress_ifindex", scope: !196, file: !6, line: 6331, baseType: !106, size: 32, offset: 160)
!204 = !{!205, !206, !207, !208, !209, !214, !229, !260, !301, !304, !305, !306, !317, !318, !319, !320, !333, !358, !359, !360, !361, !387, !390, !391, !392, !397, !398, !399, !400, !403, !404, !405, !406, !409}
!205 = !DILocalVariable(name: "ctx", arg: 1, scope: !192, file: !72, line: 333, type: !195)
!206 = !DILocalVariable(name: "data_end", scope: !192, file: !72, line: 336, type: !55)
!207 = !DILocalVariable(name: "data", scope: !192, file: !72, line: 337, type: !55)
!208 = !DILocalVariable(name: "ethernet_protocol", scope: !192, file: !72, line: 343, type: !60)
!209 = !DILocalVariable(name: "cursor", scope: !192, file: !72, line: 344, type: !210)
!210 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "hdr_cursor", file: !211, line: 35, size: 64, elements: !212)
!211 = !DIFile(filename: "module/module.h", directory: "/home/cookiengineer/Software/tholian-network/firewall/ebpf", checksumkind: CSK_MD5, checksum: "c9399d316b2ddcc0b079d9dd31114f1d")
!212 = !{!213}
!213 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !210, file: !211, line: 36, baseType: !55, size: 64)
!214 = !DILocalVariable(name: "ethernet_header", scope: !192, file: !72, line: 345, type: !215)
!215 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !216, size: 64)
!216 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !217, line: 183, size: 112, elements: !218)
!217 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "", checksumkind: CSK_MD5, checksum: "3286d456f31f105294338f2c6c9e44ce")
!218 = !{!219, !223, !224}
!219 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !216, file: !217, line: 184, baseType: !220, size: 48)
!220 = !DICompositeType(tag: DW_TAG_array_type, baseType: !67, size: 48, elements: !221)
!221 = !{!222}
!222 = !DISubrange(count: 6)
!223 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !216, file: !217, line: 185, baseType: !220, size: 48, offset: 48)
!224 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !216, file: !217, line: 186, baseType: !225, size: 16, offset: 96)
!225 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !226, line: 32, baseType: !227)
!226 = !DIFile(filename: "/usr/include/linux/types.h", directory: "", checksumkind: CSK_MD5, checksum: "c0ade1a1a309d6896ce6080a51a2d105")
!227 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !228, line: 24, baseType: !59)
!228 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "", checksumkind: CSK_MD5, checksum: "b810f270733e106319b67ef512c6246e")
!229 = !DILocalVariable(name: "ipv4_header", scope: !192, file: !72, line: 346, type: !230)
!230 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !231, size: 64)
!231 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !232, line: 87, size: 160, elements: !233)
!232 = !DIFile(filename: "/usr/include/linux/ip.h", directory: "", checksumkind: CSK_MD5, checksum: "5c58d077e910b6c258855dca54d0ec22")
!233 = !{!234, !236, !237, !238, !239, !240, !241, !242, !243, !245}
!234 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !231, file: !232, line: 89, baseType: !235, size: 4, flags: DIFlagBitField, extraData: i64 0)
!235 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !228, line: 21, baseType: !67)
!236 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !231, file: !232, line: 90, baseType: !235, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!237 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !231, file: !232, line: 97, baseType: !235, size: 8, offset: 8)
!238 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !231, file: !232, line: 98, baseType: !225, size: 16, offset: 16)
!239 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !231, file: !232, line: 99, baseType: !225, size: 16, offset: 32)
!240 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !231, file: !232, line: 100, baseType: !225, size: 16, offset: 48)
!241 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !231, file: !232, line: 101, baseType: !235, size: 8, offset: 64)
!242 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !231, file: !232, line: 102, baseType: !235, size: 8, offset: 72)
!243 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !231, file: !232, line: 103, baseType: !244, size: 16, offset: 80)
!244 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !226, line: 38, baseType: !227)
!245 = !DIDerivedType(tag: DW_TAG_member, scope: !231, file: !232, line: 104, baseType: !246, size: 64, offset: 96)
!246 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !231, file: !232, line: 104, size: 64, elements: !247)
!247 = !{!248, !255}
!248 = !DIDerivedType(tag: DW_TAG_member, scope: !246, file: !232, line: 104, baseType: !249, size: 64)
!249 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !246, file: !232, line: 104, size: 64, elements: !250)
!250 = !{!251, !254}
!251 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !249, file: !232, line: 105, baseType: !252, size: 32)
!252 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !226, line: 34, baseType: !253)
!253 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !228, line: 27, baseType: !7)
!254 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !249, file: !232, line: 106, baseType: !252, size: 32, offset: 32)
!255 = !DIDerivedType(tag: DW_TAG_member, name: "addrs", scope: !246, file: !232, line: 104, baseType: !256, size: 64)
!256 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !246, file: !232, line: 104, size: 64, elements: !257)
!257 = !{!258, !259}
!258 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !256, file: !232, line: 105, baseType: !252, size: 32)
!259 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !256, file: !232, line: 106, baseType: !252, size: 32, offset: 32)
!260 = !DILocalVariable(name: "ipv6_header", scope: !192, file: !72, line: 347, type: !261)
!261 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !262, size: 64)
!262 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipv6hdr", file: !263, line: 118, size: 320, elements: !264)
!263 = !DIFile(filename: "/usr/include/linux/ipv6.h", directory: "", checksumkind: CSK_MD5, checksum: "2ee489601bcc9c44d828d039ff7786a6")
!264 = !{!265, !266, !267, !271, !272, !273, !274}
!265 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !262, file: !263, line: 120, baseType: !235, size: 4, flags: DIFlagBitField, extraData: i64 0)
!266 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !262, file: !263, line: 121, baseType: !235, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!267 = !DIDerivedType(tag: DW_TAG_member, name: "flow_lbl", scope: !262, file: !263, line: 128, baseType: !268, size: 24, offset: 8)
!268 = !DICompositeType(tag: DW_TAG_array_type, baseType: !235, size: 24, elements: !269)
!269 = !{!270}
!270 = !DISubrange(count: 3)
!271 = !DIDerivedType(tag: DW_TAG_member, name: "payload_len", scope: !262, file: !263, line: 130, baseType: !225, size: 16, offset: 32)
!272 = !DIDerivedType(tag: DW_TAG_member, name: "nexthdr", scope: !262, file: !263, line: 131, baseType: !235, size: 8, offset: 48)
!273 = !DIDerivedType(tag: DW_TAG_member, name: "hop_limit", scope: !262, file: !263, line: 132, baseType: !235, size: 8, offset: 56)
!274 = !DIDerivedType(tag: DW_TAG_member, scope: !262, file: !263, line: 134, baseType: !275, size: 256, offset: 64)
!275 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !262, file: !263, line: 134, size: 256, elements: !276)
!276 = !{!277, !296}
!277 = !DIDerivedType(tag: DW_TAG_member, scope: !275, file: !263, line: 134, baseType: !278, size: 256)
!278 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !275, file: !263, line: 134, size: 256, elements: !279)
!279 = !{!280, !295}
!280 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !278, file: !263, line: 135, baseType: !281, size: 128)
!281 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in6_addr", file: !282, line: 33, size: 128, elements: !283)
!282 = !DIFile(filename: "/usr/include/linux/in6.h", directory: "", checksumkind: CSK_MD5, checksum: "6eb9610917d19b67762834b3cd333671")
!283 = !{!284}
!284 = !DIDerivedType(tag: DW_TAG_member, name: "in6_u", scope: !281, file: !282, line: 40, baseType: !285, size: 128)
!285 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !281, file: !282, line: 34, size: 128, elements: !286)
!286 = !{!287, !289, !293}
!287 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr8", scope: !285, file: !282, line: 35, baseType: !288, size: 128)
!288 = !DICompositeType(tag: DW_TAG_array_type, baseType: !235, size: 128, elements: !142)
!289 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr16", scope: !285, file: !282, line: 37, baseType: !290, size: 128)
!290 = !DICompositeType(tag: DW_TAG_array_type, baseType: !225, size: 128, elements: !291)
!291 = !{!292}
!292 = !DISubrange(count: 8)
!293 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr32", scope: !285, file: !282, line: 38, baseType: !294, size: 128)
!294 = !DICompositeType(tag: DW_TAG_array_type, baseType: !252, size: 128, elements: !109)
!295 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !278, file: !263, line: 136, baseType: !281, size: 128, offset: 128)
!296 = !DIDerivedType(tag: DW_TAG_member, name: "addrs", scope: !275, file: !263, line: 134, baseType: !297, size: 256)
!297 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !275, file: !263, line: 134, size: 256, elements: !298)
!298 = !{!299, !300}
!299 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !297, file: !263, line: 135, baseType: !281, size: 128)
!300 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !297, file: !263, line: 136, baseType: !281, size: 128, offset: 128)
!301 = !DILocalVariable(name: "protocol", scope: !302, file: !72, line: 359, type: !60)
!302 = distinct !DILexicalBlock(scope: !303, file: !72, line: 357, column: 48)
!303 = distinct !DILexicalBlock(scope: !192, file: !72, line: 357, column: 6)
!304 = !DILocalVariable(name: "ipv4_source", scope: !302, file: !72, line: 361, type: !103)
!305 = !DILocalVariable(name: "ipv4_dest", scope: !302, file: !72, line: 364, type: !103)
!306 = !DILocalVariable(name: "udp_header", scope: !307, file: !72, line: 394, type: !309)
!307 = distinct !DILexicalBlock(scope: !308, file: !72, line: 392, column: 32)
!308 = distinct !DILexicalBlock(scope: !302, file: !72, line: 392, column: 7)
!309 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !310, size: 64)
!310 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "udphdr", file: !311, line: 23, size: 64, elements: !312)
!311 = !DIFile(filename: "/usr/include/linux/udp.h", directory: "", checksumkind: CSK_MD5, checksum: "ab19180315580c673b116c922b21f9fe")
!312 = !{!313, !314, !315, !316}
!313 = !DIDerivedType(tag: DW_TAG_member, name: "source", scope: !310, file: !311, line: 24, baseType: !225, size: 16)
!314 = !DIDerivedType(tag: DW_TAG_member, name: "dest", scope: !310, file: !311, line: 25, baseType: !225, size: 16, offset: 16)
!315 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !310, file: !311, line: 26, baseType: !225, size: 16, offset: 32)
!316 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !310, file: !311, line: 27, baseType: !244, size: 16, offset: 48)
!317 = !DILocalVariable(name: "length", scope: !307, file: !72, line: 396, type: !60)
!318 = !DILocalVariable(name: "port_source", scope: !307, file: !72, line: 401, type: !57)
!319 = !DILocalVariable(name: "port_dest", scope: !307, file: !72, line: 408, type: !57)
!320 = !DILocalVariable(name: "dns_header", scope: !321, file: !72, line: 424, type: !323)
!321 = distinct !DILexicalBlock(scope: !322, file: !72, line: 422, column: 6)
!322 = distinct !DILexicalBlock(scope: !307, file: !72, line: 418, column: 5)
!323 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !324, size: 64)
!324 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dnshdr", file: !211, line: 50, size: 96, elements: !325)
!325 = !{!326, !328, !329, !330, !331, !332}
!326 = !DIDerivedType(tag: DW_TAG_member, name: "transaction_id", scope: !324, file: !211, line: 51, baseType: !327, size: 16)
!327 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !58, line: 18, baseType: !57)
!328 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !324, file: !211, line: 52, baseType: !327, size: 16, offset: 16)
!329 = !DIDerivedType(tag: DW_TAG_member, name: "q_count", scope: !324, file: !211, line: 53, baseType: !327, size: 16, offset: 32)
!330 = !DIDerivedType(tag: DW_TAG_member, name: "ans_count", scope: !324, file: !211, line: 54, baseType: !327, size: 16, offset: 48)
!331 = !DIDerivedType(tag: DW_TAG_member, name: "auth_count", scope: !324, file: !211, line: 55, baseType: !327, size: 16, offset: 64)
!332 = !DIDerivedType(tag: DW_TAG_member, name: "add_count", scope: !324, file: !211, line: 56, baseType: !327, size: 16, offset: 80)
!333 = !DILocalVariable(name: "tcp_header", scope: !334, file: !72, line: 438, type: !336)
!334 = distinct !DILexicalBlock(scope: !335, file: !72, line: 436, column: 39)
!335 = distinct !DILexicalBlock(scope: !308, file: !72, line: 436, column: 14)
!336 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !337, size: 64)
!337 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tcphdr", file: !338, line: 25, size: 160, elements: !339)
!338 = !DIFile(filename: "/usr/include/linux/tcp.h", directory: "", checksumkind: CSK_MD5, checksum: "94289bf5e4706e239f7e28899aea608a")
!339 = !{!340, !341, !342, !343, !344, !345, !346, !347, !348, !349, !350, !351, !352, !353, !354, !355, !356, !357}
!340 = !DIDerivedType(tag: DW_TAG_member, name: "source", scope: !337, file: !338, line: 26, baseType: !225, size: 16)
!341 = !DIDerivedType(tag: DW_TAG_member, name: "dest", scope: !337, file: !338, line: 27, baseType: !225, size: 16, offset: 16)
!342 = !DIDerivedType(tag: DW_TAG_member, name: "seq", scope: !337, file: !338, line: 28, baseType: !252, size: 32, offset: 32)
!343 = !DIDerivedType(tag: DW_TAG_member, name: "ack_seq", scope: !337, file: !338, line: 29, baseType: !252, size: 32, offset: 64)
!344 = !DIDerivedType(tag: DW_TAG_member, name: "ae", scope: !337, file: !338, line: 31, baseType: !227, size: 1, offset: 96, flags: DIFlagBitField, extraData: i64 96)
!345 = !DIDerivedType(tag: DW_TAG_member, name: "res1", scope: !337, file: !338, line: 32, baseType: !227, size: 3, offset: 97, flags: DIFlagBitField, extraData: i64 96)
!346 = !DIDerivedType(tag: DW_TAG_member, name: "doff", scope: !337, file: !338, line: 33, baseType: !227, size: 4, offset: 100, flags: DIFlagBitField, extraData: i64 96)
!347 = !DIDerivedType(tag: DW_TAG_member, name: "fin", scope: !337, file: !338, line: 34, baseType: !227, size: 1, offset: 104, flags: DIFlagBitField, extraData: i64 96)
!348 = !DIDerivedType(tag: DW_TAG_member, name: "syn", scope: !337, file: !338, line: 35, baseType: !227, size: 1, offset: 105, flags: DIFlagBitField, extraData: i64 96)
!349 = !DIDerivedType(tag: DW_TAG_member, name: "rst", scope: !337, file: !338, line: 36, baseType: !227, size: 1, offset: 106, flags: DIFlagBitField, extraData: i64 96)
!350 = !DIDerivedType(tag: DW_TAG_member, name: "psh", scope: !337, file: !338, line: 37, baseType: !227, size: 1, offset: 107, flags: DIFlagBitField, extraData: i64 96)
!351 = !DIDerivedType(tag: DW_TAG_member, name: "ack", scope: !337, file: !338, line: 38, baseType: !227, size: 1, offset: 108, flags: DIFlagBitField, extraData: i64 96)
!352 = !DIDerivedType(tag: DW_TAG_member, name: "urg", scope: !337, file: !338, line: 39, baseType: !227, size: 1, offset: 109, flags: DIFlagBitField, extraData: i64 96)
!353 = !DIDerivedType(tag: DW_TAG_member, name: "ece", scope: !337, file: !338, line: 40, baseType: !227, size: 1, offset: 110, flags: DIFlagBitField, extraData: i64 96)
!354 = !DIDerivedType(tag: DW_TAG_member, name: "cwr", scope: !337, file: !338, line: 41, baseType: !227, size: 1, offset: 111, flags: DIFlagBitField, extraData: i64 96)
!355 = !DIDerivedType(tag: DW_TAG_member, name: "window", scope: !337, file: !338, line: 57, baseType: !225, size: 16, offset: 112)
!356 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !337, file: !338, line: 58, baseType: !244, size: 16, offset: 128)
!357 = !DIDerivedType(tag: DW_TAG_member, name: "urg_ptr", scope: !337, file: !338, line: 59, baseType: !225, size: 16, offset: 144)
!358 = !DILocalVariable(name: "length", scope: !334, file: !72, line: 440, type: !60)
!359 = !DILocalVariable(name: "port_source", scope: !334, file: !72, line: 452, type: !57)
!360 = !DILocalVariable(name: "port_dest", scope: !334, file: !72, line: 459, type: !57)
!361 = !DILocalVariable(name: "icmp_header", scope: !362, file: !72, line: 470, type: !364)
!362 = distinct !DILexicalBlock(scope: !363, file: !72, line: 468, column: 40)
!363 = distinct !DILexicalBlock(scope: !335, file: !72, line: 468, column: 14)
!364 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !365, size: 64)
!365 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmphdr", file: !366, line: 89, size: 64, elements: !367)
!366 = !DIFile(filename: "/usr/include/linux/icmp.h", directory: "", checksumkind: CSK_MD5, checksum: "a505632898dce546638b3344627d334b")
!367 = !{!368, !369, !370, !371}
!368 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !365, file: !366, line: 90, baseType: !235, size: 8)
!369 = !DIDerivedType(tag: DW_TAG_member, name: "code", scope: !365, file: !366, line: 91, baseType: !235, size: 8, offset: 8)
!370 = !DIDerivedType(tag: DW_TAG_member, name: "checksum", scope: !365, file: !366, line: 92, baseType: !244, size: 16, offset: 16)
!371 = !DIDerivedType(tag: DW_TAG_member, name: "un", scope: !365, file: !366, line: 104, baseType: !372, size: 32, offset: 32)
!372 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !365, file: !366, line: 93, size: 32, elements: !373)
!373 = !{!374, !379, !380, !385}
!374 = !DIDerivedType(tag: DW_TAG_member, name: "echo", scope: !372, file: !366, line: 97, baseType: !375, size: 32)
!375 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !372, file: !366, line: 94, size: 32, elements: !376)
!376 = !{!377, !378}
!377 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !375, file: !366, line: 95, baseType: !225, size: 16)
!378 = !DIDerivedType(tag: DW_TAG_member, name: "sequence", scope: !375, file: !366, line: 96, baseType: !225, size: 16, offset: 16)
!379 = !DIDerivedType(tag: DW_TAG_member, name: "gateway", scope: !372, file: !366, line: 98, baseType: !252, size: 32)
!380 = !DIDerivedType(tag: DW_TAG_member, name: "frag", scope: !372, file: !366, line: 102, baseType: !381, size: 32)
!381 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !372, file: !366, line: 99, size: 32, elements: !382)
!382 = !{!383, !384}
!383 = !DIDerivedType(tag: DW_TAG_member, name: "__unused", scope: !381, file: !366, line: 100, baseType: !225, size: 16)
!384 = !DIDerivedType(tag: DW_TAG_member, name: "mtu", scope: !381, file: !366, line: 101, baseType: !225, size: 16, offset: 16)
!385 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !372, file: !366, line: 103, baseType: !386, size: 32)
!386 = !DICompositeType(tag: DW_TAG_array_type, baseType: !235, size: 32, elements: !109)
!387 = !DILocalVariable(name: "protocol", scope: !388, file: !72, line: 490, type: !60)
!388 = distinct !DILexicalBlock(scope: !389, file: !72, line: 488, column: 57)
!389 = distinct !DILexicalBlock(scope: !303, file: !72, line: 488, column: 13)
!390 = !DILocalVariable(name: "ipv6_source", scope: !388, file: !72, line: 492, type: !137)
!391 = !DILocalVariable(name: "ipv6_dest", scope: !388, file: !72, line: 495, type: !137)
!392 = !DILocalVariable(name: "udp_header", scope: !393, file: !72, line: 523, type: !309)
!393 = distinct !DILexicalBlock(scope: !394, file: !72, line: 521, column: 33)
!394 = distinct !DILexicalBlock(scope: !395, file: !72, line: 521, column: 8)
!395 = distinct !DILexicalBlock(scope: !396, file: !72, line: 498, column: 20)
!396 = distinct !DILexicalBlock(scope: !388, file: !72, line: 498, column: 7)
!397 = !DILocalVariable(name: "length", scope: !393, file: !72, line: 525, type: !60)
!398 = !DILocalVariable(name: "port_source", scope: !393, file: !72, line: 530, type: !57)
!399 = !DILocalVariable(name: "port_dest", scope: !393, file: !72, line: 537, type: !57)
!400 = !DILocalVariable(name: "tcp_header", scope: !401, file: !72, line: 546, type: !336)
!401 = distinct !DILexicalBlock(scope: !402, file: !72, line: 544, column: 40)
!402 = distinct !DILexicalBlock(scope: !394, file: !72, line: 544, column: 15)
!403 = !DILocalVariable(name: "length", scope: !401, file: !72, line: 548, type: !60)
!404 = !DILocalVariable(name: "port_source", scope: !401, file: !72, line: 560, type: !57)
!405 = !DILocalVariable(name: "port_dest", scope: !401, file: !72, line: 567, type: !57)
!406 = !DILocalVariable(name: "icmp_header", scope: !407, file: !72, line: 576, type: !364)
!407 = distinct !DILexicalBlock(scope: !408, file: !72, line: 574, column: 41)
!408 = distinct !DILexicalBlock(scope: !402, file: !72, line: 574, column: 15)
!409 = !DILocalVariable(name: "icmp6_header", scope: !410, file: !72, line: 592, type: !412)
!410 = distinct !DILexicalBlock(scope: !411, file: !72, line: 590, column: 43)
!411 = distinct !DILexicalBlock(scope: !408, file: !72, line: 590, column: 15)
!412 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !413, size: 64)
!413 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmp6hdr", file: !414, line: 8, size: 64, elements: !415)
!414 = !DIFile(filename: "/usr/include/linux/icmpv6.h", directory: "", checksumkind: CSK_MD5, checksum: "c573774d0b3c9a61b5510be75a6ff374")
!415 = !{!416, !417, !418, !419}
!416 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_type", scope: !413, file: !414, line: 10, baseType: !235, size: 8)
!417 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_code", scope: !413, file: !414, line: 11, baseType: !235, size: 8, offset: 8)
!418 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_cksum", scope: !413, file: !414, line: 12, baseType: !244, size: 16, offset: 16)
!419 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_dataun", scope: !413, file: !414, line: 63, baseType: !420, size: 32, offset: 32)
!420 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !413, file: !414, line: 15, size: 32, elements: !421)
!421 = !{!422, !424, !428, !429, !434, !442}
!422 = !DIDerivedType(tag: DW_TAG_member, name: "un_data32", scope: !420, file: !414, line: 16, baseType: !423, size: 32)
!423 = !DICompositeType(tag: DW_TAG_array_type, baseType: !252, size: 32, elements: !78)
!424 = !DIDerivedType(tag: DW_TAG_member, name: "un_data16", scope: !420, file: !414, line: 17, baseType: !425, size: 32)
!425 = !DICompositeType(tag: DW_TAG_array_type, baseType: !225, size: 32, elements: !426)
!426 = !{!427}
!427 = !DISubrange(count: 2)
!428 = !DIDerivedType(tag: DW_TAG_member, name: "un_data8", scope: !420, file: !414, line: 18, baseType: !386, size: 32)
!429 = !DIDerivedType(tag: DW_TAG_member, name: "u_echo", scope: !420, file: !414, line: 23, baseType: !430, size: 32)
!430 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmpv6_echo", file: !414, line: 20, size: 32, elements: !431)
!431 = !{!432, !433}
!432 = !DIDerivedType(tag: DW_TAG_member, name: "identifier", scope: !430, file: !414, line: 21, baseType: !225, size: 16)
!433 = !DIDerivedType(tag: DW_TAG_member, name: "sequence", scope: !430, file: !414, line: 22, baseType: !225, size: 16, offset: 16)
!434 = !DIDerivedType(tag: DW_TAG_member, name: "u_nd_advt", scope: !420, file: !414, line: 40, baseType: !435, size: 32)
!435 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmpv6_nd_advt", file: !414, line: 25, size: 32, elements: !436)
!436 = !{!437, !438, !439, !440, !441}
!437 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !435, file: !414, line: 27, baseType: !253, size: 5, flags: DIFlagBitField, extraData: i64 0)
!438 = !DIDerivedType(tag: DW_TAG_member, name: "override", scope: !435, file: !414, line: 28, baseType: !253, size: 1, offset: 5, flags: DIFlagBitField, extraData: i64 0)
!439 = !DIDerivedType(tag: DW_TAG_member, name: "solicited", scope: !435, file: !414, line: 29, baseType: !253, size: 1, offset: 6, flags: DIFlagBitField, extraData: i64 0)
!440 = !DIDerivedType(tag: DW_TAG_member, name: "router", scope: !435, file: !414, line: 30, baseType: !253, size: 1, offset: 7, flags: DIFlagBitField, extraData: i64 0)
!441 = !DIDerivedType(tag: DW_TAG_member, name: "reserved2", scope: !435, file: !414, line: 31, baseType: !253, size: 24, offset: 8, flags: DIFlagBitField, extraData: i64 0)
!442 = !DIDerivedType(tag: DW_TAG_member, name: "u_nd_ra", scope: !420, file: !414, line: 61, baseType: !443, size: 32)
!443 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmpv6_nd_ra", file: !414, line: 42, size: 32, elements: !444)
!444 = !{!445, !446, !447, !448, !449, !450, !451}
!445 = !DIDerivedType(tag: DW_TAG_member, name: "hop_limit", scope: !443, file: !414, line: 43, baseType: !235, size: 8)
!446 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !443, file: !414, line: 45, baseType: !235, size: 3, offset: 8, flags: DIFlagBitField, extraData: i64 8)
!447 = !DIDerivedType(tag: DW_TAG_member, name: "router_pref", scope: !443, file: !414, line: 46, baseType: !235, size: 2, offset: 11, flags: DIFlagBitField, extraData: i64 8)
!448 = !DIDerivedType(tag: DW_TAG_member, name: "home_agent", scope: !443, file: !414, line: 47, baseType: !235, size: 1, offset: 13, flags: DIFlagBitField, extraData: i64 8)
!449 = !DIDerivedType(tag: DW_TAG_member, name: "other", scope: !443, file: !414, line: 48, baseType: !235, size: 1, offset: 14, flags: DIFlagBitField, extraData: i64 8)
!450 = !DIDerivedType(tag: DW_TAG_member, name: "managed", scope: !443, file: !414, line: 49, baseType: !235, size: 1, offset: 15, flags: DIFlagBitField, extraData: i64 8)
!451 = !DIDerivedType(tag: DW_TAG_member, name: "rt_lifetime", scope: !443, file: !414, line: 60, baseType: !225, size: 16, offset: 16)
!452 = distinct !DIAssignID()
!453 = distinct !DIAssignID()
!454 = !DILocalVariable(name: "value", scope: !455, file: !72, line: 119, type: !66)
!455 = distinct !DILexicalBlock(scope: !456, file: !72, line: 117, column: 24)
!456 = distinct !DILexicalBlock(scope: !457, file: !72, line: 117, column: 6)
!457 = distinct !DISubprogram(name: "warn_ipv6", scope: !72, file: !72, line: 111, type: !458, scopeLine: 111, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !461, keyInstructions: true)
!458 = !DISubroutineType(types: !459)
!459 = !{!460, !136}
!460 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!461 = !{!462, !463, !454, !464, !467}
!462 = !DILocalVariable(name: "subnet", arg: 1, scope: !457, file: !72, line: 111, type: !136)
!463 = !DILocalVariable(name: "warnings", scope: !457, file: !72, line: 113, type: !90)
!464 = !DILocalVariable(name: "banned", scope: !465, file: !72, line: 126, type: !66)
!465 = distinct !DILexicalBlock(scope: !466, file: !72, line: 124, column: 19)
!466 = distinct !DILexicalBlock(scope: !455, file: !72, line: 124, column: 7)
!467 = !DILocalVariable(name: "value", scope: !468, file: !72, line: 134, type: !66)
!468 = distinct !DILexicalBlock(scope: !456, file: !72, line: 132, column: 9)
!469 = !DILocation(line: 0, scope: !455, inlinedAt: !470)
!470 = distinct !DILocation(line: 557, column: 6, scope: !471)
!471 = distinct !DILexicalBlock(scope: !472, file: !72, line: 556, column: 61)
!472 = distinct !DILexicalBlock(scope: !473, file: !72, line: 556, column: 16)
!473 = distinct !DILexicalBlock(scope: !401, file: !72, line: 554, column: 9)
!474 = distinct !DIAssignID()
!475 = !DILocation(line: 0, scope: !465, inlinedAt: !470)
!476 = distinct !DIAssignID()
!477 = distinct !DIAssignID()
!478 = !DILocalVariable(name: "value", scope: !479, file: !72, line: 87, type: !66)
!479 = distinct !DILexicalBlock(scope: !480, file: !72, line: 85, column: 24)
!480 = distinct !DILexicalBlock(scope: !481, file: !72, line: 85, column: 6)
!481 = distinct !DISubprogram(name: "warn_ipv4", scope: !72, file: !72, line: 79, type: !482, scopeLine: 79, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !484, keyInstructions: true)
!482 = !DISubroutineType(types: !483)
!483 = !{!460, !102}
!484 = !{!485, !486, !478, !487, !490}
!485 = !DILocalVariable(name: "subnet", arg: 1, scope: !481, file: !72, line: 79, type: !102)
!486 = !DILocalVariable(name: "warnings", scope: !481, file: !72, line: 81, type: !90)
!487 = !DILocalVariable(name: "banned", scope: !488, file: !72, line: 94, type: !66)
!488 = distinct !DILexicalBlock(scope: !489, file: !72, line: 92, column: 19)
!489 = distinct !DILexicalBlock(scope: !479, file: !72, line: 92, column: 7)
!490 = !DILocalVariable(name: "value", scope: !491, file: !72, line: 102, type: !66)
!491 = distinct !DILexicalBlock(scope: !480, file: !72, line: 100, column: 9)
!492 = !DILocation(line: 0, scope: !479, inlinedAt: !493)
!493 = distinct !DILocation(line: 449, column: 5, scope: !494)
!494 = distinct !DILexicalBlock(scope: !495, file: !72, line: 448, column: 60)
!495 = distinct !DILexicalBlock(scope: !496, file: !72, line: 448, column: 15)
!496 = distinct !DILexicalBlock(scope: !334, file: !72, line: 446, column: 8)
!497 = distinct !DIAssignID()
!498 = !DILocation(line: 0, scope: !488, inlinedAt: !493)
!499 = distinct !DIAssignID()
!500 = distinct !DIAssignID()
!501 = distinct !DIAssignID()
!502 = distinct !DIAssignID()
!503 = distinct !DIAssignID()
!504 = distinct !DIAssignID()
!505 = distinct !DIAssignID()
!506 = distinct !DIAssignID()
!507 = distinct !DIAssignID()
!508 = !DILocalVariable(name: "nh", arg: 1, scope: !509, file: !211, line: 74, type: !512)
!509 = distinct !DISubprogram(name: "skip_ip6hdrext", scope: !211, file: !211, line: 74, type: !510, scopeLine: 74, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !513, keyInstructions: true)
!510 = !DISubroutineType(types: !511)
!511 = !{!60, !512, !55, !66}
!512 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !210, size: 64)
!513 = !{!508, !514, !515, !516, !518}
!514 = !DILocalVariable(name: "data_end", arg: 2, scope: !509, file: !211, line: 74, type: !55)
!515 = !DILocalVariable(name: "next_hdr_type", arg: 3, scope: !509, file: !211, line: 74, type: !66)
!516 = !DILocalVariable(name: "i", scope: !517, file: !211, line: 76, type: !60)
!517 = distinct !DILexicalBlock(scope: !509, file: !211, line: 76, column: 2)
!518 = !DILocalVariable(name: "hdr", scope: !519, file: !211, line: 78, type: !521)
!519 = distinct !DILexicalBlock(scope: !520, file: !211, line: 76, column: 46)
!520 = distinct !DILexicalBlock(scope: !517, file: !211, line: 76, column: 2)
!521 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !522, size: 64)
!522 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipv6_opt_hdr", file: !263, line: 63, size: 16, elements: !523)
!523 = !{!524, !525}
!524 = !DIDerivedType(tag: DW_TAG_member, name: "nexthdr", scope: !522, file: !263, line: 64, baseType: !235, size: 8)
!525 = !DIDerivedType(tag: DW_TAG_member, name: "hdrlen", scope: !522, file: !263, line: 65, baseType: !235, size: 8, offset: 8)
!526 = !DILocation(line: 0, scope: !509, inlinedAt: !527)
!527 = distinct !DILocation(line: 201, column: 9, scope: !528, inlinedAt: !537)
!528 = distinct !DISubprogram(name: "parse_ipv6hdr", scope: !211, file: !211, line: 190, type: !529, scopeLine: 190, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !532, keyInstructions: true)
!529 = !DISubroutineType(types: !530)
!530 = !{!60, !512, !55, !531}
!531 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !261, size: 64)
!532 = !{!533, !534, !535, !536}
!533 = !DILocalVariable(name: "nh", arg: 1, scope: !528, file: !211, line: 190, type: !512)
!534 = !DILocalVariable(name: "data_end", arg: 2, scope: !528, file: !211, line: 190, type: !55)
!535 = !DILocalVariable(name: "ip6hdr", arg: 3, scope: !528, file: !211, line: 190, type: !531)
!536 = !DILocalVariable(name: "ip6h", scope: !528, file: !211, line: 192, type: !261)
!537 = distinct !DILocation(line: 490, column: 18, scope: !388)
!538 = !DILocalVariable(name: "nh", arg: 1, scope: !539, file: !211, line: 205, type: !512)
!539 = distinct !DISubprogram(name: "parse_icmp6hdr", scope: !211, file: !211, line: 205, type: !540, scopeLine: 205, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !543, keyInstructions: true)
!540 = !DISubroutineType(types: !541)
!541 = !{!60, !512, !55, !542}
!542 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !412, size: 64)
!543 = !{!538, !544, !545, !546}
!544 = !DILocalVariable(name: "data_end", arg: 2, scope: !539, file: !211, line: 205, type: !55)
!545 = !DILocalVariable(name: "icmp6hdr", arg: 3, scope: !539, file: !211, line: 205, type: !542)
!546 = !DILocalVariable(name: "icmp6h", scope: !539, file: !211, line: 207, type: !412)
!547 = !DILocation(line: 0, scope: !539, inlinedAt: !548)
!548 = distinct !DILocation(line: 594, column: 5, scope: !410)
!549 = !DILocation(line: 0, scope: !528, inlinedAt: !537)
!550 = !DILocalVariable(name: "nh", arg: 1, scope: !551, file: !211, line: 175, type: !512)
!551 = distinct !DISubprogram(name: "parse_icmphdr", scope: !211, file: !211, line: 175, type: !552, scopeLine: 175, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !555, keyInstructions: true)
!552 = !DISubroutineType(types: !553)
!553 = !{!60, !512, !55, !554}
!554 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !364, size: 64)
!555 = !{!550, !556, !557, !558}
!556 = !DILocalVariable(name: "data_end", arg: 2, scope: !551, file: !211, line: 175, type: !55)
!557 = !DILocalVariable(name: "icmphdr", arg: 3, scope: !551, file: !211, line: 175, type: !554)
!558 = !DILocalVariable(name: "icmph", scope: !551, file: !211, line: 177, type: !364)
!559 = !DILocation(line: 0, scope: !551, inlinedAt: !560)
!560 = distinct !DILocation(line: 472, column: 4, scope: !362)
!561 = !DILocation(line: 0, scope: !551, inlinedAt: !562)
!562 = distinct !DILocation(line: 578, column: 5, scope: !407)
!563 = !DILocalVariable(name: "nh", arg: 1, scope: !564, file: !211, line: 241, type: !512)
!564 = distinct !DISubprogram(name: "parse_tcphdr", scope: !211, file: !211, line: 241, type: !565, scopeLine: 241, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !568, keyInstructions: true)
!565 = !DISubroutineType(types: !566)
!566 = !{!60, !512, !55, !567}
!567 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !336, size: 64)
!568 = !{!563, !569, !570, !571, !572}
!569 = !DILocalVariable(name: "data_end", arg: 2, scope: !564, file: !211, line: 241, type: !55)
!570 = !DILocalVariable(name: "tcphdr", arg: 3, scope: !564, file: !211, line: 241, type: !567)
!571 = !DILocalVariable(name: "len", scope: !564, file: !211, line: 243, type: !60)
!572 = !DILocalVariable(name: "tcph", scope: !564, file: !211, line: 244, type: !336)
!573 = !DILocation(line: 0, scope: !564, inlinedAt: !574)
!574 = distinct !DILocation(line: 440, column: 17, scope: !334)
!575 = !DILocation(line: 0, scope: !564, inlinedAt: !576)
!576 = distinct !DILocation(line: 548, column: 18, scope: !401)
!577 = !DILocalVariable(name: "cursor", arg: 1, scope: !578, file: !72, line: 201, type: !512)
!578 = distinct !DISubprogram(name: "filter_dns", scope: !72, file: !72, line: 201, type: !579, scopeLine: 201, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !581, keyInstructions: true)
!579 = !DISubroutineType(types: !580)
!580 = !{!460, !512, !55, !323}
!581 = !{!577, !582, !583, !584, !585, !586, !587}
!582 = !DILocalVariable(name: "data_end", arg: 2, scope: !578, file: !72, line: 201, type: !55)
!583 = !DILocalVariable(name: "dns_header", arg: 3, scope: !578, file: !72, line: 201, type: !323)
!584 = !DILocalVariable(name: "flags", scope: !578, file: !72, line: 207, type: !57)
!585 = !DILocalVariable(name: "q_count", scope: !578, file: !72, line: 213, type: !57)
!586 = !DILocalVariable(name: "banned_hash", scope: !578, file: !72, line: 219, type: !87)
!587 = !DILocalVariable(name: "next", scope: !578, file: !72, line: 220, type: !55)
!588 = !DILocation(line: 0, scope: !578, inlinedAt: !589)
!589 = distinct !DILocation(line: 427, column: 10, scope: !590)
!590 = distinct !DILexicalBlock(scope: !591, file: !72, line: 427, column: 10)
!591 = distinct !DILexicalBlock(scope: !592, file: !72, line: 426, column: 60)
!592 = distinct !DILexicalBlock(scope: !321, file: !72, line: 426, column: 9)
!593 = !DILocalVariable(name: "nh", arg: 1, scope: !594, file: !211, line: 268, type: !512)
!594 = distinct !DISubprogram(name: "parse_dnshdr", scope: !211, file: !211, line: 268, type: !595, scopeLine: 268, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !598, keyInstructions: true)
!595 = !DISubroutineType(types: !596)
!596 = !{!60, !512, !55, !597}
!597 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !323, size: 64)
!598 = !{!593, !599, !600, !601}
!599 = !DILocalVariable(name: "data_end", arg: 2, scope: !594, file: !211, line: 268, type: !55)
!600 = !DILocalVariable(name: "dnshdr", arg: 3, scope: !594, file: !211, line: 268, type: !597)
!601 = !DILocalVariable(name: "dnsh", scope: !594, file: !211, line: 270, type: !323)
!602 = !DILocation(line: 0, scope: !594, inlinedAt: !603)
!603 = distinct !DILocation(line: 426, column: 9, scope: !592)
!604 = !DILocalVariable(name: "nh", arg: 1, scope: !605, file: !211, line: 220, type: !512)
!605 = distinct !DISubprogram(name: "parse_udphdr", scope: !211, file: !211, line: 220, type: !606, scopeLine: 220, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !609, keyInstructions: true)
!606 = !DISubroutineType(types: !607)
!607 = !{!60, !512, !55, !608}
!608 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !309, size: 64)
!609 = !{!604, !610, !611, !612, !613}
!610 = !DILocalVariable(name: "data_end", arg: 2, scope: !605, file: !211, line: 220, type: !55)
!611 = !DILocalVariable(name: "udphdr", arg: 3, scope: !605, file: !211, line: 220, type: !608)
!612 = !DILocalVariable(name: "len", scope: !605, file: !211, line: 222, type: !60)
!613 = !DILocalVariable(name: "udph", scope: !605, file: !211, line: 223, type: !309)
!614 = !DILocation(line: 0, scope: !605, inlinedAt: !615)
!615 = distinct !DILocation(line: 396, column: 17, scope: !307)
!616 = !DILocation(line: 0, scope: !605, inlinedAt: !617)
!617 = distinct !DILocation(line: 525, column: 18, scope: !393)
!618 = !DILocalVariable(name: "nh", arg: 1, scope: !619, file: !211, line: 152, type: !512)
!619 = distinct !DISubprogram(name: "parse_iphdr", scope: !211, file: !211, line: 152, type: !620, scopeLine: 152, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !623, keyInstructions: true)
!620 = !DISubroutineType(types: !621)
!621 = !{!60, !512, !55, !622}
!622 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !230, size: 64)
!623 = !{!618, !624, !625, !626, !627}
!624 = !DILocalVariable(name: "data_end", arg: 2, scope: !619, file: !211, line: 152, type: !55)
!625 = !DILocalVariable(name: "iphdr", arg: 3, scope: !619, file: !211, line: 152, type: !622)
!626 = !DILocalVariable(name: "iph", scope: !619, file: !211, line: 154, type: !230)
!627 = !DILocalVariable(name: "hdrsize", scope: !619, file: !211, line: 155, type: !60)
!628 = !DILocation(line: 0, scope: !619, inlinedAt: !629)
!629 = distinct !DILocation(line: 359, column: 18, scope: !302)
!630 = !DILocalVariable(name: "nh", arg: 1, scope: !631, file: !211, line: 112, type: !512)
!631 = distinct !DISubprogram(name: "parse_ethhdr", scope: !211, file: !211, line: 112, type: !632, scopeLine: 112, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !635, keyInstructions: true)
!632 = !DISubroutineType(types: !633)
!633 = !{!60, !512, !55, !634}
!634 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !215, size: 64)
!635 = !{!630, !636, !637, !638, !639, !645, !646}
!636 = !DILocalVariable(name: "data_end", arg: 2, scope: !631, file: !211, line: 112, type: !55)
!637 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !631, file: !211, line: 112, type: !634)
!638 = !DILocalVariable(name: "eth", scope: !631, file: !211, line: 114, type: !215)
!639 = !DILocalVariable(name: "vlh", scope: !631, file: !211, line: 115, type: !640)
!640 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !641, size: 64)
!641 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vlanhdr", file: !211, line: 45, size: 32, elements: !642)
!642 = !{!643, !644}
!643 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_TCI", scope: !641, file: !211, line: 46, baseType: !327, size: 16)
!644 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_encapsulated_proto", scope: !641, file: !211, line: 47, baseType: !327, size: 16, offset: 16)
!645 = !DILocalVariable(name: "h_proto", scope: !631, file: !211, line: 116, type: !57)
!646 = !DILocalVariable(name: "i", scope: !631, file: !211, line: 117, type: !60)
!647 = !DILocation(line: 0, scope: !631, inlinedAt: !648)
!648 = distinct !DILocation(line: 350, column: 22, scope: !192)
!649 = distinct !DIAssignID()
!650 = !DILocation(line: 0, scope: !302)
!651 = distinct !DIAssignID()
!652 = distinct !DIAssignID()
!653 = !DILocation(line: 0, scope: !388)
!654 = distinct !DIAssignID()
!655 = !DILocation(line: 0, scope: !192)
!656 = !DILocation(line: 336, column: 38, scope: !192)
!657 = !DILocation(line: 336, column: 38, scope: !192, atomGroup: 1, atomRank: 4)
!658 = !{!659, !189, i64 4}
!659 = !{!"xdp_md", !189, i64 0, !189, i64 4, !189, i64 8, !189, i64 12, !189, i64 16, !189, i64 20}
!660 = !DILocation(line: 336, column: 27, scope: !192, atomGroup: 1, atomRank: 3)
!661 = !DILocation(line: 336, column: 19, scope: !192, atomGroup: 1, atomRank: 2)
!662 = !DILocation(line: 337, column: 34, scope: !192, atomGroup: 2, atomRank: 4)
!663 = !{!659, !189, i64 0}
!664 = !DILocation(line: 337, column: 23, scope: !192, atomGroup: 2, atomRank: 3)
!665 = !DILocation(line: 337, column: 15, scope: !192, atomGroup: 2, atomRank: 2)
!666 = !DILocation(line: 339, column: 11, scope: !667)
!667 = distinct !DILexicalBlock(scope: !192, file: !72, line: 339, column: 6)
!668 = !DILocation(line: 339, column: 35, scope: !667, atomGroup: 3, atomRank: 2)
!669 = !DILocation(line: 339, column: 35, scope: !667, atomGroup: 3, atomRank: 1)
!670 = !DILocation(line: 125, column: 17, scope: !631, inlinedAt: !648)
!671 = !{!672, !672, i64 0}
!672 = !{!"short", !190, i64 0}
!673 = !DILocalVariable(name: "h_proto", arg: 1, scope: !674, file: !211, line: 70, type: !57)
!674 = distinct !DISubprogram(name: "proto_is_vlan", scope: !211, file: !211, line: 70, type: !675, scopeLine: 70, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !677, keyInstructions: true)
!675 = !DISubroutineType(types: !676)
!676 = !{!60, !57}
!677 = !{!673}
!678 = !DILocation(line: 0, scope: !674, inlinedAt: !679)
!679 = distinct !DILocation(line: 133, column: 8, scope: !680, inlinedAt: !648)
!680 = distinct !DILexicalBlock(scope: !681, file: !211, line: 133, column: 7)
!681 = distinct !DILexicalBlock(scope: !682, file: !211, line: 131, column: 39)
!682 = distinct !DILexicalBlock(scope: !683, file: !211, line: 131, column: 2)
!683 = distinct !DILexicalBlock(scope: !631, file: !211, line: 131, column: 2)
!684 = !DILocation(line: 71, column: 20, scope: !674, inlinedAt: !679, atomGroup: 2, atomRank: 2)
!685 = !DILocation(line: 71, column: 46, scope: !674, inlinedAt: !679, atomGroup: 2, atomRank: 1)
!686 = !DILocation(line: 133, column: 7, scope: !680, inlinedAt: !648, atomGroup: 11, atomRank: 1)
!687 = !DILocation(line: 137, column: 11, scope: !688, inlinedAt: !648)
!688 = distinct !DILexicalBlock(scope: !681, file: !211, line: 137, column: 7)
!689 = !DILocation(line: 137, column: 15, scope: !688, inlinedAt: !648, atomGroup: 13, atomRank: 2)
!690 = !DILocation(line: 137, column: 15, scope: !688, inlinedAt: !648, atomGroup: 13, atomRank: 1)
!691 = !DILocation(line: 141, column: 18, scope: !681, inlinedAt: !648)
!692 = !DILocation(line: 71, column: 20, scope: !674, inlinedAt: !679, atomGroup: 137, atomRank: 2)
!693 = !DILocation(line: 71, column: 46, scope: !674, inlinedAt: !679, atomGroup: 137, atomRank: 1)
!694 = !DILocation(line: 133, column: 7, scope: !680, inlinedAt: !648, atomGroup: 138, atomRank: 1)
!695 = !DILocation(line: 137, column: 15, scope: !688, inlinedAt: !648, atomGroup: 139, atomRank: 2)
!696 = !DILocation(line: 137, column: 15, scope: !688, inlinedAt: !648, atomGroup: 139, atomRank: 1)
!697 = !DILocation(line: 71, column: 20, scope: !674, inlinedAt: !679, atomGroup: 143, atomRank: 2)
!698 = !DILocation(line: 71, column: 46, scope: !674, inlinedAt: !679, atomGroup: 143, atomRank: 1)
!699 = !DILocation(line: 133, column: 7, scope: !680, inlinedAt: !648, atomGroup: 144, atomRank: 1)
!700 = !DILocation(line: 137, column: 15, scope: !688, inlinedAt: !648, atomGroup: 145, atomRank: 2)
!701 = !DILocation(line: 137, column: 15, scope: !688, inlinedAt: !648, atomGroup: 145, atomRank: 1)
!702 = !DILocation(line: 71, column: 20, scope: !674, inlinedAt: !679, atomGroup: 149, atomRank: 2)
!703 = !DILocation(line: 71, column: 46, scope: !674, inlinedAt: !679, atomGroup: 149, atomRank: 1)
!704 = !DILocation(line: 133, column: 7, scope: !680, inlinedAt: !648, atomGroup: 150, atomRank: 1)
!705 = !DILocation(line: 137, column: 15, scope: !688, inlinedAt: !648, atomGroup: 151, atomRank: 2)
!706 = !DILocation(line: 137, column: 15, scope: !688, inlinedAt: !648, atomGroup: 151, atomRank: 1)
!707 = !DILocation(line: 131, column: 2, scope: !683, inlinedAt: !648, atomGroup: 154, atomRank: 1)
!708 = !DILocation(line: 357, column: 24, scope: !303, atomGroup: 10, atomRank: 1)
!709 = !DILocation(line: 157, column: 10, scope: !710, inlinedAt: !629)
!710 = distinct !DILexicalBlock(scope: !619, file: !211, line: 157, column: 6)
!711 = !DILocation(line: 157, column: 14, scope: !710, inlinedAt: !629, atomGroup: 2, atomRank: 2)
!712 = !DILocation(line: 157, column: 14, scope: !710, inlinedAt: !629, atomGroup: 2, atomRank: 1)
!713 = !DILocation(line: 161, column: 17, scope: !619, inlinedAt: !629)
!714 = !DILocation(line: 161, column: 21, scope: !619, inlinedAt: !629, atomGroup: 4, atomRank: 2)
!715 = !DILocation(line: 164, column: 14, scope: !716, inlinedAt: !629)
!716 = distinct !DILexicalBlock(scope: !619, file: !211, line: 164, column: 6)
!717 = !DILocation(line: 164, column: 24, scope: !716, inlinedAt: !629, atomGroup: 5, atomRank: 2)
!718 = !DILocation(line: 164, column: 24, scope: !716, inlinedAt: !629, atomGroup: 5, atomRank: 1)
!719 = !DILocation(line: 361, column: 3, scope: !302)
!720 = distinct !DIAssignID()
!721 = !DILocation(line: 364, column: 3, scope: !302)
!722 = distinct !DIAssignID()
!723 = !DILocation(line: 392, column: 16, scope: !308, atomGroup: 21, atomRank: 1)
!724 = !DILocation(line: 171, column: 14, scope: !619, inlinedAt: !629)
!725 = !DILocation(line: 171, column: 14, scope: !619, inlinedAt: !629, atomGroup: 9, atomRank: 3)
!726 = !{!727, !190, i64 9}
!727 = !{!"iphdr", !190, i64 0, !190, i64 0, !190, i64 1, !672, i64 2, !672, i64 4, !672, i64 6, !190, i64 8, !190, i64 9, !672, i64 10, !190, i64 12}
!728 = !DILocation(line: 362, column: 25, scope: !302, atomGroup: 12, atomRank: 1)
!729 = !{!730, !189, i64 0}
!730 = !{!"ipv4_subnet", !189, i64 0, !190, i64 4}
!731 = !DILocation(line: 365, column: 23, scope: !302, atomGroup: 13, atomRank: 1)
!732 = !DILocation(line: 369, column: 24, scope: !733)
!733 = distinct !DILexicalBlock(scope: !734, file: !72, line: 367, column: 20)
!734 = distinct !DILexicalBlock(scope: !302, file: !72, line: 367, column: 7)
!735 = !DILocation(line: 369, column: 47, scope: !733)
!736 = !DILocation(line: 369, column: 4, scope: !733, atomGroup: 15, atomRank: 1)
!737 = distinct !DIAssignID()
!738 = !DILocation(line: 370, column: 22, scope: !733)
!739 = !DILocation(line: 370, column: 45, scope: !733)
!740 = !DILocation(line: 370, column: 4, scope: !733, atomGroup: 16, atomRank: 1)
!741 = distinct !DIAssignID()
!742 = !DILocalVariable(name: "subnet", arg: 1, scope: !743, file: !72, line: 143, type: !102)
!743 = distinct !DISubprogram(name: "is_filtered_ipv4", scope: !72, file: !72, line: 143, type: !482, scopeLine: 143, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !744, keyInstructions: true)
!744 = !{!742, !745}
!745 = !DILocalVariable(name: "banned", scope: !743, file: !72, line: 145, type: !90)
!746 = !DILocation(line: 0, scope: !743, inlinedAt: !747)
!747 = distinct !DILocation(line: 372, column: 8, scope: !748)
!748 = distinct !DILexicalBlock(scope: !733, file: !72, line: 372, column: 8)
!749 = !DILocation(line: 147, column: 11, scope: !743, inlinedAt: !747, atomGroup: 2, atomRank: 2)
!750 = !DILocation(line: 149, column: 13, scope: !751, inlinedAt: !747, atomGroup: 3, atomRank: 2)
!751 = distinct !DILexicalBlock(scope: !743, file: !72, line: 149, column: 6)
!752 = !DILocation(line: 149, column: 21, scope: !751, inlinedAt: !747, atomGroup: 3, atomRank: 1)
!753 = !DILocation(line: 149, column: 24, scope: !751, inlinedAt: !747)
!754 = !{!190, !190, i64 0}
!755 = !DILocation(line: 149, column: 32, scope: !751, inlinedAt: !747, atomGroup: 4, atomRank: 2)
!756 = !DILocation(line: 149, column: 21, scope: !751, inlinedAt: !747, atomGroup: 4, atomRank: 1)
!757 = !DILocation(line: 0, scope: !743, inlinedAt: !758)
!758 = distinct !DILocation(line: 380, column: 15, scope: !759)
!759 = distinct !DILexicalBlock(scope: !748, file: !72, line: 380, column: 15)
!760 = !DILocation(line: 147, column: 11, scope: !743, inlinedAt: !758, atomGroup: 2, atomRank: 2)
!761 = !DILocation(line: 149, column: 13, scope: !751, inlinedAt: !758, atomGroup: 3, atomRank: 2)
!762 = !DILocation(line: 149, column: 21, scope: !751, inlinedAt: !758, atomGroup: 3, atomRank: 1)
!763 = !DILocation(line: 149, column: 24, scope: !751, inlinedAt: !758)
!764 = !DILocation(line: 149, column: 32, scope: !751, inlinedAt: !758, atomGroup: 4, atomRank: 2)
!765 = !DILocation(line: 149, column: 21, scope: !751, inlinedAt: !758, atomGroup: 4, atomRank: 1)
!766 = !DILocation(line: 0, scope: !307)
!767 = !DILocation(line: 225, column: 11, scope: !768, inlinedAt: !615)
!768 = distinct !DILexicalBlock(scope: !605, file: !211, line: 225, column: 6)
!769 = !DILocation(line: 225, column: 15, scope: !768, inlinedAt: !615, atomGroup: 2, atomRank: 2)
!770 = !DILocation(line: 225, column: 15, scope: !768, inlinedAt: !615, atomGroup: 2, atomRank: 1)
!771 = !DILocation(line: 232, column: 24, scope: !605, inlinedAt: !615)
!772 = !{!773, !672, i64 4}
!773 = !{!"udphdr", !672, i64 0, !672, i64 2, !672, i64 4, !672, i64 6}
!774 = !DILocation(line: 232, column: 8, scope: !605, inlinedAt: !615)
!775 = !DILocation(line: 233, column: 10, scope: !776, inlinedAt: !615, atomGroup: 8, atomRank: 2)
!776 = distinct !DILexicalBlock(scope: !605, file: !211, line: 233, column: 6)
!777 = !DILocation(line: 233, column: 10, scope: !776, inlinedAt: !615, atomGroup: 8, atomRank: 1)
!778 = !DILocation(line: 401, column: 36, scope: !307, atomGroup: 26, atomRank: 2)
!779 = !{!773, !672, i64 0}
!780 = !DILocalVariable(name: "port", arg: 1, scope: !781, file: !72, line: 171, type: !57)
!781 = distinct !DISubprogram(name: "is_filtered_port", scope: !72, file: !72, line: 171, type: !782, scopeLine: 171, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !784, keyInstructions: true)
!782 = !DISubroutineType(types: !783)
!783 = !{!460, !57}
!784 = !{!780, !785}
!785 = !DILocalVariable(name: "blocked_port", scope: !781, file: !72, line: 173, type: !90)
!786 = !DILocation(line: 0, scope: !781, inlinedAt: !787)
!787 = distinct !DILocation(line: 404, column: 8, scope: !788)
!788 = distinct !DILexicalBlock(scope: !307, file: !72, line: 404, column: 8)
!789 = distinct !DIAssignID()
!790 = !DILocation(line: 175, column: 17, scope: !781, inlinedAt: !787, atomGroup: 2, atomRank: 2)
!791 = !DILocation(line: 177, column: 19, scope: !792, inlinedAt: !787, atomGroup: 3, atomRank: 2)
!792 = distinct !DILexicalBlock(scope: !781, file: !72, line: 177, column: 6)
!793 = !DILocation(line: 177, column: 27, scope: !792, inlinedAt: !787, atomGroup: 3, atomRank: 1)
!794 = !DILocation(line: 177, column: 30, scope: !792, inlinedAt: !787)
!795 = !DILocation(line: 177, column: 44, scope: !792, inlinedAt: !787, atomGroup: 4, atomRank: 2)
!796 = !DILocation(line: 177, column: 27, scope: !792, inlinedAt: !787, atomGroup: 4, atomRank: 1)
!797 = !DILocation(line: 183, column: 1, scope: !781, inlinedAt: !787, atomGroup: 112, atomRank: 1)
!798 = !DILocation(line: 404, column: 38, scope: !788, atomGroup: 27, atomRank: 1)
!799 = !DILocation(line: 183, column: 1, scope: !781, inlinedAt: !787, atomGroup: 7, atomRank: 1)
!800 = !DILocation(line: 408, column: 34, scope: !307)
!801 = !DILocation(line: 408, column: 34, scope: !307, atomGroup: 29, atomRank: 2)
!802 = !{!773, !672, i64 2}
!803 = !DILocation(line: 0, scope: !781, inlinedAt: !804)
!804 = distinct !DILocation(line: 411, column: 8, scope: !805)
!805 = distinct !DILexicalBlock(scope: !307, file: !72, line: 411, column: 8)
!806 = distinct !DIAssignID()
!807 = !DILocation(line: 175, column: 17, scope: !781, inlinedAt: !804, atomGroup: 2, atomRank: 2)
!808 = !DILocation(line: 177, column: 19, scope: !792, inlinedAt: !804, atomGroup: 3, atomRank: 2)
!809 = !DILocation(line: 177, column: 27, scope: !792, inlinedAt: !804, atomGroup: 3, atomRank: 1)
!810 = !DILocation(line: 177, column: 30, scope: !792, inlinedAt: !804)
!811 = !DILocation(line: 177, column: 44, scope: !792, inlinedAt: !804, atomGroup: 4, atomRank: 2)
!812 = !DILocation(line: 177, column: 27, scope: !792, inlinedAt: !804, atomGroup: 4, atomRank: 1)
!813 = !DILocation(line: 183, column: 1, scope: !781, inlinedAt: !804, atomGroup: 113, atomRank: 1)
!814 = !DILocation(line: 411, column: 36, scope: !805, atomGroup: 30, atomRank: 1)
!815 = !DILocation(line: 183, column: 1, scope: !781, inlinedAt: !804, atomGroup: 7, atomRank: 1)
!816 = !DILocation(line: 418, column: 17, scope: !322, atomGroup: 32, atomRank: 2)
!817 = !DILocation(line: 419, column: 5, scope: !322, atomGroup: 32, atomRank: 1)
!818 = !DILocation(line: 0, scope: !321)
!819 = !DILocation(line: 272, column: 11, scope: !820, inlinedAt: !603)
!820 = distinct !DILexicalBlock(scope: !594, file: !211, line: 272, column: 6)
!821 = !DILocation(line: 272, column: 15, scope: !820, inlinedAt: !603, atomGroup: 2, atomRank: 2)
!822 = !DILocation(line: 272, column: 15, scope: !820, inlinedAt: !603, atomGroup: 2, atomRank: 1)
!823 = !DILocation(line: 207, column: 38, scope: !578, inlinedAt: !589)
!824 = !{!825, !672, i64 2}
!825 = !{!"dnshdr", !672, i64 0, !672, i64 2, !672, i64 4, !672, i64 6, !672, i64 8, !672, i64 10}
!826 = !DILocation(line: 209, column: 23, scope: !827, inlinedAt: !589, atomGroup: 5, atomRank: 2)
!827 = distinct !DILexicalBlock(scope: !578, file: !72, line: 209, column: 6)
!828 = !DILocation(line: 209, column: 23, scope: !827, inlinedAt: !589, atomGroup: 5, atomRank: 1)
!829 = !DILocation(line: 213, column: 40, scope: !578, inlinedAt: !589)
!830 = !{!825, !672, i64 4}
!831 = !DILocation(line: 215, column: 14, scope: !832, inlinedAt: !589, atomGroup: 9, atomRank: 2)
!832 = distinct !DILexicalBlock(scope: !578, file: !72, line: 215, column: 6)
!833 = !DILocation(line: 215, column: 14, scope: !832, inlinedAt: !589, atomGroup: 9, atomRank: 1)
!834 = !DILocation(line: 288, column: 43, scope: !835, inlinedAt: !850, atomGroup: 23, atomRank: 2)
!835 = distinct !DILexicalBlock(scope: !836, file: !211, line: 288, column: 2)
!836 = distinct !DILexicalBlock(scope: !837, file: !211, line: 288, column: 2)
!837 = distinct !DISubprogram(name: "dns_hash_wire", scope: !211, file: !211, line: 283, type: !838, scopeLine: 283, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !840, keyInstructions: true)
!838 = !DISubroutineType(types: !839)
!839 = !{!55, !61, !55, !86}
!840 = !{!841, !842, !843, !844, !845, !846, !847, !849}
!841 = !DILocalVariable(name: "start", arg: 1, scope: !837, file: !211, line: 283, type: !61)
!842 = !DILocalVariable(name: "data_end", arg: 2, scope: !837, file: !211, line: 283, type: !55)
!843 = !DILocalVariable(name: "out_hash", arg: 3, scope: !837, file: !211, line: 283, type: !86)
!844 = !DILocalVariable(name: "hash", scope: !837, file: !211, line: 285, type: !87)
!845 = !DILocalVariable(name: "base", scope: !837, file: !211, line: 286, type: !61)
!846 = !DILocalVariable(name: "i", scope: !836, file: !211, line: 288, type: !60)
!847 = !DILocalVariable(name: "b", scope: !848, file: !211, line: 294, type: !66)
!848 = distinct !DILexicalBlock(scope: !835, file: !211, line: 288, column: 47)
!849 = !DILocalVariable(name: "c", scope: !848, file: !211, line: 307, type: !66)
!850 = distinct !DILocation(line: 220, column: 15, scope: !578, inlinedAt: !589)
!851 = !DILocation(line: 0, scope: !836, inlinedAt: !850)
!852 = !DILocation(line: 0, scope: !837, inlinedAt: !850)
!853 = !DILocation(line: 288, column: 20, scope: !835, inlinedAt: !850, atomGroup: 4, atomRank: 1)
!854 = !DILocation(line: 288, column: 2, scope: !836, inlinedAt: !850, atomGroup: 5, atomRank: 1)
!855 = distinct !{!855, !856, !857, !858}
!856 = !DILocation(line: 288, column: 2, scope: !836, inlinedAt: !850)
!857 = !DILocation(line: 321, column: 2, scope: !836, inlinedAt: !850)
!858 = !{!"llvm.loop.mustprogress"}
!859 = !DILocation(line: 290, column: 21, scope: !860, inlinedAt: !850)
!860 = distinct !DILexicalBlock(scope: !848, file: !211, line: 290, column: 7)
!861 = !DILocation(line: 290, column: 25, scope: !860, inlinedAt: !850)
!862 = !DILocation(line: 290, column: 29, scope: !860, inlinedAt: !850, atomGroup: 6, atomRank: 2)
!863 = !DILocation(line: 290, column: 29, scope: !860, inlinedAt: !850, atomGroup: 6, atomRank: 1)
!864 = !DILocation(line: 294, column: 12, scope: !848, inlinedAt: !850, atomGroup: 8, atomRank: 2)
!865 = !DILocation(line: 0, scope: !848, inlinedAt: !850)
!866 = !DILocation(line: 296, column: 18, scope: !867, inlinedAt: !850, atomGroup: 9, atomRank: 2)
!867 = distinct !DILexicalBlock(scope: !848, file: !211, line: 296, column: 7)
!868 = !DILocation(line: 296, column: 18, scope: !867, inlinedAt: !850, atomGroup: 9, atomRank: 1)
!869 = !DILocation(line: 298, column: 26, scope: !870, inlinedAt: !850)
!870 = distinct !DILexicalBlock(scope: !871, file: !211, line: 298, column: 8)
!871 = distinct !DILexicalBlock(scope: !867, file: !211, line: 296, column: 27)
!872 = !DILocation(line: 298, column: 30, scope: !870, inlinedAt: !850, atomGroup: 10, atomRank: 2)
!873 = !DILocation(line: 298, column: 30, scope: !870, inlinedAt: !850, atomGroup: 10, atomRank: 1)
!874 = !DILocation(line: 309, column: 16, scope: !875, inlinedAt: !850, atomGroup: 15, atomRank: 1)
!875 = distinct !DILexicalBlock(scope: !848, file: !211, line: 309, column: 7)
!876 = !DILocation(line: 313, column: 11, scope: !848, inlinedAt: !850)
!877 = !DILocation(line: 313, column: 8, scope: !848, inlinedAt: !850, atomGroup: 18, atomRank: 2)
!878 = !DILocation(line: 314, column: 8, scope: !848, inlinedAt: !850, atomGroup: 19, atomRank: 2)
!879 = !DILocation(line: 316, column: 9, scope: !880, inlinedAt: !850, atomGroup: 20, atomRank: 2)
!880 = distinct !DILexicalBlock(scope: !848, file: !211, line: 316, column: 7)
!881 = !DILocation(line: 316, column: 9, scope: !880, inlinedAt: !850, atomGroup: 20, atomRank: 1)
!882 = !DILocation(line: 219, column: 8, scope: !578, inlinedAt: !589, atomGroup: 11, atomRank: 1)
!883 = !DILocalVariable(name: "hash", arg: 1, scope: !884, file: !72, line: 187, type: !87)
!884 = distinct !DISubprogram(name: "is_domain_banned", scope: !72, file: !72, line: 187, type: !885, scopeLine: 187, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !887, keyInstructions: true)
!885 = !DISubroutineType(types: !886)
!886 = !{!460, !87}
!887 = !{!883, !888}
!888 = !DILocalVariable(name: "banned", scope: !884, file: !72, line: 189, type: !90)
!889 = !DILocation(line: 0, scope: !884, inlinedAt: !890)
!890 = distinct !DILocation(line: 226, column: 9, scope: !578, inlinedAt: !589)
!891 = !{!892, !892, i64 0}
!892 = !{!"long long", !190, i64 0}
!893 = distinct !DIAssignID()
!894 = !DILocation(line: 191, column: 11, scope: !884, inlinedAt: !890, atomGroup: 2, atomRank: 2)
!895 = !DILocation(line: 193, column: 13, scope: !896, inlinedAt: !890, atomGroup: 3, atomRank: 2)
!896 = distinct !DILexicalBlock(scope: !884, file: !72, line: 193, column: 6)
!897 = !DILocation(line: 193, column: 21, scope: !896, inlinedAt: !890, atomGroup: 3, atomRank: 1)
!898 = !DILocation(line: 193, column: 24, scope: !896, inlinedAt: !890)
!899 = !DILocation(line: 193, column: 32, scope: !896, inlinedAt: !890, atomGroup: 4, atomRank: 2)
!900 = !DILocation(line: 193, column: 21, scope: !896, inlinedAt: !890, atomGroup: 4, atomRank: 1)
!901 = !DILocation(line: 199, column: 1, scope: !884, inlinedAt: !890, atomGroup: 7, atomRank: 1)
!902 = !DILocation(line: 427, column: 52, scope: !590, atomGroup: 38, atomRank: 1)
!903 = !DILocation(line: 199, column: 1, scope: !884, inlinedAt: !890, atomGroup: 115, atomRank: 1)
!904 = !DILocation(line: 0, scope: !334)
!905 = !DILocation(line: 246, column: 11, scope: !906, inlinedAt: !574)
!906 = distinct !DILexicalBlock(scope: !564, file: !211, line: 246, column: 6)
!907 = !DILocation(line: 246, column: 15, scope: !906, inlinedAt: !574, atomGroup: 2, atomRank: 2)
!908 = !DILocation(line: 246, column: 15, scope: !906, inlinedAt: !574, atomGroup: 2, atomRank: 1)
!909 = !DILocation(line: 250, column: 14, scope: !564, inlinedAt: !574)
!910 = !DILocation(line: 250, column: 19, scope: !564, inlinedAt: !574, atomGroup: 4, atomRank: 2)
!911 = !DILocation(line: 251, column: 10, scope: !912, inlinedAt: !574, atomGroup: 5, atomRank: 2)
!912 = distinct !DILexicalBlock(scope: !564, file: !211, line: 251, column: 6)
!913 = !DILocation(line: 251, column: 10, scope: !912, inlinedAt: !574, atomGroup: 5, atomRank: 1)
!914 = !DILocalVariable(name: "tcp_header", arg: 1, scope: !915, file: !72, line: 275, type: !336)
!915 = distinct !DISubprogram(name: "is_filtered_nmap_tcp_scan", scope: !72, file: !72, line: 275, type: !916, scopeLine: 275, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !918, keyInstructions: true)
!916 = !DISubroutineType(types: !917)
!917 = !{!460, !336}
!918 = !{!914}
!919 = !DILocation(line: 0, scope: !915, inlinedAt: !920)
!920 = distinct !DILocation(line: 446, column: 8, scope: !496)
!921 = !DILocation(line: 279, column: 3, scope: !922, inlinedAt: !920, atomGroup: 1, atomRank: 1)
!922 = distinct !DILexicalBlock(scope: !915, file: !72, line: 278, column: 3)
!923 = !DILocation(line: 300, column: 18, scope: !924, inlinedAt: !920)
!924 = distinct !DILexicalBlock(scope: !915, file: !72, line: 292, column: 3)
!925 = !{!926, !672, i64 14}
!926 = !{!"tcphdr", !672, i64 0, !672, i64 2, !189, i64 4, !189, i64 8, !672, i64 12, !672, i64 12, !672, i64 12, !672, i64 13, !672, i64 13, !672, i64 13, !672, i64 13, !672, i64 13, !672, i64 13, !672, i64 13, !672, i64 13, !672, i64 14, !672, i64 16, !672, i64 18}
!927 = !DILocation(line: 300, column: 25, scope: !924, inlinedAt: !920, atomGroup: 18, atomRank: 2)
!928 = !DILocation(line: 300, column: 3, scope: !924, inlinedAt: !920, atomGroup: 18, atomRank: 1)
!929 = !DILocalVariable(name: "tcp_header", arg: 1, scope: !930, file: !72, line: 309, type: !336)
!930 = distinct !DISubprogram(name: "is_likely_nmap_tcp_scan", scope: !72, file: !72, line: 309, type: !916, scopeLine: 309, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !931, keyInstructions: true)
!931 = !{!929}
!932 = !DILocation(line: 0, scope: !930, inlinedAt: !933)
!933 = distinct !DILocation(line: 448, column: 15, scope: !495)
!934 = !DILocation(line: 315, column: 3, scope: !935, inlinedAt: !933, atomGroup: 1, atomRank: 1)
!935 = distinct !DILexicalBlock(scope: !930, file: !72, line: 314, column: 3)
!936 = !DILocation(line: 321, column: 28, scope: !935, inlinedAt: !933)
!937 = !DILocation(line: 321, column: 36, scope: !935, inlinedAt: !933, atomGroup: 9, atomRank: 2)
!938 = !DILocation(line: 321, column: 3, scope: !935, inlinedAt: !933, atomGroup: 9, atomRank: 1)
!939 = !DILocation(line: 0, scope: !491, inlinedAt: !493)
!940 = !DILocation(line: 0, scope: !481, inlinedAt: !493)
!941 = !DILocation(line: 83, column: 13, scope: !481, inlinedAt: !493, atomGroup: 2, atomRank: 2)
!942 = !DILocation(line: 85, column: 15, scope: !480, inlinedAt: !493, atomGroup: 3, atomRank: 2)
!943 = !DILocation(line: 85, column: 15, scope: !480, inlinedAt: !493, atomGroup: 3, atomRank: 1)
!944 = !DILocation(line: 87, column: 3, scope: !479, inlinedAt: !493)
!945 = distinct !DIAssignID()
!946 = !DILocation(line: 88, column: 11, scope: !479, inlinedAt: !493)
!947 = !DILocation(line: 88, column: 21, scope: !479, inlinedAt: !493, atomGroup: 5, atomRank: 3)
!948 = !DILocation(line: 88, column: 9, scope: !479, inlinedAt: !493, atomGroup: 5, atomRank: 1)
!949 = distinct !DIAssignID()
!950 = !DILocation(line: 90, column: 3, scope: !479, inlinedAt: !493)
!951 = !DILocation(line: 92, column: 7, scope: !489, inlinedAt: !493)
!952 = !DILocation(line: 92, column: 13, scope: !489, inlinedAt: !493, atomGroup: 6, atomRank: 2)
!953 = !DILocation(line: 92, column: 13, scope: !489, inlinedAt: !493, atomGroup: 6, atomRank: 1)
!954 = !DILocation(line: 94, column: 4, scope: !488, inlinedAt: !493)
!955 = !DILocation(line: 94, column: 9, scope: !488, inlinedAt: !493, atomGroup: 7, atomRank: 1)
!956 = distinct !DIAssignID()
!957 = !DILocation(line: 95, column: 4, scope: !488, inlinedAt: !493)
!958 = !DILocation(line: 96, column: 4, scope: !488, inlinedAt: !493)
!959 = !DILocation(line: 98, column: 3, scope: !489, inlinedAt: !493)
!960 = !DILocation(line: 98, column: 3, scope: !488, inlinedAt: !493)
!961 = !DILocation(line: 100, column: 2, scope: !480, inlinedAt: !493)
!962 = !DILocation(line: 100, column: 2, scope: !479, inlinedAt: !493)
!963 = !DILocation(line: 102, column: 3, scope: !491, inlinedAt: !493)
!964 = !DILocation(line: 102, column: 8, scope: !491, inlinedAt: !493, atomGroup: 8, atomRank: 1)
!965 = distinct !DIAssignID()
!966 = !DILocation(line: 103, column: 3, scope: !491, inlinedAt: !493)
!967 = !DILocation(line: 105, column: 2, scope: !480, inlinedAt: !493)
!968 = !DILocation(line: 452, column: 36, scope: !334, atomGroup: 48, atomRank: 2)
!969 = !{!926, !672, i64 0}
!970 = !DILocation(line: 0, scope: !781, inlinedAt: !971)
!971 = distinct !DILocation(line: 455, column: 8, scope: !972)
!972 = distinct !DILexicalBlock(scope: !334, file: !72, line: 455, column: 8)
!973 = distinct !DIAssignID()
!974 = !DILocation(line: 175, column: 17, scope: !781, inlinedAt: !971, atomGroup: 2, atomRank: 2)
!975 = !DILocation(line: 177, column: 19, scope: !792, inlinedAt: !971, atomGroup: 3, atomRank: 2)
!976 = !DILocation(line: 177, column: 27, scope: !792, inlinedAt: !971, atomGroup: 3, atomRank: 1)
!977 = !DILocation(line: 177, column: 30, scope: !792, inlinedAt: !971)
!978 = !DILocation(line: 177, column: 44, scope: !792, inlinedAt: !971, atomGroup: 4, atomRank: 2)
!979 = !DILocation(line: 177, column: 27, scope: !792, inlinedAt: !971, atomGroup: 4, atomRank: 1)
!980 = !DILocation(line: 183, column: 1, scope: !781, inlinedAt: !971, atomGroup: 117, atomRank: 1)
!981 = !DILocation(line: 455, column: 38, scope: !972, atomGroup: 49, atomRank: 1)
!982 = !DILocation(line: 183, column: 1, scope: !781, inlinedAt: !971, atomGroup: 7, atomRank: 1)
!983 = !DILocation(line: 459, column: 34, scope: !334)
!984 = !DILocation(line: 459, column: 34, scope: !334, atomGroup: 51, atomRank: 2)
!985 = !{!926, !672, i64 2}
!986 = !DILocation(line: 0, scope: !781, inlinedAt: !987)
!987 = distinct !DILocation(line: 462, column: 8, scope: !988)
!988 = distinct !DILexicalBlock(scope: !334, file: !72, line: 462, column: 8)
!989 = distinct !DIAssignID()
!990 = !DILocation(line: 175, column: 17, scope: !781, inlinedAt: !987, atomGroup: 2, atomRank: 2)
!991 = !DILocation(line: 177, column: 19, scope: !792, inlinedAt: !987, atomGroup: 3, atomRank: 2)
!992 = !DILocation(line: 177, column: 27, scope: !792, inlinedAt: !987, atomGroup: 3, atomRank: 1)
!993 = !DILocation(line: 177, column: 30, scope: !792, inlinedAt: !987)
!994 = !DILocation(line: 177, column: 44, scope: !792, inlinedAt: !987, atomGroup: 4, atomRank: 2)
!995 = !DILocation(line: 177, column: 27, scope: !792, inlinedAt: !987, atomGroup: 4, atomRank: 1)
!996 = !DILocation(line: 183, column: 1, scope: !781, inlinedAt: !987, atomGroup: 118, atomRank: 1)
!997 = !DILocation(line: 183, column: 1, scope: !781, inlinedAt: !987, atomGroup: 7, atomRank: 1)
!998 = !DILocation(line: 0, scope: !362)
!999 = !DILocation(line: 179, column: 12, scope: !1000, inlinedAt: !560)
!1000 = distinct !DILexicalBlock(scope: !551, file: !211, line: 179, column: 6)
!1001 = !DILocation(line: 179, column: 16, scope: !1000, inlinedAt: !560, atomGroup: 2, atomRank: 2)
!1002 = !DILocation(line: 179, column: 16, scope: !1000, inlinedAt: !560, atomGroup: 2, atomRank: 1)
!1003 = !DILocalVariable(name: "icmp_header", arg: 1, scope: !1004, file: !72, line: 232, type: !364)
!1004 = distinct !DISubprogram(name: "is_filtered_icmp_packet", scope: !72, file: !72, line: 232, type: !1005, scopeLine: 232, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1007, keyInstructions: true)
!1005 = !DISubroutineType(types: !1006)
!1006 = !{!460, !364}
!1007 = !{!1003, !1008}
!1008 = !DILocalVariable(name: "type", scope: !1004, file: !72, line: 234, type: !60)
!1009 = !DILocation(line: 0, scope: !1004, inlinedAt: !1010)
!1010 = distinct !DILocation(line: 474, column: 23, scope: !1011)
!1011 = distinct !DILexicalBlock(scope: !362, file: !72, line: 474, column: 8)
!1012 = !DILocation(line: 234, column: 26, scope: !1004, inlinedAt: !1010, atomGroup: 1, atomRank: 3)
!1013 = !{!1014, !190, i64 0}
!1014 = !{!"icmphdr", !190, i64 0, !190, i64 1, !672, i64 2, !190, i64 4}
!1015 = !DILocation(line: 237, column: 8, scope: !1016, inlinedAt: !1010, atomGroup: 2, atomRank: 2)
!1016 = distinct !DILexicalBlock(scope: !1004, file: !72, line: 237, column: 3)
!1017 = !DILocation(line: 474, column: 20, scope: !1011)
!1018 = !DILocation(line: 474, column: 20, scope: !1011, atomGroup: 57, atomRank: 1)
!1019 = !DILocation(line: 486, column: 3, scope: !302, atomGroup: 59, atomRank: 1)
!1020 = !DILocation(line: 488, column: 2, scope: !303)
!1021 = !DILocation(line: 194, column: 11, scope: !1022, inlinedAt: !537)
!1022 = distinct !DILexicalBlock(scope: !528, file: !211, line: 194, column: 6)
!1023 = !DILocation(line: 194, column: 15, scope: !1022, inlinedAt: !537, atomGroup: 2, atomRank: 2)
!1024 = !DILocation(line: 194, column: 15, scope: !1022, inlinedAt: !537, atomGroup: 2, atomRank: 1)
!1025 = !DILocation(line: 0, scope: !517, inlinedAt: !527)
!1026 = !DILocation(line: 76, column: 2, scope: !517, inlinedAt: !527, atomGroup: 134, atomRank: 1)
!1027 = !DILocation(line: 201, column: 44, scope: !528, inlinedAt: !537)
!1028 = !DILocation(line: 76, column: 2, scope: !517, inlinedAt: !527)
!1029 = !DILocation(line: 201, scope: !528, inlinedAt: !537)
!1030 = !DILocation(line: 84, column: 3, scope: !519, inlinedAt: !527, atomGroup: 7, atomRank: 1)
!1031 = !DILocation(line: 96, column: 5, scope: !1032, inlinedAt: !527, atomGroup: 13, atomRank: 1)
!1032 = distinct !DILexicalBlock(scope: !519, file: !211, line: 84, column: 26)
!1033 = !DILocation(line: 84, column: 11, scope: !519, inlinedAt: !527, atomGroup: 7, atomRank: 2)
!1034 = !DILocation(line: 102, column: 5, scope: !1032, inlinedAt: !527, atomGroup: 17, atomRank: 1)
!1035 = !DILocation(line: 0, scope: !1032, inlinedAt: !527)
!1036 = !{!1037, !190, i64 1}
!1037 = !{!"ipv6_opt_hdr", !190, i64 0, !190, i64 1}
!1038 = !DILocation(line: 76, column: 41, scope: !520, inlinedAt: !527, atomGroup: 18, atomRank: 2)
!1039 = !DILocation(line: 76, column: 20, scope: !520, inlinedAt: !527, atomGroup: 2, atomRank: 1)
!1040 = !DILocation(line: 0, scope: !519, inlinedAt: !527)
!1041 = !DILocation(line: 76, column: 2, scope: !517, inlinedAt: !527, atomGroup: 3, atomRank: 1)
!1042 = distinct !{!1042, !1028, !1043, !858}
!1043 = !DILocation(line: 106, column: 2, scope: !517, inlinedAt: !527)
!1044 = !DILocation(line: 492, column: 3, scope: !388)
!1045 = distinct !DIAssignID()
!1046 = !DILocation(line: 495, column: 3, scope: !388)
!1047 = distinct !DIAssignID()
!1048 = !DILocation(line: 498, column: 7, scope: !396, atomGroup: 64, atomRank: 1)
!1049 = !DILocation(line: 493, column: 31, scope: !388, atomGroup: 120, atomRank: 1)
!1050 = !{!1051, !189, i64 0}
!1051 = !{!"ipv6_subnet", !189, i64 0, !190, i64 4}
!1052 = !DILocation(line: 496, column: 23, scope: !388, atomGroup: 121, atomRank: 1)
!1053 = !DILocation(line: 500, column: 24, scope: !395)
!1054 = !DILocation(line: 500, column: 47, scope: !395)
!1055 = !DILocation(line: 500, column: 4, scope: !395, atomGroup: 65, atomRank: 1)
!1056 = distinct !DIAssignID()
!1057 = !DILocation(line: 501, column: 22, scope: !395)
!1058 = !DILocation(line: 501, column: 45, scope: !395)
!1059 = !DILocation(line: 501, column: 4, scope: !395, atomGroup: 66, atomRank: 1)
!1060 = distinct !DIAssignID()
!1061 = !DILocalVariable(name: "subnet", arg: 1, scope: !1062, file: !72, line: 157, type: !136)
!1062 = distinct !DISubprogram(name: "is_filtered_ipv6", scope: !72, file: !72, line: 157, type: !458, scopeLine: 157, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1063, keyInstructions: true)
!1063 = !{!1061, !1064}
!1064 = !DILocalVariable(name: "banned", scope: !1062, file: !72, line: 159, type: !90)
!1065 = !DILocation(line: 0, scope: !1062, inlinedAt: !1066)
!1066 = distinct !DILocation(line: 503, column: 8, scope: !1067)
!1067 = distinct !DILexicalBlock(scope: !395, file: !72, line: 503, column: 8)
!1068 = !DILocation(line: 161, column: 11, scope: !1062, inlinedAt: !1066, atomGroup: 2, atomRank: 2)
!1069 = !DILocation(line: 163, column: 13, scope: !1070, inlinedAt: !1066, atomGroup: 3, atomRank: 2)
!1070 = distinct !DILexicalBlock(scope: !1062, file: !72, line: 163, column: 6)
!1071 = !DILocation(line: 163, column: 21, scope: !1070, inlinedAt: !1066, atomGroup: 3, atomRank: 1)
!1072 = !DILocation(line: 163, column: 24, scope: !1070, inlinedAt: !1066)
!1073 = !DILocation(line: 163, column: 32, scope: !1070, inlinedAt: !1066, atomGroup: 4, atomRank: 2)
!1074 = !DILocation(line: 163, column: 21, scope: !1070, inlinedAt: !1066, atomGroup: 4, atomRank: 1)
!1075 = !DILocation(line: 0, scope: !1062, inlinedAt: !1076)
!1076 = distinct !DILocation(line: 511, column: 15, scope: !1077)
!1077 = distinct !DILexicalBlock(scope: !1067, file: !72, line: 511, column: 15)
!1078 = !DILocation(line: 161, column: 11, scope: !1062, inlinedAt: !1076, atomGroup: 2, atomRank: 2)
!1079 = !DILocation(line: 163, column: 13, scope: !1070, inlinedAt: !1076, atomGroup: 3, atomRank: 2)
!1080 = !DILocation(line: 163, column: 21, scope: !1070, inlinedAt: !1076, atomGroup: 3, atomRank: 1)
!1081 = !DILocation(line: 163, column: 24, scope: !1070, inlinedAt: !1076)
!1082 = !DILocation(line: 163, column: 32, scope: !1070, inlinedAt: !1076, atomGroup: 4, atomRank: 2)
!1083 = !DILocation(line: 163, column: 21, scope: !1070, inlinedAt: !1076, atomGroup: 4, atomRank: 1)
!1084 = !DILocation(line: 521, column: 17, scope: !394, atomGroup: 71, atomRank: 1)
!1085 = !DILocation(line: 0, scope: !393)
!1086 = !DILocation(line: 225, column: 11, scope: !768, inlinedAt: !617)
!1087 = !DILocation(line: 225, column: 15, scope: !768, inlinedAt: !617, atomGroup: 2, atomRank: 2)
!1088 = !DILocation(line: 225, column: 15, scope: !768, inlinedAt: !617, atomGroup: 2, atomRank: 1)
!1089 = !DILocation(line: 232, column: 24, scope: !605, inlinedAt: !617)
!1090 = !DILocation(line: 232, column: 8, scope: !605, inlinedAt: !617)
!1091 = !DILocation(line: 233, column: 10, scope: !776, inlinedAt: !617, atomGroup: 8, atomRank: 2)
!1092 = !DILocation(line: 233, column: 10, scope: !776, inlinedAt: !617, atomGroup: 8, atomRank: 1)
!1093 = !DILocation(line: 530, column: 37, scope: !393, atomGroup: 76, atomRank: 2)
!1094 = !DILocation(line: 0, scope: !781, inlinedAt: !1095)
!1095 = distinct !DILocation(line: 533, column: 9, scope: !1096)
!1096 = distinct !DILexicalBlock(scope: !393, file: !72, line: 533, column: 9)
!1097 = distinct !DIAssignID()
!1098 = !DILocation(line: 175, column: 17, scope: !781, inlinedAt: !1095, atomGroup: 2, atomRank: 2)
!1099 = !DILocation(line: 177, column: 19, scope: !792, inlinedAt: !1095, atomGroup: 3, atomRank: 2)
!1100 = !DILocation(line: 177, column: 27, scope: !792, inlinedAt: !1095, atomGroup: 3, atomRank: 1)
!1101 = !DILocation(line: 177, column: 30, scope: !792, inlinedAt: !1095)
!1102 = !DILocation(line: 177, column: 44, scope: !792, inlinedAt: !1095, atomGroup: 4, atomRank: 2)
!1103 = !DILocation(line: 177, column: 27, scope: !792, inlinedAt: !1095, atomGroup: 4, atomRank: 1)
!1104 = !DILocation(line: 183, column: 1, scope: !781, inlinedAt: !1095, atomGroup: 124, atomRank: 1)
!1105 = !DILocation(line: 533, column: 39, scope: !1096, atomGroup: 77, atomRank: 1)
!1106 = !DILocation(line: 183, column: 1, scope: !781, inlinedAt: !1095, atomGroup: 7, atomRank: 1)
!1107 = !DILocation(line: 537, column: 35, scope: !393)
!1108 = !DILocation(line: 537, column: 35, scope: !393, atomGroup: 79, atomRank: 2)
!1109 = !DILocation(line: 0, scope: !781, inlinedAt: !1110)
!1110 = distinct !DILocation(line: 540, column: 9, scope: !1111)
!1111 = distinct !DILexicalBlock(scope: !393, file: !72, line: 540, column: 9)
!1112 = distinct !DIAssignID()
!1113 = !DILocation(line: 175, column: 17, scope: !781, inlinedAt: !1110, atomGroup: 2, atomRank: 2)
!1114 = !DILocation(line: 177, column: 19, scope: !792, inlinedAt: !1110, atomGroup: 3, atomRank: 2)
!1115 = !DILocation(line: 177, column: 27, scope: !792, inlinedAt: !1110, atomGroup: 3, atomRank: 1)
!1116 = !DILocation(line: 177, column: 30, scope: !792, inlinedAt: !1110)
!1117 = !DILocation(line: 177, column: 44, scope: !792, inlinedAt: !1110, atomGroup: 4, atomRank: 2)
!1118 = !DILocation(line: 177, column: 27, scope: !792, inlinedAt: !1110, atomGroup: 4, atomRank: 1)
!1119 = !DILocation(line: 183, column: 1, scope: !781, inlinedAt: !1110, atomGroup: 125, atomRank: 1)
!1120 = !DILocation(line: 183, column: 1, scope: !781, inlinedAt: !1110, atomGroup: 7, atomRank: 1)
!1121 = !DILocation(line: 0, scope: !401)
!1122 = !DILocation(line: 246, column: 11, scope: !906, inlinedAt: !576)
!1123 = !DILocation(line: 246, column: 15, scope: !906, inlinedAt: !576, atomGroup: 2, atomRank: 2)
!1124 = !DILocation(line: 246, column: 15, scope: !906, inlinedAt: !576, atomGroup: 2, atomRank: 1)
!1125 = !DILocation(line: 250, column: 14, scope: !564, inlinedAt: !576)
!1126 = !DILocation(line: 250, column: 19, scope: !564, inlinedAt: !576, atomGroup: 4, atomRank: 2)
!1127 = !DILocation(line: 251, column: 10, scope: !912, inlinedAt: !576, atomGroup: 5, atomRank: 2)
!1128 = !DILocation(line: 251, column: 10, scope: !912, inlinedAt: !576, atomGroup: 5, atomRank: 1)
!1129 = !DILocation(line: 0, scope: !915, inlinedAt: !1130)
!1130 = distinct !DILocation(line: 554, column: 9, scope: !473)
!1131 = !DILocation(line: 279, column: 3, scope: !922, inlinedAt: !1130, atomGroup: 1, atomRank: 1)
!1132 = !DILocation(line: 300, column: 18, scope: !924, inlinedAt: !1130)
!1133 = !DILocation(line: 300, column: 25, scope: !924, inlinedAt: !1130, atomGroup: 18, atomRank: 2)
!1134 = !DILocation(line: 300, column: 3, scope: !924, inlinedAt: !1130, atomGroup: 18, atomRank: 1)
!1135 = !DILocation(line: 0, scope: !930, inlinedAt: !1136)
!1136 = distinct !DILocation(line: 556, column: 16, scope: !472)
!1137 = !DILocation(line: 315, column: 3, scope: !935, inlinedAt: !1136, atomGroup: 1, atomRank: 1)
!1138 = !DILocation(line: 321, column: 28, scope: !935, inlinedAt: !1136)
!1139 = !DILocation(line: 321, column: 36, scope: !935, inlinedAt: !1136, atomGroup: 9, atomRank: 2)
!1140 = !DILocation(line: 321, column: 3, scope: !935, inlinedAt: !1136, atomGroup: 9, atomRank: 1)
!1141 = !DILocation(line: 0, scope: !468, inlinedAt: !470)
!1142 = !DILocation(line: 0, scope: !457, inlinedAt: !470)
!1143 = !DILocation(line: 115, column: 13, scope: !457, inlinedAt: !470, atomGroup: 2, atomRank: 2)
!1144 = !DILocation(line: 117, column: 15, scope: !456, inlinedAt: !470, atomGroup: 3, atomRank: 2)
!1145 = !DILocation(line: 117, column: 15, scope: !456, inlinedAt: !470, atomGroup: 3, atomRank: 1)
!1146 = !DILocation(line: 119, column: 3, scope: !455, inlinedAt: !470)
!1147 = distinct !DIAssignID()
!1148 = !DILocation(line: 120, column: 11, scope: !455, inlinedAt: !470)
!1149 = !DILocation(line: 120, column: 21, scope: !455, inlinedAt: !470, atomGroup: 5, atomRank: 3)
!1150 = !DILocation(line: 120, column: 9, scope: !455, inlinedAt: !470, atomGroup: 5, atomRank: 1)
!1151 = distinct !DIAssignID()
!1152 = !DILocation(line: 122, column: 3, scope: !455, inlinedAt: !470)
!1153 = !DILocation(line: 124, column: 7, scope: !466, inlinedAt: !470)
!1154 = !DILocation(line: 124, column: 13, scope: !466, inlinedAt: !470, atomGroup: 6, atomRank: 2)
!1155 = !DILocation(line: 124, column: 13, scope: !466, inlinedAt: !470, atomGroup: 6, atomRank: 1)
!1156 = !DILocation(line: 126, column: 4, scope: !465, inlinedAt: !470)
!1157 = !DILocation(line: 126, column: 9, scope: !465, inlinedAt: !470, atomGroup: 7, atomRank: 1)
!1158 = distinct !DIAssignID()
!1159 = !DILocation(line: 127, column: 4, scope: !465, inlinedAt: !470)
!1160 = !DILocation(line: 128, column: 4, scope: !465, inlinedAt: !470)
!1161 = !DILocation(line: 130, column: 3, scope: !466, inlinedAt: !470)
!1162 = !DILocation(line: 130, column: 3, scope: !465, inlinedAt: !470)
!1163 = !DILocation(line: 132, column: 2, scope: !456, inlinedAt: !470)
!1164 = !DILocation(line: 132, column: 2, scope: !455, inlinedAt: !470)
!1165 = !DILocation(line: 134, column: 3, scope: !468, inlinedAt: !470)
!1166 = !DILocation(line: 134, column: 8, scope: !468, inlinedAt: !470, atomGroup: 8, atomRank: 1)
!1167 = distinct !DIAssignID()
!1168 = !DILocation(line: 135, column: 3, scope: !468, inlinedAt: !470)
!1169 = !DILocation(line: 137, column: 2, scope: !456, inlinedAt: !470)
!1170 = !DILocation(line: 560, column: 37, scope: !401, atomGroup: 90, atomRank: 2)
!1171 = !DILocation(line: 0, scope: !781, inlinedAt: !1172)
!1172 = distinct !DILocation(line: 563, column: 9, scope: !1173)
!1173 = distinct !DILexicalBlock(scope: !401, file: !72, line: 563, column: 9)
!1174 = distinct !DIAssignID()
!1175 = !DILocation(line: 175, column: 17, scope: !781, inlinedAt: !1172, atomGroup: 2, atomRank: 2)
!1176 = !DILocation(line: 177, column: 19, scope: !792, inlinedAt: !1172, atomGroup: 3, atomRank: 2)
!1177 = !DILocation(line: 177, column: 27, scope: !792, inlinedAt: !1172, atomGroup: 3, atomRank: 1)
!1178 = !DILocation(line: 177, column: 30, scope: !792, inlinedAt: !1172)
!1179 = !DILocation(line: 177, column: 44, scope: !792, inlinedAt: !1172, atomGroup: 4, atomRank: 2)
!1180 = !DILocation(line: 177, column: 27, scope: !792, inlinedAt: !1172, atomGroup: 4, atomRank: 1)
!1181 = !DILocation(line: 183, column: 1, scope: !781, inlinedAt: !1172, atomGroup: 127, atomRank: 1)
!1182 = !DILocation(line: 563, column: 39, scope: !1173, atomGroup: 91, atomRank: 1)
!1183 = !DILocation(line: 183, column: 1, scope: !781, inlinedAt: !1172, atomGroup: 7, atomRank: 1)
!1184 = !DILocation(line: 567, column: 35, scope: !401)
!1185 = !DILocation(line: 567, column: 35, scope: !401, atomGroup: 93, atomRank: 2)
!1186 = !DILocation(line: 0, scope: !781, inlinedAt: !1187)
!1187 = distinct !DILocation(line: 570, column: 9, scope: !1188)
!1188 = distinct !DILexicalBlock(scope: !401, file: !72, line: 570, column: 9)
!1189 = distinct !DIAssignID()
!1190 = !DILocation(line: 175, column: 17, scope: !781, inlinedAt: !1187, atomGroup: 2, atomRank: 2)
!1191 = !DILocation(line: 177, column: 19, scope: !792, inlinedAt: !1187, atomGroup: 3, atomRank: 2)
!1192 = !DILocation(line: 177, column: 27, scope: !792, inlinedAt: !1187, atomGroup: 3, atomRank: 1)
!1193 = !DILocation(line: 177, column: 30, scope: !792, inlinedAt: !1187)
!1194 = !DILocation(line: 177, column: 44, scope: !792, inlinedAt: !1187, atomGroup: 4, atomRank: 2)
!1195 = !DILocation(line: 177, column: 27, scope: !792, inlinedAt: !1187, atomGroup: 4, atomRank: 1)
!1196 = !DILocation(line: 183, column: 1, scope: !781, inlinedAt: !1187, atomGroup: 128, atomRank: 1)
!1197 = !DILocation(line: 183, column: 1, scope: !781, inlinedAt: !1187, atomGroup: 7, atomRank: 1)
!1198 = !DILocation(line: 0, scope: !407)
!1199 = !DILocation(line: 179, column: 12, scope: !1000, inlinedAt: !562)
!1200 = !DILocation(line: 179, column: 16, scope: !1000, inlinedAt: !562, atomGroup: 2, atomRank: 2)
!1201 = !DILocation(line: 179, column: 16, scope: !1000, inlinedAt: !562, atomGroup: 2, atomRank: 1)
!1202 = !DILocation(line: 0, scope: !1004, inlinedAt: !1203)
!1203 = distinct !DILocation(line: 580, column: 24, scope: !1204)
!1204 = distinct !DILexicalBlock(scope: !407, file: !72, line: 580, column: 9)
!1205 = !DILocation(line: 234, column: 26, scope: !1004, inlinedAt: !1203, atomGroup: 1, atomRank: 3)
!1206 = !DILocation(line: 237, column: 8, scope: !1016, inlinedAt: !1203, atomGroup: 2, atomRank: 2)
!1207 = !DILocation(line: 580, column: 21, scope: !1204)
!1208 = !DILocation(line: 580, column: 21, scope: !1204, atomGroup: 99, atomRank: 1)
!1209 = !DILocation(line: 0, scope: !410)
!1210 = !DILocation(line: 209, column: 13, scope: !1211, inlinedAt: !548)
!1211 = distinct !DILexicalBlock(scope: !539, file: !211, line: 209, column: 6)
!1212 = !DILocation(line: 209, column: 17, scope: !1211, inlinedAt: !548, atomGroup: 2, atomRank: 2)
!1213 = !DILocation(line: 209, column: 17, scope: !1211, inlinedAt: !548, atomGroup: 2, atomRank: 1)
!1214 = !DILocalVariable(name: "icmp6_header", arg: 1, scope: !1215, file: !72, line: 251, type: !412)
!1215 = distinct !DISubprogram(name: "is_filtered_icmp6_packet", scope: !72, file: !72, line: 251, type: !1216, scopeLine: 251, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1218, keyInstructions: true)
!1216 = !DISubroutineType(types: !1217)
!1217 = !{!460, !412}
!1218 = !{!1214, !1219}
!1219 = !DILocalVariable(name: "type", scope: !1215, file: !72, line: 253, type: !60)
!1220 = !DILocation(line: 0, scope: !1215, inlinedAt: !1221)
!1221 = distinct !DILocation(line: 596, column: 25, scope: !1222)
!1222 = distinct !DILexicalBlock(scope: !410, file: !72, line: 596, column: 9)
!1223 = !DILocation(line: 253, column: 27, scope: !1215, inlinedAt: !1221, atomGroup: 1, atomRank: 3)
!1224 = !{!1225, !190, i64 0}
!1225 = !{!"icmp6hdr", !190, i64 0, !190, i64 1, !672, i64 2, !190, i64 4}
!1226 = !DILocation(line: 256, column: 8, scope: !1227, inlinedAt: !1221, atomGroup: 2, atomRank: 2)
!1227 = distinct !DILexicalBlock(scope: !1215, file: !72, line: 256, column: 3)
!1228 = !DILocation(line: 596, column: 22, scope: !1222)
!1229 = !DILocation(line: 596, column: 22, scope: !1222, atomGroup: 104, atomRank: 1)
!1230 = !DILocation(line: 610, column: 2, scope: !389)
!1231 = !DILocation(line: 614, column: 1, scope: !192, atomGroup: 107, atomRank: 1)
