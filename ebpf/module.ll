; ModuleID = '/home/cookiengineer/Software/cookiengineer/ebpf-firewall/ebpf/module.c'
source_filename = "/home/cookiengineer/Software/cookiengineer/ebpf-firewall/ebpf/module.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.anon.8 = type { ptr, ptr, ptr, ptr }
%struct.anon.9 = type { ptr, ptr, ptr, ptr }
%struct.anon.10 = type { ptr, ptr, ptr, ptr }
%struct.xdp_md = type { i32, i32, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }

@ipv6_bans = dso_local global %struct.anon.8 zeroinitializer, section ".maps", align 8
@port_bans = dso_local global %struct.anon.9 zeroinitializer, section ".maps", align 8
@ipv4_bans = dso_local global %struct.anon.10 zeroinitializer, section ".maps", align 8
@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1
@llvm.compiler.used = appending global [5 x ptr] [ptr @_license, ptr @ipv4_bans, ptr @ipv6_bans, ptr @port_bans, ptr @xdp_prog_main], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @xdp_prog_main(ptr nocapture noundef readonly %0) #0 section "xdp_prog" {
  %2 = alloca i32, align 4
  %3 = alloca i128, align 16
  %4 = alloca i16, align 2
  %5 = alloca i16, align 2
  %6 = getelementptr inbounds %struct.xdp_md, ptr %0, i64 0, i32 1
  %7 = load i32, ptr %6, align 4, !tbaa !3
  %8 = zext i32 %7 to i64
  %9 = inttoptr i64 %8 to ptr
  %10 = load i32, ptr %0, align 4, !tbaa !8
  %11 = zext i32 %10 to i64
  %12 = inttoptr i64 %11 to ptr
  %13 = getelementptr i8, ptr %12, i64 14
  %14 = icmp ugt ptr %13, %9
  br i1 %14, label %142, label %15

15:                                               ; preds = %1
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %2) #6
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %3) #6
  call void @llvm.lifetime.start.p0(i64 2, ptr nonnull %4) #6
  call void @llvm.lifetime.start.p0(i64 2, ptr nonnull %5) #6
  %16 = getelementptr inbounds %struct.ethhdr, ptr %12, i64 0, i32 2
  %17 = load i16, ptr %16, align 1, !tbaa !9
  switch i16 %17, label %139 [
    i16 -8826, label %18
    i16 8, label %79
  ]

18:                                               ; preds = %15
  %19 = getelementptr i8, ptr %12, i64 54
  %20 = icmp ult ptr %19, %9
  br i1 %20, label %21, label %140

21:                                               ; preds = %18
  %22 = getelementptr i8, ptr %12, i64 22
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(16) %3, ptr noundef nonnull align 4 dereferenceable(16) %22, i64 16, i1 false)
  %23 = load i128, ptr %3, align 16, !tbaa !12
  %24 = icmp eq i128 %23, 0
  br i1 %24, label %31, label %25

25:                                               ; preds = %21
  %26 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @ipv6_bans, ptr noundef nonnull %3) #6
  %27 = icmp eq ptr %26, null
  br i1 %27, label %31, label %28

28:                                               ; preds = %25
  %29 = load i8, ptr %26, align 1, !tbaa !14
  %30 = icmp eq i8 %29, 0
  br i1 %30, label %31, label %140

31:                                               ; preds = %25, %28, %21
  %32 = getelementptr i8, ptr %12, i64 20
  %33 = load i8, ptr %32, align 2, !tbaa !15
  switch i8 %33, label %139 [
    i8 17, label %34
    i8 6, label %43
    i8 58, label %52
    i8 1, label %67
  ]

34:                                               ; preds = %31
  %35 = icmp eq ptr %19, null
  br i1 %35, label %139, label %36

36:                                               ; preds = %34
  %37 = getelementptr i8, ptr %12, i64 56
  %38 = load i16, ptr %37, align 2, !tbaa !17
  store i16 %38, ptr %5, align 2, !tbaa !19
  %39 = icmp eq i16 %38, 0
  br i1 %39, label %139, label %40

40:                                               ; preds = %36
  %41 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @port_bans, ptr noundef nonnull %5) #6
  %42 = icmp eq ptr %41, null
  br i1 %42, label %139, label %140

43:                                               ; preds = %31
  %44 = icmp eq ptr %19, null
  br i1 %44, label %139, label %45

45:                                               ; preds = %43
  %46 = getelementptr i8, ptr %12, i64 56
  %47 = load i16, ptr %46, align 2, !tbaa !20
  store i16 %47, ptr %5, align 2, !tbaa !19
  %48 = icmp eq i16 %47, 0
  br i1 %48, label %139, label %49

49:                                               ; preds = %45
  %50 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @port_bans, ptr noundef nonnull %5) #6
  %51 = icmp eq ptr %50, null
  br i1 %51, label %139, label %140

52:                                               ; preds = %31
  %53 = icmp eq ptr %19, null
  br i1 %53, label %139, label %54

54:                                               ; preds = %52
  %55 = load i8, ptr %19, align 4, !tbaa !22
  switch i8 %55, label %56 [
    i8 0, label %140
    i8 1, label %140
    i8 2, label %140
    i8 4, label %140
    i8 6, label %140
    i8 7, label %140
    i8 8, label %140
    i8 9, label %140
    i8 10, label %140
    i8 13, label %140
    i8 14, label %140
    i8 15, label %140
    i8 16, label %140
    i8 17, label %140
    i8 18, label %140
    i8 19, label %140
  ]

56:                                               ; preds = %54
  %57 = add i8 %55, -20
  %58 = icmp ult i8 %57, 22
  %59 = and i8 %55, -2
  %60 = icmp eq i8 %59, 42
  %61 = or i1 %58, %60
  %62 = icmp sgt i8 %55, 43
  %63 = select i1 %61, i1 true, i1 %62
  br i1 %63, label %140, label %64

64:                                               ; preds = %56
  switch i8 %55, label %65 [
    i8 -128, label %140
    i8 -127, label %140
    i8 -123, label %140
    i8 -122, label %140
    i8 -121, label %140
    i8 -120, label %140
    i8 -106, label %140
    i8 -105, label %140
    i8 -104, label %140
    i8 -103, label %140
    i8 -102, label %140
  ]

65:                                               ; preds = %64
  %66 = icmp ugt i8 %55, -101
  br i1 %66, label %140, label %139

67:                                               ; preds = %31
  %68 = icmp eq ptr %19, null
  br i1 %68, label %139, label %69

69:                                               ; preds = %67
  %70 = load i8, ptr %19, align 4, !tbaa !22
  switch i8 %70, label %71 [
    i8 0, label %140
    i8 1, label %140
    i8 2, label %140
    i8 4, label %140
    i8 6, label %140
    i8 7, label %140
    i8 8, label %140
    i8 9, label %140
    i8 10, label %140
    i8 13, label %140
    i8 14, label %140
    i8 15, label %140
    i8 16, label %140
    i8 17, label %140
    i8 18, label %140
    i8 19, label %140
  ]

71:                                               ; preds = %69
  %72 = add i8 %70, -20
  %73 = icmp ult i8 %72, 22
  br i1 %73, label %140, label %74

74:                                               ; preds = %71
  %75 = and i8 %70, -2
  %76 = icmp eq i8 %75, 42
  %77 = icmp ugt i8 %70, 43
  %78 = or i1 %77, %76
  br i1 %78, label %140, label %139

79:                                               ; preds = %15
  %80 = getelementptr i8, ptr %12, i64 34
  %81 = icmp ult ptr %80, %9
  br i1 %81, label %82, label %140

82:                                               ; preds = %79
  %83 = getelementptr i8, ptr %12, i64 26
  %84 = load i32, ptr %83, align 4
  store i32 %84, ptr %2, align 4
  %85 = icmp eq i32 %84, 0
  br i1 %85, label %92, label %86

86:                                               ; preds = %82
  %87 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @ipv4_bans, ptr noundef nonnull %2) #6
  %88 = icmp eq ptr %87, null
  br i1 %88, label %92, label %89

89:                                               ; preds = %86
  %90 = load i8, ptr %87, align 1, !tbaa !14
  %91 = icmp eq i8 %90, 0
  br i1 %91, label %92, label %140

92:                                               ; preds = %86, %89, %82
  %93 = getelementptr i8, ptr %12, i64 23
  %94 = load i8, ptr %93, align 1, !tbaa !24
  switch i8 %94, label %139 [
    i8 17, label %95
    i8 6, label %118
    i8 1, label %127
  ]

95:                                               ; preds = %92
  %96 = icmp eq ptr %80, null
  br i1 %96, label %139, label %97

97:                                               ; preds = %95
  %98 = getelementptr i8, ptr %12, i64 36
  %99 = load i16, ptr %98, align 2, !tbaa !17
  store i16 %99, ptr %4, align 2, !tbaa !19
  %100 = icmp eq i16 %99, 0
  br i1 %100, label %104, label %101

101:                                              ; preds = %97
  %102 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @port_bans, ptr noundef nonnull %4) #6
  %103 = icmp eq ptr %102, null
  br i1 %103, label %104, label %140

104:                                              ; preds = %101, %97
  %105 = getelementptr i8, ptr %12, i64 54
  %106 = icmp uge ptr %105, %9
  %107 = getelementptr i8, ptr %12, i64 42
  %108 = icmp eq ptr %107, null
  %109 = or i1 %106, %108
  br i1 %109, label %139, label %110

110:                                              ; preds = %104
  %111 = getelementptr i8, ptr %12, i64 44
  %112 = load i16, ptr %111, align 2
  %113 = and i16 %112, 248
  %114 = icmp eq i16 %113, 0
  br i1 %114, label %115, label %139

115:                                              ; preds = %110
  call fastcc void @parse_dns_question(ptr noundef nonnull %0, ptr noundef %105)
  %116 = load i16, ptr inttoptr (i64 258 to ptr), align 2, !tbaa !26
  %117 = icmp eq i16 %116, 1
  br i1 %117, label %139, label %140

118:                                              ; preds = %92
  %119 = icmp eq ptr %80, null
  br i1 %119, label %139, label %120

120:                                              ; preds = %118
  %121 = getelementptr i8, ptr %12, i64 36
  %122 = load i16, ptr %121, align 2, !tbaa !20
  store i16 %122, ptr %4, align 2, !tbaa !19
  %123 = icmp eq i16 %122, 0
  br i1 %123, label %139, label %124

124:                                              ; preds = %120
  %125 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @port_bans, ptr noundef nonnull %4) #6
  %126 = icmp eq ptr %125, null
  br i1 %126, label %139, label %140

127:                                              ; preds = %92
  %128 = icmp eq ptr %80, null
  br i1 %128, label %139, label %129

129:                                              ; preds = %127
  %130 = load i8, ptr %80, align 4, !tbaa !22
  switch i8 %130, label %131 [
    i8 0, label %140
    i8 1, label %140
    i8 2, label %140
    i8 4, label %140
    i8 6, label %140
    i8 7, label %140
    i8 8, label %140
    i8 9, label %140
    i8 10, label %140
    i8 13, label %140
    i8 14, label %140
    i8 15, label %140
    i8 16, label %140
    i8 17, label %140
    i8 18, label %140
    i8 19, label %140
  ]

131:                                              ; preds = %129
  %132 = add i8 %130, -20
  %133 = icmp ult i8 %132, 22
  br i1 %133, label %140, label %134

134:                                              ; preds = %131
  %135 = and i8 %130, -2
  %136 = icmp eq i8 %135, 42
  %137 = icmp ugt i8 %130, 43
  %138 = or i1 %137, %136
  br i1 %138, label %140, label %139

139:                                              ; preds = %115, %134, %74, %15, %92, %31, %110, %104, %95, %127, %118, %124, %120, %45, %49, %43, %67, %52, %65, %34, %40, %36
  br label %140

140:                                              ; preds = %134, %74, %115, %79, %129, %129, %129, %129, %129, %129, %129, %129, %129, %129, %129, %129, %129, %129, %129, %129, %131, %124, %101, %89, %18, %69, %69, %69, %69, %69, %69, %69, %69, %69, %69, %69, %69, %69, %69, %69, %69, %71, %54, %54, %54, %54, %54, %54, %54, %54, %54, %54, %54, %54, %54, %54, %54, %54, %56, %64, %64, %64, %64, %64, %64, %64, %64, %64, %64, %64, %65, %49, %40, %28, %139
  %141 = phi i32 [ 2, %139 ], [ 1, %28 ], [ 1, %40 ], [ 1, %49 ], [ 1, %65 ], [ 1, %64 ], [ 1, %64 ], [ 1, %64 ], [ 1, %64 ], [ 1, %64 ], [ 1, %64 ], [ 1, %64 ], [ 1, %64 ], [ 1, %64 ], [ 1, %64 ], [ 1, %64 ], [ 1, %56 ], [ 1, %54 ], [ 1, %54 ], [ 1, %54 ], [ 1, %54 ], [ 1, %54 ], [ 1, %54 ], [ 1, %54 ], [ 1, %54 ], [ 1, %54 ], [ 1, %54 ], [ 1, %54 ], [ 1, %54 ], [ 1, %54 ], [ 1, %54 ], [ 1, %54 ], [ 1, %54 ], [ 1, %74 ], [ 1, %71 ], [ 1, %69 ], [ 1, %69 ], [ 1, %69 ], [ 1, %69 ], [ 1, %69 ], [ 1, %69 ], [ 1, %69 ], [ 1, %69 ], [ 1, %69 ], [ 1, %69 ], [ 1, %69 ], [ 1, %69 ], [ 1, %69 ], [ 1, %69 ], [ 1, %69 ], [ 1, %69 ], [ 1, %18 ], [ 1, %89 ], [ 1, %101 ], [ 1, %124 ], [ 1, %134 ], [ 1, %131 ], [ 1, %129 ], [ 1, %129 ], [ 1, %129 ], [ 1, %129 ], [ 1, %129 ], [ 1, %129 ], [ 1, %129 ], [ 1, %129 ], [ 1, %129 ], [ 1, %129 ], [ 1, %129 ], [ 1, %129 ], [ 1, %129 ], [ 1, %129 ], [ 1, %129 ], [ 1, %129 ], [ 1, %79 ], [ 1, %115 ]
  call void @llvm.lifetime.end.p0(i64 2, ptr nonnull %5) #6
  call void @llvm.lifetime.end.p0(i64 2, ptr nonnull %4) #6
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %3) #6
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %2) #6
  br label %142

142:                                              ; preds = %1, %140
  %143 = phi i32 [ %141, %140 ], [ 1, %1 ]
  ret i32 %143
}

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: argmemonly mustprogress nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nofree nosync nounwind
define internal fastcc void @parse_dns_question(ptr nocapture noundef readonly %0, ptr noundef readonly %1) unnamed_addr #3 {
  %3 = getelementptr inbounds %struct.xdp_md, ptr %0, i64 0, i32 1
  %4 = load i32, ptr %3, align 4, !tbaa !3
  %5 = zext i32 %4 to i64
  %6 = inttoptr i64 %5 to ptr
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 4294967296 dereferenceable(256) null, i8 0, i64 256, i1 false)
  store i16 0, ptr inttoptr (i64 256 to ptr), align 256, !tbaa !28
  store i16 0, ptr inttoptr (i64 258 to ptr), align 2, !tbaa !26
  %7 = icmp ugt ptr %6, %1
  br i1 %7, label %8, label %27

8:                                                ; preds = %2, %20
  %9 = phi i64 [ %23, %20 ], [ 0, %2 ]
  %10 = phi ptr [ %22, %20 ], [ %1, %2 ]
  %11 = load i8, ptr %10, align 1, !tbaa !14
  %12 = icmp eq i8 %11, 0
  br i1 %12, label %13, label %20

13:                                               ; preds = %8
  %14 = getelementptr i8, ptr %10, i64 1
  %15 = load i16, ptr %14, align 2, !tbaa !19
  %16 = tail call i16 @llvm.bswap.i16(i16 %15)
  store i16 %16, ptr inttoptr (i64 256 to ptr), align 256, !tbaa !28
  %17 = getelementptr i8, ptr %10, i64 3
  %18 = load i16, ptr %17, align 2, !tbaa !19
  %19 = tail call i16 @llvm.bswap.i16(i16 %18)
  store i16 %19, ptr inttoptr (i64 258 to ptr), align 2, !tbaa !26
  br label %27

20:                                               ; preds = %8
  %21 = getelementptr inbounds [256 x i8], ptr null, i64 0, i64 %9
  store i8 poison, ptr %21, align 1, !tbaa !14
  %22 = getelementptr inbounds i8, ptr %10, i64 1
  %23 = add nuw nsw i64 %9, 1
  %24 = icmp ult i64 %9, 255
  %25 = icmp ult ptr %22, %6
  %26 = select i1 %24, i1 %25, i1 false
  br i1 %26, label %8, label %27, !llvm.loop !29

27:                                               ; preds = %20, %2, %13
  ret void
}

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: argmemonly mustprogress nocallback nofree nounwind willreturn writeonly
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i16 @llvm.bswap.i16(i16) #5

attributes #0 = { nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #2 = { argmemonly mustprogress nocallback nofree nounwind willreturn }
attributes #3 = { nofree nosync nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #4 = { argmemonly mustprogress nocallback nofree nounwind willreturn writeonly }
attributes #5 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #6 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"clang version 15.0.7"}
!3 = !{!4, !5, i64 4}
!4 = !{!"xdp_md", !5, i64 0, !5, i64 4, !5, i64 8, !5, i64 12, !5, i64 16, !5, i64 20}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!4, !5, i64 0}
!9 = !{!10, !11, i64 12}
!10 = !{!"ethhdr", !6, i64 0, !6, i64 6, !11, i64 12}
!11 = !{!"short", !6, i64 0}
!12 = !{!13, !13, i64 0}
!13 = !{!"__int128", !6, i64 0}
!14 = !{!6, !6, i64 0}
!15 = !{!16, !6, i64 6}
!16 = !{!"ipv6hdr", !6, i64 0, !6, i64 0, !6, i64 1, !11, i64 4, !6, i64 6, !6, i64 7, !6, i64 8}
!17 = !{!18, !11, i64 2}
!18 = !{!"udphdr", !11, i64 0, !11, i64 2, !11, i64 4, !11, i64 6}
!19 = !{!11, !11, i64 0}
!20 = !{!21, !11, i64 2}
!21 = !{!"tcphdr", !11, i64 0, !11, i64 2, !5, i64 4, !5, i64 8, !11, i64 12, !11, i64 12, !11, i64 13, !11, i64 13, !11, i64 13, !11, i64 13, !11, i64 13, !11, i64 13, !11, i64 13, !11, i64 13, !11, i64 14, !11, i64 16, !11, i64 18}
!22 = !{!23, !6, i64 0}
!23 = !{!"icmphdr", !6, i64 0, !6, i64 1, !11, i64 2, !6, i64 4}
!24 = !{!25, !6, i64 9}
!25 = !{!"iphdr", !6, i64 0, !6, i64 0, !6, i64 1, !11, i64 2, !11, i64 4, !11, i64 6, !6, i64 8, !6, i64 9, !11, i64 10, !6, i64 12}
!26 = !{!27, !11, i64 258}
!27 = !{!"dnsquestion", !6, i64 0, !11, i64 256, !11, i64 258}
!28 = !{!27, !11, i64 256}
!29 = distinct !{!29, !30}
!30 = !{!"llvm.loop.mustprogress"}
