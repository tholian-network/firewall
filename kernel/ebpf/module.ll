; ModuleID = '/home/cookiengineer/Software/cookiengineer/ebpf-firewall/kernel/ebpf/module.c'
source_filename = "/home/cookiengineer/Software/cookiengineer/ebpf-firewall/kernel/ebpf/module.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.anon.8 = type { ptr, ptr, ptr, ptr }
%struct.anon.9 = type { ptr, ptr, ptr, ptr }
%struct.anon.10 = type { ptr, ptr, ptr, ptr }
%struct.xdp_md = type { i32, i32, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }

@ipv6_bans = dso_local global %struct.anon.8 zeroinitializer, section ".maps", align 8, !dbg !0
@port_bans = dso_local global %struct.anon.9 zeroinitializer, section ".maps", align 8, !dbg !119
@ipv4_bans = dso_local global %struct.anon.10 zeroinitializer, section ".maps", align 8, !dbg !140
@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !114
@llvm.compiler.used = appending global [5 x ptr] [ptr @_license, ptr @ipv4_bans, ptr @ipv6_bans, ptr @port_bans, ptr @xdp_prog_main], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @xdp_prog_main(ptr nocapture noundef readonly %0) #0 section "xdp_prog" !dbg !177 {
  %2 = alloca i32, align 4
  %3 = alloca i128, align 16
  %4 = alloca i16, align 2
  %5 = alloca i16, align 2
  call void @llvm.dbg.value(metadata ptr %0, metadata !190, metadata !DIExpression()), !dbg !283
  %6 = getelementptr inbounds %struct.xdp_md, ptr %0, i64 0, i32 1, !dbg !284
  %7 = load i32, ptr %6, align 4, !dbg !284, !tbaa !285
  %8 = zext i32 %7 to i64, !dbg !290
  %9 = inttoptr i64 %8 to ptr, !dbg !291
  call void @llvm.dbg.value(metadata ptr %9, metadata !191, metadata !DIExpression()), !dbg !283
  %10 = load i32, ptr %0, align 4, !dbg !292, !tbaa !293
  %11 = zext i32 %10 to i64, !dbg !294
  %12 = inttoptr i64 %11 to ptr, !dbg !295
  call void @llvm.dbg.value(metadata ptr %12, metadata !192, metadata !DIExpression()), !dbg !283
  %13 = getelementptr i8, ptr %12, i64 14, !dbg !296
  %14 = icmp ugt ptr %13, %9, !dbg !298
  br i1 %14, label %149, label %15, !dbg !299

15:                                               ; preds = %1
  call void @llvm.dbg.value(metadata ptr %12, metadata !193, metadata !DIExpression()), !dbg !283
  call void @llvm.dbg.value(metadata ptr null, metadata !204, metadata !DIExpression()), !dbg !283
  call void @llvm.dbg.value(metadata ptr null, metadata !231, metadata !DIExpression()), !dbg !283
  call void @llvm.dbg.value(metadata ptr null, metadata !274, metadata !DIExpression()), !dbg !283
  call void @llvm.dbg.value(metadata ptr null, metadata !275, metadata !DIExpression()), !dbg !283
  call void @llvm.dbg.value(metadata ptr null, metadata !276, metadata !DIExpression()), !dbg !283
  call void @llvm.dbg.value(metadata ptr null, metadata !277, metadata !DIExpression()), !dbg !283
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %2) #5, !dbg !300
  call void @llvm.dbg.value(metadata i32 0, metadata !278, metadata !DIExpression()), !dbg !283
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %3) #5, !dbg !301
  call void @llvm.dbg.value(metadata i128 0, metadata !279, metadata !DIExpression()), !dbg !283
  call void @llvm.dbg.value(metadata ptr null, metadata !280, metadata !DIExpression()), !dbg !283
  call void @llvm.lifetime.start.p0(i64 2, ptr nonnull %4) #5, !dbg !302
  call void @llvm.dbg.value(metadata i16 0, metadata !281, metadata !DIExpression()), !dbg !283
  call void @llvm.lifetime.start.p0(i64 2, ptr nonnull %5) #5, !dbg !303
  call void @llvm.dbg.value(metadata i16 0, metadata !282, metadata !DIExpression()), !dbg !283
  %16 = getelementptr inbounds %struct.ethhdr, ptr %12, i64 0, i32 2, !dbg !304
  %17 = load i16, ptr %16, align 1, !dbg !304, !tbaa !306
  switch i16 %17, label %146 [
    i16 -31011, label %18
    i16 2048, label %90
  ], !dbg !309

18:                                               ; preds = %15
  %19 = getelementptr i8, ptr %12, i64 54, !dbg !310
  %20 = icmp ult ptr %19, %9, !dbg !313
  br i1 %20, label %21, label %147, !dbg !314

21:                                               ; preds = %18
  call void @llvm.dbg.value(metadata ptr %13, metadata !231, metadata !DIExpression()), !dbg !283
  %22 = getelementptr i8, ptr %12, i64 22, !dbg !315
  call void @llvm.dbg.value(metadata ptr %3, metadata !279, metadata !DIExpression(DW_OP_deref)), !dbg !283
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(16) %3, ptr noundef nonnull align 4 dereferenceable(16) %22, i64 16, i1 false), !dbg !315
  %23 = load i128, ptr %3, align 16, !dbg !317, !tbaa !319
  call void @llvm.dbg.value(metadata i128 %23, metadata !279, metadata !DIExpression()), !dbg !283
  %24 = icmp eq i128 %23, 0, !dbg !321
  br i1 %24, label %31, label %25, !dbg !322

25:                                               ; preds = %21
  call void @llvm.dbg.value(metadata ptr %3, metadata !279, metadata !DIExpression(DW_OP_deref)), !dbg !283
  %26 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @ipv6_bans, ptr noundef nonnull %3) #5, !dbg !323
  call void @llvm.dbg.value(metadata ptr %26, metadata !277, metadata !DIExpression()), !dbg !283
  %27 = icmp eq ptr %26, null, !dbg !325
  br i1 %27, label %31, label %28, !dbg !327

28:                                               ; preds = %25
  %29 = load i8, ptr %26, align 1, !dbg !328, !tbaa !329
  %30 = icmp eq i8 %29, 0, !dbg !330
  br i1 %30, label %31, label %147, !dbg !331

31:                                               ; preds = %25, %28, %21
  %32 = getelementptr i8, ptr %12, i64 20, !dbg !332
  %33 = load i8, ptr %32, align 2, !dbg !332, !tbaa !334
  switch i8 %33, label %146 [
    i8 17, label %34
    i8 6, label %45
    i8 58, label %61
    i8 1, label %77
  ], !dbg !336

34:                                               ; preds = %31
  call void @llvm.dbg.value(metadata ptr %19, metadata !274, metadata !DIExpression()), !dbg !283
  %35 = getelementptr i8, ptr %12, i64 62, !dbg !337
  %36 = icmp ugt ptr %35, %9, !dbg !340
  br i1 %36, label %146, label %37, !dbg !341

37:                                               ; preds = %34
  %38 = getelementptr i8, ptr %12, i64 56, !dbg !342
  %39 = load i16, ptr %38, align 2, !dbg !342, !tbaa !344
  %40 = call i16 @llvm.bswap.i16(i16 %39), !dbg !342
  call void @llvm.dbg.value(metadata i16 %40, metadata !282, metadata !DIExpression()), !dbg !283
  store i16 %40, ptr %5, align 2, !dbg !346, !tbaa !347
  %41 = icmp eq i16 %39, 0, !dbg !348
  br i1 %41, label %146, label %42, !dbg !350

42:                                               ; preds = %37
  call void @llvm.dbg.value(metadata ptr %5, metadata !282, metadata !DIExpression(DW_OP_deref)), !dbg !283
  %43 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @port_bans, ptr noundef nonnull %5) #5, !dbg !351
  call void @llvm.dbg.value(metadata ptr %43, metadata !280, metadata !DIExpression()), !dbg !283
  %44 = icmp eq ptr %43, null, !dbg !353
  br i1 %44, label %146, label %147, !dbg !355

45:                                               ; preds = %31
  call void @llvm.dbg.value(metadata ptr %19, metadata !275, metadata !DIExpression()), !dbg !283
  %46 = getelementptr i8, ptr %12, i64 74, !dbg !356
  %47 = icmp ugt ptr %46, %9, !dbg !360
  br i1 %47, label %146, label %48, !dbg !361

48:                                               ; preds = %45
  call void @llvm.dbg.value(metadata ptr %19, metadata !362, metadata !DIExpression()), !dbg !367
  %49 = getelementptr i8, ptr %12, i64 66, !dbg !371
  %50 = load i16, ptr %49, align 4, !dbg !371
  %51 = and i16 %50, -8448, !dbg !373
  %52 = icmp eq i16 %51, 256, !dbg !373
  br i1 %52, label %147, label %53, !dbg !374

53:                                               ; preds = %48
  %54 = getelementptr i8, ptr %12, i64 56, !dbg !375
  %55 = load i16, ptr %54, align 2, !dbg !375, !tbaa !376
  %56 = call i16 @llvm.bswap.i16(i16 %55), !dbg !375
  call void @llvm.dbg.value(metadata i16 %56, metadata !282, metadata !DIExpression()), !dbg !283
  store i16 %56, ptr %5, align 2, !dbg !378, !tbaa !347
  %57 = icmp eq i16 %55, 0, !dbg !379
  br i1 %57, label %146, label %58, !dbg !381

58:                                               ; preds = %53
  call void @llvm.dbg.value(metadata ptr %5, metadata !282, metadata !DIExpression(DW_OP_deref)), !dbg !283
  %59 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @port_bans, ptr noundef nonnull %5) #5, !dbg !382
  call void @llvm.dbg.value(metadata ptr %59, metadata !280, metadata !DIExpression()), !dbg !283
  %60 = icmp eq ptr %59, null, !dbg !384
  br i1 %60, label %146, label %147, !dbg !386

61:                                               ; preds = %31
  call void @llvm.dbg.value(metadata ptr %19, metadata !276, metadata !DIExpression()), !dbg !283
  %62 = getelementptr i8, ptr %12, i64 62, !dbg !387
  %63 = icmp ugt ptr %62, %9, !dbg !391
  br i1 %63, label %146, label %64, !dbg !392

64:                                               ; preds = %61
  %65 = load i8, ptr %19, align 4, !dbg !393, !tbaa !396
  switch i8 %65, label %66 [
    i8 0, label %147
    i8 1, label %147
    i8 2, label %147
    i8 4, label %147
    i8 6, label %147
    i8 7, label %147
    i8 8, label %147
    i8 9, label %147
    i8 10, label %147
    i8 13, label %147
    i8 14, label %147
    i8 15, label %147
    i8 16, label %147
    i8 17, label %147
    i8 18, label %147
    i8 19, label %147
  ], !dbg !398

66:                                               ; preds = %64
  %67 = add i8 %65, -20, !dbg !399
  %68 = icmp ult i8 %67, 22, !dbg !399
  %69 = and i8 %65, -2
  %70 = icmp eq i8 %69, 42
  %71 = or i1 %68, %70, !dbg !399
  %72 = icmp sgt i8 %65, 43
  %73 = select i1 %71, i1 true, i1 %72, !dbg !399
  br i1 %73, label %147, label %74, !dbg !399

74:                                               ; preds = %66
  switch i8 %65, label %75 [
    i8 -128, label %147
    i8 -127, label %147
    i8 -123, label %147
    i8 -122, label %147
    i8 -121, label %147
    i8 -120, label %147
    i8 -106, label %147
    i8 -105, label %147
    i8 -104, label %147
    i8 -103, label %147
    i8 -102, label %147
  ], !dbg !400

75:                                               ; preds = %74
  %76 = icmp ugt i8 %65, -101, !dbg !401
  br i1 %76, label %147, label %146, !dbg !402

77:                                               ; preds = %31
  call void @llvm.dbg.value(metadata ptr %19, metadata !276, metadata !DIExpression()), !dbg !283
  %78 = getelementptr i8, ptr %12, i64 62, !dbg !403
  %79 = icmp ugt ptr %78, %9, !dbg !407
  br i1 %79, label %146, label %80, !dbg !408

80:                                               ; preds = %77
  %81 = load i8, ptr %19, align 4, !dbg !409, !tbaa !396
  switch i8 %81, label %82 [
    i8 0, label %147
    i8 1, label %147
    i8 2, label %147
    i8 4, label %147
    i8 6, label %147
    i8 7, label %147
    i8 8, label %147
    i8 9, label %147
    i8 10, label %147
    i8 13, label %147
    i8 14, label %147
    i8 15, label %147
    i8 16, label %147
    i8 17, label %147
    i8 18, label %147
    i8 19, label %147
  ], !dbg !412

82:                                               ; preds = %80
  %83 = add i8 %81, -20, !dbg !413
  %84 = icmp ult i8 %83, 22, !dbg !413
  br i1 %84, label %147, label %85, !dbg !413

85:                                               ; preds = %82
  %86 = and i8 %81, -2, !dbg !414
  %87 = icmp eq i8 %86, 42, !dbg !414
  %88 = icmp ugt i8 %81, 43
  %89 = or i1 %88, %87, !dbg !414
  br i1 %89, label %147, label %146, !dbg !414

90:                                               ; preds = %15
  %91 = getelementptr i8, ptr %12, i64 34, !dbg !415
  %92 = icmp ult ptr %91, %9, !dbg !419
  br i1 %92, label %93, label %147, !dbg !420

93:                                               ; preds = %90
  call void @llvm.dbg.value(metadata ptr %13, metadata !204, metadata !DIExpression()), !dbg !283
  %94 = getelementptr i8, ptr %12, i64 26, !dbg !421
  call void @llvm.dbg.value(metadata ptr %2, metadata !278, metadata !DIExpression(DW_OP_deref)), !dbg !283
  %95 = load i32, ptr %94, align 4, !dbg !421
  store i32 %95, ptr %2, align 4, !dbg !421
  call void @llvm.dbg.value(metadata i32 %95, metadata !278, metadata !DIExpression()), !dbg !283
  %96 = icmp eq i32 %95, 0, !dbg !423
  br i1 %96, label %103, label %97, !dbg !425

97:                                               ; preds = %93
  call void @llvm.dbg.value(metadata ptr %2, metadata !278, metadata !DIExpression(DW_OP_deref)), !dbg !283
  %98 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @ipv4_bans, ptr noundef nonnull %2) #5, !dbg !426
  call void @llvm.dbg.value(metadata ptr %98, metadata !277, metadata !DIExpression()), !dbg !283
  %99 = icmp eq ptr %98, null, !dbg !428
  br i1 %99, label %103, label %100, !dbg !430

100:                                              ; preds = %97
  %101 = load i8, ptr %98, align 1, !dbg !431, !tbaa !329
  %102 = icmp eq i8 %101, 0, !dbg !432
  br i1 %102, label %103, label %147, !dbg !433

103:                                              ; preds = %97, %100, %93
  %104 = getelementptr i8, ptr %12, i64 23, !dbg !434
  %105 = load i8, ptr %104, align 1, !dbg !434, !tbaa !436
  switch i8 %105, label %146 [
    i8 17, label %106
    i8 6, label %117
    i8 1, label %133
  ], !dbg !438

106:                                              ; preds = %103
  call void @llvm.dbg.value(metadata ptr %91, metadata !274, metadata !DIExpression()), !dbg !283
  %107 = getelementptr i8, ptr %12, i64 42, !dbg !439
  %108 = icmp ugt ptr %107, %9, !dbg !442
  br i1 %108, label %146, label %109, !dbg !443

109:                                              ; preds = %106
  %110 = getelementptr i8, ptr %12, i64 36, !dbg !444
  %111 = load i16, ptr %110, align 2, !dbg !444, !tbaa !344
  %112 = call i16 @llvm.bswap.i16(i16 %111), !dbg !444
  call void @llvm.dbg.value(metadata i16 %112, metadata !281, metadata !DIExpression()), !dbg !283
  store i16 %112, ptr %4, align 2, !dbg !446, !tbaa !347
  %113 = icmp eq i16 %111, 0, !dbg !447
  br i1 %113, label %146, label %114, !dbg !449

114:                                              ; preds = %109
  call void @llvm.dbg.value(metadata ptr %4, metadata !281, metadata !DIExpression(DW_OP_deref)), !dbg !283
  %115 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @port_bans, ptr noundef nonnull %4) #5, !dbg !450
  call void @llvm.dbg.value(metadata ptr %115, metadata !280, metadata !DIExpression()), !dbg !283
  %116 = icmp eq ptr %115, null, !dbg !452
  br i1 %116, label %146, label %147, !dbg !454

117:                                              ; preds = %103
  call void @llvm.dbg.value(metadata ptr %91, metadata !275, metadata !DIExpression()), !dbg !283
  %118 = getelementptr i8, ptr %12, i64 54, !dbg !455
  %119 = icmp ugt ptr %118, %9, !dbg !459
  br i1 %119, label %146, label %120, !dbg !460

120:                                              ; preds = %117
  call void @llvm.dbg.value(metadata ptr %91, metadata !362, metadata !DIExpression()), !dbg !461
  %121 = getelementptr i8, ptr %12, i64 46, !dbg !465
  %122 = load i16, ptr %121, align 4, !dbg !465
  %123 = and i16 %122, -8448, !dbg !466
  %124 = icmp eq i16 %123, 256, !dbg !466
  br i1 %124, label %147, label %125, !dbg !467

125:                                              ; preds = %120
  %126 = getelementptr i8, ptr %12, i64 36, !dbg !468
  %127 = load i16, ptr %126, align 2, !dbg !468, !tbaa !376
  %128 = call i16 @llvm.bswap.i16(i16 %127), !dbg !468
  call void @llvm.dbg.value(metadata i16 %128, metadata !281, metadata !DIExpression()), !dbg !283
  store i16 %128, ptr %4, align 2, !dbg !469, !tbaa !347
  %129 = icmp eq i16 %127, 0, !dbg !470
  br i1 %129, label %146, label %130, !dbg !472

130:                                              ; preds = %125
  call void @llvm.dbg.value(metadata ptr %4, metadata !281, metadata !DIExpression(DW_OP_deref)), !dbg !283
  %131 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @port_bans, ptr noundef nonnull %4) #5, !dbg !473
  call void @llvm.dbg.value(metadata ptr %131, metadata !280, metadata !DIExpression()), !dbg !283
  %132 = icmp eq ptr %131, null, !dbg !475
  br i1 %132, label %146, label %147, !dbg !477

133:                                              ; preds = %103
  call void @llvm.dbg.value(metadata ptr %91, metadata !276, metadata !DIExpression()), !dbg !283
  %134 = getelementptr i8, ptr %12, i64 42, !dbg !478
  %135 = icmp ugt ptr %134, %9, !dbg !482
  br i1 %135, label %146, label %136, !dbg !483

136:                                              ; preds = %133
  %137 = load i8, ptr %91, align 4, !dbg !484, !tbaa !396
  switch i8 %137, label %138 [
    i8 0, label %147
    i8 1, label %147
    i8 2, label %147
    i8 4, label %147
    i8 6, label %147
    i8 7, label %147
    i8 8, label %147
    i8 9, label %147
    i8 10, label %147
    i8 13, label %147
    i8 14, label %147
    i8 15, label %147
    i8 16, label %147
    i8 17, label %147
    i8 18, label %147
    i8 19, label %147
  ], !dbg !487

138:                                              ; preds = %136
  %139 = add i8 %137, -20, !dbg !488
  %140 = icmp ult i8 %139, 22, !dbg !488
  br i1 %140, label %147, label %141, !dbg !488

141:                                              ; preds = %138
  %142 = and i8 %137, -2, !dbg !489
  %143 = icmp eq i8 %142, 42, !dbg !489
  %144 = icmp ugt i8 %137, 43
  %145 = or i1 %144, %143, !dbg !489
  br i1 %145, label %147, label %146, !dbg !489

146:                                              ; preds = %141, %85, %15, %103, %31, %109, %114, %106, %133, %117, %130, %125, %53, %58, %45, %77, %61, %75, %34, %42, %37
  br label %147, !dbg !490

147:                                              ; preds = %141, %85, %90, %136, %136, %136, %136, %136, %136, %136, %136, %136, %136, %136, %136, %136, %136, %136, %136, %138, %130, %120, %114, %100, %18, %80, %80, %80, %80, %80, %80, %80, %80, %80, %80, %80, %80, %80, %80, %80, %80, %82, %64, %64, %64, %64, %64, %64, %64, %64, %64, %64, %64, %64, %64, %64, %64, %64, %66, %74, %74, %74, %74, %74, %74, %74, %74, %74, %74, %74, %75, %58, %48, %42, %28, %146
  %148 = phi i32 [ 2, %146 ], [ 1, %28 ], [ 1, %42 ], [ 1, %48 ], [ 1, %58 ], [ 1, %75 ], [ 1, %74 ], [ 1, %74 ], [ 1, %74 ], [ 1, %74 ], [ 1, %74 ], [ 1, %74 ], [ 1, %74 ], [ 1, %74 ], [ 1, %74 ], [ 1, %74 ], [ 1, %74 ], [ 1, %66 ], [ 1, %64 ], [ 1, %64 ], [ 1, %64 ], [ 1, %64 ], [ 1, %64 ], [ 1, %64 ], [ 1, %64 ], [ 1, %64 ], [ 1, %64 ], [ 1, %64 ], [ 1, %64 ], [ 1, %64 ], [ 1, %64 ], [ 1, %64 ], [ 1, %64 ], [ 1, %64 ], [ 1, %85 ], [ 1, %82 ], [ 1, %80 ], [ 1, %80 ], [ 1, %80 ], [ 1, %80 ], [ 1, %80 ], [ 1, %80 ], [ 1, %80 ], [ 1, %80 ], [ 1, %80 ], [ 1, %80 ], [ 1, %80 ], [ 1, %80 ], [ 1, %80 ], [ 1, %80 ], [ 1, %80 ], [ 1, %80 ], [ 1, %18 ], [ 1, %100 ], [ 1, %114 ], [ 1, %120 ], [ 1, %130 ], [ 1, %141 ], [ 1, %138 ], [ 1, %136 ], [ 1, %136 ], [ 1, %136 ], [ 1, %136 ], [ 1, %136 ], [ 1, %136 ], [ 1, %136 ], [ 1, %136 ], [ 1, %136 ], [ 1, %136 ], [ 1, %136 ], [ 1, %136 ], [ 1, %136 ], [ 1, %136 ], [ 1, %136 ], [ 1, %136 ], [ 1, %90 ], !dbg !283
  call void @llvm.lifetime.end.p0(i64 2, ptr nonnull %5) #5, !dbg !491
  call void @llvm.lifetime.end.p0(i64 2, ptr nonnull %4) #5, !dbg !491
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %3) #5, !dbg !491
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %2) #5, !dbg !491
  br label %149

149:                                              ; preds = %1, %147
  %150 = phi i32 [ %148, %147 ], [ 1, %1 ], !dbg !283
  ret i32 %150, !dbg !491
}

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: argmemonly mustprogress nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i16 @llvm.bswap.i16(i16) #3

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #4

attributes #0 = { nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #2 = { argmemonly mustprogress nocallback nofree nounwind willreturn }
attributes #3 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!172, !173, !174, !175}
!llvm.ident = !{!176}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "ipv6_bans", scope: !2, file: !116, line: 36, type: !162, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 15.0.7", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !46, globals: !113, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/cookiengineer/Software/cookiengineer/ebpf-firewall/kernel/ebpf/module.c", directory: "/home/cookiengineer/Software/cookiengineer/ebpf-firewall/kernel", checksumkind: CSK_MD5, checksum: "e07a9deb632ca1d05e1b025006f43c14")
!4 = !{!5, !14}
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
!46 = !{!47, !48, !49, !63, !86}
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!48 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "udphdr", file: !51, line: 23, size: 64, elements: !52)
!51 = !DIFile(filename: "/usr/include/linux/udp.h", directory: "", checksumkind: CSK_MD5, checksum: "53c0d42e1bf6d93b39151764be2d20fb")
!52 = !{!53, !59, !60, !61}
!53 = !DIDerivedType(tag: DW_TAG_member, name: "source", scope: !50, file: !51, line: 24, baseType: !54, size: 16)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !55, line: 28, baseType: !56)
!55 = !DIFile(filename: "/usr/include/linux/types.h", directory: "", checksumkind: CSK_MD5, checksum: "64bcf4b731906682de6e750679b9f4a2")
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !57, line: 24, baseType: !58)
!57 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "", checksumkind: CSK_MD5, checksum: "b810f270733e106319b67ef512c6246e")
!58 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "dest", scope: !50, file: !51, line: 25, baseType: !54, size: 16, offset: 16)
!60 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !50, file: !51, line: 26, baseType: !54, size: 16, offset: 32)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !50, file: !51, line: 27, baseType: !62, size: 16, offset: 48)
!62 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !55, line: 34, baseType: !56)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tcphdr", file: !65, line: 25, size: 160, elements: !66)
!65 = !DIFile(filename: "/usr/include/linux/tcp.h", directory: "", checksumkind: CSK_MD5, checksum: "0fb7164446a017a2406c1e3b94b6d7a6")
!66 = !{!67, !68, !69, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85}
!67 = !DIDerivedType(tag: DW_TAG_member, name: "source", scope: !64, file: !65, line: 26, baseType: !54, size: 16)
!68 = !DIDerivedType(tag: DW_TAG_member, name: "dest", scope: !64, file: !65, line: 27, baseType: !54, size: 16, offset: 16)
!69 = !DIDerivedType(tag: DW_TAG_member, name: "seq", scope: !64, file: !65, line: 28, baseType: !70, size: 32, offset: 32)
!70 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !55, line: 30, baseType: !71)
!71 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !57, line: 27, baseType: !7)
!72 = !DIDerivedType(tag: DW_TAG_member, name: "ack_seq", scope: !64, file: !65, line: 29, baseType: !70, size: 32, offset: 64)
!73 = !DIDerivedType(tag: DW_TAG_member, name: "res1", scope: !64, file: !65, line: 31, baseType: !56, size: 4, offset: 96, flags: DIFlagBitField, extraData: i64 96)
!74 = !DIDerivedType(tag: DW_TAG_member, name: "doff", scope: !64, file: !65, line: 32, baseType: !56, size: 4, offset: 100, flags: DIFlagBitField, extraData: i64 96)
!75 = !DIDerivedType(tag: DW_TAG_member, name: "fin", scope: !64, file: !65, line: 33, baseType: !56, size: 1, offset: 104, flags: DIFlagBitField, extraData: i64 96)
!76 = !DIDerivedType(tag: DW_TAG_member, name: "syn", scope: !64, file: !65, line: 34, baseType: !56, size: 1, offset: 105, flags: DIFlagBitField, extraData: i64 96)
!77 = !DIDerivedType(tag: DW_TAG_member, name: "rst", scope: !64, file: !65, line: 35, baseType: !56, size: 1, offset: 106, flags: DIFlagBitField, extraData: i64 96)
!78 = !DIDerivedType(tag: DW_TAG_member, name: "psh", scope: !64, file: !65, line: 36, baseType: !56, size: 1, offset: 107, flags: DIFlagBitField, extraData: i64 96)
!79 = !DIDerivedType(tag: DW_TAG_member, name: "ack", scope: !64, file: !65, line: 37, baseType: !56, size: 1, offset: 108, flags: DIFlagBitField, extraData: i64 96)
!80 = !DIDerivedType(tag: DW_TAG_member, name: "urg", scope: !64, file: !65, line: 38, baseType: !56, size: 1, offset: 109, flags: DIFlagBitField, extraData: i64 96)
!81 = !DIDerivedType(tag: DW_TAG_member, name: "ece", scope: !64, file: !65, line: 39, baseType: !56, size: 1, offset: 110, flags: DIFlagBitField, extraData: i64 96)
!82 = !DIDerivedType(tag: DW_TAG_member, name: "cwr", scope: !64, file: !65, line: 40, baseType: !56, size: 1, offset: 111, flags: DIFlagBitField, extraData: i64 96)
!83 = !DIDerivedType(tag: DW_TAG_member, name: "window", scope: !64, file: !65, line: 55, baseType: !54, size: 16, offset: 112)
!84 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !64, file: !65, line: 56, baseType: !62, size: 16, offset: 128)
!85 = !DIDerivedType(tag: DW_TAG_member, name: "urg_ptr", scope: !64, file: !65, line: 57, baseType: !54, size: 16, offset: 144)
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmphdr", file: !88, line: 89, size: 64, elements: !89)
!88 = !DIFile(filename: "/usr/include/linux/icmp.h", directory: "", checksumkind: CSK_MD5, checksum: "a505632898dce546638b3344627d334b")
!89 = !{!90, !93, !94, !95}
!90 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !87, file: !88, line: 90, baseType: !91, size: 8)
!91 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !57, line: 21, baseType: !92)
!92 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!93 = !DIDerivedType(tag: DW_TAG_member, name: "code", scope: !87, file: !88, line: 91, baseType: !91, size: 8, offset: 8)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "checksum", scope: !87, file: !88, line: 92, baseType: !62, size: 16, offset: 16)
!95 = !DIDerivedType(tag: DW_TAG_member, name: "un", scope: !87, file: !88, line: 104, baseType: !96, size: 32, offset: 32)
!96 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !87, file: !88, line: 93, size: 32, elements: !97)
!97 = !{!98, !103, !104, !109}
!98 = !DIDerivedType(tag: DW_TAG_member, name: "echo", scope: !96, file: !88, line: 97, baseType: !99, size: 32)
!99 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !96, file: !88, line: 94, size: 32, elements: !100)
!100 = !{!101, !102}
!101 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !99, file: !88, line: 95, baseType: !54, size: 16)
!102 = !DIDerivedType(tag: DW_TAG_member, name: "sequence", scope: !99, file: !88, line: 96, baseType: !54, size: 16, offset: 16)
!103 = !DIDerivedType(tag: DW_TAG_member, name: "gateway", scope: !96, file: !88, line: 98, baseType: !70, size: 32)
!104 = !DIDerivedType(tag: DW_TAG_member, name: "frag", scope: !96, file: !88, line: 102, baseType: !105, size: 32)
!105 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !96, file: !88, line: 99, size: 32, elements: !106)
!106 = !{!107, !108}
!107 = !DIDerivedType(tag: DW_TAG_member, name: "__unused", scope: !105, file: !88, line: 100, baseType: !54, size: 16)
!108 = !DIDerivedType(tag: DW_TAG_member, name: "mtu", scope: !105, file: !88, line: 101, baseType: !54, size: 16, offset: 16)
!109 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !96, file: !88, line: 103, baseType: !110, size: 32)
!110 = !DICompositeType(tag: DW_TAG_array_type, baseType: !91, size: 32, elements: !111)
!111 = !{!112}
!112 = !DISubrange(count: 4)
!113 = !{!114, !119, !140, !0, !154}
!114 = !DIGlobalVariableExpression(var: !115, expr: !DIExpression())
!115 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !116, line: 477, type: !117, isLocal: false, isDefinition: true)
!116 = !DIFile(filename: "ebpf/module.c", directory: "/home/cookiengineer/Software/cookiengineer/ebpf-firewall/kernel", checksumkind: CSK_MD5, checksum: "e07a9deb632ca1d05e1b025006f43c14")
!117 = !DICompositeType(tag: DW_TAG_array_type, baseType: !118, size: 32, elements: !111)
!118 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!119 = !DIGlobalVariableExpression(var: !120, expr: !DIExpression())
!120 = distinct !DIGlobalVariable(name: "port_bans", scope: !2, file: !116, line: 22, type: !121, isLocal: false, isDefinition: true)
!121 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !116, line: 17, size: 256, elements: !122)
!122 = !{!123, !129, !134, !137}
!123 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !121, file: !116, line: 18, baseType: !124, size: 64)
!124 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !125, size: 64)
!125 = !DICompositeType(tag: DW_TAG_array_type, baseType: !126, size: 32, elements: !127)
!126 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!127 = !{!128}
!128 = !DISubrange(count: 1)
!129 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !121, file: !116, line: 19, baseType: !130, size: 64, offset: 64)
!130 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !131, size: 64)
!131 = !DICompositeType(tag: DW_TAG_array_type, baseType: !126, size: 2097120, elements: !132)
!132 = !{!133}
!133 = !DISubrange(count: 65535)
!134 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !121, file: !116, line: 20, baseType: !135, size: 64, offset: 128)
!135 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !136, size: 64)
!136 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !6, line: 7, baseType: !58)
!137 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !121, file: !116, line: 21, baseType: !138, size: 64, offset: 192)
!138 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !139, size: 64)
!139 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !6, line: 5, baseType: !92)
!140 = !DIGlobalVariableExpression(var: !141, expr: !DIExpression())
!141 = distinct !DIGlobalVariable(name: "ipv4_bans", scope: !2, file: !116, line: 29, type: !142, isLocal: false, isDefinition: true)
!142 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !116, line: 24, size: 256, elements: !143)
!143 = !{!144, !145, !150, !153}
!144 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !142, file: !116, line: 25, baseType: !124, size: 64)
!145 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !142, file: !116, line: 26, baseType: !146, size: 64, offset: 64)
!146 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !147, size: 64)
!147 = !DICompositeType(tag: DW_TAG_array_type, baseType: !126, size: 16000000, elements: !148)
!148 = !{!149}
!149 = !DISubrange(count: 500000)
!150 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !142, file: !116, line: 27, baseType: !151, size: 64, offset: 128)
!151 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !152, size: 64)
!152 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !6, line: 9, baseType: !7)
!153 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !142, file: !116, line: 28, baseType: !138, size: 64, offset: 192)
!154 = !DIGlobalVariableExpression(var: !155, expr: !DIExpression())
!155 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !2, file: !156, line: 51, type: !157, isLocal: true, isDefinition: true)
!156 = !DIFile(filename: "headers/bpf_helper_defs.h", directory: "/home/cookiengineer/Software/cookiengineer/ebpf-firewall/kernel", checksumkind: CSK_MD5, checksum: "67458ddab14190d1ab39602394f9ecef")
!157 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !158, size: 64)
!158 = !DISubroutineType(types: !159)
!159 = !{!47, !47, !160}
!160 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !161, size: 64)
!161 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!162 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !116, line: 31, size: 256, elements: !163)
!163 = !{!164, !165, !166, !171}
!164 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !162, file: !116, line: 32, baseType: !124, size: 64)
!165 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !162, file: !116, line: 33, baseType: !146, size: 64, offset: 64)
!166 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !162, file: !116, line: 34, baseType: !167, size: 64, offset: 128)
!167 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !168, size: 64)
!168 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint128_t", file: !169, baseType: !170)
!169 = !DIFile(filename: "ebpf/module.c", directory: "/home/cookiengineer/Software/cookiengineer/ebpf-firewall/kernel")
!170 = !DIBasicType(name: "unsigned __int128", size: 128, encoding: DW_ATE_unsigned)
!171 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !162, file: !116, line: 35, baseType: !138, size: 64, offset: 192)
!172 = !{i32 7, !"Dwarf Version", i32 5}
!173 = !{i32 2, !"Debug Info Version", i32 3}
!174 = !{i32 1, !"wchar_size", i32 4}
!175 = !{i32 7, !"frame-pointer", i32 2}
!176 = !{!"clang version 15.0.7"}
!177 = distinct !DISubprogram(name: "xdp_prog_main", scope: !116, file: !116, line: 129, type: !178, scopeLine: 129, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !189)
!178 = !DISubroutineType(types: !179)
!179 = !{!126, !180}
!180 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !181, size: 64)
!181 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !6, line: 67, size: 192, elements: !182)
!182 = !{!183, !184, !185, !186, !187, !188}
!183 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !181, file: !6, line: 68, baseType: !152, size: 32)
!184 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !181, file: !6, line: 69, baseType: !152, size: 32, offset: 32)
!185 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !181, file: !6, line: 70, baseType: !152, size: 32, offset: 64)
!186 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !181, file: !6, line: 71, baseType: !152, size: 32, offset: 96)
!187 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !181, file: !6, line: 72, baseType: !152, size: 32, offset: 128)
!188 = !DIDerivedType(tag: DW_TAG_member, name: "egress_ifindex", scope: !181, file: !6, line: 73, baseType: !152, size: 32, offset: 160)
!189 = !{!190, !191, !192, !193, !204, !231, !274, !275, !276, !277, !278, !279, !280, !281, !282}
!190 = !DILocalVariable(name: "ctx", arg: 1, scope: !177, file: !116, line: 129, type: !180)
!191 = !DILocalVariable(name: "data_end", scope: !177, file: !116, line: 132, type: !47)
!192 = !DILocalVariable(name: "data", scope: !177, file: !116, line: 133, type: !47)
!193 = !DILocalVariable(name: "ethernet_header", scope: !177, file: !116, line: 139, type: !194)
!194 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !195, size: 64)
!195 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !196, line: 173, size: 112, elements: !197)
!196 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "", checksumkind: CSK_MD5, checksum: "163f54fb1af2e21fea410f14eb18fa76")
!197 = !{!198, !202, !203}
!198 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !195, file: !196, line: 174, baseType: !199, size: 48)
!199 = !DICompositeType(tag: DW_TAG_array_type, baseType: !92, size: 48, elements: !200)
!200 = !{!201}
!201 = !DISubrange(count: 6)
!202 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !195, file: !196, line: 175, baseType: !199, size: 48, offset: 48)
!203 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !195, file: !196, line: 176, baseType: !54, size: 16, offset: 96)
!204 = !DILocalVariable(name: "ipv4_header", scope: !177, file: !116, line: 140, type: !205)
!205 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !206, size: 64)
!206 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !207, line: 87, size: 160, elements: !208)
!207 = !DIFile(filename: "/usr/include/linux/ip.h", directory: "", checksumkind: CSK_MD5, checksum: "149778ace30a1ff208adc8783fd04b29")
!208 = !{!209, !210, !211, !212, !213, !214, !215, !216, !217, !218}
!209 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !206, file: !207, line: 89, baseType: !91, size: 4, flags: DIFlagBitField, extraData: i64 0)
!210 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !206, file: !207, line: 90, baseType: !91, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!211 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !206, file: !207, line: 97, baseType: !91, size: 8, offset: 8)
!212 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !206, file: !207, line: 98, baseType: !54, size: 16, offset: 16)
!213 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !206, file: !207, line: 99, baseType: !54, size: 16, offset: 32)
!214 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !206, file: !207, line: 100, baseType: !54, size: 16, offset: 48)
!215 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !206, file: !207, line: 101, baseType: !91, size: 8, offset: 64)
!216 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !206, file: !207, line: 102, baseType: !91, size: 8, offset: 72)
!217 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !206, file: !207, line: 103, baseType: !62, size: 16, offset: 80)
!218 = !DIDerivedType(tag: DW_TAG_member, scope: !206, file: !207, line: 104, baseType: !219, size: 64, offset: 96)
!219 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !206, file: !207, line: 104, size: 64, elements: !220)
!220 = !{!221, !226}
!221 = !DIDerivedType(tag: DW_TAG_member, scope: !219, file: !207, line: 104, baseType: !222, size: 64)
!222 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !219, file: !207, line: 104, size: 64, elements: !223)
!223 = !{!224, !225}
!224 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !222, file: !207, line: 104, baseType: !70, size: 32)
!225 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !222, file: !207, line: 104, baseType: !70, size: 32, offset: 32)
!226 = !DIDerivedType(tag: DW_TAG_member, name: "addrs", scope: !219, file: !207, line: 104, baseType: !227, size: 64)
!227 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !219, file: !207, line: 104, size: 64, elements: !228)
!228 = !{!229, !230}
!229 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !227, file: !207, line: 104, baseType: !70, size: 32)
!230 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !227, file: !207, line: 104, baseType: !70, size: 32, offset: 32)
!231 = !DILocalVariable(name: "ipv6_header", scope: !177, file: !116, line: 141, type: !232)
!232 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !233, size: 64)
!233 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipv6hdr", file: !234, line: 118, size: 320, elements: !235)
!234 = !DIFile(filename: "/usr/include/linux/ipv6.h", directory: "", checksumkind: CSK_MD5, checksum: "deff6bca6b519042089ed906aa3655c3")
!235 = !{!236, !237, !238, !242, !243, !244, !245}
!236 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !233, file: !234, line: 120, baseType: !91, size: 4, flags: DIFlagBitField, extraData: i64 0)
!237 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !233, file: !234, line: 121, baseType: !91, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!238 = !DIDerivedType(tag: DW_TAG_member, name: "flow_lbl", scope: !233, file: !234, line: 128, baseType: !239, size: 24, offset: 8)
!239 = !DICompositeType(tag: DW_TAG_array_type, baseType: !91, size: 24, elements: !240)
!240 = !{!241}
!241 = !DISubrange(count: 3)
!242 = !DIDerivedType(tag: DW_TAG_member, name: "payload_len", scope: !233, file: !234, line: 130, baseType: !54, size: 16, offset: 32)
!243 = !DIDerivedType(tag: DW_TAG_member, name: "nexthdr", scope: !233, file: !234, line: 131, baseType: !91, size: 8, offset: 48)
!244 = !DIDerivedType(tag: DW_TAG_member, name: "hop_limit", scope: !233, file: !234, line: 132, baseType: !91, size: 8, offset: 56)
!245 = !DIDerivedType(tag: DW_TAG_member, scope: !233, file: !234, line: 134, baseType: !246, size: 256, offset: 64)
!246 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !233, file: !234, line: 134, size: 256, elements: !247)
!247 = !{!248, !269}
!248 = !DIDerivedType(tag: DW_TAG_member, scope: !246, file: !234, line: 134, baseType: !249, size: 256)
!249 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !246, file: !234, line: 134, size: 256, elements: !250)
!250 = !{!251, !268}
!251 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !249, file: !234, line: 134, baseType: !252, size: 128)
!252 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in6_addr", file: !253, line: 33, size: 128, elements: !254)
!253 = !DIFile(filename: "/usr/include/linux/in6.h", directory: "", checksumkind: CSK_MD5, checksum: "8bebb780b45d3fe932cc1d934fa5f5fe")
!254 = !{!255}
!255 = !DIDerivedType(tag: DW_TAG_member, name: "in6_u", scope: !252, file: !253, line: 40, baseType: !256, size: 128)
!256 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !252, file: !253, line: 34, size: 128, elements: !257)
!257 = !{!258, !262, !266}
!258 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr8", scope: !256, file: !253, line: 35, baseType: !259, size: 128)
!259 = !DICompositeType(tag: DW_TAG_array_type, baseType: !91, size: 128, elements: !260)
!260 = !{!261}
!261 = !DISubrange(count: 16)
!262 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr16", scope: !256, file: !253, line: 37, baseType: !263, size: 128)
!263 = !DICompositeType(tag: DW_TAG_array_type, baseType: !54, size: 128, elements: !264)
!264 = !{!265}
!265 = !DISubrange(count: 8)
!266 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr32", scope: !256, file: !253, line: 38, baseType: !267, size: 128)
!267 = !DICompositeType(tag: DW_TAG_array_type, baseType: !70, size: 128, elements: !111)
!268 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !249, file: !234, line: 134, baseType: !252, size: 128, offset: 128)
!269 = !DIDerivedType(tag: DW_TAG_member, name: "addrs", scope: !246, file: !234, line: 134, baseType: !270, size: 256)
!270 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !246, file: !234, line: 134, size: 256, elements: !271)
!271 = !{!272, !273}
!272 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !270, file: !234, line: 134, baseType: !252, size: 128)
!273 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !270, file: !234, line: 134, baseType: !252, size: 128, offset: 128)
!274 = !DILocalVariable(name: "udp_header", scope: !177, file: !116, line: 143, type: !49)
!275 = !DILocalVariable(name: "tcp_header", scope: !177, file: !116, line: 144, type: !63)
!276 = !DILocalVariable(name: "icmp_header", scope: !177, file: !116, line: 145, type: !86)
!277 = !DILocalVariable(name: "blocked_ip", scope: !177, file: !116, line: 150, type: !138)
!278 = !DILocalVariable(name: "ipv4_address", scope: !177, file: !116, line: 151, type: !152)
!279 = !DILocalVariable(name: "ipv6_address", scope: !177, file: !116, line: 152, type: !168)
!280 = !DILocalVariable(name: "blocked_port", scope: !177, file: !116, line: 154, type: !138)
!281 = !DILocalVariable(name: "ipv4_port", scope: !177, file: !116, line: 155, type: !136)
!282 = !DILocalVariable(name: "ipv6_port", scope: !177, file: !116, line: 156, type: !136)
!283 = !DILocation(line: 0, scope: !177)
!284 = !DILocation(line: 132, column: 38, scope: !177)
!285 = !{!286, !287, i64 4}
!286 = !{!"xdp_md", !287, i64 0, !287, i64 4, !287, i64 8, !287, i64 12, !287, i64 16, !287, i64 20}
!287 = !{!"int", !288, i64 0}
!288 = !{!"omnipotent char", !289, i64 0}
!289 = !{!"Simple C/C++ TBAA"}
!290 = !DILocation(line: 132, column: 27, scope: !177)
!291 = !DILocation(line: 132, column: 19, scope: !177)
!292 = !DILocation(line: 133, column: 34, scope: !177)
!293 = !{!286, !287, i64 0}
!294 = !DILocation(line: 133, column: 23, scope: !177)
!295 = !DILocation(line: 133, column: 15, scope: !177)
!296 = !DILocation(line: 135, column: 11, scope: !297)
!297 = distinct !DILexicalBlock(scope: !177, file: !116, line: 135, column: 6)
!298 = !DILocation(line: 135, column: 35, scope: !297)
!299 = !DILocation(line: 135, column: 6, scope: !177)
!300 = !DILocation(line: 151, column: 2, scope: !177)
!301 = !DILocation(line: 152, column: 2, scope: !177)
!302 = !DILocation(line: 155, column: 2, scope: !177)
!303 = !DILocation(line: 156, column: 2, scope: !177)
!304 = !DILocation(line: 158, column: 23, scope: !305)
!305 = distinct !DILexicalBlock(scope: !177, file: !116, line: 158, column: 6)
!306 = !{!307, !308, i64 12}
!307 = !{!"ethhdr", !288, i64 0, !288, i64 6, !308, i64 12}
!308 = !{!"short", !288, i64 0}
!309 = !DILocation(line: 158, column: 6, scope: !177)
!310 = !DILocation(line: 160, column: 39, scope: !311)
!311 = distinct !DILexicalBlock(scope: !312, file: !116, line: 160, column: 7)
!312 = distinct !DILexicalBlock(scope: !305, file: !116, line: 158, column: 46)
!313 = !DILocation(line: 160, column: 64, scope: !311)
!314 = !DILocation(line: 160, column: 7, scope: !312)
!315 = !DILocation(line: 164, column: 4, scope: !316)
!316 = distinct !DILexicalBlock(scope: !311, file: !116, line: 160, column: 76)
!317 = !DILocation(line: 166, column: 8, scope: !318)
!318 = distinct !DILexicalBlock(scope: !316, file: !116, line: 166, column: 8)
!319 = !{!320, !320, i64 0}
!320 = !{!"__int128", !288, i64 0}
!321 = !DILocation(line: 166, column: 21, scope: !318)
!322 = !DILocation(line: 166, column: 8, scope: !316)
!323 = !DILocation(line: 168, column: 18, scope: !324)
!324 = distinct !DILexicalBlock(scope: !318, file: !116, line: 166, column: 27)
!325 = !DILocation(line: 170, column: 20, scope: !326)
!326 = distinct !DILexicalBlock(scope: !324, file: !116, line: 170, column: 9)
!327 = !DILocation(line: 170, column: 28, scope: !326)
!328 = !DILocation(line: 170, column: 31, scope: !326)
!329 = !{!288, !288, i64 0}
!330 = !DILocation(line: 170, column: 43, scope: !326)
!331 = !DILocation(line: 170, column: 9, scope: !324)
!332 = !DILocation(line: 176, column: 21, scope: !333)
!333 = distinct !DILexicalBlock(scope: !316, file: !116, line: 176, column: 8)
!334 = !{!335, !288, i64 6}
!335 = !{!"ipv6hdr", !288, i64 0, !288, i64 0, !288, i64 1, !308, i64 4, !288, i64 6, !288, i64 7, !288, i64 8}
!336 = !DILocation(line: 176, column: 8, scope: !316)
!337 = !DILocation(line: 180, column: 20, scope: !338)
!338 = distinct !DILexicalBlock(scope: !339, file: !116, line: 180, column: 9)
!339 = distinct !DILexicalBlock(scope: !333, file: !116, line: 176, column: 45)
!340 = !DILocation(line: 180, column: 24, scope: !338)
!341 = !DILocation(line: 180, column: 9, scope: !339)
!342 = !DILocation(line: 182, column: 18, scope: !343)
!343 = distinct !DILexicalBlock(scope: !338, file: !116, line: 180, column: 54)
!344 = !{!345, !308, i64 2}
!345 = !{!"udphdr", !308, i64 0, !308, i64 2, !308, i64 4, !308, i64 6}
!346 = !DILocation(line: 182, column: 16, scope: !343)
!347 = !{!308, !308, i64 0}
!348 = !DILocation(line: 184, column: 20, scope: !349)
!349 = distinct !DILexicalBlock(scope: !343, file: !116, line: 184, column: 10)
!350 = !DILocation(line: 184, column: 10, scope: !343)
!351 = !DILocation(line: 186, column: 22, scope: !352)
!352 = distinct !DILexicalBlock(scope: !349, file: !116, line: 184, column: 26)
!353 = !DILocation(line: 188, column: 24, scope: !354)
!354 = distinct !DILexicalBlock(scope: !352, file: !116, line: 188, column: 11)
!355 = !DILocation(line: 188, column: 32, scope: !354)
!356 = !DILocation(line: 204, column: 20, scope: !357)
!357 = distinct !DILexicalBlock(scope: !358, file: !116, line: 204, column: 9)
!358 = distinct !DILexicalBlock(scope: !359, file: !116, line: 200, column: 52)
!359 = distinct !DILexicalBlock(scope: !333, file: !116, line: 200, column: 15)
!360 = !DILocation(line: 204, column: 24, scope: !357)
!361 = !DILocation(line: 204, column: 9, scope: !358)
!362 = !DILocalVariable(name: "tcp_header", arg: 1, scope: !363, file: !116, line: 61, type: !63)
!363 = distinct !DISubprogram(name: "is_nmap_scan", scope: !116, file: !116, line: 61, type: !364, scopeLine: 61, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !366)
!364 = !DISubroutineType(types: !365)
!365 = !{!126, !63}
!366 = !{!362}
!367 = !DILocation(line: 0, scope: !363, inlinedAt: !368)
!368 = distinct !DILocation(line: 206, column: 10, scope: !369)
!369 = distinct !DILexicalBlock(scope: !370, file: !116, line: 206, column: 10)
!370 = distinct !DILexicalBlock(scope: !357, file: !116, line: 204, column: 54)
!371 = !DILocation(line: 64, column: 16, scope: !372, inlinedAt: !368)
!372 = distinct !DILexicalBlock(scope: !363, file: !116, line: 64, column: 4)
!373 = !DILocation(line: 65, column: 4, scope: !372, inlinedAt: !368)
!374 = !DILocation(line: 206, column: 10, scope: !370)
!375 = !DILocation(line: 210, column: 18, scope: !370)
!376 = !{!377, !308, i64 2}
!377 = !{!"tcphdr", !308, i64 0, !308, i64 2, !287, i64 4, !287, i64 8, !308, i64 12, !308, i64 12, !308, i64 13, !308, i64 13, !308, i64 13, !308, i64 13, !308, i64 13, !308, i64 13, !308, i64 13, !308, i64 13, !308, i64 14, !308, i64 16, !308, i64 18}
!378 = !DILocation(line: 210, column: 16, scope: !370)
!379 = !DILocation(line: 212, column: 20, scope: !380)
!380 = distinct !DILexicalBlock(scope: !370, file: !116, line: 212, column: 10)
!381 = !DILocation(line: 212, column: 10, scope: !370)
!382 = !DILocation(line: 214, column: 22, scope: !383)
!383 = distinct !DILexicalBlock(scope: !380, file: !116, line: 212, column: 26)
!384 = !DILocation(line: 216, column: 24, scope: !385)
!385 = distinct !DILexicalBlock(scope: !383, file: !116, line: 216, column: 11)
!386 = !DILocation(line: 216, column: 32, scope: !385)
!387 = !DILocation(line: 228, column: 21, scope: !388)
!388 = distinct !DILexicalBlock(scope: !389, file: !116, line: 228, column: 9)
!389 = distinct !DILexicalBlock(scope: !390, file: !116, line: 224, column: 55)
!390 = distinct !DILexicalBlock(scope: !359, file: !116, line: 224, column: 15)
!391 = !DILocation(line: 228, column: 25, scope: !388)
!392 = !DILocation(line: 228, column: 9, scope: !389)
!393 = !DILocation(line: 231, column: 20, scope: !394)
!394 = distinct !DILexicalBlock(scope: !395, file: !116, line: 231, column: 7)
!395 = distinct !DILexicalBlock(scope: !388, file: !116, line: 228, column: 56)
!396 = !{!397, !288, i64 0}
!397 = !{!"icmphdr", !288, i64 0, !288, i64 1, !308, i64 2, !288, i64 4}
!398 = !DILocation(line: 232, column: 7, scope: !394)
!399 = !DILocation(line: 247, column: 35, scope: !394)
!400 = !DILocation(line: 252, column: 7, scope: !394)
!401 = !DILocation(line: 262, column: 29, scope: !394)
!402 = !DILocation(line: 262, column: 36, scope: !394)
!403 = !DILocation(line: 273, column: 21, scope: !404)
!404 = distinct !DILexicalBlock(scope: !405, file: !116, line: 273, column: 9)
!405 = distinct !DILexicalBlock(scope: !406, file: !116, line: 269, column: 53)
!406 = distinct !DILexicalBlock(scope: !390, file: !116, line: 269, column: 15)
!407 = !DILocation(line: 273, column: 25, scope: !404)
!408 = !DILocation(line: 273, column: 9, scope: !405)
!409 = !DILocation(line: 276, column: 20, scope: !410)
!410 = distinct !DILexicalBlock(scope: !411, file: !116, line: 276, column: 7)
!411 = distinct !DILexicalBlock(scope: !404, file: !116, line: 273, column: 56)
!412 = !DILocation(line: 277, column: 7, scope: !410)
!413 = !DILocation(line: 292, column: 35, scope: !410)
!414 = !DILocation(line: 294, column: 7, scope: !410)
!415 = !DILocation(line: 310, column: 39, scope: !416)
!416 = distinct !DILexicalBlock(scope: !417, file: !116, line: 310, column: 7)
!417 = distinct !DILexicalBlock(scope: !418, file: !116, line: 308, column: 51)
!418 = distinct !DILexicalBlock(scope: !305, file: !116, line: 308, column: 13)
!419 = !DILocation(line: 310, column: 62, scope: !416)
!420 = !DILocation(line: 310, column: 7, scope: !417)
!421 = !DILocation(line: 314, column: 4, scope: !422)
!422 = distinct !DILexicalBlock(scope: !416, file: !116, line: 310, column: 74)
!423 = !DILocation(line: 316, column: 21, scope: !424)
!424 = distinct !DILexicalBlock(scope: !422, file: !116, line: 316, column: 8)
!425 = !DILocation(line: 316, column: 8, scope: !422)
!426 = !DILocation(line: 318, column: 18, scope: !427)
!427 = distinct !DILexicalBlock(scope: !424, file: !116, line: 316, column: 27)
!428 = !DILocation(line: 320, column: 20, scope: !429)
!429 = distinct !DILexicalBlock(scope: !427, file: !116, line: 320, column: 9)
!430 = !DILocation(line: 320, column: 28, scope: !429)
!431 = !DILocation(line: 320, column: 31, scope: !429)
!432 = !DILocation(line: 320, column: 43, scope: !429)
!433 = !DILocation(line: 320, column: 9, scope: !427)
!434 = !DILocation(line: 326, column: 21, scope: !435)
!435 = distinct !DILexicalBlock(scope: !422, file: !116, line: 326, column: 8)
!436 = !{!437, !288, i64 9}
!437 = !{!"iphdr", !288, i64 0, !288, i64 0, !288, i64 1, !308, i64 2, !308, i64 4, !308, i64 6, !288, i64 8, !288, i64 9, !308, i64 10, !288, i64 12}
!438 = !DILocation(line: 326, column: 8, scope: !422)
!439 = !DILocation(line: 330, column: 20, scope: !440)
!440 = distinct !DILexicalBlock(scope: !441, file: !116, line: 330, column: 9)
!441 = distinct !DILexicalBlock(scope: !435, file: !116, line: 326, column: 46)
!442 = !DILocation(line: 330, column: 24, scope: !440)
!443 = !DILocation(line: 330, column: 9, scope: !441)
!444 = !DILocation(line: 332, column: 18, scope: !445)
!445 = distinct !DILexicalBlock(scope: !440, file: !116, line: 330, column: 54)
!446 = !DILocation(line: 332, column: 16, scope: !445)
!447 = !DILocation(line: 334, column: 20, scope: !448)
!448 = distinct !DILexicalBlock(scope: !445, file: !116, line: 334, column: 10)
!449 = !DILocation(line: 334, column: 10, scope: !445)
!450 = !DILocation(line: 336, column: 22, scope: !451)
!451 = distinct !DILexicalBlock(scope: !448, file: !116, line: 334, column: 26)
!452 = !DILocation(line: 338, column: 24, scope: !453)
!453 = distinct !DILexicalBlock(scope: !451, file: !116, line: 338, column: 11)
!454 = !DILocation(line: 338, column: 32, scope: !453)
!455 = !DILocation(line: 400, column: 20, scope: !456)
!456 = distinct !DILexicalBlock(scope: !457, file: !116, line: 400, column: 9)
!457 = distinct !DILexicalBlock(scope: !458, file: !116, line: 396, column: 53)
!458 = distinct !DILexicalBlock(scope: !435, file: !116, line: 396, column: 15)
!459 = !DILocation(line: 400, column: 24, scope: !456)
!460 = !DILocation(line: 400, column: 9, scope: !457)
!461 = !DILocation(line: 0, scope: !363, inlinedAt: !462)
!462 = distinct !DILocation(line: 402, column: 10, scope: !463)
!463 = distinct !DILexicalBlock(scope: !464, file: !116, line: 402, column: 10)
!464 = distinct !DILexicalBlock(scope: !456, file: !116, line: 400, column: 54)
!465 = !DILocation(line: 64, column: 16, scope: !372, inlinedAt: !462)
!466 = !DILocation(line: 65, column: 4, scope: !372, inlinedAt: !462)
!467 = !DILocation(line: 402, column: 10, scope: !464)
!468 = !DILocation(line: 406, column: 18, scope: !464)
!469 = !DILocation(line: 406, column: 16, scope: !464)
!470 = !DILocation(line: 408, column: 20, scope: !471)
!471 = distinct !DILexicalBlock(scope: !464, file: !116, line: 408, column: 10)
!472 = !DILocation(line: 408, column: 10, scope: !464)
!473 = !DILocation(line: 410, column: 22, scope: !474)
!474 = distinct !DILexicalBlock(scope: !471, file: !116, line: 408, column: 26)
!475 = !DILocation(line: 412, column: 24, scope: !476)
!476 = distinct !DILexicalBlock(scope: !474, file: !116, line: 412, column: 11)
!477 = !DILocation(line: 412, column: 32, scope: !476)
!478 = !DILocation(line: 424, column: 21, scope: !479)
!479 = distinct !DILexicalBlock(scope: !480, file: !116, line: 424, column: 9)
!480 = distinct !DILexicalBlock(scope: !481, file: !116, line: 420, column: 54)
!481 = distinct !DILexicalBlock(scope: !458, file: !116, line: 420, column: 15)
!482 = !DILocation(line: 424, column: 25, scope: !479)
!483 = !DILocation(line: 424, column: 9, scope: !480)
!484 = !DILocation(line: 427, column: 20, scope: !485)
!485 = distinct !DILexicalBlock(scope: !486, file: !116, line: 427, column: 7)
!486 = distinct !DILexicalBlock(scope: !479, file: !116, line: 424, column: 56)
!487 = !DILocation(line: 428, column: 7, scope: !485)
!488 = !DILocation(line: 443, column: 35, scope: !485)
!489 = !DILocation(line: 445, column: 7, scope: !485)
!490 = !DILocation(line: 473, column: 2, scope: !177)
!491 = !DILocation(line: 475, column: 1, scope: !177)
