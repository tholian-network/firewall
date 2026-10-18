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
%struct.anon.11 = type { ptr, ptr, ptr, ptr }
%struct.anon.12 = type { ptr, ptr, ptr, ptr }
%struct.ipv6_socket = type { [16 x i8], i16 }
%struct.ipv4_socket = type { [4 x i8], i16 }
%struct.ipv4_subnet = type { i32, [4 x i8] }
%struct.ipv6_subnet = type { i32, [16 x i8] }

@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !0
@domain_bans = dso_local global %struct.anon.5 zeroinitializer, section ".maps", align 8, !dbg !70
@ipv4_bans = dso_local global %struct.anon.6 zeroinitializer, section ".maps", align 8, !dbg !91
@ipv4_warnings = dso_local global %struct.anon.7 zeroinitializer, section ".maps", align 8, !dbg !113
@ipv6_bans = dso_local global %struct.anon.8 zeroinitializer, section ".maps", align 8, !dbg !129
@ipv6_warnings = dso_local global %struct.anon.9 zeroinitializer, section ".maps", align 8, !dbg !146
@port_bans = dso_local global %struct.anon.10 zeroinitializer, section ".maps", align 8, !dbg !154
@ipv4_sockets = dso_local global %struct.anon.11 zeroinitializer, section ".maps", align 8, !dbg !163
@ipv6_sockets = dso_local global %struct.anon.12 zeroinitializer, section ".maps", align 8, !dbg !177
@llvm.compiler.used = appending global [10 x ptr] [ptr @_license, ptr @domain_bans, ptr @ipv4_bans, ptr @ipv4_sockets, ptr @ipv4_warnings, ptr @ipv6_bans, ptr @ipv6_sockets, ptr @ipv6_warnings, ptr @port_bans, ptr @xdp_prog_main], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local range(i32 1, 3) i32 @xdp_prog_main(ptr noundef readonly captures(none) %0) #0 section "xdp" !dbg !219 {
  %2 = alloca i64, align 8, !DIAssignID !478
  %3 = alloca i8, align 1, !DIAssignID !479
    #dbg_assign(i1 poison, !480, !DIExpression(), !479, ptr %3, !DIExpression(), !495)
  %4 = alloca i8, align 1, !DIAssignID !500
    #dbg_assign(i1 poison, !490, !DIExpression(), !500, ptr %4, !DIExpression(), !501)
  %5 = alloca i8, align 1, !DIAssignID !502
  %6 = alloca %struct.ipv6_socket, align 2, !DIAssignID !503
    #dbg_assign(i1 poison, !504, !DIExpression(), !503, ptr %6, !DIExpression(), !513)
  %7 = alloca %struct.ipv6_socket, align 2, !DIAssignID !516
  %8 = alloca %struct.ipv6_socket, align 2, !DIAssignID !517
    #dbg_assign(i1 poison, !504, !DIExpression(), !517, ptr %8, !DIExpression(), !518)
  %9 = alloca %struct.ipv6_socket, align 2, !DIAssignID !521
  %10 = alloca i8, align 1, !DIAssignID !522
    #dbg_assign(i1 poison, !523, !DIExpression(), !522, ptr %10, !DIExpression(), !537)
  %11 = alloca i8, align 1, !DIAssignID !542
    #dbg_assign(i1 poison, !532, !DIExpression(), !542, ptr %11, !DIExpression(), !543)
  %12 = alloca i8, align 1, !DIAssignID !544
  %13 = alloca %struct.ipv4_socket, align 4, !DIAssignID !545
    #dbg_assign(i1 poison, !546, !DIExpression(), !545, ptr %13, !DIExpression(), !555)
  %14 = alloca %struct.ipv4_socket, align 4, !DIAssignID !558
  %15 = alloca %struct.ipv4_socket, align 4, !DIAssignID !559
    #dbg_assign(i1 poison, !546, !DIExpression(), !559, ptr %15, !DIExpression(), !560)
  %16 = alloca %struct.ipv4_socket, align 4, !DIAssignID !563
  %17 = alloca i16, align 2, !DIAssignID !564
  %18 = alloca i16, align 2, !DIAssignID !565
  %19 = alloca i16, align 2, !DIAssignID !566
  %20 = alloca i16, align 2, !DIAssignID !567
  %21 = alloca i16, align 2, !DIAssignID !568
  %22 = alloca i16, align 2, !DIAssignID !569
  %23 = alloca i16, align 2, !DIAssignID !570
  %24 = alloca i16, align 2, !DIAssignID !571
    #dbg_value(ptr poison, !572, !DIExpression(), !590)
    #dbg_value(ptr poison, !602, !DIExpression(), !611)
    #dbg_value(ptr poison, !597, !DIExpression(), !613)
    #dbg_value(ptr poison, !614, !DIExpression(), !623)
    #dbg_value(ptr poison, !614, !DIExpression(), !625)
    #dbg_value(ptr poison, !627, !DIExpression(), !637)
    #dbg_value(ptr poison, !627, !DIExpression(), !639)
    #dbg_value(ptr poison, !641, !DIExpression(), !652)
    #dbg_value(ptr poison, !657, !DIExpression(), !666)
    #dbg_value(ptr poison, !668, !DIExpression(), !678)
    #dbg_value(ptr poison, !668, !DIExpression(), !680)
    #dbg_value(ptr poison, !682, !DIExpression(), !692)
    #dbg_value(ptr poison, !694, !DIExpression(), !711)
  %25 = alloca %struct.ipv4_subnet, align 4, !DIAssignID !713
    #dbg_assign(i1 poison, !331, !DIExpression(), !713, ptr %25, !DIExpression(), !714)
  %26 = alloca %struct.ipv4_subnet, align 4, !DIAssignID !715
    #dbg_assign(i1 poison, !332, !DIExpression(), !715, ptr %26, !DIExpression(), !714)
  %27 = alloca %struct.ipv6_subnet, align 4, !DIAssignID !716
    #dbg_assign(i1 poison, !416, !DIExpression(), !716, ptr %27, !DIExpression(), !717)
  %28 = alloca %struct.ipv6_subnet, align 4, !DIAssignID !718
    #dbg_assign(i1 poison, !417, !DIExpression(), !718, ptr %28, !DIExpression(), !717)
    #dbg_value(ptr %0, !232, !DIExpression(), !719)
  %29 = getelementptr inbounds nuw i8, ptr %0, i64 4, !dbg !720
  %30 = load i32, ptr %29, align 4, !dbg !721, !tbaa !722
  %31 = zext i32 %30 to i64, !dbg !724
  %32 = inttoptr i64 %31 to ptr, !dbg !725
    #dbg_value(ptr %32, !233, !DIExpression(), !719)
  %33 = load i32, ptr %0, align 4, !dbg !726, !tbaa !727
  %34 = zext i32 %33 to i64, !dbg !728
  %35 = inttoptr i64 %34 to ptr, !dbg !729
    #dbg_value(ptr %35, !234, !DIExpression(), !719)
  %36 = getelementptr inbounds nuw i8, ptr %35, i64 14, !dbg !730
  %37 = icmp samesign ugt ptr %36, %32, !dbg !732
  br i1 %37, label %487, label %38, !dbg !733

38:                                               ; preds = %1
    #dbg_value(ptr null, !256, !DIExpression(), !719)
    #dbg_value(ptr null, !287, !DIExpression(), !719)
    #dbg_value(ptr undef, !694, !DIExpression(), !711)
    #dbg_value(ptr %32, !700, !DIExpression(), !711)
    #dbg_value(ptr poison, !701, !DIExpression(), !711)
    #dbg_value(ptr %35, !702, !DIExpression(), !711)
    #dbg_value(ptr %36, !236, !DIExpression(), !719)
    #dbg_value(ptr %35, !241, !DIExpression(), !719)
    #dbg_value(ptr %36, !703, !DIExpression(), !711)
  %39 = getelementptr inbounds nuw i8, ptr %35, i64 12, !dbg !734
    #dbg_value(i16 poison, !709, !DIExpression(), !711)
    #dbg_value(i32 0, !710, !DIExpression(), !711)
  %40 = load i16, ptr %39, align 1, !dbg !711, !tbaa !735
    #dbg_value(i32 0, !710, !DIExpression(), !711)
    #dbg_value(ptr %36, !703, !DIExpression(), !711)
    #dbg_value(i16 %40, !737, !DIExpression(), !742)
  %41 = icmp eq i16 %40, 129, !dbg !748
  %42 = icmp eq i16 %40, -22392, !dbg !749
  %43 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 3, i1 %41)
  %44 = or i1 %42, %43, !dbg !749
  br i1 %44, label %45, label %81, !dbg !750

45:                                               ; preds = %38
  %46 = getelementptr inbounds nuw i8, ptr %35, i64 18, !dbg !751
  %47 = icmp samesign ugt ptr %46, %32, !dbg !753
  br i1 %47, label %81, label %48, !dbg !754

48:                                               ; preds = %45
  %49 = getelementptr inbounds nuw i8, ptr %35, i64 16, !dbg !755
    #dbg_value(i16 poison, !709, !DIExpression(), !711)
    #dbg_value(ptr %46, !703, !DIExpression(), !711)
    #dbg_value(i32 1, !710, !DIExpression(), !711)
  %50 = load i16, ptr %49, align 1, !dbg !711, !tbaa !735
    #dbg_value(i16 %50, !709, !DIExpression(), !711)
    #dbg_value(i16 %50, !737, !DIExpression(), !742)
  %51 = icmp eq i16 %50, 129, !dbg !756
  %52 = icmp eq i16 %50, -22392, !dbg !757
  %53 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 3, i1 %51)
  %54 = or i1 %52, %53, !dbg !757
  br i1 %54, label %55, label %81, !dbg !758

55:                                               ; preds = %48
  %56 = getelementptr inbounds nuw i8, ptr %35, i64 22, !dbg !751
  %57 = icmp samesign ugt ptr %56, %32, !dbg !759
  br i1 %57, label %81, label %58, !dbg !760

58:                                               ; preds = %55
  %59 = getelementptr inbounds nuw i8, ptr %35, i64 20, !dbg !755
    #dbg_value(i16 poison, !709, !DIExpression(), !711)
    #dbg_value(ptr %56, !703, !DIExpression(), !711)
    #dbg_value(i32 2, !710, !DIExpression(), !711)
  %60 = load i16, ptr %59, align 1, !dbg !711, !tbaa !735
    #dbg_value(i16 %60, !709, !DIExpression(), !711)
    #dbg_value(i16 %60, !737, !DIExpression(), !742)
  %61 = icmp eq i16 %60, 129, !dbg !761
  %62 = icmp eq i16 %60, -22392, !dbg !762
  %63 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 3, i1 %61)
  %64 = or i1 %62, %63, !dbg !762
  br i1 %64, label %65, label %81, !dbg !763

65:                                               ; preds = %58
  %66 = getelementptr inbounds nuw i8, ptr %35, i64 26, !dbg !751
  %67 = icmp samesign ugt ptr %66, %32, !dbg !764
  br i1 %67, label %81, label %68, !dbg !765

68:                                               ; preds = %65
  %69 = getelementptr inbounds nuw i8, ptr %35, i64 24, !dbg !755
    #dbg_value(i16 poison, !709, !DIExpression(), !711)
    #dbg_value(ptr %66, !703, !DIExpression(), !711)
    #dbg_value(i32 3, !710, !DIExpression(), !711)
  %70 = load i16, ptr %69, align 1, !dbg !711, !tbaa !735
    #dbg_value(i16 %70, !709, !DIExpression(), !711)
    #dbg_value(i16 %70, !737, !DIExpression(), !742)
  %71 = icmp eq i16 %70, 129, !dbg !766
  %72 = icmp eq i16 %70, -22392, !dbg !767
  %73 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 3, i1 %71)
  %74 = or i1 %72, %73, !dbg !767
  br i1 %74, label %75, label %81, !dbg !768

75:                                               ; preds = %68
  %76 = getelementptr inbounds nuw i8, ptr %35, i64 30, !dbg !751
  %77 = icmp samesign ugt ptr %76, %32, !dbg !769
  br i1 %77, label %81, label %78, !dbg !770

78:                                               ; preds = %75
  %79 = getelementptr inbounds nuw i8, ptr %35, i64 28, !dbg !755
    #dbg_value(i16 poison, !709, !DIExpression(), !711)
    #dbg_value(ptr %76, !703, !DIExpression(), !711)
    #dbg_value(i32 4, !710, !DIExpression(), !711)
  %80 = load i16, ptr %79, align 1, !dbg !711, !tbaa !735
    #dbg_value(i16 %80, !709, !DIExpression(), !711)
  br label %81, !dbg !771

81:                                               ; preds = %78, %75, %68, %65, %58, %55, %48, %38, %45
  %82 = phi ptr [ %76, %78 ], [ %36, %38 ], [ %36, %45 ], [ %46, %48 ], [ %46, %55 ], [ %66, %75 ], [ %56, %58 ], [ %56, %65 ], [ %66, %68 ], !dbg !711
  %83 = phi i16 [ %80, %78 ], [ %40, %38 ], [ %40, %45 ], [ %50, %48 ], [ %50, %55 ], [ %70, %75 ], [ %60, %58 ], [ %60, %65 ], [ %70, %68 ], !dbg !711
    #dbg_value(ptr %82, !236, !DIExpression(), !719)
    #dbg_value(i16 %83, !235, !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value), !719)
  switch i16 %83, label %487 [
    i16 8, label %84
    i16 -8826, label %300
  ], !dbg !772

84:                                               ; preds = %81
    #dbg_value(ptr undef, !682, !DIExpression(), !692)
    #dbg_value(ptr %32, !688, !DIExpression(), !692)
    #dbg_value(ptr poison, !689, !DIExpression(), !692)
    #dbg_value(ptr %82, !690, !DIExpression(), !692)
  %85 = getelementptr inbounds nuw i8, ptr %82, i64 20, !dbg !773
  %86 = icmp ugt ptr %85, %32, !dbg !775
  br i1 %86, label %94, label %87, !dbg !776

87:                                               ; preds = %84
  %88 = load i8, ptr %82, align 4, !dbg !777
  %89 = shl i8 %88, 2, !dbg !778
  %90 = and i8 %89, 60, !dbg !778
  %91 = zext nneg i8 %90 to i64, !dbg !779
    #dbg_value(i64 %91, !691, !DIExpression(), !692)
  %92 = getelementptr inbounds nuw i8, ptr %82, i64 %91, !dbg !779
  %93 = icmp ugt ptr %92, %32, !dbg !781
  br i1 %93, label %94, label %95, !dbg !782

94:                                               ; preds = %87, %84
    #dbg_value(ptr null, !256, !DIExpression(), !719)
    #dbg_value(ptr %82, !236, !DIExpression(), !719)
    #dbg_value(i32 -1, !328, !DIExpression(), !714)
  call void @llvm.lifetime.start.p0(ptr nonnull %25) #5, !dbg !783
    #dbg_assign(i32 32, !331, !DIExpression(DW_OP_LLVM_fragment, 0, 32), !784, ptr %25, !DIExpression(), !714)
  call void @llvm.lifetime.start.p0(ptr nonnull %26) #5, !dbg !785
    #dbg_assign(i32 32, !332, !DIExpression(DW_OP_LLVM_fragment, 0, 32), !786, ptr %26, !DIExpression(), !714)
  br label %297, !dbg !787

95:                                               ; preds = %87
    #dbg_value(ptr %92, !236, !DIExpression(), !719)
    #dbg_value(ptr %82, !256, !DIExpression(), !719)
  %96 = getelementptr inbounds nuw i8, ptr %82, i64 9, !dbg !788
  %97 = load i8, ptr %96, align 1, !dbg !789, !tbaa !790
    #dbg_value(i8 %97, !328, !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value), !714)
  call void @llvm.lifetime.start.p0(ptr nonnull %25) #5, !dbg !783
  store i32 32, ptr %25, align 4, !dbg !792, !tbaa !793, !DIAssignID !784
    #dbg_assign(i32 32, !331, !DIExpression(DW_OP_LLVM_fragment, 0, 32), !784, ptr %25, !DIExpression(), !714)
  call void @llvm.lifetime.start.p0(ptr nonnull %26) #5, !dbg !785
  store i32 32, ptr %26, align 4, !dbg !795, !tbaa !793, !DIAssignID !786
    #dbg_assign(i32 32, !332, !DIExpression(DW_OP_LLVM_fragment, 0, 32), !786, ptr %26, !DIExpression(), !714)
  %98 = getelementptr inbounds nuw i8, ptr %25, i64 4, !dbg !796
  %99 = getelementptr inbounds nuw i8, ptr %82, i64 12, !dbg !799
  %100 = load i32, ptr %99, align 4, !dbg !800
  store i32 %100, ptr %98, align 4, !dbg !800, !DIAssignID !801
    #dbg_assign(i1 poison, !331, !DIExpression(DW_OP_LLVM_fragment, 32, 32), !801, ptr %98, !DIExpression(), !714)
  %101 = getelementptr inbounds nuw i8, ptr %26, i64 4, !dbg !802
  %102 = getelementptr inbounds nuw i8, ptr %82, i64 16, !dbg !803
  %103 = load i32, ptr %102, align 4, !dbg !804
  store i32 %103, ptr %101, align 4, !dbg !804, !DIAssignID !805
    #dbg_assign(i1 poison, !332, !DIExpression(DW_OP_LLVM_fragment, 32, 32), !805, ptr %101, !DIExpression(), !714)
    #dbg_value(ptr %25, !806, !DIExpression(), !810)
    #dbg_value(ptr null, !809, !DIExpression(), !810)
  %104 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @ipv4_bans, ptr noundef nonnull %25) #5, !dbg !813
    #dbg_value(ptr %104, !809, !DIExpression(), !810)
  %105 = icmp eq ptr %104, null, !dbg !814
  br i1 %105, label %109, label %106, !dbg !816

106:                                              ; preds = %95
  %107 = load i8, ptr %104, align 1, !dbg !817, !tbaa !818
  %108 = icmp eq i8 %107, 0, !dbg !819
  br i1 %108, label %109, label %298, !dbg !820

109:                                              ; preds = %106, %95
    #dbg_value(ptr %26, !806, !DIExpression(), !821)
    #dbg_value(ptr null, !809, !DIExpression(), !821)
  %110 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @ipv4_bans, ptr noundef nonnull %26) #5, !dbg !824
    #dbg_value(ptr %110, !809, !DIExpression(), !821)
  %111 = icmp eq ptr %110, null, !dbg !825
  br i1 %111, label %115, label %112, !dbg !826

112:                                              ; preds = %109
  %113 = load i8, ptr %110, align 1, !dbg !827, !tbaa !818
  %114 = icmp eq i8 %113, 0, !dbg !828
  br i1 %114, label %115, label %298, !dbg !829

115:                                              ; preds = %112, %109
  switch i8 %97, label %297 [
    i8 17, label %116
    i8 6, label %212
    i8 1, label %288
  ], !dbg !787

116:                                              ; preds = %115
    #dbg_value(ptr null, !333, !DIExpression(), !830)
    #dbg_value(ptr undef, !668, !DIExpression(), !678)
    #dbg_value(ptr %32, !674, !DIExpression(), !678)
    #dbg_value(ptr poison, !675, !DIExpression(), !678)
    #dbg_value(ptr %92, !677, !DIExpression(), !678)
  %117 = getelementptr inbounds nuw i8, ptr %92, i64 8, !dbg !831
  %118 = icmp ugt ptr %117, %32, !dbg !833
  br i1 %118, label %298, label %119, !dbg !834

119:                                              ; preds = %116
    #dbg_value(ptr %117, !236, !DIExpression(), !719)
    #dbg_value(ptr %92, !333, !DIExpression(), !830)
  %120 = getelementptr inbounds nuw i8, ptr %92, i64 4, !dbg !835
  %121 = load i16, ptr %120, align 2, !dbg !835, !tbaa !836
  %122 = call i16 @llvm.bswap.i16(i16 %121), !dbg !838
    #dbg_value(i16 %122, !676, !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_constu, 8, DW_OP_minus, DW_OP_stack_value), !678)
  %123 = icmp ult i16 %122, 8, !dbg !839
  br i1 %123, label %298, label %124, !dbg !841

124:                                              ; preds = %119
    #dbg_value(i16 %122, !676, !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_constu, 8, DW_OP_minus, DW_OP_stack_value), !678)
    #dbg_value(i16 %122, !676, !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_constu, 8, DW_OP_minus, DW_OP_stack_value), !678)
    #dbg_value(ptr %92, !333, !DIExpression(), !830)
    #dbg_value(ptr %117, !236, !DIExpression(), !719)
    #dbg_value(i16 %122, !344, !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_constu, 8, DW_OP_minus, DW_OP_stack_value), !830)
  %125 = load i16, ptr %92, align 2, !dbg !842, !tbaa !843
    #dbg_value(i16 %125, !345, !DIExpression(), !830)
  call void @llvm.lifetime.start.p0(ptr nonnull %17)
    #dbg_assign(i1 poison, !844, !DIExpression(), !564, ptr %17, !DIExpression(), !850)
  store i16 %125, ptr %17, align 2, !tbaa !735, !DIAssignID !853
    #dbg_assign(i16 %125, !844, !DIExpression(), !853, ptr %17, !DIExpression(), !850)
    #dbg_value(ptr null, !849, !DIExpression(), !850)
  %126 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @port_bans, ptr noundef nonnull %17) #5, !dbg !854
    #dbg_value(ptr %126, !849, !DIExpression(), !850)
  %127 = icmp eq ptr %126, null, !dbg !855
  br i1 %127, label %132, label %128, !dbg !857

128:                                              ; preds = %124
  %129 = load i8, ptr %126, align 1, !dbg !858, !tbaa !818
  %130 = icmp eq i8 %129, 0, !dbg !859
  br i1 %130, label %132, label %131, !dbg !860

131:                                              ; preds = %128
  call void @llvm.lifetime.end.p0(ptr nonnull %17), !dbg !861
  br label %298, !dbg !862

132:                                              ; preds = %128, %124
  call void @llvm.lifetime.end.p0(ptr nonnull %17), !dbg !863
  %133 = getelementptr inbounds nuw i8, ptr %92, i64 2, !dbg !864
  %134 = load i16, ptr %133, align 2, !dbg !865, !tbaa !866
    #dbg_value(i16 %134, !346, !DIExpression(), !830)
  call void @llvm.lifetime.start.p0(ptr nonnull %18)
    #dbg_assign(i1 poison, !844, !DIExpression(), !565, ptr %18, !DIExpression(), !867)
  store i16 %134, ptr %18, align 2, !tbaa !735, !DIAssignID !870
    #dbg_assign(i16 %134, !844, !DIExpression(), !870, ptr %18, !DIExpression(), !867)
    #dbg_value(ptr null, !849, !DIExpression(), !867)
  %135 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @port_bans, ptr noundef nonnull %18) #5, !dbg !871
    #dbg_value(ptr %135, !849, !DIExpression(), !867)
  %136 = icmp eq ptr %135, null, !dbg !872
  br i1 %136, label %141, label %137, !dbg !873

137:                                              ; preds = %132
  %138 = load i8, ptr %135, align 1, !dbg !874, !tbaa !818
  %139 = icmp eq i8 %138, 0, !dbg !875
  br i1 %139, label %141, label %140, !dbg !876

140:                                              ; preds = %137
  call void @llvm.lifetime.end.p0(ptr nonnull %18), !dbg !877
  br label %298, !dbg !878

141:                                              ; preds = %137, %132
  call void @llvm.lifetime.end.p0(ptr nonnull %18), !dbg !879
    #dbg_assign(i1 poison, !554, !DIExpression(), !558, ptr %14, !DIExpression(), !555)
    #dbg_value(ptr %82, !551, !DIExpression(), !555)
    #dbg_value(i16 %125, !552, !DIExpression(), !555)
    #dbg_value(i16 %134, !553, !DIExpression(), !555)
  call void @llvm.lifetime.start.p0(ptr nonnull %13) #5, !dbg !880
  call void @llvm.lifetime.start.p0(ptr nonnull %14) #5, !dbg !881
  %142 = getelementptr inbounds nuw i8, ptr %13, i64 4, !dbg !882
  store i16 %125, ptr %142, align 4, !dbg !883, !tbaa !884, !DIAssignID !886
    #dbg_assign(i16 %125, !546, !DIExpression(DW_OP_LLVM_fragment, 32, 16), !886, ptr %142, !DIExpression(), !555)
  %143 = getelementptr inbounds nuw i8, ptr %14, i64 4, !dbg !887
  store i16 %134, ptr %143, align 4, !dbg !888, !tbaa !884, !DIAssignID !889
    #dbg_assign(i16 %134, !554, !DIExpression(DW_OP_LLVM_fragment, 32, 16), !889, ptr %143, !DIExpression(), !555)
  %144 = load i32, ptr %99, align 4, !dbg !890
  store i32 %144, ptr %13, align 4, !dbg !890, !DIAssignID !891
    #dbg_assign(i1 poison, !546, !DIExpression(DW_OP_LLVM_fragment, 0, 32), !891, ptr %13, !DIExpression(), !555)
  %145 = load i32, ptr %102, align 4, !dbg !892
  store i32 %145, ptr %14, align 4, !dbg !892, !DIAssignID !893
    #dbg_assign(i1 poison, !554, !DIExpression(DW_OP_LLVM_fragment, 0, 32), !893, ptr %14, !DIExpression(), !555)
    #dbg_value(ptr %13, !894, !DIExpression(), !900)
    #dbg_value(ptr null, !899, !DIExpression(), !900)
  %146 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @ipv4_sockets, ptr noundef nonnull %13) #5, !dbg !903
    #dbg_value(ptr %146, !899, !DIExpression(), !900)
  %147 = icmp eq ptr %146, null, !dbg !904
  br i1 %147, label %151, label %148, !dbg !906

148:                                              ; preds = %141
  %149 = load i8, ptr %146, align 1, !dbg !907, !tbaa !818
  %150 = icmp eq i8 %149, 0, !dbg !908
  br i1 %150, label %151, label %157, !dbg !909

151:                                              ; preds = %148, %141
    #dbg_value(ptr %14, !894, !DIExpression(), !910)
    #dbg_value(ptr null, !899, !DIExpression(), !910)
  %152 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @ipv4_sockets, ptr noundef nonnull %14) #5, !dbg !913
    #dbg_value(ptr %152, !899, !DIExpression(), !910)
  %153 = icmp eq ptr %152, null, !dbg !914
  br i1 %153, label %158, label %154, !dbg !915

154:                                              ; preds = %151
  %155 = load i8, ptr %152, align 1, !dbg !916, !tbaa !818
  %156 = icmp eq i8 %155, 0, !dbg !917
  br i1 %156, label %158, label %157, !dbg !918

157:                                              ; preds = %154, %148
  call void @llvm.lifetime.end.p0(ptr nonnull %14) #5, !dbg !919
  call void @llvm.lifetime.end.p0(ptr nonnull %13) #5, !dbg !919
  br label %298, !dbg !920

158:                                              ; preds = %154, %151
  call void @llvm.lifetime.end.p0(ptr nonnull %14) #5, !dbg !919
  call void @llvm.lifetime.end.p0(ptr nonnull %13) #5, !dbg !919
  %159 = icmp eq i16 %125, 13568, !dbg !921
  %160 = icmp eq i16 %125, -5868
  %161 = call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %159)
  %162 = or i1 %160, %161, !dbg !922
  %163 = icmp eq i16 %134, 13568
  %164 = or i1 %163, %162, !dbg !922
  %165 = icmp eq i16 %134, -5868
  %166 = or i1 %165, %164, !dbg !922
  br i1 %166, label %167, label %297, !dbg !922

167:                                              ; preds = %158
    #dbg_value(ptr null, !347, !DIExpression(), !923)
    #dbg_value(ptr undef, !657, !DIExpression(), !666)
    #dbg_value(ptr %32, !663, !DIExpression(), !666)
    #dbg_value(ptr poison, !664, !DIExpression(), !666)
    #dbg_value(ptr %117, !665, !DIExpression(), !666)
  %168 = getelementptr inbounds nuw i8, ptr %92, i64 20, !dbg !924
  %169 = icmp ugt ptr %168, %32, !dbg !926
  br i1 %169, label %297, label %170, !dbg !927

170:                                              ; preds = %167
    #dbg_value(ptr %117, !347, !DIExpression(), !923)
    #dbg_value(ptr %168, !236, !DIExpression(), !719)
    #dbg_value(ptr undef, !641, !DIExpression(), !652)
    #dbg_value(ptr %32, !646, !DIExpression(), !652)
    #dbg_value(ptr %117, !647, !DIExpression(), !652)
  %171 = getelementptr inbounds nuw i8, ptr %92, i64 10, !dbg !928
  %172 = load i16, ptr %171, align 2, !dbg !928, !tbaa !929
    #dbg_value(i16 poison, !648, !DIExpression(), !652)
  %173 = and i16 %172, 128, !dbg !931
  %174 = icmp eq i16 %173, 0, !dbg !931
  br i1 %174, label %297, label %175, !dbg !933

175:                                              ; preds = %170
  %176 = getelementptr inbounds nuw i8, ptr %92, i64 12, !dbg !934
  %177 = load i16, ptr %176, align 2, !dbg !934, !tbaa !935
    #dbg_value(i16 poison, !649, !DIExpression(), !652)
  %178 = icmp eq i16 %177, 0, !dbg !936
  br i1 %178, label %297, label %182, !dbg !938

179:                                              ; preds = %194
  %180 = add nuw nsw i64 %183, 1, !dbg !939
    #dbg_value(i64 %180, !951, !DIExpression(), !956)
    #dbg_value(i64 0, !650, !DIExpression(), !652)
    #dbg_value(i64 %180, !951, !DIExpression(), !956)
    #dbg_value(i64 %201, !949, !DIExpression(), !957)
  %181 = icmp eq i64 %180, 128, !dbg !958
  br i1 %181, label %297, label %182, !dbg !959, !llvm.loop !960

182:                                              ; preds = %175, %179
  %183 = phi i64 [ %180, %179 ], [ 0, %175 ]
  %184 = phi i64 [ %201, %179 ], [ -3750763034362895579, %175 ]
    #dbg_value(i64 %183, !951, !DIExpression(), !956)
    #dbg_value(i64 %184, !949, !DIExpression(), !957)
  %185 = getelementptr inbounds nuw i8, ptr %168, i64 %183, !dbg !964
  %186 = getelementptr inbounds nuw i8, ptr %185, i64 1, !dbg !966
  %187 = icmp samesign ugt ptr %186, %32, !dbg !967
  br i1 %187, label %297, label %188, !dbg !968

188:                                              ; preds = %182
  %189 = load i8, ptr %185, align 1, !dbg !969, !tbaa !818
    #dbg_value(i8 %189, !952, !DIExpression(), !970)
  %190 = icmp ugt i8 %189, -65, !dbg !971
  br i1 %190, label %191, label %194, !dbg !973

191:                                              ; preds = %188
  %192 = getelementptr inbounds nuw i8, ptr %185, i64 2, !dbg !974
  %193 = icmp ugt ptr %192, %32, !dbg !977
  br i1 %193, label %297, label %203, !dbg !978

194:                                              ; preds = %188
    #dbg_value(i8 %189, !954, !DIExpression(), !970)
  %195 = add i8 %189, -65, !dbg !979
  %196 = icmp ult i8 %195, 26, !dbg !979
  %197 = or disjoint i8 %189, 32, !dbg !979
  %198 = select i1 %196, i8 %197, i8 %189, !dbg !979
    #dbg_value(i8 %198, !954, !DIExpression(), !970)
  %199 = zext i8 %198 to i64, !dbg !981
  %200 = xor i64 %184, %199, !dbg !982
    #dbg_value(i64 %200, !949, !DIExpression(), !957)
  %201 = mul i64 %200, 1099511628211, !dbg !983
    #dbg_value(i64 %201, !949, !DIExpression(), !957)
  %202 = icmp eq i8 %189, 0, !dbg !984
    #dbg_value(i64 0, !650, !DIExpression(), !652)
    #dbg_value(i64 %201, !949, !DIExpression(), !957)
    #dbg_value(i64 %183, !951, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !956)
  br i1 %202, label %203, label %179, !dbg !986

203:                                              ; preds = %194, %191
  %204 = phi i64 [ 0, %191 ], [ %201, %194 ], !dbg !987
    #dbg_value(i64 %204, !650, !DIExpression(), !652)
    #dbg_value(ptr poison, !651, !DIExpression(), !652)
  call void @llvm.lifetime.start.p0(ptr nonnull %2)
    #dbg_assign(i1 poison, !988, !DIExpression(), !478, ptr %2, !DIExpression(), !994)
  store i64 %204, ptr %2, align 8, !tbaa !996, !DIAssignID !998
    #dbg_assign(i64 %204, !988, !DIExpression(), !998, ptr %2, !DIExpression(), !994)
    #dbg_value(ptr null, !993, !DIExpression(), !994)
  %205 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @domain_bans, ptr noundef nonnull %2) #5, !dbg !999
    #dbg_value(ptr %205, !993, !DIExpression(), !994)
  %206 = icmp eq ptr %205, null, !dbg !1000
  br i1 %206, label %210, label %207, !dbg !1002

207:                                              ; preds = %203
  %208 = load i8, ptr %205, align 1, !dbg !1003, !tbaa !818
  %209 = icmp eq i8 %208, 0, !dbg !1004
  br i1 %209, label %210, label %211, !dbg !1005

210:                                              ; preds = %203, %207
  call void @llvm.lifetime.end.p0(ptr nonnull %2), !dbg !1006
  br label %297, !dbg !1007

211:                                              ; preds = %207
  call void @llvm.lifetime.end.p0(ptr nonnull %2), !dbg !1008
  br label %298

212:                                              ; preds = %115
    #dbg_value(ptr null, !359, !DIExpression(), !1009)
    #dbg_value(ptr undef, !627, !DIExpression(), !637)
    #dbg_value(ptr %32, !633, !DIExpression(), !637)
    #dbg_value(ptr poison, !634, !DIExpression(), !637)
    #dbg_value(ptr %92, !636, !DIExpression(), !637)
  %213 = getelementptr inbounds nuw i8, ptr %92, i64 20, !dbg !1010
  %214 = icmp ugt ptr %213, %32, !dbg !1012
  br i1 %214, label %298, label %215, !dbg !1013

215:                                              ; preds = %212
  %216 = getelementptr inbounds nuw i8, ptr %92, i64 12, !dbg !1014
  %217 = load i16, ptr %216, align 4, !dbg !1014
  %218 = lshr i16 %217, 2, !dbg !1015
  %219 = and i16 %218, 60, !dbg !1015
    #dbg_value(i16 %219, !635, !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value), !637)
  %220 = icmp samesign ult i16 %219, 20, !dbg !1016
  %221 = zext nneg i16 %219 to i64
  %222 = getelementptr inbounds nuw i8, ptr %92, i64 %221
  %223 = icmp ugt ptr %222, %32
  %224 = select i1 %220, i1 true, i1 %223, !dbg !1018
  br i1 %224, label %298, label %225, !dbg !1018

225:                                              ; preds = %215
    #dbg_value(ptr poison, !236, !DIExpression(), !719)
    #dbg_value(ptr %92, !359, !DIExpression(), !1009)
    #dbg_value(i16 %219, !384, !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value), !1009)
    #dbg_value(ptr %92, !1019, !DIExpression(), !1024)
  %226 = and i16 %217, -256, !dbg !1026
  switch i16 %226, label %231 [
    i16 256, label %298
    i16 5120, label %227
  ], !dbg !1026

227:                                              ; preds = %225
  %228 = getelementptr inbounds nuw i8, ptr %92, i64 14, !dbg !1028
  %229 = load i16, ptr %228, align 2, !dbg !1028, !tbaa !1030
  %230 = icmp eq i16 %229, 0, !dbg !1032
  br i1 %230, label %298, label %231, !dbg !1033

231:                                              ; preds = %225, %227
    #dbg_value(ptr %92, !1034, !DIExpression(), !1037)
  %232 = and i16 %217, -8448, !dbg !1039
  %233 = icmp eq i16 %232, 512, !dbg !1039
  br i1 %233, label %234, label %253, !dbg !1039

234:                                              ; preds = %231
  %235 = getelementptr inbounds nuw i8, ptr %92, i64 14, !dbg !1041
  %236 = load i16, ptr %235, align 2, !dbg !1041, !tbaa !1030
  %237 = icmp eq i16 %236, -1296, !dbg !1042
  br i1 %237, label %238, label %253, !dbg !1043

238:                                              ; preds = %234
    #dbg_assign(i1 poison, !535, !DIExpression(), !544, ptr %12, !DIExpression(), !1044)
    #dbg_value(ptr %25, !530, !DIExpression(), !1045)
    #dbg_value(ptr null, !531, !DIExpression(), !1045)
  %239 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @ipv4_warnings, ptr noundef nonnull %25) #5, !dbg !1046
    #dbg_value(ptr %239, !531, !DIExpression(), !1045)
  %240 = icmp eq ptr %239, null, !dbg !1047
  br i1 %240, label %251, label %241, !dbg !1048

241:                                              ; preds = %238
  call void @llvm.lifetime.start.p0(ptr nonnull %10) #5, !dbg !1049
    #dbg_assign(i8 0, !523, !DIExpression(), !1050, ptr %10, !DIExpression(), !537)
  %242 = load i8, ptr %239, align 1, !dbg !1051, !tbaa !818
  %243 = add i8 %242, 1, !dbg !1052
  store i8 %243, ptr %10, align 1, !dbg !1053, !tbaa !818, !DIAssignID !1054
    #dbg_assign(i8 %243, !523, !DIExpression(), !1054, ptr %10, !DIExpression(), !537)
  %244 = call i64 inttoptr (i64 2 to ptr)(ptr noundef nonnull @ipv4_warnings, ptr noundef nonnull %25, ptr noundef nonnull %10, i64 noundef 0) #5, !dbg !1055
  %245 = load i8, ptr %10, align 1, !dbg !1056, !tbaa !818
  %246 = icmp ugt i8 %245, 16, !dbg !1057
  br i1 %246, label %247, label %250, !dbg !1058

247:                                              ; preds = %241
  call void @llvm.lifetime.start.p0(ptr nonnull %11) #5, !dbg !1059
  store i8 1, ptr %11, align 1, !dbg !1060, !tbaa !818, !DIAssignID !1061
    #dbg_assign(i8 1, !532, !DIExpression(), !1061, ptr %11, !DIExpression(), !543)
  %248 = call i64 inttoptr (i64 2 to ptr)(ptr noundef nonnull @ipv4_bans, ptr noundef nonnull %25, ptr noundef nonnull %11, i64 noundef 0) #5, !dbg !1062
  %249 = call i64 inttoptr (i64 3 to ptr)(ptr noundef nonnull @ipv4_warnings, ptr noundef nonnull %25) #5, !dbg !1063
  call void @llvm.lifetime.end.p0(ptr nonnull %11) #5, !dbg !1064
  br label %250, !dbg !1065

250:                                              ; preds = %247, %241
  call void @llvm.lifetime.end.p0(ptr nonnull %10) #5, !dbg !1066
  br label %253, !dbg !1067

251:                                              ; preds = %238
  call void @llvm.lifetime.start.p0(ptr nonnull %12) #5, !dbg !1068
  store i8 1, ptr %12, align 1, !dbg !1069, !tbaa !818, !DIAssignID !1070
    #dbg_assign(i8 1, !535, !DIExpression(), !1070, ptr %12, !DIExpression(), !1044)
  %252 = call i64 inttoptr (i64 2 to ptr)(ptr noundef nonnull @ipv4_warnings, ptr noundef nonnull %25, ptr noundef nonnull %12, i64 noundef 0) #5, !dbg !1071
  call void @llvm.lifetime.end.p0(ptr nonnull %12) #5, !dbg !1072
  br label %253

253:                                              ; preds = %251, %250, %234, %231
  %254 = load i16, ptr %92, align 4, !dbg !1073, !tbaa !1074
    #dbg_value(i16 %254, !385, !DIExpression(), !1009)
  call void @llvm.lifetime.start.p0(ptr nonnull %19)
    #dbg_assign(i1 poison, !844, !DIExpression(), !566, ptr %19, !DIExpression(), !1075)
  store i16 %254, ptr %19, align 2, !tbaa !735, !DIAssignID !1078
    #dbg_assign(i16 %254, !844, !DIExpression(), !1078, ptr %19, !DIExpression(), !1075)
    #dbg_value(ptr null, !849, !DIExpression(), !1075)
  %255 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @port_bans, ptr noundef nonnull %19) #5, !dbg !1079
    #dbg_value(ptr %255, !849, !DIExpression(), !1075)
  %256 = icmp eq ptr %255, null, !dbg !1080
  br i1 %256, label %261, label %257, !dbg !1081

257:                                              ; preds = %253
  %258 = load i8, ptr %255, align 1, !dbg !1082, !tbaa !818
  %259 = icmp eq i8 %258, 0, !dbg !1083
  br i1 %259, label %261, label %260, !dbg !1084

260:                                              ; preds = %257
  call void @llvm.lifetime.end.p0(ptr nonnull %19), !dbg !1085
  br label %298, !dbg !1086

261:                                              ; preds = %257, %253
  call void @llvm.lifetime.end.p0(ptr nonnull %19), !dbg !1087
  %262 = getelementptr inbounds nuw i8, ptr %92, i64 2, !dbg !1088
  %263 = load i16, ptr %262, align 2, !dbg !1089, !tbaa !1090
    #dbg_value(i16 %263, !386, !DIExpression(), !1009)
  call void @llvm.lifetime.start.p0(ptr nonnull %20)
    #dbg_assign(i1 poison, !844, !DIExpression(), !567, ptr %20, !DIExpression(), !1091)
  store i16 %263, ptr %20, align 2, !tbaa !735, !DIAssignID !1094
    #dbg_assign(i16 %263, !844, !DIExpression(), !1094, ptr %20, !DIExpression(), !1091)
    #dbg_value(ptr null, !849, !DIExpression(), !1091)
  %264 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @port_bans, ptr noundef nonnull %20) #5, !dbg !1095
    #dbg_value(ptr %264, !849, !DIExpression(), !1091)
  %265 = icmp eq ptr %264, null, !dbg !1096
  br i1 %265, label %270, label %266, !dbg !1097

266:                                              ; preds = %261
  %267 = load i8, ptr %264, align 1, !dbg !1098, !tbaa !818
  %268 = icmp eq i8 %267, 0, !dbg !1099
  br i1 %268, label %270, label %269, !dbg !1100

269:                                              ; preds = %266
  call void @llvm.lifetime.end.p0(ptr nonnull %20), !dbg !1101
  br label %298, !dbg !1102

270:                                              ; preds = %266, %261
  call void @llvm.lifetime.end.p0(ptr nonnull %20), !dbg !1103
    #dbg_assign(i1 poison, !554, !DIExpression(), !563, ptr %16, !DIExpression(), !560)
    #dbg_value(ptr %82, !551, !DIExpression(), !560)
    #dbg_value(i16 %254, !552, !DIExpression(), !560)
    #dbg_value(i16 %263, !553, !DIExpression(), !560)
  call void @llvm.lifetime.start.p0(ptr nonnull %15) #5, !dbg !1104
  call void @llvm.lifetime.start.p0(ptr nonnull %16) #5, !dbg !1105
  %271 = getelementptr inbounds nuw i8, ptr %15, i64 4, !dbg !1106
  store i16 %254, ptr %271, align 4, !dbg !1107, !tbaa !884, !DIAssignID !1108
    #dbg_assign(i16 %254, !546, !DIExpression(DW_OP_LLVM_fragment, 32, 16), !1108, ptr %271, !DIExpression(), !560)
  %272 = getelementptr inbounds nuw i8, ptr %16, i64 4, !dbg !1109
  store i16 %263, ptr %272, align 4, !dbg !1110, !tbaa !884, !DIAssignID !1111
    #dbg_assign(i16 %263, !554, !DIExpression(DW_OP_LLVM_fragment, 32, 16), !1111, ptr %272, !DIExpression(), !560)
  %273 = load i32, ptr %99, align 4, !dbg !1112
  store i32 %273, ptr %15, align 4, !dbg !1112, !DIAssignID !1113
    #dbg_assign(i1 poison, !546, !DIExpression(DW_OP_LLVM_fragment, 0, 32), !1113, ptr %15, !DIExpression(), !560)
  %274 = load i32, ptr %102, align 4, !dbg !1114
  store i32 %274, ptr %16, align 4, !dbg !1114, !DIAssignID !1115
    #dbg_assign(i1 poison, !554, !DIExpression(DW_OP_LLVM_fragment, 0, 32), !1115, ptr %16, !DIExpression(), !560)
    #dbg_value(ptr %15, !894, !DIExpression(), !1116)
    #dbg_value(ptr null, !899, !DIExpression(), !1116)
  %275 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @ipv4_sockets, ptr noundef nonnull %15) #5, !dbg !1118
    #dbg_value(ptr %275, !899, !DIExpression(), !1116)
  %276 = icmp eq ptr %275, null, !dbg !1119
  br i1 %276, label %280, label %277, !dbg !1120

277:                                              ; preds = %270
  %278 = load i8, ptr %275, align 1, !dbg !1121, !tbaa !818
  %279 = icmp eq i8 %278, 0, !dbg !1122
  br i1 %279, label %280, label %286, !dbg !1123

280:                                              ; preds = %277, %270
    #dbg_value(ptr %16, !894, !DIExpression(), !1124)
    #dbg_value(ptr null, !899, !DIExpression(), !1124)
  %281 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @ipv4_sockets, ptr noundef nonnull %16) #5, !dbg !1126
    #dbg_value(ptr %281, !899, !DIExpression(), !1124)
  %282 = icmp eq ptr %281, null, !dbg !1127
  br i1 %282, label %287, label %283, !dbg !1128

283:                                              ; preds = %280
  %284 = load i8, ptr %281, align 1, !dbg !1129, !tbaa !818
  %285 = icmp eq i8 %284, 0, !dbg !1130
  br i1 %285, label %287, label %286, !dbg !1131

286:                                              ; preds = %277, %283
  call void @llvm.lifetime.end.p0(ptr nonnull %16) #5, !dbg !1132
  call void @llvm.lifetime.end.p0(ptr nonnull %15) #5, !dbg !1132
  br label %298, !dbg !1133

287:                                              ; preds = %283, %280
  call void @llvm.lifetime.end.p0(ptr nonnull %16) #5, !dbg !1132
  call void @llvm.lifetime.end.p0(ptr nonnull %15) #5, !dbg !1132
  br label %297

288:                                              ; preds = %115
    #dbg_value(ptr null, !387, !DIExpression(), !1134)
    #dbg_value(ptr undef, !614, !DIExpression(), !623)
    #dbg_value(ptr %32, !620, !DIExpression(), !623)
    #dbg_value(ptr poison, !621, !DIExpression(), !623)
    #dbg_value(ptr %92, !622, !DIExpression(), !623)
  %289 = getelementptr inbounds nuw i8, ptr %92, i64 8, !dbg !1135
  %290 = icmp ugt ptr %289, %32, !dbg !1137
  br i1 %290, label %297, label %291, !dbg !1138

291:                                              ; preds = %288
    #dbg_value(ptr %289, !236, !DIExpression(), !719)
    #dbg_value(ptr %92, !387, !DIExpression(), !1134)
    #dbg_value(ptr %92, !1139, !DIExpression(), !1145)
  %292 = load i8, ptr %92, align 4, !dbg !1148, !tbaa !1149
    #dbg_value(i8 %292, !1144, !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value), !1145)
  %293 = icmp eq i8 %292, 0, !dbg !1151
  %294 = call i1 @llvm.bpf.passthrough.i1.i1(i32 1, i1 %293)
  %295 = freeze i1 %294, !dbg !1153
  br i1 %295, label %297, label %296, !dbg !1153

296:                                              ; preds = %291
  switch i8 %292, label %298 [
    i8 12, label %297
    i8 11, label %297
    i8 8, label %297
    i8 5, label %297
    i8 3, label %297
  ], !dbg !1154

297:                                              ; preds = %179, %182, %191, %296, %296, %296, %296, %296, %291, %288, %170, %175, %287, %158, %210, %167, %94, %115
  br label %298, !dbg !1155

298:                                              ; preds = %225, %296, %227, %215, %212, %286, %269, %260, %119, %116, %157, %140, %211, %131, %112, %106, %297
  %299 = phi i32 [ 1, %106 ], [ 1, %296 ], [ 2, %297 ], [ 1, %112 ], [ 2, %119 ], [ 1, %131 ], [ 1, %227 ], [ 1, %211 ], [ 1, %157 ], [ 1, %140 ], [ 2, %116 ], [ 1, %286 ], [ 1, %260 ], [ 1, %269 ], [ 1, %225 ], [ 2, %212 ], [ 2, %215 ], !dbg !714
  call void @llvm.lifetime.end.p0(ptr nonnull %26) #5, !dbg !1156
  call void @llvm.lifetime.end.p0(ptr nonnull %25) #5, !dbg !1156
  br label %487

300:                                              ; preds = %81
    #dbg_value(ptr undef, !597, !DIExpression(), !613)
    #dbg_value(ptr %32, !598, !DIExpression(), !613)
    #dbg_value(ptr poison, !599, !DIExpression(), !613)
    #dbg_value(ptr %82, !600, !DIExpression(), !613)
  %301 = getelementptr inbounds nuw i8, ptr %82, i64 40, !dbg !1157
  %302 = icmp ugt ptr %301, %32, !dbg !1159
  br i1 %302, label %331, label %303, !dbg !1160

303:                                              ; preds = %300
    #dbg_value(ptr %301, !236, !DIExpression(), !719)
    #dbg_value(ptr %82, !287, !DIExpression(), !719)
    #dbg_value(ptr undef, !572, !DIExpression(), !590)
    #dbg_value(ptr %32, !578, !DIExpression(), !590)
    #dbg_value(i8 poison, !579, !DIExpression(), !590)
    #dbg_value(i32 0, !580, !DIExpression(), !1161)
  %304 = getelementptr inbounds nuw i8, ptr %82, i64 42
  %305 = icmp ugt ptr %304, %32
  br i1 %305, label %332, label %306, !dbg !1162

306:                                              ; preds = %303
  %307 = getelementptr inbounds nuw i8, ptr %82, i64 6, !dbg !1163
  br label %308, !dbg !1164

308:                                              ; preds = %306, %323
  %309 = phi ptr [ %311, %323 ], [ %307, %306 ]
  %310 = phi i32 [ %326, %323 ], [ 0, %306 ]
  %311 = phi ptr [ %325, %323 ], [ %301, %306 ]
  %312 = load i8, ptr %309, align 1, !dbg !1165, !tbaa !818
    #dbg_value(i32 %310, !580, !DIExpression(), !1161)
    #dbg_value(ptr %311, !236, !DIExpression(), !719)
  switch i8 %312, label %314 [
    i8 0, label %316
    i8 60, label %316
    i8 43, label %316
    i8 -121, label %316
    i8 51, label %313
    i8 44, label %323
  ], !dbg !1166

313:                                              ; preds = %308
    #dbg_value(ptr %325, !236, !DIExpression(), !719)
    #dbg_value(i8 poison, !579, !DIExpression(), !590)
  br label %316, !dbg !1167

314:                                              ; preds = %308
  %315 = zext i8 %312 to i32, !dbg !1169
  br label %332, !dbg !1170

316:                                              ; preds = %308, %308, %308, %308, %313
  %317 = phi i64 [ 2, %313 ], [ 3, %308 ], [ 3, %308 ], [ 3, %308 ], [ 3, %308 ]
  %318 = getelementptr inbounds nuw i8, ptr %311, i64 1, !dbg !1171
  %319 = load i8, ptr %318, align 1, !dbg !1171, !tbaa !1172
  %320 = zext i8 %319 to i64, !dbg !1171
  %321 = shl nuw nsw i64 %320, %317, !dbg !1171
  %322 = getelementptr inbounds nuw i8, ptr %311, i64 %321, !dbg !1171
  br label %323, !dbg !1171

323:                                              ; preds = %316, %308
  %324 = phi ptr [ %311, %308 ], [ %322, %316 ]
  %325 = getelementptr inbounds nuw i8, ptr %324, i64 8, !dbg !1171
    #dbg_value(ptr %325, !236, !DIExpression(), !719)
    #dbg_value(i8 poison, !579, !DIExpression(), !590)
  %326 = add nuw nsw i32 %310, 1, !dbg !1174
    #dbg_value(i32 %326, !580, !DIExpression(), !1161)
    #dbg_value(i8 poison, !579, !DIExpression(), !590)
  %327 = icmp samesign ugt i32 %310, 4, !dbg !1175
    #dbg_value(ptr %325, !582, !DIExpression(), !1176)
  %328 = getelementptr inbounds nuw i8, ptr %324, i64 10
  %329 = icmp ugt ptr %328, %32
  %330 = select i1 %327, i1 true, i1 %329, !dbg !1177
  br i1 %330, label %332, label %308, !dbg !1177, !llvm.loop !1178

331:                                              ; preds = %300
    #dbg_value(ptr null, !287, !DIExpression(), !719)
    #dbg_value(ptr %82, !236, !DIExpression(), !719)
    #dbg_value(i32 -1, !413, !DIExpression(), !717)
  call void @llvm.lifetime.start.p0(ptr nonnull %27) #5, !dbg !1180
    #dbg_assign(i32 128, !416, !DIExpression(DW_OP_LLVM_fragment, 0, 32), !1181, ptr %27, !DIExpression(), !717)
  call void @llvm.lifetime.start.p0(ptr nonnull %28) #5, !dbg !1182
    #dbg_assign(i32 128, !417, !DIExpression(DW_OP_LLVM_fragment, 0, 32), !1183, ptr %28, !DIExpression(), !717)
  br label %486, !dbg !1184

332:                                              ; preds = %323, %303, %314
  %333 = phi ptr [ %311, %314 ], [ %301, %303 ], [ %325, %323 ]
  %334 = phi i32 [ %315, %314 ], [ -1, %303 ], [ -1, %323 ]
    #dbg_value(ptr %82, !287, !DIExpression(), !719)
    #dbg_value(ptr %333, !236, !DIExpression(), !719)
    #dbg_value(i32 %334, !413, !DIExpression(), !717)
  call void @llvm.lifetime.start.p0(ptr nonnull %27) #5, !dbg !1180
  store i32 128, ptr %27, align 4, !dbg !1185, !tbaa !1186, !DIAssignID !1181
    #dbg_assign(i32 128, !416, !DIExpression(DW_OP_LLVM_fragment, 0, 32), !1181, ptr %27, !DIExpression(), !717)
  call void @llvm.lifetime.start.p0(ptr nonnull %28) #5, !dbg !1182
  store i32 128, ptr %28, align 4, !dbg !1188, !tbaa !1186, !DIAssignID !1183
    #dbg_assign(i32 128, !417, !DIExpression(DW_OP_LLVM_fragment, 0, 32), !1183, ptr %28, !DIExpression(), !717)
  %335 = getelementptr inbounds nuw i8, ptr %27, i64 4, !dbg !1189
  %336 = getelementptr inbounds nuw i8, ptr %82, i64 8, !dbg !1190
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 4 dereferenceable(16) %335, ptr noundef nonnull align 4 dereferenceable(16) %336, i64 16, i1 false), !dbg !1191, !DIAssignID !1192
    #dbg_assign(i1 poison, !416, !DIExpression(DW_OP_LLVM_fragment, 32, 128), !1192, ptr %335, !DIExpression(), !717)
  %337 = getelementptr inbounds nuw i8, ptr %28, i64 4, !dbg !1193
  %338 = getelementptr inbounds nuw i8, ptr %82, i64 24, !dbg !1194
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 4 dereferenceable(16) %337, ptr noundef nonnull align 4 dereferenceable(16) %338, i64 16, i1 false), !dbg !1195, !DIAssignID !1196
    #dbg_assign(i1 poison, !417, !DIExpression(DW_OP_LLVM_fragment, 32, 128), !1196, ptr %337, !DIExpression(), !717)
    #dbg_value(ptr %27, !1197, !DIExpression(), !1201)
    #dbg_value(ptr null, !1200, !DIExpression(), !1201)
  %339 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @ipv6_bans, ptr noundef nonnull %27) #5, !dbg !1204
    #dbg_value(ptr %339, !1200, !DIExpression(), !1201)
  %340 = icmp eq ptr %339, null, !dbg !1205
  br i1 %340, label %344, label %341, !dbg !1207

341:                                              ; preds = %332
  %342 = load i8, ptr %339, align 1, !dbg !1208, !tbaa !818
  %343 = icmp eq i8 %342, 0, !dbg !1209
  br i1 %343, label %344, label %484, !dbg !1210

344:                                              ; preds = %341, %332
    #dbg_value(ptr %28, !1197, !DIExpression(), !1211)
    #dbg_value(ptr null, !1200, !DIExpression(), !1211)
  %345 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @ipv6_bans, ptr noundef nonnull %28) #5, !dbg !1214
    #dbg_value(ptr %345, !1200, !DIExpression(), !1211)
  %346 = icmp eq ptr %345, null, !dbg !1215
  br i1 %346, label %350, label %347, !dbg !1216

347:                                              ; preds = %344
  %348 = load i8, ptr %345, align 1, !dbg !1217, !tbaa !818
  %349 = icmp eq i8 %348, 0, !dbg !1218
  br i1 %349, label %350, label %484, !dbg !1219

350:                                              ; preds = %347, %344
  switch i32 %334, label %486 [
    i32 17, label %351
    i32 6, label %392
    i32 1, label %466
    i32 58, label %475
  ], !dbg !1220

351:                                              ; preds = %350
    #dbg_value(ptr null, !418, !DIExpression(), !1221)
    #dbg_value(ptr undef, !668, !DIExpression(), !680)
    #dbg_value(ptr %32, !674, !DIExpression(), !680)
    #dbg_value(ptr poison, !675, !DIExpression(), !680)
    #dbg_value(ptr %333, !677, !DIExpression(), !680)
  %352 = getelementptr inbounds nuw i8, ptr %333, i64 8, !dbg !1222
  %353 = icmp ugt ptr %352, %32, !dbg !1223
  br i1 %353, label %484, label %354, !dbg !1224

354:                                              ; preds = %351
    #dbg_value(ptr %352, !236, !DIExpression(), !719)
    #dbg_value(ptr %333, !418, !DIExpression(), !1221)
  %355 = getelementptr inbounds nuw i8, ptr %333, i64 4, !dbg !1225
  %356 = load i16, ptr %355, align 2, !dbg !1225, !tbaa !836
  %357 = call i16 @llvm.bswap.i16(i16 %356), !dbg !1226
    #dbg_value(i16 %357, !676, !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_constu, 8, DW_OP_minus, DW_OP_stack_value), !680)
  %358 = icmp ult i16 %357, 8, !dbg !1227
  br i1 %358, label %484, label %359, !dbg !1228

359:                                              ; preds = %354
    #dbg_value(i16 %357, !676, !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_constu, 8, DW_OP_minus, DW_OP_stack_value), !680)
    #dbg_value(i16 %357, !676, !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_constu, 8, DW_OP_minus, DW_OP_stack_value), !680)
    #dbg_value(ptr %333, !418, !DIExpression(), !1221)
    #dbg_value(i16 %357, !423, !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_constu, 8, DW_OP_minus, DW_OP_stack_value), !1221)
  %360 = load i16, ptr %333, align 2, !dbg !1229, !tbaa !843
    #dbg_value(i16 %360, !424, !DIExpression(), !1221)
  call void @llvm.lifetime.start.p0(ptr nonnull %21)
    #dbg_assign(i1 poison, !844, !DIExpression(), !568, ptr %21, !DIExpression(), !1230)
  store i16 %360, ptr %21, align 2, !tbaa !735, !DIAssignID !1233
    #dbg_assign(i16 %360, !844, !DIExpression(), !1233, ptr %21, !DIExpression(), !1230)
    #dbg_value(ptr null, !849, !DIExpression(), !1230)
  %361 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @port_bans, ptr noundef nonnull %21) #5, !dbg !1234
    #dbg_value(ptr %361, !849, !DIExpression(), !1230)
  %362 = icmp eq ptr %361, null, !dbg !1235
  br i1 %362, label %367, label %363, !dbg !1236

363:                                              ; preds = %359
  %364 = load i8, ptr %361, align 1, !dbg !1237, !tbaa !818
  %365 = icmp eq i8 %364, 0, !dbg !1238
  br i1 %365, label %367, label %366, !dbg !1239

366:                                              ; preds = %363
  call void @llvm.lifetime.end.p0(ptr nonnull %21), !dbg !1240
  br label %484, !dbg !1241

367:                                              ; preds = %363, %359
  call void @llvm.lifetime.end.p0(ptr nonnull %21), !dbg !1242
  %368 = getelementptr inbounds nuw i8, ptr %333, i64 2, !dbg !1243
  %369 = load i16, ptr %368, align 2, !dbg !1244, !tbaa !866
    #dbg_value(i16 %369, !425, !DIExpression(), !1221)
  call void @llvm.lifetime.start.p0(ptr nonnull %22)
    #dbg_assign(i1 poison, !844, !DIExpression(), !569, ptr %22, !DIExpression(), !1245)
  store i16 %369, ptr %22, align 2, !tbaa !735, !DIAssignID !1248
    #dbg_assign(i16 %369, !844, !DIExpression(), !1248, ptr %22, !DIExpression(), !1245)
    #dbg_value(ptr null, !849, !DIExpression(), !1245)
  %370 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @port_bans, ptr noundef nonnull %22) #5, !dbg !1249
    #dbg_value(ptr %370, !849, !DIExpression(), !1245)
  %371 = icmp eq ptr %370, null, !dbg !1250
  br i1 %371, label %376, label %372, !dbg !1251

372:                                              ; preds = %367
  %373 = load i8, ptr %370, align 1, !dbg !1252, !tbaa !818
  %374 = icmp eq i8 %373, 0, !dbg !1253
  br i1 %374, label %376, label %375, !dbg !1254

375:                                              ; preds = %372
  call void @llvm.lifetime.end.p0(ptr nonnull %22), !dbg !1255
  br label %484, !dbg !1256

376:                                              ; preds = %372, %367
  call void @llvm.lifetime.end.p0(ptr nonnull %22), !dbg !1257
    #dbg_assign(i1 poison, !512, !DIExpression(), !516, ptr %7, !DIExpression(), !513)
    #dbg_value(ptr poison, !509, !DIExpression(), !513)
    #dbg_value(i16 %360, !510, !DIExpression(), !513)
    #dbg_value(i16 %369, !511, !DIExpression(), !513)
  call void @llvm.lifetime.start.p0(ptr nonnull %6) #5, !dbg !1258
  call void @llvm.lifetime.start.p0(ptr nonnull %7) #5, !dbg !1259
  %377 = getelementptr inbounds nuw i8, ptr %6, i64 16, !dbg !1260
  store i16 %360, ptr %377, align 2, !dbg !1261, !tbaa !1262, !DIAssignID !1264
    #dbg_assign(i16 %360, !504, !DIExpression(DW_OP_LLVM_fragment, 128, 16), !1264, ptr %377, !DIExpression(), !513)
  %378 = getelementptr inbounds nuw i8, ptr %7, i64 16, !dbg !1265
  store i16 %369, ptr %378, align 2, !dbg !1266, !tbaa !1262, !DIAssignID !1267
    #dbg_assign(i16 %369, !512, !DIExpression(DW_OP_LLVM_fragment, 128, 16), !1267, ptr %378, !DIExpression(), !513)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 2 dereferenceable(16) %6, ptr noundef nonnull align 4 dereferenceable(16) %336, i64 16, i1 false), !dbg !1268, !DIAssignID !1269
    #dbg_assign(i1 poison, !504, !DIExpression(DW_OP_LLVM_fragment, 0, 128), !1269, ptr %6, !DIExpression(), !513)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 2 dereferenceable(16) %7, ptr noundef nonnull align 4 dereferenceable(16) %338, i64 16, i1 false), !dbg !1270, !DIAssignID !1271
    #dbg_assign(i1 poison, !512, !DIExpression(DW_OP_LLVM_fragment, 0, 128), !1271, ptr %7, !DIExpression(), !513)
    #dbg_value(ptr %6, !1272, !DIExpression(), !1278)
    #dbg_value(ptr null, !1277, !DIExpression(), !1278)
  %379 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @ipv6_sockets, ptr noundef nonnull %6) #5, !dbg !1281
    #dbg_value(ptr %379, !1277, !DIExpression(), !1278)
  %380 = icmp eq ptr %379, null, !dbg !1282
  br i1 %380, label %384, label %381, !dbg !1284

381:                                              ; preds = %376
  %382 = load i8, ptr %379, align 1, !dbg !1285, !tbaa !818
  %383 = icmp eq i8 %382, 0, !dbg !1286
  br i1 %383, label %384, label %390, !dbg !1287

384:                                              ; preds = %381, %376
    #dbg_value(ptr %7, !1272, !DIExpression(), !1288)
    #dbg_value(ptr null, !1277, !DIExpression(), !1288)
  %385 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @ipv6_sockets, ptr noundef nonnull %7) #5, !dbg !1291
    #dbg_value(ptr %385, !1277, !DIExpression(), !1288)
  %386 = icmp eq ptr %385, null, !dbg !1292
  br i1 %386, label %391, label %387, !dbg !1293

387:                                              ; preds = %384
  %388 = load i8, ptr %385, align 1, !dbg !1294, !tbaa !818
  %389 = icmp eq i8 %388, 0, !dbg !1295
  br i1 %389, label %391, label %390, !dbg !1296

390:                                              ; preds = %381, %387
  call void @llvm.lifetime.end.p0(ptr nonnull %7) #5, !dbg !1297
  call void @llvm.lifetime.end.p0(ptr nonnull %6) #5, !dbg !1297
  br label %484, !dbg !1298

391:                                              ; preds = %387, %384
  call void @llvm.lifetime.end.p0(ptr nonnull %7) #5, !dbg !1297
  call void @llvm.lifetime.end.p0(ptr nonnull %6) #5, !dbg !1297
  br label %486

392:                                              ; preds = %350
    #dbg_value(ptr null, !426, !DIExpression(), !1299)
    #dbg_value(ptr undef, !627, !DIExpression(), !639)
    #dbg_value(ptr %32, !633, !DIExpression(), !639)
    #dbg_value(ptr poison, !634, !DIExpression(), !639)
    #dbg_value(ptr %333, !636, !DIExpression(), !639)
  %393 = getelementptr inbounds nuw i8, ptr %333, i64 20, !dbg !1300
  %394 = icmp ugt ptr %393, %32, !dbg !1301
  br i1 %394, label %484, label %395, !dbg !1302

395:                                              ; preds = %392
  %396 = getelementptr inbounds nuw i8, ptr %333, i64 12, !dbg !1303
  %397 = load i16, ptr %396, align 4, !dbg !1303
  %398 = lshr i16 %397, 2, !dbg !1304
  %399 = and i16 %398, 60, !dbg !1304
    #dbg_value(i16 %399, !635, !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value), !639)
  %400 = icmp samesign ult i16 %399, 20, !dbg !1305
  %401 = zext nneg i16 %399 to i64
  %402 = getelementptr inbounds nuw i8, ptr %333, i64 %401
  %403 = icmp ugt ptr %402, %32
  %404 = select i1 %400, i1 true, i1 %403, !dbg !1306
  br i1 %404, label %484, label %405, !dbg !1306

405:                                              ; preds = %395
    #dbg_value(ptr poison, !236, !DIExpression(), !719)
    #dbg_value(ptr %333, !426, !DIExpression(), !1299)
    #dbg_value(i16 %399, !429, !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value), !1299)
    #dbg_value(ptr %333, !1019, !DIExpression(), !1307)
  %406 = and i16 %397, -256, !dbg !1309
  switch i16 %406, label %411 [
    i16 256, label %484
    i16 5120, label %407
  ], !dbg !1309

407:                                              ; preds = %405
  %408 = getelementptr inbounds nuw i8, ptr %333, i64 14, !dbg !1310
  %409 = load i16, ptr %408, align 2, !dbg !1310, !tbaa !1030
  %410 = icmp eq i16 %409, 0, !dbg !1311
  br i1 %410, label %484, label %411, !dbg !1312

411:                                              ; preds = %405, %407
    #dbg_value(ptr %333, !1034, !DIExpression(), !1313)
  %412 = and i16 %397, -8448, !dbg !1315
  %413 = icmp eq i16 %412, 512, !dbg !1315
  br i1 %413, label %414, label %433, !dbg !1315

414:                                              ; preds = %411
  %415 = getelementptr inbounds nuw i8, ptr %333, i64 14, !dbg !1316
  %416 = load i16, ptr %415, align 2, !dbg !1316, !tbaa !1030
  %417 = icmp eq i16 %416, -1296, !dbg !1317
  br i1 %417, label %418, label %433, !dbg !1318

418:                                              ; preds = %414
    #dbg_assign(i1 poison, !493, !DIExpression(), !502, ptr %5, !DIExpression(), !1319)
    #dbg_value(ptr %27, !488, !DIExpression(), !1320)
    #dbg_value(ptr null, !489, !DIExpression(), !1320)
  %419 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @ipv6_warnings, ptr noundef nonnull %27) #5, !dbg !1321
    #dbg_value(ptr %419, !489, !DIExpression(), !1320)
  %420 = icmp eq ptr %419, null, !dbg !1322
  br i1 %420, label %431, label %421, !dbg !1323

421:                                              ; preds = %418
  call void @llvm.lifetime.start.p0(ptr nonnull %3) #5, !dbg !1324
    #dbg_assign(i8 0, !480, !DIExpression(), !1325, ptr %3, !DIExpression(), !495)
  %422 = load i8, ptr %419, align 1, !dbg !1326, !tbaa !818
  %423 = add i8 %422, 1, !dbg !1327
  store i8 %423, ptr %3, align 1, !dbg !1328, !tbaa !818, !DIAssignID !1329
    #dbg_assign(i8 %423, !480, !DIExpression(), !1329, ptr %3, !DIExpression(), !495)
  %424 = call i64 inttoptr (i64 2 to ptr)(ptr noundef nonnull @ipv6_warnings, ptr noundef nonnull %27, ptr noundef nonnull %3, i64 noundef 0) #5, !dbg !1330
  %425 = load i8, ptr %3, align 1, !dbg !1331, !tbaa !818
  %426 = icmp ugt i8 %425, 16, !dbg !1332
  br i1 %426, label %427, label %430, !dbg !1333

427:                                              ; preds = %421
  call void @llvm.lifetime.start.p0(ptr nonnull %4) #5, !dbg !1334
  store i8 1, ptr %4, align 1, !dbg !1335, !tbaa !818, !DIAssignID !1336
    #dbg_assign(i8 1, !490, !DIExpression(), !1336, ptr %4, !DIExpression(), !501)
  %428 = call i64 inttoptr (i64 2 to ptr)(ptr noundef nonnull @ipv6_bans, ptr noundef nonnull %27, ptr noundef nonnull %4, i64 noundef 0) #5, !dbg !1337
  %429 = call i64 inttoptr (i64 3 to ptr)(ptr noundef nonnull @ipv6_warnings, ptr noundef nonnull %27) #5, !dbg !1338
  call void @llvm.lifetime.end.p0(ptr nonnull %4) #5, !dbg !1339
  br label %430, !dbg !1340

430:                                              ; preds = %427, %421
  call void @llvm.lifetime.end.p0(ptr nonnull %3) #5, !dbg !1341
  br label %433, !dbg !1342

431:                                              ; preds = %418
  call void @llvm.lifetime.start.p0(ptr nonnull %5) #5, !dbg !1343
  store i8 1, ptr %5, align 1, !dbg !1344, !tbaa !818, !DIAssignID !1345
    #dbg_assign(i8 1, !493, !DIExpression(), !1345, ptr %5, !DIExpression(), !1319)
  %432 = call i64 inttoptr (i64 2 to ptr)(ptr noundef nonnull @ipv6_warnings, ptr noundef nonnull %27, ptr noundef nonnull %5, i64 noundef 0) #5, !dbg !1346
  call void @llvm.lifetime.end.p0(ptr nonnull %5) #5, !dbg !1347
  br label %433

433:                                              ; preds = %431, %430, %414, %411
  %434 = load i16, ptr %333, align 4, !dbg !1348, !tbaa !1074
    #dbg_value(i16 %434, !430, !DIExpression(), !1299)
  call void @llvm.lifetime.start.p0(ptr nonnull %23)
    #dbg_assign(i1 poison, !844, !DIExpression(), !570, ptr %23, !DIExpression(), !1349)
  store i16 %434, ptr %23, align 2, !tbaa !735, !DIAssignID !1352
    #dbg_assign(i16 %434, !844, !DIExpression(), !1352, ptr %23, !DIExpression(), !1349)
    #dbg_value(ptr null, !849, !DIExpression(), !1349)
  %435 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @port_bans, ptr noundef nonnull %23) #5, !dbg !1353
    #dbg_value(ptr %435, !849, !DIExpression(), !1349)
  %436 = icmp eq ptr %435, null, !dbg !1354
  br i1 %436, label %441, label %437, !dbg !1355

437:                                              ; preds = %433
  %438 = load i8, ptr %435, align 1, !dbg !1356, !tbaa !818
  %439 = icmp eq i8 %438, 0, !dbg !1357
  br i1 %439, label %441, label %440, !dbg !1358

440:                                              ; preds = %437
  call void @llvm.lifetime.end.p0(ptr nonnull %23), !dbg !1359
  br label %484, !dbg !1360

441:                                              ; preds = %437, %433
  call void @llvm.lifetime.end.p0(ptr nonnull %23), !dbg !1361
  %442 = getelementptr inbounds nuw i8, ptr %333, i64 2, !dbg !1362
  %443 = load i16, ptr %442, align 2, !dbg !1363, !tbaa !1090
    #dbg_value(i16 %443, !431, !DIExpression(), !1299)
  call void @llvm.lifetime.start.p0(ptr nonnull %24)
    #dbg_assign(i1 poison, !844, !DIExpression(), !571, ptr %24, !DIExpression(), !1364)
  store i16 %443, ptr %24, align 2, !tbaa !735, !DIAssignID !1367
    #dbg_assign(i16 %443, !844, !DIExpression(), !1367, ptr %24, !DIExpression(), !1364)
    #dbg_value(ptr null, !849, !DIExpression(), !1364)
  %444 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @port_bans, ptr noundef nonnull %24) #5, !dbg !1368
    #dbg_value(ptr %444, !849, !DIExpression(), !1364)
  %445 = icmp eq ptr %444, null, !dbg !1369
  br i1 %445, label %450, label %446, !dbg !1370

446:                                              ; preds = %441
  %447 = load i8, ptr %444, align 1, !dbg !1371, !tbaa !818
  %448 = icmp eq i8 %447, 0, !dbg !1372
  br i1 %448, label %450, label %449, !dbg !1373

449:                                              ; preds = %446
  call void @llvm.lifetime.end.p0(ptr nonnull %24), !dbg !1374
  br label %484, !dbg !1375

450:                                              ; preds = %446, %441
  call void @llvm.lifetime.end.p0(ptr nonnull %24), !dbg !1376
    #dbg_assign(i1 poison, !512, !DIExpression(), !521, ptr %9, !DIExpression(), !518)
    #dbg_value(ptr poison, !509, !DIExpression(), !518)
    #dbg_value(i16 %434, !510, !DIExpression(), !518)
    #dbg_value(i16 %443, !511, !DIExpression(), !518)
  call void @llvm.lifetime.start.p0(ptr nonnull %8) #5, !dbg !1377
  call void @llvm.lifetime.start.p0(ptr nonnull %9) #5, !dbg !1378
  %451 = getelementptr inbounds nuw i8, ptr %8, i64 16, !dbg !1379
  store i16 %434, ptr %451, align 2, !dbg !1380, !tbaa !1262, !DIAssignID !1381
    #dbg_assign(i16 %434, !504, !DIExpression(DW_OP_LLVM_fragment, 128, 16), !1381, ptr %451, !DIExpression(), !518)
  %452 = getelementptr inbounds nuw i8, ptr %9, i64 16, !dbg !1382
  store i16 %443, ptr %452, align 2, !dbg !1383, !tbaa !1262, !DIAssignID !1384
    #dbg_assign(i16 %443, !512, !DIExpression(DW_OP_LLVM_fragment, 128, 16), !1384, ptr %452, !DIExpression(), !518)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 2 dereferenceable(16) %8, ptr noundef nonnull align 4 dereferenceable(16) %336, i64 16, i1 false), !dbg !1385, !DIAssignID !1386
    #dbg_assign(i1 poison, !504, !DIExpression(DW_OP_LLVM_fragment, 0, 128), !1386, ptr %8, !DIExpression(), !518)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 2 dereferenceable(16) %9, ptr noundef nonnull align 4 dereferenceable(16) %338, i64 16, i1 false), !dbg !1387, !DIAssignID !1388
    #dbg_assign(i1 poison, !512, !DIExpression(DW_OP_LLVM_fragment, 0, 128), !1388, ptr %9, !DIExpression(), !518)
    #dbg_value(ptr %8, !1272, !DIExpression(), !1389)
    #dbg_value(ptr null, !1277, !DIExpression(), !1389)
  %453 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @ipv6_sockets, ptr noundef nonnull %8) #5, !dbg !1391
    #dbg_value(ptr %453, !1277, !DIExpression(), !1389)
  %454 = icmp eq ptr %453, null, !dbg !1392
  br i1 %454, label %458, label %455, !dbg !1393

455:                                              ; preds = %450
  %456 = load i8, ptr %453, align 1, !dbg !1394, !tbaa !818
  %457 = icmp eq i8 %456, 0, !dbg !1395
  br i1 %457, label %458, label %464, !dbg !1396

458:                                              ; preds = %455, %450
    #dbg_value(ptr %9, !1272, !DIExpression(), !1397)
    #dbg_value(ptr null, !1277, !DIExpression(), !1397)
  %459 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @ipv6_sockets, ptr noundef nonnull %9) #5, !dbg !1399
    #dbg_value(ptr %459, !1277, !DIExpression(), !1397)
  %460 = icmp eq ptr %459, null, !dbg !1400
  br i1 %460, label %465, label %461, !dbg !1401

461:                                              ; preds = %458
  %462 = load i8, ptr %459, align 1, !dbg !1402, !tbaa !818
  %463 = icmp eq i8 %462, 0, !dbg !1403
  br i1 %463, label %465, label %464, !dbg !1404

464:                                              ; preds = %455, %461
  call void @llvm.lifetime.end.p0(ptr nonnull %9) #5, !dbg !1405
  call void @llvm.lifetime.end.p0(ptr nonnull %8) #5, !dbg !1405
  br label %484, !dbg !1406

465:                                              ; preds = %461, %458
  call void @llvm.lifetime.end.p0(ptr nonnull %9) #5, !dbg !1405
  call void @llvm.lifetime.end.p0(ptr nonnull %8) #5, !dbg !1405
  br label %486

466:                                              ; preds = %350
    #dbg_value(ptr null, !432, !DIExpression(), !1407)
    #dbg_value(ptr undef, !614, !DIExpression(), !625)
    #dbg_value(ptr %32, !620, !DIExpression(), !625)
    #dbg_value(ptr poison, !621, !DIExpression(), !625)
    #dbg_value(ptr %333, !622, !DIExpression(), !625)
  %467 = getelementptr inbounds nuw i8, ptr %333, i64 8, !dbg !1408
  %468 = icmp ugt ptr %467, %32, !dbg !1409
  br i1 %468, label %486, label %469, !dbg !1410

469:                                              ; preds = %466
    #dbg_value(ptr %467, !236, !DIExpression(), !719)
    #dbg_value(ptr %333, !432, !DIExpression(), !1407)
    #dbg_value(ptr %333, !1139, !DIExpression(), !1411)
  %470 = load i8, ptr %333, align 4, !dbg !1414, !tbaa !1149
    #dbg_value(i8 %470, !1144, !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value), !1411)
  %471 = icmp eq i8 %470, 0, !dbg !1415
  %472 = call i1 @llvm.bpf.passthrough.i1.i1(i32 1, i1 %471)
  %473 = freeze i1 %472, !dbg !1416
  br i1 %473, label %486, label %474, !dbg !1416

474:                                              ; preds = %469
  switch i8 %470, label %484 [
    i8 12, label %486
    i8 11, label %486
    i8 8, label %486
    i8 5, label %486
    i8 3, label %486
  ], !dbg !1417

475:                                              ; preds = %350
    #dbg_value(ptr null, !435, !DIExpression(), !1418)
    #dbg_value(ptr undef, !602, !DIExpression(), !611)
    #dbg_value(ptr %32, !608, !DIExpression(), !611)
    #dbg_value(ptr poison, !609, !DIExpression(), !611)
    #dbg_value(ptr %333, !610, !DIExpression(), !611)
  %476 = getelementptr inbounds nuw i8, ptr %333, i64 8, !dbg !1419
  %477 = icmp ugt ptr %476, %32, !dbg !1421
  br i1 %477, label %486, label %478, !dbg !1422

478:                                              ; preds = %475
    #dbg_value(ptr %476, !236, !DIExpression(), !719)
    #dbg_value(ptr %333, !435, !DIExpression(), !1418)
    #dbg_value(ptr %333, !1423, !DIExpression(), !1429)
  %479 = load i8, ptr %333, align 4, !dbg !1432, !tbaa !1433
    #dbg_value(i8 %479, !1428, !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value), !1429)
  %480 = icmp eq i8 %479, 1, !dbg !1435
  %481 = call i1 @llvm.bpf.passthrough.i1.i1(i32 2, i1 %480)
  %482 = freeze i1 %481, !dbg !1437
  br i1 %482, label %486, label %483, !dbg !1437

483:                                              ; preds = %478
  switch i8 %479, label %484 [
    i8 -119, label %486
    i8 -120, label %486
    i8 -121, label %486
    i8 -122, label %486
    i8 -123, label %486
    i8 -127, label %486
    i8 -128, label %486
    i8 4, label %486
    i8 3, label %486
    i8 2, label %486
  ], !dbg !1438

484:                                              ; preds = %405, %483, %474, %341, %347, %366, %375, %390, %351, %354, %440, %449, %464, %392, %395, %407
  %485 = phi i32 [ 1, %483 ], [ 1, %341 ], [ 2, %354 ], [ 1, %347 ], [ 1, %474 ], [ 1, %390 ], [ 1, %366 ], [ 1, %407 ], [ 1, %375 ], [ 2, %351 ], [ 1, %464 ], [ 1, %440 ], [ 1, %449 ], [ 1, %405 ], [ 2, %392 ], [ 2, %395 ]
  call void @llvm.lifetime.end.p0(ptr nonnull %28) #5, !dbg !1439
  call void @llvm.lifetime.end.p0(ptr nonnull %27) #5, !dbg !1439
  br label %487

486:                                              ; preds = %483, %483, %483, %483, %483, %483, %483, %483, %483, %483, %478, %474, %474, %474, %474, %474, %469, %475, %466, %350, %331, %391, %465
  call void @llvm.lifetime.end.p0(ptr nonnull %28) #5, !dbg !1439
  call void @llvm.lifetime.end.p0(ptr nonnull %27) #5, !dbg !1439
  br label %487

487:                                              ; preds = %298, %484, %486, %81, %1
  %488 = phi i32 [ 2, %1 ], [ %299, %298 ], [ %485, %484 ], [ 2, %486 ], [ 2, %81 ], !dbg !719
  ret i32 %488, !dbg !1440
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
!llvm.module.flags = !{!209, !210, !211, !212, !213}
!llvm.ident = !{!214}
!llvm.errno.tbaa = !{!215}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !72, line: 726, type: !208, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "clang version 22.1.8", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !54, globals: !69, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/cookiengineer/Software/tholian-network/firewall/ebpf/module/module.c", directory: "/home/cookiengineer/Software/tholian-network/firewall/ebpf", checksumkind: CSK_MD5, checksum: "d0894670282d81adefd0c9ab01f754b5")
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
!69 = !{!0, !70, !91, !113, !129, !146, !154, !163, !177, !190, !198, !203}
!70 = !DIGlobalVariableExpression(var: !71, expr: !DIExpression())
!71 = distinct !DIGlobalVariable(name: "domain_bans", scope: !2, file: !72, line: 43, type: !73, isLocal: false, isDefinition: true)
!72 = !DIFile(filename: "module/module.c", directory: "/home/cookiengineer/Software/tholian-network/firewall/ebpf", checksumkind: CSK_MD5, checksum: "d0894670282d81adefd0c9ab01f754b5")
!73 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !72, line: 38, size: 256, elements: !74)
!74 = !{!75, !80, !85, !89}
!75 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !73, file: !72, line: 39, baseType: !76, size: 64)
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DICompositeType(tag: DW_TAG_array_type, baseType: !60, size: 32, elements: !78)
!78 = !{!79}
!79 = !DISubrange(count: 1)
!80 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !73, file: !72, line: 40, baseType: !81, size: 64, offset: 64)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DICompositeType(tag: DW_TAG_array_type, baseType: !60, size: 2097120, elements: !83)
!83 = !{!84}
!84 = !DISubrange(count: 65535)
!85 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !73, file: !72, line: 41, baseType: !86, size: 64, offset: 128)
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !58, line: 9, baseType: !88)
!88 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!89 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !73, file: !72, line: 42, baseType: !90, size: 64, offset: 192)
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!91 = !DIGlobalVariableExpression(var: !92, expr: !DIExpression())
!92 = distinct !DIGlobalVariable(name: "ipv4_bans", scope: !2, file: !72, line: 52, type: !93, isLocal: false, isDefinition: true)
!93 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !72, line: 46, size: 320, elements: !94)
!94 = !{!95, !100, !101, !111, !112}
!95 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !93, file: !72, line: 47, baseType: !96, size: 64)
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 64)
!97 = !DICompositeType(tag: DW_TAG_array_type, baseType: !60, size: 352, elements: !98)
!98 = !{!99}
!99 = !DISubrange(count: 11)
!100 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !93, file: !72, line: 48, baseType: !81, size: 64, offset: 64)
!101 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !93, file: !72, line: 49, baseType: !102, size: 64, offset: 128)
!102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !103, size: 64)
!103 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipv4_subnet", file: !72, line: 17, size: 64, elements: !104)
!104 = !{!105, !107}
!105 = !DIDerivedType(tag: DW_TAG_member, name: "prefixlen", scope: !103, file: !72, line: 18, baseType: !106, size: 32)
!106 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !58, line: 7, baseType: !7)
!107 = !DIDerivedType(tag: DW_TAG_member, name: "address", scope: !103, file: !72, line: 19, baseType: !108, size: 32, offset: 32)
!108 = !DICompositeType(tag: DW_TAG_array_type, baseType: !66, size: 32, elements: !109)
!109 = !{!110}
!110 = !DISubrange(count: 4)
!111 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !93, file: !72, line: 50, baseType: !90, size: 64, offset: 192)
!112 = !DIDerivedType(tag: DW_TAG_member, name: "map_flags", scope: !93, file: !72, line: 51, baseType: !76, size: 64, offset: 256)
!113 = !DIGlobalVariableExpression(var: !114, expr: !DIExpression())
!114 = distinct !DIGlobalVariable(name: "ipv4_warnings", scope: !2, file: !72, line: 60, type: !115, isLocal: false, isDefinition: true)
!115 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !72, line: 55, size: 256, elements: !116)
!116 = !{!117, !122, !127, !128}
!117 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !115, file: !72, line: 56, baseType: !118, size: 64)
!118 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !119, size: 64)
!119 = !DICompositeType(tag: DW_TAG_array_type, baseType: !60, size: 288, elements: !120)
!120 = !{!121}
!121 = !DISubrange(count: 9)
!122 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !115, file: !72, line: 57, baseType: !123, size: 64, offset: 64)
!123 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !124, size: 64)
!124 = !DICompositeType(tag: DW_TAG_array_type, baseType: !60, size: 4096, elements: !125)
!125 = !{!126}
!126 = !DISubrange(count: 128)
!127 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !115, file: !72, line: 58, baseType: !102, size: 64, offset: 128)
!128 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !115, file: !72, line: 59, baseType: !90, size: 64, offset: 192)
!129 = !DIGlobalVariableExpression(var: !130, expr: !DIExpression())
!130 = distinct !DIGlobalVariable(name: "ipv6_bans", scope: !2, file: !72, line: 69, type: !131, isLocal: false, isDefinition: true)
!131 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !72, line: 63, size: 320, elements: !132)
!132 = !{!133, !134, !135, !144, !145}
!133 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !131, file: !72, line: 64, baseType: !96, size: 64)
!134 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !131, file: !72, line: 65, baseType: !81, size: 64, offset: 64)
!135 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !131, file: !72, line: 66, baseType: !136, size: 64, offset: 128)
!136 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !137, size: 64)
!137 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipv6_subnet", file: !72, line: 22, size: 160, elements: !138)
!138 = !{!139, !140}
!139 = !DIDerivedType(tag: DW_TAG_member, name: "prefixlen", scope: !137, file: !72, line: 23, baseType: !106, size: 32)
!140 = !DIDerivedType(tag: DW_TAG_member, name: "address", scope: !137, file: !72, line: 24, baseType: !141, size: 128, offset: 32)
!141 = !DICompositeType(tag: DW_TAG_array_type, baseType: !66, size: 128, elements: !142)
!142 = !{!143}
!143 = !DISubrange(count: 16)
!144 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !131, file: !72, line: 67, baseType: !90, size: 64, offset: 192)
!145 = !DIDerivedType(tag: DW_TAG_member, name: "map_flags", scope: !131, file: !72, line: 68, baseType: !76, size: 64, offset: 256)
!146 = !DIGlobalVariableExpression(var: !147, expr: !DIExpression())
!147 = distinct !DIGlobalVariable(name: "ipv6_warnings", scope: !2, file: !72, line: 77, type: !148, isLocal: false, isDefinition: true)
!148 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !72, line: 72, size: 256, elements: !149)
!149 = !{!150, !151, !152, !153}
!150 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !148, file: !72, line: 73, baseType: !118, size: 64)
!151 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !148, file: !72, line: 74, baseType: !123, size: 64, offset: 64)
!152 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !148, file: !72, line: 75, baseType: !136, size: 64, offset: 128)
!153 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !148, file: !72, line: 76, baseType: !90, size: 64, offset: 192)
!154 = !DIGlobalVariableExpression(var: !155, expr: !DIExpression())
!155 = distinct !DIGlobalVariable(name: "port_bans", scope: !2, file: !72, line: 85, type: !156, isLocal: false, isDefinition: true)
!156 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !72, line: 80, size: 256, elements: !157)
!157 = !{!158, !159, !160, !162}
!158 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !156, file: !72, line: 81, baseType: !76, size: 64)
!159 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !156, file: !72, line: 82, baseType: !81, size: 64, offset: 64)
!160 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !156, file: !72, line: 83, baseType: !161, size: 64, offset: 128)
!161 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!162 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !156, file: !72, line: 84, baseType: !90, size: 64, offset: 192)
!163 = !DIGlobalVariableExpression(var: !164, expr: !DIExpression())
!164 = distinct !DIGlobalVariable(name: "ipv4_sockets", scope: !2, file: !72, line: 93, type: !165, isLocal: false, isDefinition: true)
!165 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !72, line: 88, size: 256, elements: !166)
!166 = !{!167, !168, !169, !176}
!167 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !165, file: !72, line: 89, baseType: !76, size: 64)
!168 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !165, file: !72, line: 90, baseType: !81, size: 64, offset: 64)
!169 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !165, file: !72, line: 91, baseType: !170, size: 64, offset: 128)
!170 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !171, size: 64)
!171 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipv4_socket", file: !72, line: 27, size: 48, elements: !172)
!172 = !{!173, !174}
!173 = !DIDerivedType(tag: DW_TAG_member, name: "address", scope: !171, file: !72, line: 28, baseType: !108, size: 32)
!174 = !DIDerivedType(tag: DW_TAG_member, name: "port", scope: !171, file: !72, line: 29, baseType: !175, size: 16, offset: 32)
!175 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !58, line: 18, baseType: !57)
!176 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !165, file: !72, line: 92, baseType: !90, size: 64, offset: 192)
!177 = !DIGlobalVariableExpression(var: !178, expr: !DIExpression())
!178 = distinct !DIGlobalVariable(name: "ipv6_sockets", scope: !2, file: !72, line: 101, type: !179, isLocal: false, isDefinition: true)
!179 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !72, line: 96, size: 256, elements: !180)
!180 = !{!181, !182, !183, !189}
!181 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !179, file: !72, line: 97, baseType: !76, size: 64)
!182 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !179, file: !72, line: 98, baseType: !81, size: 64, offset: 64)
!183 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !179, file: !72, line: 99, baseType: !184, size: 64, offset: 128)
!184 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !185, size: 64)
!185 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipv6_socket", file: !72, line: 32, size: 144, elements: !186)
!186 = !{!187, !188}
!187 = !DIDerivedType(tag: DW_TAG_member, name: "address", scope: !185, file: !72, line: 33, baseType: !141, size: 128)
!188 = !DIDerivedType(tag: DW_TAG_member, name: "port", scope: !185, file: !72, line: 34, baseType: !175, size: 16, offset: 128)
!189 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !179, file: !72, line: 100, baseType: !90, size: 64, offset: 192)
!190 = !DIGlobalVariableExpression(var: !191, expr: !DIExpression(DW_OP_constu, 1, DW_OP_stack_value))
!191 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !2, file: !192, line: 51, type: !193, isLocal: true, isDefinition: true)
!192 = !DIFile(filename: "module/../headers/bpf_helper_defs.h", directory: "/home/cookiengineer/Software/tholian-network/firewall/ebpf", checksumkind: CSK_MD5, checksum: "67458ddab14190d1ab39602394f9ecef")
!193 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !194, size: 64)
!194 = !DISubroutineType(types: !195)
!195 = !{!55, !55, !196}
!196 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !197, size: 64)
!197 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!198 = !DIGlobalVariableExpression(var: !199, expr: !DIExpression(DW_OP_constu, 2, DW_OP_stack_value))
!199 = distinct !DIGlobalVariable(name: "bpf_map_update_elem", scope: !2, file: !192, line: 73, type: !200, isLocal: true, isDefinition: true)
!200 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !201, size: 64)
!201 = !DISubroutineType(types: !202)
!202 = !{!56, !55, !196, !196, !87}
!203 = !DIGlobalVariableExpression(var: !204, expr: !DIExpression(DW_OP_constu, 3, DW_OP_stack_value))
!204 = distinct !DIGlobalVariable(name: "bpf_map_delete_elem", scope: !2, file: !192, line: 83, type: !205, isLocal: true, isDefinition: true)
!205 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !206, size: 64)
!206 = !DISubroutineType(types: !207)
!207 = !{!56, !55, !196}
!208 = !DICompositeType(tag: DW_TAG_array_type, baseType: !63, size: 32, elements: !109)
!209 = !{i32 7, !"Dwarf Version", i32 5}
!210 = !{i32 2, !"Debug Info Version", i32 3}
!211 = !{i32 1, !"wchar_size", i32 4}
!212 = !{i32 7, !"frame-pointer", i32 2}
!213 = !{i32 7, !"debug-info-assignment-tracking", i1 true}
!214 = !{!"clang version 22.1.8"}
!215 = !{!216, !216, i64 0}
!216 = !{!"int", !217, i64 0}
!217 = !{!"omnipotent char", !218, i64 0}
!218 = !{!"Simple C/C++ TBAA"}
!219 = distinct !DISubprogram(name: "xdp_prog_main", scope: !72, file: !72, line: 429, type: !220, scopeLine: 429, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !231, keyInstructions: true)
!220 = !DISubroutineType(types: !221)
!221 = !{!60, !222}
!222 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !223, size: 64)
!223 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !6, line: 6323, size: 192, elements: !224)
!224 = !{!225, !226, !227, !228, !229, !230}
!225 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !223, file: !6, line: 6324, baseType: !106, size: 32)
!226 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !223, file: !6, line: 6325, baseType: !106, size: 32, offset: 32)
!227 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !223, file: !6, line: 6326, baseType: !106, size: 32, offset: 64)
!228 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !223, file: !6, line: 6328, baseType: !106, size: 32, offset: 96)
!229 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !223, file: !6, line: 6329, baseType: !106, size: 32, offset: 128)
!230 = !DIDerivedType(tag: DW_TAG_member, name: "egress_ifindex", scope: !223, file: !6, line: 6331, baseType: !106, size: 32, offset: 160)
!231 = !{!232, !233, !234, !235, !236, !241, !256, !287, !328, !331, !332, !333, !344, !345, !346, !347, !359, !384, !385, !386, !387, !413, !416, !417, !418, !423, !424, !425, !426, !429, !430, !431, !432, !435}
!232 = !DILocalVariable(name: "ctx", arg: 1, scope: !219, file: !72, line: 429, type: !222)
!233 = !DILocalVariable(name: "data_end", scope: !219, file: !72, line: 432, type: !55)
!234 = !DILocalVariable(name: "data", scope: !219, file: !72, line: 433, type: !55)
!235 = !DILocalVariable(name: "ethernet_protocol", scope: !219, file: !72, line: 439, type: !60)
!236 = !DILocalVariable(name: "cursor", scope: !219, file: !72, line: 440, type: !237)
!237 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "hdr_cursor", file: !238, line: 35, size: 64, elements: !239)
!238 = !DIFile(filename: "module/module.h", directory: "/home/cookiengineer/Software/tholian-network/firewall/ebpf", checksumkind: CSK_MD5, checksum: "c9399d316b2ddcc0b079d9dd31114f1d")
!239 = !{!240}
!240 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !237, file: !238, line: 36, baseType: !55, size: 64)
!241 = !DILocalVariable(name: "ethernet_header", scope: !219, file: !72, line: 441, type: !242)
!242 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !243, size: 64)
!243 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !244, line: 183, size: 112, elements: !245)
!244 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "", checksumkind: CSK_MD5, checksum: "3286d456f31f105294338f2c6c9e44ce")
!245 = !{!246, !250, !251}
!246 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !243, file: !244, line: 184, baseType: !247, size: 48)
!247 = !DICompositeType(tag: DW_TAG_array_type, baseType: !67, size: 48, elements: !248)
!248 = !{!249}
!249 = !DISubrange(count: 6)
!250 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !243, file: !244, line: 185, baseType: !247, size: 48, offset: 48)
!251 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !243, file: !244, line: 186, baseType: !252, size: 16, offset: 96)
!252 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !253, line: 32, baseType: !254)
!253 = !DIFile(filename: "/usr/include/linux/types.h", directory: "", checksumkind: CSK_MD5, checksum: "c0ade1a1a309d6896ce6080a51a2d105")
!254 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !255, line: 24, baseType: !59)
!255 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "", checksumkind: CSK_MD5, checksum: "b810f270733e106319b67ef512c6246e")
!256 = !DILocalVariable(name: "ipv4_header", scope: !219, file: !72, line: 442, type: !257)
!257 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !258, size: 64)
!258 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !259, line: 87, size: 160, elements: !260)
!259 = !DIFile(filename: "/usr/include/linux/ip.h", directory: "", checksumkind: CSK_MD5, checksum: "5c58d077e910b6c258855dca54d0ec22")
!260 = !{!261, !263, !264, !265, !266, !267, !268, !269, !270, !272}
!261 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !258, file: !259, line: 89, baseType: !262, size: 4, flags: DIFlagBitField, extraData: i64 0)
!262 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !255, line: 21, baseType: !67)
!263 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !258, file: !259, line: 90, baseType: !262, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!264 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !258, file: !259, line: 97, baseType: !262, size: 8, offset: 8)
!265 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !258, file: !259, line: 98, baseType: !252, size: 16, offset: 16)
!266 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !258, file: !259, line: 99, baseType: !252, size: 16, offset: 32)
!267 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !258, file: !259, line: 100, baseType: !252, size: 16, offset: 48)
!268 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !258, file: !259, line: 101, baseType: !262, size: 8, offset: 64)
!269 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !258, file: !259, line: 102, baseType: !262, size: 8, offset: 72)
!270 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !258, file: !259, line: 103, baseType: !271, size: 16, offset: 80)
!271 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !253, line: 38, baseType: !254)
!272 = !DIDerivedType(tag: DW_TAG_member, scope: !258, file: !259, line: 104, baseType: !273, size: 64, offset: 96)
!273 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !258, file: !259, line: 104, size: 64, elements: !274)
!274 = !{!275, !282}
!275 = !DIDerivedType(tag: DW_TAG_member, scope: !273, file: !259, line: 104, baseType: !276, size: 64)
!276 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !273, file: !259, line: 104, size: 64, elements: !277)
!277 = !{!278, !281}
!278 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !276, file: !259, line: 105, baseType: !279, size: 32)
!279 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !253, line: 34, baseType: !280)
!280 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !255, line: 27, baseType: !7)
!281 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !276, file: !259, line: 106, baseType: !279, size: 32, offset: 32)
!282 = !DIDerivedType(tag: DW_TAG_member, name: "addrs", scope: !273, file: !259, line: 104, baseType: !283, size: 64)
!283 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !273, file: !259, line: 104, size: 64, elements: !284)
!284 = !{!285, !286}
!285 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !283, file: !259, line: 105, baseType: !279, size: 32)
!286 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !283, file: !259, line: 106, baseType: !279, size: 32, offset: 32)
!287 = !DILocalVariable(name: "ipv6_header", scope: !219, file: !72, line: 443, type: !288)
!288 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !289, size: 64)
!289 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipv6hdr", file: !290, line: 118, size: 320, elements: !291)
!290 = !DIFile(filename: "/usr/include/linux/ipv6.h", directory: "", checksumkind: CSK_MD5, checksum: "2ee489601bcc9c44d828d039ff7786a6")
!291 = !{!292, !293, !294, !298, !299, !300, !301}
!292 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !289, file: !290, line: 120, baseType: !262, size: 4, flags: DIFlagBitField, extraData: i64 0)
!293 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !289, file: !290, line: 121, baseType: !262, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!294 = !DIDerivedType(tag: DW_TAG_member, name: "flow_lbl", scope: !289, file: !290, line: 128, baseType: !295, size: 24, offset: 8)
!295 = !DICompositeType(tag: DW_TAG_array_type, baseType: !262, size: 24, elements: !296)
!296 = !{!297}
!297 = !DISubrange(count: 3)
!298 = !DIDerivedType(tag: DW_TAG_member, name: "payload_len", scope: !289, file: !290, line: 130, baseType: !252, size: 16, offset: 32)
!299 = !DIDerivedType(tag: DW_TAG_member, name: "nexthdr", scope: !289, file: !290, line: 131, baseType: !262, size: 8, offset: 48)
!300 = !DIDerivedType(tag: DW_TAG_member, name: "hop_limit", scope: !289, file: !290, line: 132, baseType: !262, size: 8, offset: 56)
!301 = !DIDerivedType(tag: DW_TAG_member, scope: !289, file: !290, line: 134, baseType: !302, size: 256, offset: 64)
!302 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !289, file: !290, line: 134, size: 256, elements: !303)
!303 = !{!304, !323}
!304 = !DIDerivedType(tag: DW_TAG_member, scope: !302, file: !290, line: 134, baseType: !305, size: 256)
!305 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !302, file: !290, line: 134, size: 256, elements: !306)
!306 = !{!307, !322}
!307 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !305, file: !290, line: 135, baseType: !308, size: 128)
!308 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in6_addr", file: !309, line: 33, size: 128, elements: !310)
!309 = !DIFile(filename: "/usr/include/linux/in6.h", directory: "", checksumkind: CSK_MD5, checksum: "6eb9610917d19b67762834b3cd333671")
!310 = !{!311}
!311 = !DIDerivedType(tag: DW_TAG_member, name: "in6_u", scope: !308, file: !309, line: 40, baseType: !312, size: 128)
!312 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !308, file: !309, line: 34, size: 128, elements: !313)
!313 = !{!314, !316, !320}
!314 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr8", scope: !312, file: !309, line: 35, baseType: !315, size: 128)
!315 = !DICompositeType(tag: DW_TAG_array_type, baseType: !262, size: 128, elements: !142)
!316 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr16", scope: !312, file: !309, line: 37, baseType: !317, size: 128)
!317 = !DICompositeType(tag: DW_TAG_array_type, baseType: !252, size: 128, elements: !318)
!318 = !{!319}
!319 = !DISubrange(count: 8)
!320 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr32", scope: !312, file: !309, line: 38, baseType: !321, size: 128)
!321 = !DICompositeType(tag: DW_TAG_array_type, baseType: !279, size: 128, elements: !109)
!322 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !305, file: !290, line: 136, baseType: !308, size: 128, offset: 128)
!323 = !DIDerivedType(tag: DW_TAG_member, name: "addrs", scope: !302, file: !290, line: 134, baseType: !324, size: 256)
!324 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !302, file: !290, line: 134, size: 256, elements: !325)
!325 = !{!326, !327}
!326 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !324, file: !290, line: 135, baseType: !308, size: 128)
!327 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !324, file: !290, line: 136, baseType: !308, size: 128, offset: 128)
!328 = !DILocalVariable(name: "protocol", scope: !329, file: !72, line: 455, type: !60)
!329 = distinct !DILexicalBlock(scope: !330, file: !72, line: 453, column: 48)
!330 = distinct !DILexicalBlock(scope: !219, file: !72, line: 453, column: 6)
!331 = !DILocalVariable(name: "ipv4_source", scope: !329, file: !72, line: 457, type: !103)
!332 = !DILocalVariable(name: "ipv4_dest", scope: !329, file: !72, line: 460, type: !103)
!333 = !DILocalVariable(name: "udp_header", scope: !334, file: !72, line: 490, type: !336)
!334 = distinct !DILexicalBlock(scope: !335, file: !72, line: 488, column: 32)
!335 = distinct !DILexicalBlock(scope: !329, file: !72, line: 488, column: 7)
!336 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !337, size: 64)
!337 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "udphdr", file: !338, line: 23, size: 64, elements: !339)
!338 = !DIFile(filename: "/usr/include/linux/udp.h", directory: "", checksumkind: CSK_MD5, checksum: "ab19180315580c673b116c922b21f9fe")
!339 = !{!340, !341, !342, !343}
!340 = !DIDerivedType(tag: DW_TAG_member, name: "source", scope: !337, file: !338, line: 24, baseType: !252, size: 16)
!341 = !DIDerivedType(tag: DW_TAG_member, name: "dest", scope: !337, file: !338, line: 25, baseType: !252, size: 16, offset: 16)
!342 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !337, file: !338, line: 26, baseType: !252, size: 16, offset: 32)
!343 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !337, file: !338, line: 27, baseType: !271, size: 16, offset: 48)
!344 = !DILocalVariable(name: "length", scope: !334, file: !72, line: 492, type: !60)
!345 = !DILocalVariable(name: "port_source", scope: !334, file: !72, line: 497, type: !57)
!346 = !DILocalVariable(name: "port_dest", scope: !334, file: !72, line: 504, type: !57)
!347 = !DILocalVariable(name: "dns_header", scope: !348, file: !72, line: 524, type: !350)
!348 = distinct !DILexicalBlock(scope: !349, file: !72, line: 522, column: 6)
!349 = distinct !DILexicalBlock(scope: !334, file: !72, line: 518, column: 5)
!350 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !351, size: 64)
!351 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dnshdr", file: !238, line: 50, size: 96, elements: !352)
!352 = !{!353, !354, !355, !356, !357, !358}
!353 = !DIDerivedType(tag: DW_TAG_member, name: "transaction_id", scope: !351, file: !238, line: 51, baseType: !175, size: 16)
!354 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !351, file: !238, line: 52, baseType: !175, size: 16, offset: 16)
!355 = !DIDerivedType(tag: DW_TAG_member, name: "q_count", scope: !351, file: !238, line: 53, baseType: !175, size: 16, offset: 32)
!356 = !DIDerivedType(tag: DW_TAG_member, name: "ans_count", scope: !351, file: !238, line: 54, baseType: !175, size: 16, offset: 48)
!357 = !DIDerivedType(tag: DW_TAG_member, name: "auth_count", scope: !351, file: !238, line: 55, baseType: !175, size: 16, offset: 64)
!358 = !DIDerivedType(tag: DW_TAG_member, name: "add_count", scope: !351, file: !238, line: 56, baseType: !175, size: 16, offset: 80)
!359 = !DILocalVariable(name: "tcp_header", scope: !360, file: !72, line: 538, type: !362)
!360 = distinct !DILexicalBlock(scope: !361, file: !72, line: 536, column: 39)
!361 = distinct !DILexicalBlock(scope: !335, file: !72, line: 536, column: 14)
!362 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !363, size: 64)
!363 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tcphdr", file: !364, line: 25, size: 160, elements: !365)
!364 = !DIFile(filename: "/usr/include/linux/tcp.h", directory: "", checksumkind: CSK_MD5, checksum: "94289bf5e4706e239f7e28899aea608a")
!365 = !{!366, !367, !368, !369, !370, !371, !372, !373, !374, !375, !376, !377, !378, !379, !380, !381, !382, !383}
!366 = !DIDerivedType(tag: DW_TAG_member, name: "source", scope: !363, file: !364, line: 26, baseType: !252, size: 16)
!367 = !DIDerivedType(tag: DW_TAG_member, name: "dest", scope: !363, file: !364, line: 27, baseType: !252, size: 16, offset: 16)
!368 = !DIDerivedType(tag: DW_TAG_member, name: "seq", scope: !363, file: !364, line: 28, baseType: !279, size: 32, offset: 32)
!369 = !DIDerivedType(tag: DW_TAG_member, name: "ack_seq", scope: !363, file: !364, line: 29, baseType: !279, size: 32, offset: 64)
!370 = !DIDerivedType(tag: DW_TAG_member, name: "ae", scope: !363, file: !364, line: 31, baseType: !254, size: 1, offset: 96, flags: DIFlagBitField, extraData: i64 96)
!371 = !DIDerivedType(tag: DW_TAG_member, name: "res1", scope: !363, file: !364, line: 32, baseType: !254, size: 3, offset: 97, flags: DIFlagBitField, extraData: i64 96)
!372 = !DIDerivedType(tag: DW_TAG_member, name: "doff", scope: !363, file: !364, line: 33, baseType: !254, size: 4, offset: 100, flags: DIFlagBitField, extraData: i64 96)
!373 = !DIDerivedType(tag: DW_TAG_member, name: "fin", scope: !363, file: !364, line: 34, baseType: !254, size: 1, offset: 104, flags: DIFlagBitField, extraData: i64 96)
!374 = !DIDerivedType(tag: DW_TAG_member, name: "syn", scope: !363, file: !364, line: 35, baseType: !254, size: 1, offset: 105, flags: DIFlagBitField, extraData: i64 96)
!375 = !DIDerivedType(tag: DW_TAG_member, name: "rst", scope: !363, file: !364, line: 36, baseType: !254, size: 1, offset: 106, flags: DIFlagBitField, extraData: i64 96)
!376 = !DIDerivedType(tag: DW_TAG_member, name: "psh", scope: !363, file: !364, line: 37, baseType: !254, size: 1, offset: 107, flags: DIFlagBitField, extraData: i64 96)
!377 = !DIDerivedType(tag: DW_TAG_member, name: "ack", scope: !363, file: !364, line: 38, baseType: !254, size: 1, offset: 108, flags: DIFlagBitField, extraData: i64 96)
!378 = !DIDerivedType(tag: DW_TAG_member, name: "urg", scope: !363, file: !364, line: 39, baseType: !254, size: 1, offset: 109, flags: DIFlagBitField, extraData: i64 96)
!379 = !DIDerivedType(tag: DW_TAG_member, name: "ece", scope: !363, file: !364, line: 40, baseType: !254, size: 1, offset: 110, flags: DIFlagBitField, extraData: i64 96)
!380 = !DIDerivedType(tag: DW_TAG_member, name: "cwr", scope: !363, file: !364, line: 41, baseType: !254, size: 1, offset: 111, flags: DIFlagBitField, extraData: i64 96)
!381 = !DIDerivedType(tag: DW_TAG_member, name: "window", scope: !363, file: !364, line: 57, baseType: !252, size: 16, offset: 112)
!382 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !363, file: !364, line: 58, baseType: !271, size: 16, offset: 128)
!383 = !DIDerivedType(tag: DW_TAG_member, name: "urg_ptr", scope: !363, file: !364, line: 59, baseType: !252, size: 16, offset: 144)
!384 = !DILocalVariable(name: "length", scope: !360, file: !72, line: 540, type: !60)
!385 = !DILocalVariable(name: "port_source", scope: !360, file: !72, line: 552, type: !57)
!386 = !DILocalVariable(name: "port_dest", scope: !360, file: !72, line: 559, type: !57)
!387 = !DILocalVariable(name: "icmp_header", scope: !388, file: !72, line: 572, type: !390)
!388 = distinct !DILexicalBlock(scope: !389, file: !72, line: 570, column: 40)
!389 = distinct !DILexicalBlock(scope: !361, file: !72, line: 570, column: 14)
!390 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !391, size: 64)
!391 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmphdr", file: !392, line: 89, size: 64, elements: !393)
!392 = !DIFile(filename: "/usr/include/linux/icmp.h", directory: "", checksumkind: CSK_MD5, checksum: "a505632898dce546638b3344627d334b")
!393 = !{!394, !395, !396, !397}
!394 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !391, file: !392, line: 90, baseType: !262, size: 8)
!395 = !DIDerivedType(tag: DW_TAG_member, name: "code", scope: !391, file: !392, line: 91, baseType: !262, size: 8, offset: 8)
!396 = !DIDerivedType(tag: DW_TAG_member, name: "checksum", scope: !391, file: !392, line: 92, baseType: !271, size: 16, offset: 16)
!397 = !DIDerivedType(tag: DW_TAG_member, name: "un", scope: !391, file: !392, line: 104, baseType: !398, size: 32, offset: 32)
!398 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !391, file: !392, line: 93, size: 32, elements: !399)
!399 = !{!400, !405, !406, !411}
!400 = !DIDerivedType(tag: DW_TAG_member, name: "echo", scope: !398, file: !392, line: 97, baseType: !401, size: 32)
!401 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !398, file: !392, line: 94, size: 32, elements: !402)
!402 = !{!403, !404}
!403 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !401, file: !392, line: 95, baseType: !252, size: 16)
!404 = !DIDerivedType(tag: DW_TAG_member, name: "sequence", scope: !401, file: !392, line: 96, baseType: !252, size: 16, offset: 16)
!405 = !DIDerivedType(tag: DW_TAG_member, name: "gateway", scope: !398, file: !392, line: 98, baseType: !279, size: 32)
!406 = !DIDerivedType(tag: DW_TAG_member, name: "frag", scope: !398, file: !392, line: 102, baseType: !407, size: 32)
!407 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !398, file: !392, line: 99, size: 32, elements: !408)
!408 = !{!409, !410}
!409 = !DIDerivedType(tag: DW_TAG_member, name: "__unused", scope: !407, file: !392, line: 100, baseType: !252, size: 16)
!410 = !DIDerivedType(tag: DW_TAG_member, name: "mtu", scope: !407, file: !392, line: 101, baseType: !252, size: 16, offset: 16)
!411 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !398, file: !392, line: 103, baseType: !412, size: 32)
!412 = !DICompositeType(tag: DW_TAG_array_type, baseType: !262, size: 32, elements: !109)
!413 = !DILocalVariable(name: "protocol", scope: !414, file: !72, line: 592, type: !60)
!414 = distinct !DILexicalBlock(scope: !415, file: !72, line: 590, column: 57)
!415 = distinct !DILexicalBlock(scope: !330, file: !72, line: 590, column: 13)
!416 = !DILocalVariable(name: "ipv6_source", scope: !414, file: !72, line: 594, type: !137)
!417 = !DILocalVariable(name: "ipv6_dest", scope: !414, file: !72, line: 597, type: !137)
!418 = !DILocalVariable(name: "udp_header", scope: !419, file: !72, line: 625, type: !336)
!419 = distinct !DILexicalBlock(scope: !420, file: !72, line: 623, column: 33)
!420 = distinct !DILexicalBlock(scope: !421, file: !72, line: 623, column: 8)
!421 = distinct !DILexicalBlock(scope: !422, file: !72, line: 600, column: 20)
!422 = distinct !DILexicalBlock(scope: !414, file: !72, line: 600, column: 7)
!423 = !DILocalVariable(name: "length", scope: !419, file: !72, line: 627, type: !60)
!424 = !DILocalVariable(name: "port_source", scope: !419, file: !72, line: 632, type: !57)
!425 = !DILocalVariable(name: "port_dest", scope: !419, file: !72, line: 639, type: !57)
!426 = !DILocalVariable(name: "tcp_header", scope: !427, file: !72, line: 652, type: !362)
!427 = distinct !DILexicalBlock(scope: !428, file: !72, line: 650, column: 40)
!428 = distinct !DILexicalBlock(scope: !420, file: !72, line: 650, column: 15)
!429 = !DILocalVariable(name: "length", scope: !427, file: !72, line: 654, type: !60)
!430 = !DILocalVariable(name: "port_source", scope: !427, file: !72, line: 666, type: !57)
!431 = !DILocalVariable(name: "port_dest", scope: !427, file: !72, line: 673, type: !57)
!432 = !DILocalVariable(name: "icmp_header", scope: !433, file: !72, line: 686, type: !390)
!433 = distinct !DILexicalBlock(scope: !434, file: !72, line: 684, column: 41)
!434 = distinct !DILexicalBlock(scope: !428, file: !72, line: 684, column: 15)
!435 = !DILocalVariable(name: "icmp6_header", scope: !436, file: !72, line: 702, type: !438)
!436 = distinct !DILexicalBlock(scope: !437, file: !72, line: 700, column: 43)
!437 = distinct !DILexicalBlock(scope: !434, file: !72, line: 700, column: 15)
!438 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !439, size: 64)
!439 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmp6hdr", file: !440, line: 8, size: 64, elements: !441)
!440 = !DIFile(filename: "/usr/include/linux/icmpv6.h", directory: "", checksumkind: CSK_MD5, checksum: "c573774d0b3c9a61b5510be75a6ff374")
!441 = !{!442, !443, !444, !445}
!442 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_type", scope: !439, file: !440, line: 10, baseType: !262, size: 8)
!443 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_code", scope: !439, file: !440, line: 11, baseType: !262, size: 8, offset: 8)
!444 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_cksum", scope: !439, file: !440, line: 12, baseType: !271, size: 16, offset: 16)
!445 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_dataun", scope: !439, file: !440, line: 63, baseType: !446, size: 32, offset: 32)
!446 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !439, file: !440, line: 15, size: 32, elements: !447)
!447 = !{!448, !450, !454, !455, !460, !468}
!448 = !DIDerivedType(tag: DW_TAG_member, name: "un_data32", scope: !446, file: !440, line: 16, baseType: !449, size: 32)
!449 = !DICompositeType(tag: DW_TAG_array_type, baseType: !279, size: 32, elements: !78)
!450 = !DIDerivedType(tag: DW_TAG_member, name: "un_data16", scope: !446, file: !440, line: 17, baseType: !451, size: 32)
!451 = !DICompositeType(tag: DW_TAG_array_type, baseType: !252, size: 32, elements: !452)
!452 = !{!453}
!453 = !DISubrange(count: 2)
!454 = !DIDerivedType(tag: DW_TAG_member, name: "un_data8", scope: !446, file: !440, line: 18, baseType: !412, size: 32)
!455 = !DIDerivedType(tag: DW_TAG_member, name: "u_echo", scope: !446, file: !440, line: 23, baseType: !456, size: 32)
!456 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmpv6_echo", file: !440, line: 20, size: 32, elements: !457)
!457 = !{!458, !459}
!458 = !DIDerivedType(tag: DW_TAG_member, name: "identifier", scope: !456, file: !440, line: 21, baseType: !252, size: 16)
!459 = !DIDerivedType(tag: DW_TAG_member, name: "sequence", scope: !456, file: !440, line: 22, baseType: !252, size: 16, offset: 16)
!460 = !DIDerivedType(tag: DW_TAG_member, name: "u_nd_advt", scope: !446, file: !440, line: 40, baseType: !461, size: 32)
!461 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmpv6_nd_advt", file: !440, line: 25, size: 32, elements: !462)
!462 = !{!463, !464, !465, !466, !467}
!463 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !461, file: !440, line: 27, baseType: !280, size: 5, flags: DIFlagBitField, extraData: i64 0)
!464 = !DIDerivedType(tag: DW_TAG_member, name: "override", scope: !461, file: !440, line: 28, baseType: !280, size: 1, offset: 5, flags: DIFlagBitField, extraData: i64 0)
!465 = !DIDerivedType(tag: DW_TAG_member, name: "solicited", scope: !461, file: !440, line: 29, baseType: !280, size: 1, offset: 6, flags: DIFlagBitField, extraData: i64 0)
!466 = !DIDerivedType(tag: DW_TAG_member, name: "router", scope: !461, file: !440, line: 30, baseType: !280, size: 1, offset: 7, flags: DIFlagBitField, extraData: i64 0)
!467 = !DIDerivedType(tag: DW_TAG_member, name: "reserved2", scope: !461, file: !440, line: 31, baseType: !280, size: 24, offset: 8, flags: DIFlagBitField, extraData: i64 0)
!468 = !DIDerivedType(tag: DW_TAG_member, name: "u_nd_ra", scope: !446, file: !440, line: 61, baseType: !469, size: 32)
!469 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmpv6_nd_ra", file: !440, line: 42, size: 32, elements: !470)
!470 = !{!471, !472, !473, !474, !475, !476, !477}
!471 = !DIDerivedType(tag: DW_TAG_member, name: "hop_limit", scope: !469, file: !440, line: 43, baseType: !262, size: 8)
!472 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !469, file: !440, line: 45, baseType: !262, size: 3, offset: 8, flags: DIFlagBitField, extraData: i64 8)
!473 = !DIDerivedType(tag: DW_TAG_member, name: "router_pref", scope: !469, file: !440, line: 46, baseType: !262, size: 2, offset: 11, flags: DIFlagBitField, extraData: i64 8)
!474 = !DIDerivedType(tag: DW_TAG_member, name: "home_agent", scope: !469, file: !440, line: 47, baseType: !262, size: 1, offset: 13, flags: DIFlagBitField, extraData: i64 8)
!475 = !DIDerivedType(tag: DW_TAG_member, name: "other", scope: !469, file: !440, line: 48, baseType: !262, size: 1, offset: 14, flags: DIFlagBitField, extraData: i64 8)
!476 = !DIDerivedType(tag: DW_TAG_member, name: "managed", scope: !469, file: !440, line: 49, baseType: !262, size: 1, offset: 15, flags: DIFlagBitField, extraData: i64 8)
!477 = !DIDerivedType(tag: DW_TAG_member, name: "rt_lifetime", scope: !469, file: !440, line: 60, baseType: !252, size: 16, offset: 16)
!478 = distinct !DIAssignID()
!479 = distinct !DIAssignID()
!480 = !DILocalVariable(name: "value", scope: !481, file: !72, line: 145, type: !66)
!481 = distinct !DILexicalBlock(scope: !482, file: !72, line: 143, column: 24)
!482 = distinct !DILexicalBlock(scope: !483, file: !72, line: 143, column: 6)
!483 = distinct !DISubprogram(name: "warn_ipv6", scope: !72, file: !72, line: 137, type: !484, scopeLine: 137, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !487, keyInstructions: true)
!484 = !DISubroutineType(types: !485)
!485 = !{!486, !136}
!486 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!487 = !{!488, !489, !480, !490, !493}
!488 = !DILocalVariable(name: "subnet", arg: 1, scope: !483, file: !72, line: 137, type: !136)
!489 = !DILocalVariable(name: "warnings", scope: !483, file: !72, line: 139, type: !90)
!490 = !DILocalVariable(name: "banned", scope: !491, file: !72, line: 152, type: !66)
!491 = distinct !DILexicalBlock(scope: !492, file: !72, line: 150, column: 19)
!492 = distinct !DILexicalBlock(scope: !481, file: !72, line: 150, column: 7)
!493 = !DILocalVariable(name: "value", scope: !494, file: !72, line: 160, type: !66)
!494 = distinct !DILexicalBlock(scope: !482, file: !72, line: 158, column: 9)
!495 = !DILocation(line: 0, scope: !481, inlinedAt: !496)
!496 = distinct !DILocation(line: 663, column: 6, scope: !497)
!497 = distinct !DILexicalBlock(scope: !498, file: !72, line: 662, column: 61)
!498 = distinct !DILexicalBlock(scope: !499, file: !72, line: 662, column: 16)
!499 = distinct !DILexicalBlock(scope: !427, file: !72, line: 660, column: 9)
!500 = distinct !DIAssignID()
!501 = !DILocation(line: 0, scope: !491, inlinedAt: !496)
!502 = distinct !DIAssignID()
!503 = distinct !DIAssignID()
!504 = !DILocalVariable(name: "source_socket", scope: !505, file: !72, line: 262, type: !185)
!505 = distinct !DISubprogram(name: "is_filtered_ipv6_socket_pair", scope: !72, file: !72, line: 260, type: !506, scopeLine: 260, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !508, keyInstructions: true)
!506 = !DISubroutineType(types: !507)
!507 = !{!486, !288, !175, !175}
!508 = !{!509, !510, !511, !504, !512}
!509 = !DILocalVariable(name: "ipv6_header", arg: 1, scope: !505, file: !72, line: 260, type: !288)
!510 = !DILocalVariable(name: "source_port", arg: 2, scope: !505, file: !72, line: 260, type: !175)
!511 = !DILocalVariable(name: "dest_port", arg: 3, scope: !505, file: !72, line: 260, type: !175)
!512 = !DILocalVariable(name: "dest_socket", scope: !505, file: !72, line: 263, type: !185)
!513 = !DILocation(line: 0, scope: !505, inlinedAt: !514)
!514 = distinct !DILocation(line: 646, column: 9, scope: !515)
!515 = distinct !DILexicalBlock(scope: !419, file: !72, line: 646, column: 9)
!516 = distinct !DIAssignID()
!517 = distinct !DIAssignID()
!518 = !DILocation(line: 0, scope: !505, inlinedAt: !519)
!519 = distinct !DILocation(line: 680, column: 9, scope: !520)
!520 = distinct !DILexicalBlock(scope: !427, file: !72, line: 680, column: 9)
!521 = distinct !DIAssignID()
!522 = distinct !DIAssignID()
!523 = !DILocalVariable(name: "value", scope: !524, file: !72, line: 113, type: !66)
!524 = distinct !DILexicalBlock(scope: !525, file: !72, line: 111, column: 24)
!525 = distinct !DILexicalBlock(scope: !526, file: !72, line: 111, column: 6)
!526 = distinct !DISubprogram(name: "warn_ipv4", scope: !72, file: !72, line: 105, type: !527, scopeLine: 105, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !529, keyInstructions: true)
!527 = !DISubroutineType(types: !528)
!528 = !{!486, !102}
!529 = !{!530, !531, !523, !532, !535}
!530 = !DILocalVariable(name: "subnet", arg: 1, scope: !526, file: !72, line: 105, type: !102)
!531 = !DILocalVariable(name: "warnings", scope: !526, file: !72, line: 107, type: !90)
!532 = !DILocalVariable(name: "banned", scope: !533, file: !72, line: 120, type: !66)
!533 = distinct !DILexicalBlock(scope: !534, file: !72, line: 118, column: 19)
!534 = distinct !DILexicalBlock(scope: !524, file: !72, line: 118, column: 7)
!535 = !DILocalVariable(name: "value", scope: !536, file: !72, line: 128, type: !66)
!536 = distinct !DILexicalBlock(scope: !525, file: !72, line: 126, column: 9)
!537 = !DILocation(line: 0, scope: !524, inlinedAt: !538)
!538 = distinct !DILocation(line: 549, column: 5, scope: !539)
!539 = distinct !DILexicalBlock(scope: !540, file: !72, line: 548, column: 60)
!540 = distinct !DILexicalBlock(scope: !541, file: !72, line: 548, column: 15)
!541 = distinct !DILexicalBlock(scope: !360, file: !72, line: 546, column: 8)
!542 = distinct !DIAssignID()
!543 = !DILocation(line: 0, scope: !533, inlinedAt: !538)
!544 = distinct !DIAssignID()
!545 = distinct !DIAssignID()
!546 = !DILocalVariable(name: "source_socket", scope: !547, file: !72, line: 241, type: !171)
!547 = distinct !DISubprogram(name: "is_filtered_ipv4_socket_pair", scope: !72, file: !72, line: 239, type: !548, scopeLine: 239, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !550, keyInstructions: true)
!548 = !DISubroutineType(types: !549)
!549 = !{!486, !257, !175, !175}
!550 = !{!551, !552, !553, !546, !554}
!551 = !DILocalVariable(name: "ipv4_header", arg: 1, scope: !547, file: !72, line: 239, type: !257)
!552 = !DILocalVariable(name: "source_port", arg: 2, scope: !547, file: !72, line: 239, type: !175)
!553 = !DILocalVariable(name: "dest_port", arg: 3, scope: !547, file: !72, line: 239, type: !175)
!554 = !DILocalVariable(name: "dest_socket", scope: !547, file: !72, line: 242, type: !171)
!555 = !DILocation(line: 0, scope: !547, inlinedAt: !556)
!556 = distinct !DILocation(line: 511, column: 8, scope: !557)
!557 = distinct !DILexicalBlock(scope: !334, file: !72, line: 511, column: 8)
!558 = distinct !DIAssignID()
!559 = distinct !DIAssignID()
!560 = !DILocation(line: 0, scope: !547, inlinedAt: !561)
!561 = distinct !DILocation(line: 566, column: 8, scope: !562)
!562 = distinct !DILexicalBlock(scope: !360, file: !72, line: 566, column: 8)
!563 = distinct !DIAssignID()
!564 = distinct !DIAssignID()
!565 = distinct !DIAssignID()
!566 = distinct !DIAssignID()
!567 = distinct !DIAssignID()
!568 = distinct !DIAssignID()
!569 = distinct !DIAssignID()
!570 = distinct !DIAssignID()
!571 = distinct !DIAssignID()
!572 = !DILocalVariable(name: "nh", arg: 1, scope: !573, file: !238, line: 74, type: !576)
!573 = distinct !DISubprogram(name: "skip_ip6hdrext", scope: !238, file: !238, line: 74, type: !574, scopeLine: 74, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !577, keyInstructions: true)
!574 = !DISubroutineType(types: !575)
!575 = !{!60, !576, !55, !66}
!576 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !237, size: 64)
!577 = !{!572, !578, !579, !580, !582}
!578 = !DILocalVariable(name: "data_end", arg: 2, scope: !573, file: !238, line: 74, type: !55)
!579 = !DILocalVariable(name: "next_hdr_type", arg: 3, scope: !573, file: !238, line: 74, type: !66)
!580 = !DILocalVariable(name: "i", scope: !581, file: !238, line: 76, type: !60)
!581 = distinct !DILexicalBlock(scope: !573, file: !238, line: 76, column: 2)
!582 = !DILocalVariable(name: "hdr", scope: !583, file: !238, line: 78, type: !585)
!583 = distinct !DILexicalBlock(scope: !584, file: !238, line: 76, column: 46)
!584 = distinct !DILexicalBlock(scope: !581, file: !238, line: 76, column: 2)
!585 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !586, size: 64)
!586 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipv6_opt_hdr", file: !290, line: 63, size: 16, elements: !587)
!587 = !{!588, !589}
!588 = !DIDerivedType(tag: DW_TAG_member, name: "nexthdr", scope: !586, file: !290, line: 64, baseType: !262, size: 8)
!589 = !DIDerivedType(tag: DW_TAG_member, name: "hdrlen", scope: !586, file: !290, line: 65, baseType: !262, size: 8, offset: 8)
!590 = !DILocation(line: 0, scope: !573, inlinedAt: !591)
!591 = distinct !DILocation(line: 201, column: 9, scope: !592, inlinedAt: !601)
!592 = distinct !DISubprogram(name: "parse_ipv6hdr", scope: !238, file: !238, line: 190, type: !593, scopeLine: 190, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !596, keyInstructions: true)
!593 = !DISubroutineType(types: !594)
!594 = !{!60, !576, !55, !595}
!595 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !288, size: 64)
!596 = !{!597, !598, !599, !600}
!597 = !DILocalVariable(name: "nh", arg: 1, scope: !592, file: !238, line: 190, type: !576)
!598 = !DILocalVariable(name: "data_end", arg: 2, scope: !592, file: !238, line: 190, type: !55)
!599 = !DILocalVariable(name: "ip6hdr", arg: 3, scope: !592, file: !238, line: 190, type: !595)
!600 = !DILocalVariable(name: "ip6h", scope: !592, file: !238, line: 192, type: !288)
!601 = distinct !DILocation(line: 592, column: 18, scope: !414)
!602 = !DILocalVariable(name: "nh", arg: 1, scope: !603, file: !238, line: 205, type: !576)
!603 = distinct !DISubprogram(name: "parse_icmp6hdr", scope: !238, file: !238, line: 205, type: !604, scopeLine: 205, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !607, keyInstructions: true)
!604 = !DISubroutineType(types: !605)
!605 = !{!60, !576, !55, !606}
!606 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !438, size: 64)
!607 = !{!602, !608, !609, !610}
!608 = !DILocalVariable(name: "data_end", arg: 2, scope: !603, file: !238, line: 205, type: !55)
!609 = !DILocalVariable(name: "icmp6hdr", arg: 3, scope: !603, file: !238, line: 205, type: !606)
!610 = !DILocalVariable(name: "icmp6h", scope: !603, file: !238, line: 207, type: !438)
!611 = !DILocation(line: 0, scope: !603, inlinedAt: !612)
!612 = distinct !DILocation(line: 704, column: 5, scope: !436)
!613 = !DILocation(line: 0, scope: !592, inlinedAt: !601)
!614 = !DILocalVariable(name: "nh", arg: 1, scope: !615, file: !238, line: 175, type: !576)
!615 = distinct !DISubprogram(name: "parse_icmphdr", scope: !238, file: !238, line: 175, type: !616, scopeLine: 175, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !619, keyInstructions: true)
!616 = !DISubroutineType(types: !617)
!617 = !{!60, !576, !55, !618}
!618 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !390, size: 64)
!619 = !{!614, !620, !621, !622}
!620 = !DILocalVariable(name: "data_end", arg: 2, scope: !615, file: !238, line: 175, type: !55)
!621 = !DILocalVariable(name: "icmphdr", arg: 3, scope: !615, file: !238, line: 175, type: !618)
!622 = !DILocalVariable(name: "icmph", scope: !615, file: !238, line: 177, type: !390)
!623 = !DILocation(line: 0, scope: !615, inlinedAt: !624)
!624 = distinct !DILocation(line: 574, column: 4, scope: !388)
!625 = !DILocation(line: 0, scope: !615, inlinedAt: !626)
!626 = distinct !DILocation(line: 688, column: 5, scope: !433)
!627 = !DILocalVariable(name: "nh", arg: 1, scope: !628, file: !238, line: 241, type: !576)
!628 = distinct !DISubprogram(name: "parse_tcphdr", scope: !238, file: !238, line: 241, type: !629, scopeLine: 241, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !632, keyInstructions: true)
!629 = !DISubroutineType(types: !630)
!630 = !{!60, !576, !55, !631}
!631 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !362, size: 64)
!632 = !{!627, !633, !634, !635, !636}
!633 = !DILocalVariable(name: "data_end", arg: 2, scope: !628, file: !238, line: 241, type: !55)
!634 = !DILocalVariable(name: "tcphdr", arg: 3, scope: !628, file: !238, line: 241, type: !631)
!635 = !DILocalVariable(name: "len", scope: !628, file: !238, line: 243, type: !60)
!636 = !DILocalVariable(name: "tcph", scope: !628, file: !238, line: 244, type: !362)
!637 = !DILocation(line: 0, scope: !628, inlinedAt: !638)
!638 = distinct !DILocation(line: 540, column: 17, scope: !360)
!639 = !DILocation(line: 0, scope: !628, inlinedAt: !640)
!640 = distinct !DILocation(line: 654, column: 18, scope: !427)
!641 = !DILocalVariable(name: "cursor", arg: 1, scope: !642, file: !72, line: 297, type: !576)
!642 = distinct !DISubprogram(name: "filter_dns", scope: !72, file: !72, line: 297, type: !643, scopeLine: 297, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !645, keyInstructions: true)
!643 = !DISubroutineType(types: !644)
!644 = !{!486, !576, !55, !350}
!645 = !{!641, !646, !647, !648, !649, !650, !651}
!646 = !DILocalVariable(name: "data_end", arg: 2, scope: !642, file: !72, line: 297, type: !55)
!647 = !DILocalVariable(name: "dns_header", arg: 3, scope: !642, file: !72, line: 297, type: !350)
!648 = !DILocalVariable(name: "flags", scope: !642, file: !72, line: 303, type: !57)
!649 = !DILocalVariable(name: "q_count", scope: !642, file: !72, line: 309, type: !57)
!650 = !DILocalVariable(name: "banned_hash", scope: !642, file: !72, line: 315, type: !87)
!651 = !DILocalVariable(name: "next", scope: !642, file: !72, line: 316, type: !55)
!652 = !DILocation(line: 0, scope: !642, inlinedAt: !653)
!653 = distinct !DILocation(line: 527, column: 10, scope: !654)
!654 = distinct !DILexicalBlock(scope: !655, file: !72, line: 527, column: 10)
!655 = distinct !DILexicalBlock(scope: !656, file: !72, line: 526, column: 60)
!656 = distinct !DILexicalBlock(scope: !348, file: !72, line: 526, column: 9)
!657 = !DILocalVariable(name: "nh", arg: 1, scope: !658, file: !238, line: 268, type: !576)
!658 = distinct !DISubprogram(name: "parse_dnshdr", scope: !238, file: !238, line: 268, type: !659, scopeLine: 268, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !662, keyInstructions: true)
!659 = !DISubroutineType(types: !660)
!660 = !{!60, !576, !55, !661}
!661 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !350, size: 64)
!662 = !{!657, !663, !664, !665}
!663 = !DILocalVariable(name: "data_end", arg: 2, scope: !658, file: !238, line: 268, type: !55)
!664 = !DILocalVariable(name: "dnshdr", arg: 3, scope: !658, file: !238, line: 268, type: !661)
!665 = !DILocalVariable(name: "dnsh", scope: !658, file: !238, line: 270, type: !350)
!666 = !DILocation(line: 0, scope: !658, inlinedAt: !667)
!667 = distinct !DILocation(line: 526, column: 9, scope: !656)
!668 = !DILocalVariable(name: "nh", arg: 1, scope: !669, file: !238, line: 220, type: !576)
!669 = distinct !DISubprogram(name: "parse_udphdr", scope: !238, file: !238, line: 220, type: !670, scopeLine: 220, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !673, keyInstructions: true)
!670 = !DISubroutineType(types: !671)
!671 = !{!60, !576, !55, !672}
!672 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !336, size: 64)
!673 = !{!668, !674, !675, !676, !677}
!674 = !DILocalVariable(name: "data_end", arg: 2, scope: !669, file: !238, line: 220, type: !55)
!675 = !DILocalVariable(name: "udphdr", arg: 3, scope: !669, file: !238, line: 220, type: !672)
!676 = !DILocalVariable(name: "len", scope: !669, file: !238, line: 222, type: !60)
!677 = !DILocalVariable(name: "udph", scope: !669, file: !238, line: 223, type: !336)
!678 = !DILocation(line: 0, scope: !669, inlinedAt: !679)
!679 = distinct !DILocation(line: 492, column: 17, scope: !334)
!680 = !DILocation(line: 0, scope: !669, inlinedAt: !681)
!681 = distinct !DILocation(line: 627, column: 18, scope: !419)
!682 = !DILocalVariable(name: "nh", arg: 1, scope: !683, file: !238, line: 152, type: !576)
!683 = distinct !DISubprogram(name: "parse_iphdr", scope: !238, file: !238, line: 152, type: !684, scopeLine: 152, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !687, keyInstructions: true)
!684 = !DISubroutineType(types: !685)
!685 = !{!60, !576, !55, !686}
!686 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !257, size: 64)
!687 = !{!682, !688, !689, !690, !691}
!688 = !DILocalVariable(name: "data_end", arg: 2, scope: !683, file: !238, line: 152, type: !55)
!689 = !DILocalVariable(name: "iphdr", arg: 3, scope: !683, file: !238, line: 152, type: !686)
!690 = !DILocalVariable(name: "iph", scope: !683, file: !238, line: 154, type: !257)
!691 = !DILocalVariable(name: "hdrsize", scope: !683, file: !238, line: 155, type: !60)
!692 = !DILocation(line: 0, scope: !683, inlinedAt: !693)
!693 = distinct !DILocation(line: 455, column: 18, scope: !329)
!694 = !DILocalVariable(name: "nh", arg: 1, scope: !695, file: !238, line: 112, type: !576)
!695 = distinct !DISubprogram(name: "parse_ethhdr", scope: !238, file: !238, line: 112, type: !696, scopeLine: 112, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !699, keyInstructions: true)
!696 = !DISubroutineType(types: !697)
!697 = !{!60, !576, !55, !698}
!698 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !242, size: 64)
!699 = !{!694, !700, !701, !702, !703, !709, !710}
!700 = !DILocalVariable(name: "data_end", arg: 2, scope: !695, file: !238, line: 112, type: !55)
!701 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !695, file: !238, line: 112, type: !698)
!702 = !DILocalVariable(name: "eth", scope: !695, file: !238, line: 114, type: !242)
!703 = !DILocalVariable(name: "vlh", scope: !695, file: !238, line: 115, type: !704)
!704 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !705, size: 64)
!705 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vlanhdr", file: !238, line: 45, size: 32, elements: !706)
!706 = !{!707, !708}
!707 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_TCI", scope: !705, file: !238, line: 46, baseType: !175, size: 16)
!708 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_encapsulated_proto", scope: !705, file: !238, line: 47, baseType: !175, size: 16, offset: 16)
!709 = !DILocalVariable(name: "h_proto", scope: !695, file: !238, line: 116, type: !57)
!710 = !DILocalVariable(name: "i", scope: !695, file: !238, line: 117, type: !60)
!711 = !DILocation(line: 0, scope: !695, inlinedAt: !712)
!712 = distinct !DILocation(line: 446, column: 22, scope: !219)
!713 = distinct !DIAssignID()
!714 = !DILocation(line: 0, scope: !329)
!715 = distinct !DIAssignID()
!716 = distinct !DIAssignID()
!717 = !DILocation(line: 0, scope: !414)
!718 = distinct !DIAssignID()
!719 = !DILocation(line: 0, scope: !219)
!720 = !DILocation(line: 432, column: 38, scope: !219)
!721 = !DILocation(line: 432, column: 38, scope: !219, atomGroup: 1, atomRank: 4)
!722 = !{!723, !216, i64 4}
!723 = !{!"xdp_md", !216, i64 0, !216, i64 4, !216, i64 8, !216, i64 12, !216, i64 16, !216, i64 20}
!724 = !DILocation(line: 432, column: 27, scope: !219, atomGroup: 1, atomRank: 3)
!725 = !DILocation(line: 432, column: 19, scope: !219, atomGroup: 1, atomRank: 2)
!726 = !DILocation(line: 433, column: 34, scope: !219, atomGroup: 2, atomRank: 4)
!727 = !{!723, !216, i64 0}
!728 = !DILocation(line: 433, column: 23, scope: !219, atomGroup: 2, atomRank: 3)
!729 = !DILocation(line: 433, column: 15, scope: !219, atomGroup: 2, atomRank: 2)
!730 = !DILocation(line: 435, column: 11, scope: !731)
!731 = distinct !DILexicalBlock(scope: !219, file: !72, line: 435, column: 6)
!732 = !DILocation(line: 435, column: 35, scope: !731, atomGroup: 3, atomRank: 2)
!733 = !DILocation(line: 435, column: 35, scope: !731, atomGroup: 3, atomRank: 1)
!734 = !DILocation(line: 125, column: 17, scope: !695, inlinedAt: !712)
!735 = !{!736, !736, i64 0}
!736 = !{!"short", !217, i64 0}
!737 = !DILocalVariable(name: "h_proto", arg: 1, scope: !738, file: !238, line: 70, type: !57)
!738 = distinct !DISubprogram(name: "proto_is_vlan", scope: !238, file: !238, line: 70, type: !739, scopeLine: 70, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !741, keyInstructions: true)
!739 = !DISubroutineType(types: !740)
!740 = !{!60, !57}
!741 = !{!737}
!742 = !DILocation(line: 0, scope: !738, inlinedAt: !743)
!743 = distinct !DILocation(line: 133, column: 8, scope: !744, inlinedAt: !712)
!744 = distinct !DILexicalBlock(scope: !745, file: !238, line: 133, column: 7)
!745 = distinct !DILexicalBlock(scope: !746, file: !238, line: 131, column: 39)
!746 = distinct !DILexicalBlock(scope: !747, file: !238, line: 131, column: 2)
!747 = distinct !DILexicalBlock(scope: !695, file: !238, line: 131, column: 2)
!748 = !DILocation(line: 71, column: 20, scope: !738, inlinedAt: !743, atomGroup: 2, atomRank: 2)
!749 = !DILocation(line: 71, column: 46, scope: !738, inlinedAt: !743, atomGroup: 2, atomRank: 1)
!750 = !DILocation(line: 133, column: 7, scope: !744, inlinedAt: !712, atomGroup: 11, atomRank: 1)
!751 = !DILocation(line: 137, column: 11, scope: !752, inlinedAt: !712)
!752 = distinct !DILexicalBlock(scope: !745, file: !238, line: 137, column: 7)
!753 = !DILocation(line: 137, column: 15, scope: !752, inlinedAt: !712, atomGroup: 13, atomRank: 2)
!754 = !DILocation(line: 137, column: 15, scope: !752, inlinedAt: !712, atomGroup: 13, atomRank: 1)
!755 = !DILocation(line: 141, column: 18, scope: !745, inlinedAt: !712)
!756 = !DILocation(line: 71, column: 20, scope: !738, inlinedAt: !743, atomGroup: 145, atomRank: 2)
!757 = !DILocation(line: 71, column: 46, scope: !738, inlinedAt: !743, atomGroup: 145, atomRank: 1)
!758 = !DILocation(line: 133, column: 7, scope: !744, inlinedAt: !712, atomGroup: 146, atomRank: 1)
!759 = !DILocation(line: 137, column: 15, scope: !752, inlinedAt: !712, atomGroup: 147, atomRank: 2)
!760 = !DILocation(line: 137, column: 15, scope: !752, inlinedAt: !712, atomGroup: 147, atomRank: 1)
!761 = !DILocation(line: 71, column: 20, scope: !738, inlinedAt: !743, atomGroup: 151, atomRank: 2)
!762 = !DILocation(line: 71, column: 46, scope: !738, inlinedAt: !743, atomGroup: 151, atomRank: 1)
!763 = !DILocation(line: 133, column: 7, scope: !744, inlinedAt: !712, atomGroup: 152, atomRank: 1)
!764 = !DILocation(line: 137, column: 15, scope: !752, inlinedAt: !712, atomGroup: 153, atomRank: 2)
!765 = !DILocation(line: 137, column: 15, scope: !752, inlinedAt: !712, atomGroup: 153, atomRank: 1)
!766 = !DILocation(line: 71, column: 20, scope: !738, inlinedAt: !743, atomGroup: 157, atomRank: 2)
!767 = !DILocation(line: 71, column: 46, scope: !738, inlinedAt: !743, atomGroup: 157, atomRank: 1)
!768 = !DILocation(line: 133, column: 7, scope: !744, inlinedAt: !712, atomGroup: 158, atomRank: 1)
!769 = !DILocation(line: 137, column: 15, scope: !752, inlinedAt: !712, atomGroup: 159, atomRank: 2)
!770 = !DILocation(line: 137, column: 15, scope: !752, inlinedAt: !712, atomGroup: 159, atomRank: 1)
!771 = !DILocation(line: 131, column: 2, scope: !747, inlinedAt: !712, atomGroup: 162, atomRank: 1)
!772 = !DILocation(line: 453, column: 24, scope: !330, atomGroup: 10, atomRank: 1)
!773 = !DILocation(line: 157, column: 10, scope: !774, inlinedAt: !693)
!774 = distinct !DILexicalBlock(scope: !683, file: !238, line: 157, column: 6)
!775 = !DILocation(line: 157, column: 14, scope: !774, inlinedAt: !693, atomGroup: 2, atomRank: 2)
!776 = !DILocation(line: 157, column: 14, scope: !774, inlinedAt: !693, atomGroup: 2, atomRank: 1)
!777 = !DILocation(line: 161, column: 17, scope: !683, inlinedAt: !693)
!778 = !DILocation(line: 161, column: 21, scope: !683, inlinedAt: !693, atomGroup: 4, atomRank: 2)
!779 = !DILocation(line: 164, column: 14, scope: !780, inlinedAt: !693)
!780 = distinct !DILexicalBlock(scope: !683, file: !238, line: 164, column: 6)
!781 = !DILocation(line: 164, column: 24, scope: !780, inlinedAt: !693, atomGroup: 5, atomRank: 2)
!782 = !DILocation(line: 164, column: 24, scope: !780, inlinedAt: !693, atomGroup: 5, atomRank: 1)
!783 = !DILocation(line: 457, column: 3, scope: !329)
!784 = distinct !DIAssignID()
!785 = !DILocation(line: 460, column: 3, scope: !329)
!786 = distinct !DIAssignID()
!787 = !DILocation(line: 488, column: 16, scope: !335, atomGroup: 21, atomRank: 1)
!788 = !DILocation(line: 171, column: 14, scope: !683, inlinedAt: !693)
!789 = !DILocation(line: 171, column: 14, scope: !683, inlinedAt: !693, atomGroup: 9, atomRank: 3)
!790 = !{!791, !217, i64 9}
!791 = !{!"iphdr", !217, i64 0, !217, i64 0, !217, i64 1, !736, i64 2, !736, i64 4, !736, i64 6, !217, i64 8, !217, i64 9, !736, i64 10, !217, i64 12}
!792 = !DILocation(line: 458, column: 25, scope: !329, atomGroup: 12, atomRank: 1)
!793 = !{!794, !216, i64 0}
!794 = !{!"ipv4_subnet", !216, i64 0, !217, i64 4}
!795 = !DILocation(line: 461, column: 23, scope: !329, atomGroup: 13, atomRank: 1)
!796 = !DILocation(line: 465, column: 24, scope: !797)
!797 = distinct !DILexicalBlock(scope: !798, file: !72, line: 463, column: 20)
!798 = distinct !DILexicalBlock(scope: !329, file: !72, line: 463, column: 7)
!799 = !DILocation(line: 465, column: 47, scope: !797)
!800 = !DILocation(line: 465, column: 4, scope: !797, atomGroup: 15, atomRank: 1)
!801 = distinct !DIAssignID()
!802 = !DILocation(line: 466, column: 22, scope: !797)
!803 = !DILocation(line: 466, column: 45, scope: !797)
!804 = !DILocation(line: 466, column: 4, scope: !797, atomGroup: 16, atomRank: 1)
!805 = distinct !DIAssignID()
!806 = !DILocalVariable(name: "subnet", arg: 1, scope: !807, file: !72, line: 169, type: !102)
!807 = distinct !DISubprogram(name: "is_filtered_ipv4", scope: !72, file: !72, line: 169, type: !527, scopeLine: 169, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !808, keyInstructions: true)
!808 = !{!806, !809}
!809 = !DILocalVariable(name: "banned", scope: !807, file: !72, line: 171, type: !90)
!810 = !DILocation(line: 0, scope: !807, inlinedAt: !811)
!811 = distinct !DILocation(line: 468, column: 8, scope: !812)
!812 = distinct !DILexicalBlock(scope: !797, file: !72, line: 468, column: 8)
!813 = !DILocation(line: 173, column: 11, scope: !807, inlinedAt: !811, atomGroup: 2, atomRank: 2)
!814 = !DILocation(line: 175, column: 13, scope: !815, inlinedAt: !811, atomGroup: 3, atomRank: 2)
!815 = distinct !DILexicalBlock(scope: !807, file: !72, line: 175, column: 6)
!816 = !DILocation(line: 175, column: 21, scope: !815, inlinedAt: !811, atomGroup: 3, atomRank: 1)
!817 = !DILocation(line: 175, column: 24, scope: !815, inlinedAt: !811)
!818 = !{!217, !217, i64 0}
!819 = !DILocation(line: 175, column: 32, scope: !815, inlinedAt: !811, atomGroup: 4, atomRank: 2)
!820 = !DILocation(line: 175, column: 21, scope: !815, inlinedAt: !811, atomGroup: 4, atomRank: 1)
!821 = !DILocation(line: 0, scope: !807, inlinedAt: !822)
!822 = distinct !DILocation(line: 476, column: 15, scope: !823)
!823 = distinct !DILexicalBlock(scope: !812, file: !72, line: 476, column: 15)
!824 = !DILocation(line: 173, column: 11, scope: !807, inlinedAt: !822, atomGroup: 2, atomRank: 2)
!825 = !DILocation(line: 175, column: 13, scope: !815, inlinedAt: !822, atomGroup: 3, atomRank: 2)
!826 = !DILocation(line: 175, column: 21, scope: !815, inlinedAt: !822, atomGroup: 3, atomRank: 1)
!827 = !DILocation(line: 175, column: 24, scope: !815, inlinedAt: !822)
!828 = !DILocation(line: 175, column: 32, scope: !815, inlinedAt: !822, atomGroup: 4, atomRank: 2)
!829 = !DILocation(line: 175, column: 21, scope: !815, inlinedAt: !822, atomGroup: 4, atomRank: 1)
!830 = !DILocation(line: 0, scope: !334)
!831 = !DILocation(line: 225, column: 11, scope: !832, inlinedAt: !679)
!832 = distinct !DILexicalBlock(scope: !669, file: !238, line: 225, column: 6)
!833 = !DILocation(line: 225, column: 15, scope: !832, inlinedAt: !679, atomGroup: 2, atomRank: 2)
!834 = !DILocation(line: 225, column: 15, scope: !832, inlinedAt: !679, atomGroup: 2, atomRank: 1)
!835 = !DILocation(line: 232, column: 24, scope: !669, inlinedAt: !679)
!836 = !{!837, !736, i64 4}
!837 = !{!"udphdr", !736, i64 0, !736, i64 2, !736, i64 4, !736, i64 6}
!838 = !DILocation(line: 232, column: 8, scope: !669, inlinedAt: !679)
!839 = !DILocation(line: 233, column: 10, scope: !840, inlinedAt: !679, atomGroup: 8, atomRank: 2)
!840 = distinct !DILexicalBlock(scope: !669, file: !238, line: 233, column: 6)
!841 = !DILocation(line: 233, column: 10, scope: !840, inlinedAt: !679, atomGroup: 8, atomRank: 1)
!842 = !DILocation(line: 497, column: 36, scope: !334, atomGroup: 26, atomRank: 2)
!843 = !{!837, !736, i64 0}
!844 = !DILocalVariable(name: "port", arg: 1, scope: !845, file: !72, line: 197, type: !57)
!845 = distinct !DISubprogram(name: "is_filtered_port", scope: !72, file: !72, line: 197, type: !846, scopeLine: 197, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !848, keyInstructions: true)
!846 = !DISubroutineType(types: !847)
!847 = !{!486, !57}
!848 = !{!844, !849}
!849 = !DILocalVariable(name: "blocked_port", scope: !845, file: !72, line: 199, type: !90)
!850 = !DILocation(line: 0, scope: !845, inlinedAt: !851)
!851 = distinct !DILocation(line: 500, column: 8, scope: !852)
!852 = distinct !DILexicalBlock(scope: !334, file: !72, line: 500, column: 8)
!853 = distinct !DIAssignID()
!854 = !DILocation(line: 201, column: 17, scope: !845, inlinedAt: !851, atomGroup: 2, atomRank: 2)
!855 = !DILocation(line: 203, column: 19, scope: !856, inlinedAt: !851, atomGroup: 3, atomRank: 2)
!856 = distinct !DILexicalBlock(scope: !845, file: !72, line: 203, column: 6)
!857 = !DILocation(line: 203, column: 27, scope: !856, inlinedAt: !851, atomGroup: 3, atomRank: 1)
!858 = !DILocation(line: 203, column: 30, scope: !856, inlinedAt: !851)
!859 = !DILocation(line: 203, column: 44, scope: !856, inlinedAt: !851, atomGroup: 4, atomRank: 2)
!860 = !DILocation(line: 203, column: 27, scope: !856, inlinedAt: !851, atomGroup: 4, atomRank: 1)
!861 = !DILocation(line: 209, column: 1, scope: !845, inlinedAt: !851, atomGroup: 120, atomRank: 1)
!862 = !DILocation(line: 500, column: 38, scope: !852, atomGroup: 27, atomRank: 1)
!863 = !DILocation(line: 209, column: 1, scope: !845, inlinedAt: !851, atomGroup: 7, atomRank: 1)
!864 = !DILocation(line: 504, column: 34, scope: !334)
!865 = !DILocation(line: 504, column: 34, scope: !334, atomGroup: 29, atomRank: 2)
!866 = !{!837, !736, i64 2}
!867 = !DILocation(line: 0, scope: !845, inlinedAt: !868)
!868 = distinct !DILocation(line: 507, column: 8, scope: !869)
!869 = distinct !DILexicalBlock(scope: !334, file: !72, line: 507, column: 8)
!870 = distinct !DIAssignID()
!871 = !DILocation(line: 201, column: 17, scope: !845, inlinedAt: !868, atomGroup: 2, atomRank: 2)
!872 = !DILocation(line: 203, column: 19, scope: !856, inlinedAt: !868, atomGroup: 3, atomRank: 2)
!873 = !DILocation(line: 203, column: 27, scope: !856, inlinedAt: !868, atomGroup: 3, atomRank: 1)
!874 = !DILocation(line: 203, column: 30, scope: !856, inlinedAt: !868)
!875 = !DILocation(line: 203, column: 44, scope: !856, inlinedAt: !868, atomGroup: 4, atomRank: 2)
!876 = !DILocation(line: 203, column: 27, scope: !856, inlinedAt: !868, atomGroup: 4, atomRank: 1)
!877 = !DILocation(line: 209, column: 1, scope: !845, inlinedAt: !868, atomGroup: 121, atomRank: 1)
!878 = !DILocation(line: 507, column: 36, scope: !869, atomGroup: 30, atomRank: 1)
!879 = !DILocation(line: 209, column: 1, scope: !845, inlinedAt: !868, atomGroup: 7, atomRank: 1)
!880 = !DILocation(line: 241, column: 2, scope: !547, inlinedAt: !556)
!881 = !DILocation(line: 242, column: 2, scope: !547, inlinedAt: !556)
!882 = !DILocation(line: 244, column: 16, scope: !547, inlinedAt: !556)
!883 = !DILocation(line: 244, column: 21, scope: !547, inlinedAt: !556, atomGroup: 1, atomRank: 1)
!884 = !{!885, !736, i64 4}
!885 = !{!"ipv4_socket", !217, i64 0, !736, i64 4}
!886 = distinct !DIAssignID()
!887 = !DILocation(line: 245, column: 14, scope: !547, inlinedAt: !556)
!888 = !DILocation(line: 245, column: 19, scope: !547, inlinedAt: !556, atomGroup: 2, atomRank: 1)
!889 = distinct !DIAssignID()
!890 = !DILocation(line: 247, column: 2, scope: !547, inlinedAt: !556, atomGroup: 3, atomRank: 1)
!891 = distinct !DIAssignID()
!892 = !DILocation(line: 248, column: 2, scope: !547, inlinedAt: !556, atomGroup: 4, atomRank: 1)
!893 = distinct !DIAssignID()
!894 = !DILocalVariable(name: "socket", arg: 1, scope: !895, file: !72, line: 211, type: !170)
!895 = distinct !DISubprogram(name: "is_filtered_ipv4_socket", scope: !72, file: !72, line: 211, type: !896, scopeLine: 211, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !898, keyInstructions: true)
!896 = !DISubroutineType(types: !897)
!897 = !{!486, !170}
!898 = !{!894, !899}
!899 = !DILocalVariable(name: "banned", scope: !895, file: !72, line: 213, type: !90)
!900 = !DILocation(line: 0, scope: !895, inlinedAt: !901)
!901 = distinct !DILocation(line: 250, column: 6, scope: !902, inlinedAt: !556)
!902 = distinct !DILexicalBlock(scope: !547, file: !72, line: 250, column: 6)
!903 = !DILocation(line: 215, column: 11, scope: !895, inlinedAt: !901, atomGroup: 2, atomRank: 2)
!904 = !DILocation(line: 217, column: 13, scope: !905, inlinedAt: !901, atomGroup: 3, atomRank: 2)
!905 = distinct !DILexicalBlock(scope: !895, file: !72, line: 217, column: 6)
!906 = !DILocation(line: 217, column: 21, scope: !905, inlinedAt: !901, atomGroup: 3, atomRank: 1)
!907 = !DILocation(line: 217, column: 24, scope: !905, inlinedAt: !901)
!908 = !DILocation(line: 217, column: 32, scope: !905, inlinedAt: !901, atomGroup: 4, atomRank: 2)
!909 = !DILocation(line: 217, column: 21, scope: !905, inlinedAt: !901, atomGroup: 4, atomRank: 1)
!910 = !DILocation(line: 0, scope: !895, inlinedAt: !911)
!911 = distinct !DILocation(line: 252, column: 13, scope: !912, inlinedAt: !556)
!912 = distinct !DILexicalBlock(scope: !902, file: !72, line: 252, column: 13)
!913 = !DILocation(line: 215, column: 11, scope: !895, inlinedAt: !911, atomGroup: 2, atomRank: 2)
!914 = !DILocation(line: 217, column: 13, scope: !905, inlinedAt: !911, atomGroup: 3, atomRank: 2)
!915 = !DILocation(line: 217, column: 21, scope: !905, inlinedAt: !911, atomGroup: 3, atomRank: 1)
!916 = !DILocation(line: 217, column: 24, scope: !905, inlinedAt: !911)
!917 = !DILocation(line: 217, column: 32, scope: !905, inlinedAt: !911, atomGroup: 4, atomRank: 2)
!918 = !DILocation(line: 217, column: 21, scope: !905, inlinedAt: !911, atomGroup: 4, atomRank: 1)
!919 = !DILocation(line: 258, column: 1, scope: !547, inlinedAt: !556)
!920 = !DILocation(line: 511, column: 74, scope: !557, atomGroup: 32, atomRank: 1)
!921 = !DILocation(line: 518, column: 17, scope: !349, atomGroup: 34, atomRank: 2)
!922 = !DILocation(line: 519, column: 5, scope: !349, atomGroup: 34, atomRank: 1)
!923 = !DILocation(line: 0, scope: !348)
!924 = !DILocation(line: 272, column: 11, scope: !925, inlinedAt: !667)
!925 = distinct !DILexicalBlock(scope: !658, file: !238, line: 272, column: 6)
!926 = !DILocation(line: 272, column: 15, scope: !925, inlinedAt: !667, atomGroup: 2, atomRank: 2)
!927 = !DILocation(line: 272, column: 15, scope: !925, inlinedAt: !667, atomGroup: 2, atomRank: 1)
!928 = !DILocation(line: 303, column: 38, scope: !642, inlinedAt: !653)
!929 = !{!930, !736, i64 2}
!930 = !{!"dnshdr", !736, i64 0, !736, i64 2, !736, i64 4, !736, i64 6, !736, i64 8, !736, i64 10}
!931 = !DILocation(line: 305, column: 23, scope: !932, inlinedAt: !653, atomGroup: 5, atomRank: 2)
!932 = distinct !DILexicalBlock(scope: !642, file: !72, line: 305, column: 6)
!933 = !DILocation(line: 305, column: 23, scope: !932, inlinedAt: !653, atomGroup: 5, atomRank: 1)
!934 = !DILocation(line: 309, column: 40, scope: !642, inlinedAt: !653)
!935 = !{!930, !736, i64 4}
!936 = !DILocation(line: 311, column: 14, scope: !937, inlinedAt: !653, atomGroup: 9, atomRank: 2)
!937 = distinct !DILexicalBlock(scope: !642, file: !72, line: 311, column: 6)
!938 = !DILocation(line: 311, column: 14, scope: !937, inlinedAt: !653, atomGroup: 9, atomRank: 1)
!939 = !DILocation(line: 288, column: 43, scope: !940, inlinedAt: !955, atomGroup: 23, atomRank: 2)
!940 = distinct !DILexicalBlock(scope: !941, file: !238, line: 288, column: 2)
!941 = distinct !DILexicalBlock(scope: !942, file: !238, line: 288, column: 2)
!942 = distinct !DISubprogram(name: "dns_hash_wire", scope: !238, file: !238, line: 283, type: !943, scopeLine: 283, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !945, keyInstructions: true)
!943 = !DISubroutineType(types: !944)
!944 = !{!55, !61, !55, !86}
!945 = !{!946, !947, !948, !949, !950, !951, !952, !954}
!946 = !DILocalVariable(name: "start", arg: 1, scope: !942, file: !238, line: 283, type: !61)
!947 = !DILocalVariable(name: "data_end", arg: 2, scope: !942, file: !238, line: 283, type: !55)
!948 = !DILocalVariable(name: "out_hash", arg: 3, scope: !942, file: !238, line: 283, type: !86)
!949 = !DILocalVariable(name: "hash", scope: !942, file: !238, line: 285, type: !87)
!950 = !DILocalVariable(name: "base", scope: !942, file: !238, line: 286, type: !61)
!951 = !DILocalVariable(name: "i", scope: !941, file: !238, line: 288, type: !60)
!952 = !DILocalVariable(name: "b", scope: !953, file: !238, line: 294, type: !66)
!953 = distinct !DILexicalBlock(scope: !940, file: !238, line: 288, column: 47)
!954 = !DILocalVariable(name: "c", scope: !953, file: !238, line: 307, type: !66)
!955 = distinct !DILocation(line: 316, column: 15, scope: !642, inlinedAt: !653)
!956 = !DILocation(line: 0, scope: !941, inlinedAt: !955)
!957 = !DILocation(line: 0, scope: !942, inlinedAt: !955)
!958 = !DILocation(line: 288, column: 20, scope: !940, inlinedAt: !955, atomGroup: 4, atomRank: 1)
!959 = !DILocation(line: 288, column: 2, scope: !941, inlinedAt: !955, atomGroup: 5, atomRank: 1)
!960 = distinct !{!960, !961, !962, !963}
!961 = !DILocation(line: 288, column: 2, scope: !941, inlinedAt: !955)
!962 = !DILocation(line: 321, column: 2, scope: !941, inlinedAt: !955)
!963 = !{!"llvm.loop.mustprogress"}
!964 = !DILocation(line: 290, column: 21, scope: !965, inlinedAt: !955)
!965 = distinct !DILexicalBlock(scope: !953, file: !238, line: 290, column: 7)
!966 = !DILocation(line: 290, column: 25, scope: !965, inlinedAt: !955)
!967 = !DILocation(line: 290, column: 29, scope: !965, inlinedAt: !955, atomGroup: 6, atomRank: 2)
!968 = !DILocation(line: 290, column: 29, scope: !965, inlinedAt: !955, atomGroup: 6, atomRank: 1)
!969 = !DILocation(line: 294, column: 12, scope: !953, inlinedAt: !955, atomGroup: 8, atomRank: 2)
!970 = !DILocation(line: 0, scope: !953, inlinedAt: !955)
!971 = !DILocation(line: 296, column: 18, scope: !972, inlinedAt: !955, atomGroup: 9, atomRank: 2)
!972 = distinct !DILexicalBlock(scope: !953, file: !238, line: 296, column: 7)
!973 = !DILocation(line: 296, column: 18, scope: !972, inlinedAt: !955, atomGroup: 9, atomRank: 1)
!974 = !DILocation(line: 298, column: 26, scope: !975, inlinedAt: !955)
!975 = distinct !DILexicalBlock(scope: !976, file: !238, line: 298, column: 8)
!976 = distinct !DILexicalBlock(scope: !972, file: !238, line: 296, column: 27)
!977 = !DILocation(line: 298, column: 30, scope: !975, inlinedAt: !955, atomGroup: 10, atomRank: 2)
!978 = !DILocation(line: 298, column: 30, scope: !975, inlinedAt: !955, atomGroup: 10, atomRank: 1)
!979 = !DILocation(line: 309, column: 16, scope: !980, inlinedAt: !955, atomGroup: 15, atomRank: 1)
!980 = distinct !DILexicalBlock(scope: !953, file: !238, line: 309, column: 7)
!981 = !DILocation(line: 313, column: 11, scope: !953, inlinedAt: !955)
!982 = !DILocation(line: 313, column: 8, scope: !953, inlinedAt: !955, atomGroup: 18, atomRank: 2)
!983 = !DILocation(line: 314, column: 8, scope: !953, inlinedAt: !955, atomGroup: 19, atomRank: 2)
!984 = !DILocation(line: 316, column: 9, scope: !985, inlinedAt: !955, atomGroup: 20, atomRank: 2)
!985 = distinct !DILexicalBlock(scope: !953, file: !238, line: 316, column: 7)
!986 = !DILocation(line: 316, column: 9, scope: !985, inlinedAt: !955, atomGroup: 20, atomRank: 1)
!987 = !DILocation(line: 315, column: 8, scope: !642, inlinedAt: !653, atomGroup: 11, atomRank: 1)
!988 = !DILocalVariable(name: "hash", arg: 1, scope: !989, file: !72, line: 283, type: !87)
!989 = distinct !DISubprogram(name: "is_domain_banned", scope: !72, file: !72, line: 283, type: !990, scopeLine: 283, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !992, keyInstructions: true)
!990 = !DISubroutineType(types: !991)
!991 = !{!486, !87}
!992 = !{!988, !993}
!993 = !DILocalVariable(name: "banned", scope: !989, file: !72, line: 285, type: !90)
!994 = !DILocation(line: 0, scope: !989, inlinedAt: !995)
!995 = distinct !DILocation(line: 322, column: 9, scope: !642, inlinedAt: !653)
!996 = !{!997, !997, i64 0}
!997 = !{!"long long", !217, i64 0}
!998 = distinct !DIAssignID()
!999 = !DILocation(line: 287, column: 11, scope: !989, inlinedAt: !995, atomGroup: 2, atomRank: 2)
!1000 = !DILocation(line: 289, column: 13, scope: !1001, inlinedAt: !995, atomGroup: 3, atomRank: 2)
!1001 = distinct !DILexicalBlock(scope: !989, file: !72, line: 289, column: 6)
!1002 = !DILocation(line: 289, column: 21, scope: !1001, inlinedAt: !995, atomGroup: 3, atomRank: 1)
!1003 = !DILocation(line: 289, column: 24, scope: !1001, inlinedAt: !995)
!1004 = !DILocation(line: 289, column: 32, scope: !1001, inlinedAt: !995, atomGroup: 4, atomRank: 2)
!1005 = !DILocation(line: 289, column: 21, scope: !1001, inlinedAt: !995, atomGroup: 4, atomRank: 1)
!1006 = !DILocation(line: 295, column: 1, scope: !989, inlinedAt: !995, atomGroup: 7, atomRank: 1)
!1007 = !DILocation(line: 527, column: 52, scope: !654, atomGroup: 40, atomRank: 1)
!1008 = !DILocation(line: 295, column: 1, scope: !989, inlinedAt: !995, atomGroup: 123, atomRank: 1)
!1009 = !DILocation(line: 0, scope: !360)
!1010 = !DILocation(line: 246, column: 11, scope: !1011, inlinedAt: !638)
!1011 = distinct !DILexicalBlock(scope: !628, file: !238, line: 246, column: 6)
!1012 = !DILocation(line: 246, column: 15, scope: !1011, inlinedAt: !638, atomGroup: 2, atomRank: 2)
!1013 = !DILocation(line: 246, column: 15, scope: !1011, inlinedAt: !638, atomGroup: 2, atomRank: 1)
!1014 = !DILocation(line: 250, column: 14, scope: !628, inlinedAt: !638)
!1015 = !DILocation(line: 250, column: 19, scope: !628, inlinedAt: !638, atomGroup: 4, atomRank: 2)
!1016 = !DILocation(line: 251, column: 10, scope: !1017, inlinedAt: !638, atomGroup: 5, atomRank: 2)
!1017 = distinct !DILexicalBlock(scope: !628, file: !238, line: 251, column: 6)
!1018 = !DILocation(line: 251, column: 10, scope: !1017, inlinedAt: !638, atomGroup: 5, atomRank: 1)
!1019 = !DILocalVariable(name: "tcp_header", arg: 1, scope: !1020, file: !72, line: 371, type: !362)
!1020 = distinct !DISubprogram(name: "is_filtered_nmap_tcp_scan", scope: !72, file: !72, line: 371, type: !1021, scopeLine: 371, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1023, keyInstructions: true)
!1021 = !DISubroutineType(types: !1022)
!1022 = !{!486, !362}
!1023 = !{!1019}
!1024 = !DILocation(line: 0, scope: !1020, inlinedAt: !1025)
!1025 = distinct !DILocation(line: 546, column: 8, scope: !541)
!1026 = !DILocation(line: 375, column: 3, scope: !1027, inlinedAt: !1025, atomGroup: 1, atomRank: 1)
!1027 = distinct !DILexicalBlock(scope: !1020, file: !72, line: 374, column: 3)
!1028 = !DILocation(line: 396, column: 18, scope: !1029, inlinedAt: !1025)
!1029 = distinct !DILexicalBlock(scope: !1020, file: !72, line: 388, column: 3)
!1030 = !{!1031, !736, i64 14}
!1031 = !{!"tcphdr", !736, i64 0, !736, i64 2, !216, i64 4, !216, i64 8, !736, i64 12, !736, i64 12, !736, i64 12, !736, i64 13, !736, i64 13, !736, i64 13, !736, i64 13, !736, i64 13, !736, i64 13, !736, i64 13, !736, i64 13, !736, i64 14, !736, i64 16, !736, i64 18}
!1032 = !DILocation(line: 396, column: 25, scope: !1029, inlinedAt: !1025, atomGroup: 18, atomRank: 2)
!1033 = !DILocation(line: 396, column: 3, scope: !1029, inlinedAt: !1025, atomGroup: 18, atomRank: 1)
!1034 = !DILocalVariable(name: "tcp_header", arg: 1, scope: !1035, file: !72, line: 405, type: !362)
!1035 = distinct !DISubprogram(name: "is_likely_nmap_tcp_scan", scope: !72, file: !72, line: 405, type: !1021, scopeLine: 405, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1036, keyInstructions: true)
!1036 = !{!1034}
!1037 = !DILocation(line: 0, scope: !1035, inlinedAt: !1038)
!1038 = distinct !DILocation(line: 548, column: 15, scope: !540)
!1039 = !DILocation(line: 411, column: 3, scope: !1040, inlinedAt: !1038, atomGroup: 1, atomRank: 1)
!1040 = distinct !DILexicalBlock(scope: !1035, file: !72, line: 410, column: 3)
!1041 = !DILocation(line: 417, column: 28, scope: !1040, inlinedAt: !1038)
!1042 = !DILocation(line: 417, column: 36, scope: !1040, inlinedAt: !1038, atomGroup: 9, atomRank: 2)
!1043 = !DILocation(line: 417, column: 3, scope: !1040, inlinedAt: !1038, atomGroup: 9, atomRank: 1)
!1044 = !DILocation(line: 0, scope: !536, inlinedAt: !538)
!1045 = !DILocation(line: 0, scope: !526, inlinedAt: !538)
!1046 = !DILocation(line: 109, column: 13, scope: !526, inlinedAt: !538, atomGroup: 2, atomRank: 2)
!1047 = !DILocation(line: 111, column: 15, scope: !525, inlinedAt: !538, atomGroup: 3, atomRank: 2)
!1048 = !DILocation(line: 111, column: 15, scope: !525, inlinedAt: !538, atomGroup: 3, atomRank: 1)
!1049 = !DILocation(line: 113, column: 3, scope: !524, inlinedAt: !538)
!1050 = distinct !DIAssignID()
!1051 = !DILocation(line: 114, column: 11, scope: !524, inlinedAt: !538)
!1052 = !DILocation(line: 114, column: 21, scope: !524, inlinedAt: !538, atomGroup: 5, atomRank: 3)
!1053 = !DILocation(line: 114, column: 9, scope: !524, inlinedAt: !538, atomGroup: 5, atomRank: 1)
!1054 = distinct !DIAssignID()
!1055 = !DILocation(line: 116, column: 3, scope: !524, inlinedAt: !538)
!1056 = !DILocation(line: 118, column: 7, scope: !534, inlinedAt: !538)
!1057 = !DILocation(line: 118, column: 13, scope: !534, inlinedAt: !538, atomGroup: 6, atomRank: 2)
!1058 = !DILocation(line: 118, column: 13, scope: !534, inlinedAt: !538, atomGroup: 6, atomRank: 1)
!1059 = !DILocation(line: 120, column: 4, scope: !533, inlinedAt: !538)
!1060 = !DILocation(line: 120, column: 9, scope: !533, inlinedAt: !538, atomGroup: 7, atomRank: 1)
!1061 = distinct !DIAssignID()
!1062 = !DILocation(line: 121, column: 4, scope: !533, inlinedAt: !538)
!1063 = !DILocation(line: 122, column: 4, scope: !533, inlinedAt: !538)
!1064 = !DILocation(line: 124, column: 3, scope: !534, inlinedAt: !538)
!1065 = !DILocation(line: 124, column: 3, scope: !533, inlinedAt: !538)
!1066 = !DILocation(line: 126, column: 2, scope: !525, inlinedAt: !538)
!1067 = !DILocation(line: 126, column: 2, scope: !524, inlinedAt: !538)
!1068 = !DILocation(line: 128, column: 3, scope: !536, inlinedAt: !538)
!1069 = !DILocation(line: 128, column: 8, scope: !536, inlinedAt: !538, atomGroup: 8, atomRank: 1)
!1070 = distinct !DIAssignID()
!1071 = !DILocation(line: 129, column: 3, scope: !536, inlinedAt: !538)
!1072 = !DILocation(line: 131, column: 2, scope: !525, inlinedAt: !538)
!1073 = !DILocation(line: 552, column: 36, scope: !360, atomGroup: 50, atomRank: 2)
!1074 = !{!1031, !736, i64 0}
!1075 = !DILocation(line: 0, scope: !845, inlinedAt: !1076)
!1076 = distinct !DILocation(line: 555, column: 8, scope: !1077)
!1077 = distinct !DILexicalBlock(scope: !360, file: !72, line: 555, column: 8)
!1078 = distinct !DIAssignID()
!1079 = !DILocation(line: 201, column: 17, scope: !845, inlinedAt: !1076, atomGroup: 2, atomRank: 2)
!1080 = !DILocation(line: 203, column: 19, scope: !856, inlinedAt: !1076, atomGroup: 3, atomRank: 2)
!1081 = !DILocation(line: 203, column: 27, scope: !856, inlinedAt: !1076, atomGroup: 3, atomRank: 1)
!1082 = !DILocation(line: 203, column: 30, scope: !856, inlinedAt: !1076)
!1083 = !DILocation(line: 203, column: 44, scope: !856, inlinedAt: !1076, atomGroup: 4, atomRank: 2)
!1084 = !DILocation(line: 203, column: 27, scope: !856, inlinedAt: !1076, atomGroup: 4, atomRank: 1)
!1085 = !DILocation(line: 209, column: 1, scope: !845, inlinedAt: !1076, atomGroup: 125, atomRank: 1)
!1086 = !DILocation(line: 555, column: 38, scope: !1077, atomGroup: 51, atomRank: 1)
!1087 = !DILocation(line: 209, column: 1, scope: !845, inlinedAt: !1076, atomGroup: 7, atomRank: 1)
!1088 = !DILocation(line: 559, column: 34, scope: !360)
!1089 = !DILocation(line: 559, column: 34, scope: !360, atomGroup: 53, atomRank: 2)
!1090 = !{!1031, !736, i64 2}
!1091 = !DILocation(line: 0, scope: !845, inlinedAt: !1092)
!1092 = distinct !DILocation(line: 562, column: 8, scope: !1093)
!1093 = distinct !DILexicalBlock(scope: !360, file: !72, line: 562, column: 8)
!1094 = distinct !DIAssignID()
!1095 = !DILocation(line: 201, column: 17, scope: !845, inlinedAt: !1092, atomGroup: 2, atomRank: 2)
!1096 = !DILocation(line: 203, column: 19, scope: !856, inlinedAt: !1092, atomGroup: 3, atomRank: 2)
!1097 = !DILocation(line: 203, column: 27, scope: !856, inlinedAt: !1092, atomGroup: 3, atomRank: 1)
!1098 = !DILocation(line: 203, column: 30, scope: !856, inlinedAt: !1092)
!1099 = !DILocation(line: 203, column: 44, scope: !856, inlinedAt: !1092, atomGroup: 4, atomRank: 2)
!1100 = !DILocation(line: 203, column: 27, scope: !856, inlinedAt: !1092, atomGroup: 4, atomRank: 1)
!1101 = !DILocation(line: 209, column: 1, scope: !845, inlinedAt: !1092, atomGroup: 126, atomRank: 1)
!1102 = !DILocation(line: 562, column: 36, scope: !1093, atomGroup: 54, atomRank: 1)
!1103 = !DILocation(line: 209, column: 1, scope: !845, inlinedAt: !1092, atomGroup: 7, atomRank: 1)
!1104 = !DILocation(line: 241, column: 2, scope: !547, inlinedAt: !561)
!1105 = !DILocation(line: 242, column: 2, scope: !547, inlinedAt: !561)
!1106 = !DILocation(line: 244, column: 16, scope: !547, inlinedAt: !561)
!1107 = !DILocation(line: 244, column: 21, scope: !547, inlinedAt: !561, atomGroup: 1, atomRank: 1)
!1108 = distinct !DIAssignID()
!1109 = !DILocation(line: 245, column: 14, scope: !547, inlinedAt: !561)
!1110 = !DILocation(line: 245, column: 19, scope: !547, inlinedAt: !561, atomGroup: 2, atomRank: 1)
!1111 = distinct !DIAssignID()
!1112 = !DILocation(line: 247, column: 2, scope: !547, inlinedAt: !561, atomGroup: 3, atomRank: 1)
!1113 = distinct !DIAssignID()
!1114 = !DILocation(line: 248, column: 2, scope: !547, inlinedAt: !561, atomGroup: 4, atomRank: 1)
!1115 = distinct !DIAssignID()
!1116 = !DILocation(line: 0, scope: !895, inlinedAt: !1117)
!1117 = distinct !DILocation(line: 250, column: 6, scope: !902, inlinedAt: !561)
!1118 = !DILocation(line: 215, column: 11, scope: !895, inlinedAt: !1117, atomGroup: 2, atomRank: 2)
!1119 = !DILocation(line: 217, column: 13, scope: !905, inlinedAt: !1117, atomGroup: 3, atomRank: 2)
!1120 = !DILocation(line: 217, column: 21, scope: !905, inlinedAt: !1117, atomGroup: 3, atomRank: 1)
!1121 = !DILocation(line: 217, column: 24, scope: !905, inlinedAt: !1117)
!1122 = !DILocation(line: 217, column: 32, scope: !905, inlinedAt: !1117, atomGroup: 4, atomRank: 2)
!1123 = !DILocation(line: 217, column: 21, scope: !905, inlinedAt: !1117, atomGroup: 4, atomRank: 1)
!1124 = !DILocation(line: 0, scope: !895, inlinedAt: !1125)
!1125 = distinct !DILocation(line: 252, column: 13, scope: !912, inlinedAt: !561)
!1126 = !DILocation(line: 215, column: 11, scope: !895, inlinedAt: !1125, atomGroup: 2, atomRank: 2)
!1127 = !DILocation(line: 217, column: 13, scope: !905, inlinedAt: !1125, atomGroup: 3, atomRank: 2)
!1128 = !DILocation(line: 217, column: 21, scope: !905, inlinedAt: !1125, atomGroup: 3, atomRank: 1)
!1129 = !DILocation(line: 217, column: 24, scope: !905, inlinedAt: !1125)
!1130 = !DILocation(line: 217, column: 32, scope: !905, inlinedAt: !1125, atomGroup: 4, atomRank: 2)
!1131 = !DILocation(line: 217, column: 21, scope: !905, inlinedAt: !1125, atomGroup: 4, atomRank: 1)
!1132 = !DILocation(line: 258, column: 1, scope: !547, inlinedAt: !561)
!1133 = !DILocation(line: 0, scope: !361)
!1134 = !DILocation(line: 0, scope: !388)
!1135 = !DILocation(line: 179, column: 12, scope: !1136, inlinedAt: !624)
!1136 = distinct !DILexicalBlock(scope: !615, file: !238, line: 179, column: 6)
!1137 = !DILocation(line: 179, column: 16, scope: !1136, inlinedAt: !624, atomGroup: 2, atomRank: 2)
!1138 = !DILocation(line: 179, column: 16, scope: !1136, inlinedAt: !624, atomGroup: 2, atomRank: 1)
!1139 = !DILocalVariable(name: "icmp_header", arg: 1, scope: !1140, file: !72, line: 328, type: !390)
!1140 = distinct !DISubprogram(name: "is_filtered_icmp_packet", scope: !72, file: !72, line: 328, type: !1141, scopeLine: 328, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1143, keyInstructions: true)
!1141 = !DISubroutineType(types: !1142)
!1142 = !{!486, !390}
!1143 = !{!1139, !1144}
!1144 = !DILocalVariable(name: "type", scope: !1140, file: !72, line: 330, type: !60)
!1145 = !DILocation(line: 0, scope: !1140, inlinedAt: !1146)
!1146 = distinct !DILocation(line: 576, column: 23, scope: !1147)
!1147 = distinct !DILexicalBlock(scope: !388, file: !72, line: 576, column: 8)
!1148 = !DILocation(line: 330, column: 26, scope: !1140, inlinedAt: !1146, atomGroup: 1, atomRank: 3)
!1149 = !{!1150, !217, i64 0}
!1150 = !{!"icmphdr", !217, i64 0, !217, i64 1, !736, i64 2, !217, i64 4}
!1151 = !DILocation(line: 333, column: 8, scope: !1152, inlinedAt: !1146, atomGroup: 2, atomRank: 2)
!1152 = distinct !DILexicalBlock(scope: !1140, file: !72, line: 333, column: 3)
!1153 = !DILocation(line: 576, column: 20, scope: !1147)
!1154 = !DILocation(line: 576, column: 20, scope: !1147, atomGroup: 61, atomRank: 1)
!1155 = !DILocation(line: 588, column: 3, scope: !329, atomGroup: 63, atomRank: 1)
!1156 = !DILocation(line: 590, column: 2, scope: !330)
!1157 = !DILocation(line: 194, column: 11, scope: !1158, inlinedAt: !601)
!1158 = distinct !DILexicalBlock(scope: !592, file: !238, line: 194, column: 6)
!1159 = !DILocation(line: 194, column: 15, scope: !1158, inlinedAt: !601, atomGroup: 2, atomRank: 2)
!1160 = !DILocation(line: 194, column: 15, scope: !1158, inlinedAt: !601, atomGroup: 2, atomRank: 1)
!1161 = !DILocation(line: 0, scope: !581, inlinedAt: !591)
!1162 = !DILocation(line: 76, column: 2, scope: !581, inlinedAt: !591, atomGroup: 142, atomRank: 1)
!1163 = !DILocation(line: 201, column: 44, scope: !592, inlinedAt: !601)
!1164 = !DILocation(line: 76, column: 2, scope: !581, inlinedAt: !591)
!1165 = !DILocation(line: 201, scope: !592, inlinedAt: !601)
!1166 = !DILocation(line: 84, column: 3, scope: !583, inlinedAt: !591, atomGroup: 7, atomRank: 1)
!1167 = !DILocation(line: 96, column: 5, scope: !1168, inlinedAt: !591, atomGroup: 13, atomRank: 1)
!1168 = distinct !DILexicalBlock(scope: !583, file: !238, line: 84, column: 26)
!1169 = !DILocation(line: 84, column: 11, scope: !583, inlinedAt: !591, atomGroup: 7, atomRank: 2)
!1170 = !DILocation(line: 102, column: 5, scope: !1168, inlinedAt: !591, atomGroup: 17, atomRank: 1)
!1171 = !DILocation(line: 0, scope: !1168, inlinedAt: !591)
!1172 = !{!1173, !217, i64 1}
!1173 = !{!"ipv6_opt_hdr", !217, i64 0, !217, i64 1}
!1174 = !DILocation(line: 76, column: 41, scope: !584, inlinedAt: !591, atomGroup: 18, atomRank: 2)
!1175 = !DILocation(line: 76, column: 20, scope: !584, inlinedAt: !591, atomGroup: 2, atomRank: 1)
!1176 = !DILocation(line: 0, scope: !583, inlinedAt: !591)
!1177 = !DILocation(line: 76, column: 2, scope: !581, inlinedAt: !591, atomGroup: 3, atomRank: 1)
!1178 = distinct !{!1178, !1164, !1179, !963}
!1179 = !DILocation(line: 106, column: 2, scope: !581, inlinedAt: !591)
!1180 = !DILocation(line: 594, column: 3, scope: !414)
!1181 = distinct !DIAssignID()
!1182 = !DILocation(line: 597, column: 3, scope: !414)
!1183 = distinct !DIAssignID()
!1184 = !DILocation(line: 600, column: 7, scope: !422, atomGroup: 68, atomRank: 1)
!1185 = !DILocation(line: 595, column: 31, scope: !414, atomGroup: 128, atomRank: 1)
!1186 = !{!1187, !216, i64 0}
!1187 = !{!"ipv6_subnet", !216, i64 0, !217, i64 4}
!1188 = !DILocation(line: 598, column: 23, scope: !414, atomGroup: 129, atomRank: 1)
!1189 = !DILocation(line: 602, column: 24, scope: !421)
!1190 = !DILocation(line: 602, column: 47, scope: !421)
!1191 = !DILocation(line: 602, column: 4, scope: !421, atomGroup: 69, atomRank: 1)
!1192 = distinct !DIAssignID()
!1193 = !DILocation(line: 603, column: 22, scope: !421)
!1194 = !DILocation(line: 603, column: 45, scope: !421)
!1195 = !DILocation(line: 603, column: 4, scope: !421, atomGroup: 70, atomRank: 1)
!1196 = distinct !DIAssignID()
!1197 = !DILocalVariable(name: "subnet", arg: 1, scope: !1198, file: !72, line: 183, type: !136)
!1198 = distinct !DISubprogram(name: "is_filtered_ipv6", scope: !72, file: !72, line: 183, type: !484, scopeLine: 183, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1199, keyInstructions: true)
!1199 = !{!1197, !1200}
!1200 = !DILocalVariable(name: "banned", scope: !1198, file: !72, line: 185, type: !90)
!1201 = !DILocation(line: 0, scope: !1198, inlinedAt: !1202)
!1202 = distinct !DILocation(line: 605, column: 8, scope: !1203)
!1203 = distinct !DILexicalBlock(scope: !421, file: !72, line: 605, column: 8)
!1204 = !DILocation(line: 187, column: 11, scope: !1198, inlinedAt: !1202, atomGroup: 2, atomRank: 2)
!1205 = !DILocation(line: 189, column: 13, scope: !1206, inlinedAt: !1202, atomGroup: 3, atomRank: 2)
!1206 = distinct !DILexicalBlock(scope: !1198, file: !72, line: 189, column: 6)
!1207 = !DILocation(line: 189, column: 21, scope: !1206, inlinedAt: !1202, atomGroup: 3, atomRank: 1)
!1208 = !DILocation(line: 189, column: 24, scope: !1206, inlinedAt: !1202)
!1209 = !DILocation(line: 189, column: 32, scope: !1206, inlinedAt: !1202, atomGroup: 4, atomRank: 2)
!1210 = !DILocation(line: 189, column: 21, scope: !1206, inlinedAt: !1202, atomGroup: 4, atomRank: 1)
!1211 = !DILocation(line: 0, scope: !1198, inlinedAt: !1212)
!1212 = distinct !DILocation(line: 613, column: 15, scope: !1213)
!1213 = distinct !DILexicalBlock(scope: !1203, file: !72, line: 613, column: 15)
!1214 = !DILocation(line: 187, column: 11, scope: !1198, inlinedAt: !1212, atomGroup: 2, atomRank: 2)
!1215 = !DILocation(line: 189, column: 13, scope: !1206, inlinedAt: !1212, atomGroup: 3, atomRank: 2)
!1216 = !DILocation(line: 189, column: 21, scope: !1206, inlinedAt: !1212, atomGroup: 3, atomRank: 1)
!1217 = !DILocation(line: 189, column: 24, scope: !1206, inlinedAt: !1212)
!1218 = !DILocation(line: 189, column: 32, scope: !1206, inlinedAt: !1212, atomGroup: 4, atomRank: 2)
!1219 = !DILocation(line: 189, column: 21, scope: !1206, inlinedAt: !1212, atomGroup: 4, atomRank: 1)
!1220 = !DILocation(line: 623, column: 17, scope: !420, atomGroup: 75, atomRank: 1)
!1221 = !DILocation(line: 0, scope: !419)
!1222 = !DILocation(line: 225, column: 11, scope: !832, inlinedAt: !681)
!1223 = !DILocation(line: 225, column: 15, scope: !832, inlinedAt: !681, atomGroup: 2, atomRank: 2)
!1224 = !DILocation(line: 225, column: 15, scope: !832, inlinedAt: !681, atomGroup: 2, atomRank: 1)
!1225 = !DILocation(line: 232, column: 24, scope: !669, inlinedAt: !681)
!1226 = !DILocation(line: 232, column: 8, scope: !669, inlinedAt: !681)
!1227 = !DILocation(line: 233, column: 10, scope: !840, inlinedAt: !681, atomGroup: 8, atomRank: 2)
!1228 = !DILocation(line: 233, column: 10, scope: !840, inlinedAt: !681, atomGroup: 8, atomRank: 1)
!1229 = !DILocation(line: 632, column: 37, scope: !419, atomGroup: 80, atomRank: 2)
!1230 = !DILocation(line: 0, scope: !845, inlinedAt: !1231)
!1231 = distinct !DILocation(line: 635, column: 9, scope: !1232)
!1232 = distinct !DILexicalBlock(scope: !419, file: !72, line: 635, column: 9)
!1233 = distinct !DIAssignID()
!1234 = !DILocation(line: 201, column: 17, scope: !845, inlinedAt: !1231, atomGroup: 2, atomRank: 2)
!1235 = !DILocation(line: 203, column: 19, scope: !856, inlinedAt: !1231, atomGroup: 3, atomRank: 2)
!1236 = !DILocation(line: 203, column: 27, scope: !856, inlinedAt: !1231, atomGroup: 3, atomRank: 1)
!1237 = !DILocation(line: 203, column: 30, scope: !856, inlinedAt: !1231)
!1238 = !DILocation(line: 203, column: 44, scope: !856, inlinedAt: !1231, atomGroup: 4, atomRank: 2)
!1239 = !DILocation(line: 203, column: 27, scope: !856, inlinedAt: !1231, atomGroup: 4, atomRank: 1)
!1240 = !DILocation(line: 209, column: 1, scope: !845, inlinedAt: !1231, atomGroup: 132, atomRank: 1)
!1241 = !DILocation(line: 635, column: 39, scope: !1232, atomGroup: 81, atomRank: 1)
!1242 = !DILocation(line: 209, column: 1, scope: !845, inlinedAt: !1231, atomGroup: 7, atomRank: 1)
!1243 = !DILocation(line: 639, column: 35, scope: !419)
!1244 = !DILocation(line: 639, column: 35, scope: !419, atomGroup: 83, atomRank: 2)
!1245 = !DILocation(line: 0, scope: !845, inlinedAt: !1246)
!1246 = distinct !DILocation(line: 642, column: 9, scope: !1247)
!1247 = distinct !DILexicalBlock(scope: !419, file: !72, line: 642, column: 9)
!1248 = distinct !DIAssignID()
!1249 = !DILocation(line: 201, column: 17, scope: !845, inlinedAt: !1246, atomGroup: 2, atomRank: 2)
!1250 = !DILocation(line: 203, column: 19, scope: !856, inlinedAt: !1246, atomGroup: 3, atomRank: 2)
!1251 = !DILocation(line: 203, column: 27, scope: !856, inlinedAt: !1246, atomGroup: 3, atomRank: 1)
!1252 = !DILocation(line: 203, column: 30, scope: !856, inlinedAt: !1246)
!1253 = !DILocation(line: 203, column: 44, scope: !856, inlinedAt: !1246, atomGroup: 4, atomRank: 2)
!1254 = !DILocation(line: 203, column: 27, scope: !856, inlinedAt: !1246, atomGroup: 4, atomRank: 1)
!1255 = !DILocation(line: 209, column: 1, scope: !845, inlinedAt: !1246, atomGroup: 133, atomRank: 1)
!1256 = !DILocation(line: 642, column: 37, scope: !1247, atomGroup: 84, atomRank: 1)
!1257 = !DILocation(line: 209, column: 1, scope: !845, inlinedAt: !1246, atomGroup: 7, atomRank: 1)
!1258 = !DILocation(line: 262, column: 2, scope: !505, inlinedAt: !514)
!1259 = !DILocation(line: 263, column: 2, scope: !505, inlinedAt: !514)
!1260 = !DILocation(line: 265, column: 16, scope: !505, inlinedAt: !514)
!1261 = !DILocation(line: 265, column: 21, scope: !505, inlinedAt: !514, atomGroup: 1, atomRank: 1)
!1262 = !{!1263, !736, i64 16}
!1263 = !{!"ipv6_socket", !217, i64 0, !736, i64 16}
!1264 = distinct !DIAssignID()
!1265 = !DILocation(line: 266, column: 14, scope: !505, inlinedAt: !514)
!1266 = !DILocation(line: 266, column: 19, scope: !505, inlinedAt: !514, atomGroup: 2, atomRank: 1)
!1267 = distinct !DIAssignID()
!1268 = !DILocation(line: 268, column: 2, scope: !505, inlinedAt: !514, atomGroup: 3, atomRank: 1)
!1269 = distinct !DIAssignID()
!1270 = !DILocation(line: 269, column: 2, scope: !505, inlinedAt: !514, atomGroup: 4, atomRank: 1)
!1271 = distinct !DIAssignID()
!1272 = !DILocalVariable(name: "socket", arg: 1, scope: !1273, file: !72, line: 225, type: !184)
!1273 = distinct !DISubprogram(name: "is_filtered_ipv6_socket", scope: !72, file: !72, line: 225, type: !1274, scopeLine: 225, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1276, keyInstructions: true)
!1274 = !DISubroutineType(types: !1275)
!1275 = !{!486, !184}
!1276 = !{!1272, !1277}
!1277 = !DILocalVariable(name: "banned", scope: !1273, file: !72, line: 227, type: !90)
!1278 = !DILocation(line: 0, scope: !1273, inlinedAt: !1279)
!1279 = distinct !DILocation(line: 271, column: 6, scope: !1280, inlinedAt: !514)
!1280 = distinct !DILexicalBlock(scope: !505, file: !72, line: 271, column: 6)
!1281 = !DILocation(line: 229, column: 11, scope: !1273, inlinedAt: !1279, atomGroup: 2, atomRank: 2)
!1282 = !DILocation(line: 231, column: 13, scope: !1283, inlinedAt: !1279, atomGroup: 3, atomRank: 2)
!1283 = distinct !DILexicalBlock(scope: !1273, file: !72, line: 231, column: 6)
!1284 = !DILocation(line: 231, column: 21, scope: !1283, inlinedAt: !1279, atomGroup: 3, atomRank: 1)
!1285 = !DILocation(line: 231, column: 24, scope: !1283, inlinedAt: !1279)
!1286 = !DILocation(line: 231, column: 32, scope: !1283, inlinedAt: !1279, atomGroup: 4, atomRank: 2)
!1287 = !DILocation(line: 231, column: 21, scope: !1283, inlinedAt: !1279, atomGroup: 4, atomRank: 1)
!1288 = !DILocation(line: 0, scope: !1273, inlinedAt: !1289)
!1289 = distinct !DILocation(line: 273, column: 13, scope: !1290, inlinedAt: !514)
!1290 = distinct !DILexicalBlock(scope: !1280, file: !72, line: 273, column: 13)
!1291 = !DILocation(line: 229, column: 11, scope: !1273, inlinedAt: !1289, atomGroup: 2, atomRank: 2)
!1292 = !DILocation(line: 231, column: 13, scope: !1283, inlinedAt: !1289, atomGroup: 3, atomRank: 2)
!1293 = !DILocation(line: 231, column: 21, scope: !1283, inlinedAt: !1289, atomGroup: 3, atomRank: 1)
!1294 = !DILocation(line: 231, column: 24, scope: !1283, inlinedAt: !1289)
!1295 = !DILocation(line: 231, column: 32, scope: !1283, inlinedAt: !1289, atomGroup: 4, atomRank: 2)
!1296 = !DILocation(line: 231, column: 21, scope: !1283, inlinedAt: !1289, atomGroup: 4, atomRank: 1)
!1297 = !DILocation(line: 279, column: 1, scope: !505, inlinedAt: !514)
!1298 = !DILocation(line: 0, scope: !420)
!1299 = !DILocation(line: 0, scope: !427)
!1300 = !DILocation(line: 246, column: 11, scope: !1011, inlinedAt: !640)
!1301 = !DILocation(line: 246, column: 15, scope: !1011, inlinedAt: !640, atomGroup: 2, atomRank: 2)
!1302 = !DILocation(line: 246, column: 15, scope: !1011, inlinedAt: !640, atomGroup: 2, atomRank: 1)
!1303 = !DILocation(line: 250, column: 14, scope: !628, inlinedAt: !640)
!1304 = !DILocation(line: 250, column: 19, scope: !628, inlinedAt: !640, atomGroup: 4, atomRank: 2)
!1305 = !DILocation(line: 251, column: 10, scope: !1017, inlinedAt: !640, atomGroup: 5, atomRank: 2)
!1306 = !DILocation(line: 251, column: 10, scope: !1017, inlinedAt: !640, atomGroup: 5, atomRank: 1)
!1307 = !DILocation(line: 0, scope: !1020, inlinedAt: !1308)
!1308 = distinct !DILocation(line: 660, column: 9, scope: !499)
!1309 = !DILocation(line: 375, column: 3, scope: !1027, inlinedAt: !1308, atomGroup: 1, atomRank: 1)
!1310 = !DILocation(line: 396, column: 18, scope: !1029, inlinedAt: !1308)
!1311 = !DILocation(line: 396, column: 25, scope: !1029, inlinedAt: !1308, atomGroup: 18, atomRank: 2)
!1312 = !DILocation(line: 396, column: 3, scope: !1029, inlinedAt: !1308, atomGroup: 18, atomRank: 1)
!1313 = !DILocation(line: 0, scope: !1035, inlinedAt: !1314)
!1314 = distinct !DILocation(line: 662, column: 16, scope: !498)
!1315 = !DILocation(line: 411, column: 3, scope: !1040, inlinedAt: !1314, atomGroup: 1, atomRank: 1)
!1316 = !DILocation(line: 417, column: 28, scope: !1040, inlinedAt: !1314)
!1317 = !DILocation(line: 417, column: 36, scope: !1040, inlinedAt: !1314, atomGroup: 9, atomRank: 2)
!1318 = !DILocation(line: 417, column: 3, scope: !1040, inlinedAt: !1314, atomGroup: 9, atomRank: 1)
!1319 = !DILocation(line: 0, scope: !494, inlinedAt: !496)
!1320 = !DILocation(line: 0, scope: !483, inlinedAt: !496)
!1321 = !DILocation(line: 141, column: 13, scope: !483, inlinedAt: !496, atomGroup: 2, atomRank: 2)
!1322 = !DILocation(line: 143, column: 15, scope: !482, inlinedAt: !496, atomGroup: 3, atomRank: 2)
!1323 = !DILocation(line: 143, column: 15, scope: !482, inlinedAt: !496, atomGroup: 3, atomRank: 1)
!1324 = !DILocation(line: 145, column: 3, scope: !481, inlinedAt: !496)
!1325 = distinct !DIAssignID()
!1326 = !DILocation(line: 146, column: 11, scope: !481, inlinedAt: !496)
!1327 = !DILocation(line: 146, column: 21, scope: !481, inlinedAt: !496, atomGroup: 5, atomRank: 3)
!1328 = !DILocation(line: 146, column: 9, scope: !481, inlinedAt: !496, atomGroup: 5, atomRank: 1)
!1329 = distinct !DIAssignID()
!1330 = !DILocation(line: 148, column: 3, scope: !481, inlinedAt: !496)
!1331 = !DILocation(line: 150, column: 7, scope: !492, inlinedAt: !496)
!1332 = !DILocation(line: 150, column: 13, scope: !492, inlinedAt: !496, atomGroup: 6, atomRank: 2)
!1333 = !DILocation(line: 150, column: 13, scope: !492, inlinedAt: !496, atomGroup: 6, atomRank: 1)
!1334 = !DILocation(line: 152, column: 4, scope: !491, inlinedAt: !496)
!1335 = !DILocation(line: 152, column: 9, scope: !491, inlinedAt: !496, atomGroup: 7, atomRank: 1)
!1336 = distinct !DIAssignID()
!1337 = !DILocation(line: 153, column: 4, scope: !491, inlinedAt: !496)
!1338 = !DILocation(line: 154, column: 4, scope: !491, inlinedAt: !496)
!1339 = !DILocation(line: 156, column: 3, scope: !492, inlinedAt: !496)
!1340 = !DILocation(line: 156, column: 3, scope: !491, inlinedAt: !496)
!1341 = !DILocation(line: 158, column: 2, scope: !482, inlinedAt: !496)
!1342 = !DILocation(line: 158, column: 2, scope: !481, inlinedAt: !496)
!1343 = !DILocation(line: 160, column: 3, scope: !494, inlinedAt: !496)
!1344 = !DILocation(line: 160, column: 8, scope: !494, inlinedAt: !496, atomGroup: 8, atomRank: 1)
!1345 = distinct !DIAssignID()
!1346 = !DILocation(line: 161, column: 3, scope: !494, inlinedAt: !496)
!1347 = !DILocation(line: 163, column: 2, scope: !482, inlinedAt: !496)
!1348 = !DILocation(line: 666, column: 37, scope: !427, atomGroup: 96, atomRank: 2)
!1349 = !DILocation(line: 0, scope: !845, inlinedAt: !1350)
!1350 = distinct !DILocation(line: 669, column: 9, scope: !1351)
!1351 = distinct !DILexicalBlock(scope: !427, file: !72, line: 669, column: 9)
!1352 = distinct !DIAssignID()
!1353 = !DILocation(line: 201, column: 17, scope: !845, inlinedAt: !1350, atomGroup: 2, atomRank: 2)
!1354 = !DILocation(line: 203, column: 19, scope: !856, inlinedAt: !1350, atomGroup: 3, atomRank: 2)
!1355 = !DILocation(line: 203, column: 27, scope: !856, inlinedAt: !1350, atomGroup: 3, atomRank: 1)
!1356 = !DILocation(line: 203, column: 30, scope: !856, inlinedAt: !1350)
!1357 = !DILocation(line: 203, column: 44, scope: !856, inlinedAt: !1350, atomGroup: 4, atomRank: 2)
!1358 = !DILocation(line: 203, column: 27, scope: !856, inlinedAt: !1350, atomGroup: 4, atomRank: 1)
!1359 = !DILocation(line: 209, column: 1, scope: !845, inlinedAt: !1350, atomGroup: 135, atomRank: 1)
!1360 = !DILocation(line: 669, column: 39, scope: !1351, atomGroup: 97, atomRank: 1)
!1361 = !DILocation(line: 209, column: 1, scope: !845, inlinedAt: !1350, atomGroup: 7, atomRank: 1)
!1362 = !DILocation(line: 673, column: 35, scope: !427)
!1363 = !DILocation(line: 673, column: 35, scope: !427, atomGroup: 99, atomRank: 2)
!1364 = !DILocation(line: 0, scope: !845, inlinedAt: !1365)
!1365 = distinct !DILocation(line: 676, column: 9, scope: !1366)
!1366 = distinct !DILexicalBlock(scope: !427, file: !72, line: 676, column: 9)
!1367 = distinct !DIAssignID()
!1368 = !DILocation(line: 201, column: 17, scope: !845, inlinedAt: !1365, atomGroup: 2, atomRank: 2)
!1369 = !DILocation(line: 203, column: 19, scope: !856, inlinedAt: !1365, atomGroup: 3, atomRank: 2)
!1370 = !DILocation(line: 203, column: 27, scope: !856, inlinedAt: !1365, atomGroup: 3, atomRank: 1)
!1371 = !DILocation(line: 203, column: 30, scope: !856, inlinedAt: !1365)
!1372 = !DILocation(line: 203, column: 44, scope: !856, inlinedAt: !1365, atomGroup: 4, atomRank: 2)
!1373 = !DILocation(line: 203, column: 27, scope: !856, inlinedAt: !1365, atomGroup: 4, atomRank: 1)
!1374 = !DILocation(line: 209, column: 1, scope: !845, inlinedAt: !1365, atomGroup: 136, atomRank: 1)
!1375 = !DILocation(line: 676, column: 37, scope: !1366, atomGroup: 100, atomRank: 1)
!1376 = !DILocation(line: 209, column: 1, scope: !845, inlinedAt: !1365, atomGroup: 7, atomRank: 1)
!1377 = !DILocation(line: 262, column: 2, scope: !505, inlinedAt: !519)
!1378 = !DILocation(line: 263, column: 2, scope: !505, inlinedAt: !519)
!1379 = !DILocation(line: 265, column: 16, scope: !505, inlinedAt: !519)
!1380 = !DILocation(line: 265, column: 21, scope: !505, inlinedAt: !519, atomGroup: 1, atomRank: 1)
!1381 = distinct !DIAssignID()
!1382 = !DILocation(line: 266, column: 14, scope: !505, inlinedAt: !519)
!1383 = !DILocation(line: 266, column: 19, scope: !505, inlinedAt: !519, atomGroup: 2, atomRank: 1)
!1384 = distinct !DIAssignID()
!1385 = !DILocation(line: 268, column: 2, scope: !505, inlinedAt: !519, atomGroup: 3, atomRank: 1)
!1386 = distinct !DIAssignID()
!1387 = !DILocation(line: 269, column: 2, scope: !505, inlinedAt: !519, atomGroup: 4, atomRank: 1)
!1388 = distinct !DIAssignID()
!1389 = !DILocation(line: 0, scope: !1273, inlinedAt: !1390)
!1390 = distinct !DILocation(line: 271, column: 6, scope: !1280, inlinedAt: !519)
!1391 = !DILocation(line: 229, column: 11, scope: !1273, inlinedAt: !1390, atomGroup: 2, atomRank: 2)
!1392 = !DILocation(line: 231, column: 13, scope: !1283, inlinedAt: !1390, atomGroup: 3, atomRank: 2)
!1393 = !DILocation(line: 231, column: 21, scope: !1283, inlinedAt: !1390, atomGroup: 3, atomRank: 1)
!1394 = !DILocation(line: 231, column: 24, scope: !1283, inlinedAt: !1390)
!1395 = !DILocation(line: 231, column: 32, scope: !1283, inlinedAt: !1390, atomGroup: 4, atomRank: 2)
!1396 = !DILocation(line: 231, column: 21, scope: !1283, inlinedAt: !1390, atomGroup: 4, atomRank: 1)
!1397 = !DILocation(line: 0, scope: !1273, inlinedAt: !1398)
!1398 = distinct !DILocation(line: 273, column: 13, scope: !1290, inlinedAt: !519)
!1399 = !DILocation(line: 229, column: 11, scope: !1273, inlinedAt: !1398, atomGroup: 2, atomRank: 2)
!1400 = !DILocation(line: 231, column: 13, scope: !1283, inlinedAt: !1398, atomGroup: 3, atomRank: 2)
!1401 = !DILocation(line: 231, column: 21, scope: !1283, inlinedAt: !1398, atomGroup: 3, atomRank: 1)
!1402 = !DILocation(line: 231, column: 24, scope: !1283, inlinedAt: !1398)
!1403 = !DILocation(line: 231, column: 32, scope: !1283, inlinedAt: !1398, atomGroup: 4, atomRank: 2)
!1404 = !DILocation(line: 231, column: 21, scope: !1283, inlinedAt: !1398, atomGroup: 4, atomRank: 1)
!1405 = !DILocation(line: 279, column: 1, scope: !505, inlinedAt: !519)
!1406 = !DILocation(line: 0, scope: !428)
!1407 = !DILocation(line: 0, scope: !433)
!1408 = !DILocation(line: 179, column: 12, scope: !1136, inlinedAt: !626)
!1409 = !DILocation(line: 179, column: 16, scope: !1136, inlinedAt: !626, atomGroup: 2, atomRank: 2)
!1410 = !DILocation(line: 179, column: 16, scope: !1136, inlinedAt: !626, atomGroup: 2, atomRank: 1)
!1411 = !DILocation(line: 0, scope: !1140, inlinedAt: !1412)
!1412 = distinct !DILocation(line: 690, column: 24, scope: !1413)
!1413 = distinct !DILexicalBlock(scope: !433, file: !72, line: 690, column: 9)
!1414 = !DILocation(line: 330, column: 26, scope: !1140, inlinedAt: !1412, atomGroup: 1, atomRank: 3)
!1415 = !DILocation(line: 333, column: 8, scope: !1152, inlinedAt: !1412, atomGroup: 2, atomRank: 2)
!1416 = !DILocation(line: 690, column: 21, scope: !1413)
!1417 = !DILocation(line: 690, column: 21, scope: !1413, atomGroup: 107, atomRank: 1)
!1418 = !DILocation(line: 0, scope: !436)
!1419 = !DILocation(line: 209, column: 13, scope: !1420, inlinedAt: !612)
!1420 = distinct !DILexicalBlock(scope: !603, file: !238, line: 209, column: 6)
!1421 = !DILocation(line: 209, column: 17, scope: !1420, inlinedAt: !612, atomGroup: 2, atomRank: 2)
!1422 = !DILocation(line: 209, column: 17, scope: !1420, inlinedAt: !612, atomGroup: 2, atomRank: 1)
!1423 = !DILocalVariable(name: "icmp6_header", arg: 1, scope: !1424, file: !72, line: 347, type: !438)
!1424 = distinct !DISubprogram(name: "is_filtered_icmp6_packet", scope: !72, file: !72, line: 347, type: !1425, scopeLine: 347, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1427, keyInstructions: true)
!1425 = !DISubroutineType(types: !1426)
!1426 = !{!486, !438}
!1427 = !{!1423, !1428}
!1428 = !DILocalVariable(name: "type", scope: !1424, file: !72, line: 349, type: !60)
!1429 = !DILocation(line: 0, scope: !1424, inlinedAt: !1430)
!1430 = distinct !DILocation(line: 706, column: 25, scope: !1431)
!1431 = distinct !DILexicalBlock(scope: !436, file: !72, line: 706, column: 9)
!1432 = !DILocation(line: 349, column: 27, scope: !1424, inlinedAt: !1430, atomGroup: 1, atomRank: 3)
!1433 = !{!1434, !217, i64 0}
!1434 = !{!"icmp6hdr", !217, i64 0, !217, i64 1, !736, i64 2, !217, i64 4}
!1435 = !DILocation(line: 352, column: 8, scope: !1436, inlinedAt: !1430, atomGroup: 2, atomRank: 2)
!1436 = distinct !DILexicalBlock(scope: !1424, file: !72, line: 352, column: 3)
!1437 = !DILocation(line: 706, column: 22, scope: !1431)
!1438 = !DILocation(line: 706, column: 22, scope: !1431, atomGroup: 112, atomRank: 1)
!1439 = !DILocation(line: 720, column: 2, scope: !415)
!1440 = !DILocation(line: 724, column: 1, scope: !219, atomGroup: 115, atomRank: 1)
