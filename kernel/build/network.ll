; ModuleID = '/home/cookiengineer/Software/tholian-network/endpoint/kernel/network/module.c'
source_filename = "/home/cookiengineer/Software/tholian-network/endpoint/kernel/network/module.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.bpf_map_def = type { i32, i32, i32, i32, i32 }
%struct.xdp_md = type { i32, i32, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.ipv6hdr = type { i8, [3 x i8], i16, i8, i8, %union.anon.1 }
%union.anon.1 = type { %struct.anon.2 }
%struct.anon.2 = type { %struct.in6_addr, %struct.in6_addr }
%struct.in6_addr = type { %union.anon.3 }
%union.anon.3 = type { [4 x i32] }
%struct.udphdr = type { i16, i16, i16, i16 }
%struct.tcphdr = type { i16, i16, i32, i32, i16, i16, i16, i16 }
%struct.icmphdr = type { i8, i8, i16, %union.anon.5 }
%union.anon.5 = type { i32 }
%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, %union.anon }
%union.anon = type { %struct.anon }
%struct.anon = type { i32, i32 }
%struct.dnshdr = type { i16, i16, i16, i16, i16, i16 }
%struct.dnsquestion = type { [256 x i8], i16, i16 }

@port_bans = dso_local global %struct.bpf_map_def { i32 1, i32 2, i32 1, i32 65535, i32 0 }, section "maps", align 4
@ipv4_bans = dso_local global %struct.bpf_map_def { i32 1, i32 4, i32 1, i32 500000, i32 0 }, section "maps", align 4
@ipv6_bans = dso_local global %struct.bpf_map_def { i32 1, i32 16, i32 1, i32 500000, i32 0 }, section "maps", align 4
@bpf_map_lookup_elem = internal global ptr inttoptr (i64 1 to ptr), align 8
@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1
@llvm.compiler.used = appending global [5 x ptr] [ptr @port_bans, ptr @ipv4_bans, ptr @ipv6_bans, ptr @xdp_prog_main, ptr @_license], section "llvm.metadata"

; Function Attrs: noinline nounwind optnone
define dso_local i32 @xdp_prog_main(ptr noundef %0) #0 section "xdp_prog" {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca i32, align 4
  %15 = alloca i128, align 16
  %16 = alloca ptr, align 8
  %17 = alloca i16, align 2
  %18 = alloca i16, align 2
  %19 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %20 = load ptr, ptr %3, align 8
  %21 = getelementptr inbounds %struct.xdp_md, ptr %20, i32 0, i32 1
  %22 = load i32, ptr %21, align 4
  %23 = zext i32 %22 to i64
  %24 = inttoptr i64 %23 to ptr
  store ptr %24, ptr %4, align 8
  %25 = load ptr, ptr %3, align 8
  %26 = getelementptr inbounds %struct.xdp_md, ptr %25, i32 0, i32 0
  %27 = load i32, ptr %26, align 4
  %28 = zext i32 %27 to i64
  %29 = inttoptr i64 %28 to ptr
  store ptr %29, ptr %5, align 8
  %30 = load ptr, ptr %5, align 8
  %31 = getelementptr i8, ptr %30, i64 14
  %32 = load ptr, ptr %4, align 8
  %33 = icmp ugt ptr %31, %32
  br i1 %33, label %34, label %35

34:                                               ; preds = %1
  store i32 1, ptr %2, align 4
  br label %889

35:                                               ; preds = %1
  %36 = load ptr, ptr %5, align 8
  store ptr %36, ptr %6, align 8
  store ptr null, ptr %7, align 8
  store ptr null, ptr %8, align 8
  store ptr null, ptr %9, align 8
  store ptr null, ptr %10, align 8
  store ptr null, ptr %11, align 8
  store ptr null, ptr %12, align 8
  store ptr null, ptr %13, align 8
  store i32 0, ptr %14, align 4
  store i128 0, ptr %15, align 16
  store ptr null, ptr %16, align 8
  store i16 0, ptr %17, align 2
  store i16 0, ptr %18, align 2
  %37 = load ptr, ptr %6, align 8
  %38 = getelementptr inbounds %struct.ethhdr, ptr %37, i32 0, i32 2
  %39 = load i16, ptr %38, align 1
  %40 = zext i16 %39 to i32
  %41 = icmp eq i32 %40, 56710
  br i1 %41, label %42, label %509

42:                                               ; preds = %35
  %43 = load ptr, ptr %5, align 8
  %44 = getelementptr i8, ptr %43, i64 14
  %45 = getelementptr i8, ptr %44, i64 40
  %46 = load ptr, ptr %4, align 8
  %47 = icmp ult ptr %45, %46
  br i1 %47, label %48, label %507

48:                                               ; preds = %42
  %49 = load ptr, ptr %5, align 8
  %50 = getelementptr i8, ptr %49, i64 14
  store ptr %50, ptr %8, align 8
  %51 = load ptr, ptr %8, align 8
  %52 = getelementptr inbounds %struct.ipv6hdr, ptr %51, i32 0, i32 5
  %53 = getelementptr inbounds %struct.anon.2, ptr %52, i32 0, i32 0
  %54 = getelementptr inbounds %struct.in6_addr, ptr %53, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %15, ptr align 4 %54, i64 16, i1 false)
  %55 = load i128, ptr %15, align 16
  %56 = icmp ne i128 %55, 0
  br i1 %56, label %57, label %69

57:                                               ; preds = %48
  %58 = load ptr, ptr @bpf_map_lookup_elem, align 8
  %59 = call ptr %58(ptr noundef @ipv6_bans, ptr noundef %15)
  store ptr %59, ptr %13, align 8
  %60 = load ptr, ptr %13, align 8
  %61 = icmp ne ptr %60, null
  br i1 %61, label %62, label %68

62:                                               ; preds = %57
  %63 = load ptr, ptr %13, align 8
  %64 = load i8, ptr %63, align 1
  %65 = zext i8 %64 to i32
  %66 = icmp ne i32 %65, 0
  br i1 %66, label %67, label %68

67:                                               ; preds = %62
  store i32 1, ptr %2, align 4
  br label %889

68:                                               ; preds = %62, %57
  br label %69

69:                                               ; preds = %68, %48
  %70 = load ptr, ptr %8, align 8
  %71 = getelementptr inbounds %struct.ipv6hdr, ptr %70, i32 0, i32 3
  %72 = load i8, ptr %71, align 2
  %73 = zext i8 %72 to i32
  %74 = icmp eq i32 %73, 17
  br i1 %74, label %75, label %100

75:                                               ; preds = %69
  %76 = load ptr, ptr %5, align 8
  %77 = getelementptr i8, ptr %76, i64 14
  %78 = getelementptr i8, ptr %77, i64 40
  store ptr %78, ptr %9, align 8
  %79 = load ptr, ptr %9, align 8
  %80 = icmp ne ptr %79, null
  br i1 %80, label %81, label %99

81:                                               ; preds = %75
  %82 = load ptr, ptr %9, align 8
  %83 = getelementptr inbounds %struct.udphdr, ptr %82, i32 0, i32 1
  %84 = load i16, ptr %83, align 2
  store i16 %84, ptr %18, align 2
  %85 = load i16, ptr %18, align 2
  %86 = zext i16 %85 to i32
  %87 = icmp ne i32 %86, 0
  br i1 %87, label %88, label %98

88:                                               ; preds = %81
  %89 = load ptr, ptr @bpf_map_lookup_elem, align 8
  %90 = call ptr %89(ptr noundef @port_bans, ptr noundef %18)
  store ptr %90, ptr %16, align 8
  %91 = load ptr, ptr %16, align 8
  %92 = icmp ne ptr %91, null
  br i1 %92, label %93, label %97

93:                                               ; preds = %88
  %94 = load ptr, ptr %16, align 8
  %95 = icmp ne ptr %94, null
  br i1 %95, label %96, label %97

96:                                               ; preds = %93
  store i32 1, ptr %2, align 4
  br label %889

97:                                               ; preds = %93, %88
  br label %98

98:                                               ; preds = %97, %81
  br label %99

99:                                               ; preds = %98, %75
  br label %506

100:                                              ; preds = %69
  %101 = load ptr, ptr %8, align 8
  %102 = getelementptr inbounds %struct.ipv6hdr, ptr %101, i32 0, i32 3
  %103 = load i8, ptr %102, align 2
  %104 = zext i8 %103 to i32
  %105 = icmp eq i32 %104, 6
  br i1 %105, label %106, label %131

106:                                              ; preds = %100
  %107 = load ptr, ptr %5, align 8
  %108 = getelementptr i8, ptr %107, i64 14
  %109 = getelementptr i8, ptr %108, i64 40
  store ptr %109, ptr %10, align 8
  %110 = load ptr, ptr %10, align 8
  %111 = icmp ne ptr %110, null
  br i1 %111, label %112, label %130

112:                                              ; preds = %106
  %113 = load ptr, ptr %10, align 8
  %114 = getelementptr inbounds %struct.tcphdr, ptr %113, i32 0, i32 1
  %115 = load i16, ptr %114, align 2
  store i16 %115, ptr %18, align 2
  %116 = load i16, ptr %18, align 2
  %117 = zext i16 %116 to i32
  %118 = icmp ne i32 %117, 0
  br i1 %118, label %119, label %129

119:                                              ; preds = %112
  %120 = load ptr, ptr @bpf_map_lookup_elem, align 8
  %121 = call ptr %120(ptr noundef @port_bans, ptr noundef %18)
  store ptr %121, ptr %16, align 8
  %122 = load ptr, ptr %16, align 8
  %123 = icmp ne ptr %122, null
  br i1 %123, label %124, label %128

124:                                              ; preds = %119
  %125 = load ptr, ptr %16, align 8
  %126 = icmp ne ptr %125, null
  br i1 %126, label %127, label %128

127:                                              ; preds = %124
  store i32 1, ptr %2, align 4
  br label %889

128:                                              ; preds = %124, %119
  br label %129

129:                                              ; preds = %128, %112
  br label %130

130:                                              ; preds = %129, %106
  br label %505

131:                                              ; preds = %100
  %132 = load ptr, ptr %8, align 8
  %133 = getelementptr inbounds %struct.ipv6hdr, ptr %132, i32 0, i32 3
  %134 = load i8, ptr %133, align 2
  %135 = zext i8 %134 to i32
  %136 = icmp eq i32 %135, 58
  br i1 %136, label %137, label %356

137:                                              ; preds = %131
  %138 = load ptr, ptr %5, align 8
  %139 = getelementptr i8, ptr %138, i64 14
  %140 = getelementptr i8, ptr %139, i64 40
  store ptr %140, ptr %11, align 8
  %141 = load ptr, ptr %11, align 8
  %142 = icmp ne ptr %141, null
  br i1 %142, label %143, label %355

143:                                              ; preds = %137
  %144 = load ptr, ptr %11, align 8
  %145 = getelementptr inbounds %struct.icmphdr, ptr %144, i32 0, i32 0
  %146 = load i8, ptr %145, align 4
  %147 = zext i8 %146 to i32
  %148 = icmp eq i32 %147, 0
  br i1 %148, label %353, label %149

149:                                              ; preds = %143
  %150 = load ptr, ptr %11, align 8
  %151 = getelementptr inbounds %struct.icmphdr, ptr %150, i32 0, i32 0
  %152 = load i8, ptr %151, align 4
  %153 = zext i8 %152 to i32
  %154 = icmp eq i32 %153, 1
  br i1 %154, label %353, label %155

155:                                              ; preds = %149
  %156 = load ptr, ptr %11, align 8
  %157 = getelementptr inbounds %struct.icmphdr, ptr %156, i32 0, i32 0
  %158 = load i8, ptr %157, align 4
  %159 = zext i8 %158 to i32
  %160 = icmp eq i32 %159, 2
  br i1 %160, label %353, label %161

161:                                              ; preds = %155
  %162 = load ptr, ptr %11, align 8
  %163 = getelementptr inbounds %struct.icmphdr, ptr %162, i32 0, i32 0
  %164 = load i8, ptr %163, align 4
  %165 = zext i8 %164 to i32
  %166 = icmp eq i32 %165, 4
  br i1 %166, label %353, label %167

167:                                              ; preds = %161
  %168 = load ptr, ptr %11, align 8
  %169 = getelementptr inbounds %struct.icmphdr, ptr %168, i32 0, i32 0
  %170 = load i8, ptr %169, align 4
  %171 = zext i8 %170 to i32
  %172 = icmp eq i32 %171, 6
  br i1 %172, label %353, label %173

173:                                              ; preds = %167
  %174 = load ptr, ptr %11, align 8
  %175 = getelementptr inbounds %struct.icmphdr, ptr %174, i32 0, i32 0
  %176 = load i8, ptr %175, align 4
  %177 = zext i8 %176 to i32
  %178 = icmp eq i32 %177, 7
  br i1 %178, label %353, label %179

179:                                              ; preds = %173
  %180 = load ptr, ptr %11, align 8
  %181 = getelementptr inbounds %struct.icmphdr, ptr %180, i32 0, i32 0
  %182 = load i8, ptr %181, align 4
  %183 = zext i8 %182 to i32
  %184 = icmp eq i32 %183, 8
  br i1 %184, label %353, label %185

185:                                              ; preds = %179
  %186 = load ptr, ptr %11, align 8
  %187 = getelementptr inbounds %struct.icmphdr, ptr %186, i32 0, i32 0
  %188 = load i8, ptr %187, align 4
  %189 = zext i8 %188 to i32
  %190 = icmp eq i32 %189, 9
  br i1 %190, label %353, label %191

191:                                              ; preds = %185
  %192 = load ptr, ptr %11, align 8
  %193 = getelementptr inbounds %struct.icmphdr, ptr %192, i32 0, i32 0
  %194 = load i8, ptr %193, align 4
  %195 = zext i8 %194 to i32
  %196 = icmp eq i32 %195, 10
  br i1 %196, label %353, label %197

197:                                              ; preds = %191
  %198 = load ptr, ptr %11, align 8
  %199 = getelementptr inbounds %struct.icmphdr, ptr %198, i32 0, i32 0
  %200 = load i8, ptr %199, align 4
  %201 = zext i8 %200 to i32
  %202 = icmp eq i32 %201, 13
  br i1 %202, label %353, label %203

203:                                              ; preds = %197
  %204 = load ptr, ptr %11, align 8
  %205 = getelementptr inbounds %struct.icmphdr, ptr %204, i32 0, i32 0
  %206 = load i8, ptr %205, align 4
  %207 = zext i8 %206 to i32
  %208 = icmp eq i32 %207, 14
  br i1 %208, label %353, label %209

209:                                              ; preds = %203
  %210 = load ptr, ptr %11, align 8
  %211 = getelementptr inbounds %struct.icmphdr, ptr %210, i32 0, i32 0
  %212 = load i8, ptr %211, align 4
  %213 = zext i8 %212 to i32
  %214 = icmp eq i32 %213, 15
  br i1 %214, label %353, label %215

215:                                              ; preds = %209
  %216 = load ptr, ptr %11, align 8
  %217 = getelementptr inbounds %struct.icmphdr, ptr %216, i32 0, i32 0
  %218 = load i8, ptr %217, align 4
  %219 = zext i8 %218 to i32
  %220 = icmp eq i32 %219, 16
  br i1 %220, label %353, label %221

221:                                              ; preds = %215
  %222 = load ptr, ptr %11, align 8
  %223 = getelementptr inbounds %struct.icmphdr, ptr %222, i32 0, i32 0
  %224 = load i8, ptr %223, align 4
  %225 = zext i8 %224 to i32
  %226 = icmp eq i32 %225, 17
  br i1 %226, label %353, label %227

227:                                              ; preds = %221
  %228 = load ptr, ptr %11, align 8
  %229 = getelementptr inbounds %struct.icmphdr, ptr %228, i32 0, i32 0
  %230 = load i8, ptr %229, align 4
  %231 = zext i8 %230 to i32
  %232 = icmp eq i32 %231, 18
  br i1 %232, label %353, label %233

233:                                              ; preds = %227
  %234 = load ptr, ptr %11, align 8
  %235 = getelementptr inbounds %struct.icmphdr, ptr %234, i32 0, i32 0
  %236 = load i8, ptr %235, align 4
  %237 = zext i8 %236 to i32
  %238 = icmp eq i32 %237, 19
  br i1 %238, label %353, label %239

239:                                              ; preds = %233
  %240 = load ptr, ptr %11, align 8
  %241 = getelementptr inbounds %struct.icmphdr, ptr %240, i32 0, i32 0
  %242 = load i8, ptr %241, align 4
  %243 = zext i8 %242 to i32
  %244 = icmp sge i32 %243, 20
  br i1 %244, label %245, label %251

245:                                              ; preds = %239
  %246 = load ptr, ptr %11, align 8
  %247 = getelementptr inbounds %struct.icmphdr, ptr %246, i32 0, i32 0
  %248 = load i8, ptr %247, align 4
  %249 = zext i8 %248 to i32
  %250 = icmp sle i32 %249, 41
  br i1 %250, label %353, label %251

251:                                              ; preds = %245, %239
  %252 = load ptr, ptr %11, align 8
  %253 = getelementptr inbounds %struct.icmphdr, ptr %252, i32 0, i32 0
  %254 = load i8, ptr %253, align 4
  %255 = zext i8 %254 to i32
  %256 = icmp eq i32 %255, 42
  br i1 %256, label %353, label %257

257:                                              ; preds = %251
  %258 = load ptr, ptr %11, align 8
  %259 = getelementptr inbounds %struct.icmphdr, ptr %258, i32 0, i32 0
  %260 = load i8, ptr %259, align 4
  %261 = zext i8 %260 to i32
  %262 = icmp eq i32 %261, 43
  br i1 %262, label %353, label %263

263:                                              ; preds = %257
  %264 = load ptr, ptr %11, align 8
  %265 = getelementptr inbounds %struct.icmphdr, ptr %264, i32 0, i32 0
  %266 = load i8, ptr %265, align 4
  %267 = zext i8 %266 to i32
  %268 = icmp sge i32 %267, 44
  br i1 %268, label %269, label %275

269:                                              ; preds = %263
  %270 = load ptr, ptr %11, align 8
  %271 = getelementptr inbounds %struct.icmphdr, ptr %270, i32 0, i32 0
  %272 = load i8, ptr %271, align 4
  %273 = zext i8 %272 to i32
  %274 = icmp sle i32 %273, 127
  br i1 %274, label %353, label %275

275:                                              ; preds = %269, %263
  %276 = load ptr, ptr %11, align 8
  %277 = getelementptr inbounds %struct.icmphdr, ptr %276, i32 0, i32 0
  %278 = load i8, ptr %277, align 4
  %279 = zext i8 %278 to i32
  %280 = icmp eq i32 %279, 128
  br i1 %280, label %353, label %281

281:                                              ; preds = %275
  %282 = load ptr, ptr %11, align 8
  %283 = getelementptr inbounds %struct.icmphdr, ptr %282, i32 0, i32 0
  %284 = load i8, ptr %283, align 4
  %285 = zext i8 %284 to i32
  %286 = icmp eq i32 %285, 129
  br i1 %286, label %353, label %287

287:                                              ; preds = %281
  %288 = load ptr, ptr %11, align 8
  %289 = getelementptr inbounds %struct.icmphdr, ptr %288, i32 0, i32 0
  %290 = load i8, ptr %289, align 4
  %291 = zext i8 %290 to i32
  %292 = icmp eq i32 %291, 133
  br i1 %292, label %353, label %293

293:                                              ; preds = %287
  %294 = load ptr, ptr %11, align 8
  %295 = getelementptr inbounds %struct.icmphdr, ptr %294, i32 0, i32 0
  %296 = load i8, ptr %295, align 4
  %297 = zext i8 %296 to i32
  %298 = icmp eq i32 %297, 134
  br i1 %298, label %353, label %299

299:                                              ; preds = %293
  %300 = load ptr, ptr %11, align 8
  %301 = getelementptr inbounds %struct.icmphdr, ptr %300, i32 0, i32 0
  %302 = load i8, ptr %301, align 4
  %303 = zext i8 %302 to i32
  %304 = icmp eq i32 %303, 135
  br i1 %304, label %353, label %305

305:                                              ; preds = %299
  %306 = load ptr, ptr %11, align 8
  %307 = getelementptr inbounds %struct.icmphdr, ptr %306, i32 0, i32 0
  %308 = load i8, ptr %307, align 4
  %309 = zext i8 %308 to i32
  %310 = icmp eq i32 %309, 136
  br i1 %310, label %353, label %311

311:                                              ; preds = %305
  %312 = load ptr, ptr %11, align 8
  %313 = getelementptr inbounds %struct.icmphdr, ptr %312, i32 0, i32 0
  %314 = load i8, ptr %313, align 4
  %315 = zext i8 %314 to i32
  %316 = icmp eq i32 %315, 150
  br i1 %316, label %353, label %317

317:                                              ; preds = %311
  %318 = load ptr, ptr %11, align 8
  %319 = getelementptr inbounds %struct.icmphdr, ptr %318, i32 0, i32 0
  %320 = load i8, ptr %319, align 4
  %321 = zext i8 %320 to i32
  %322 = icmp eq i32 %321, 151
  br i1 %322, label %353, label %323

323:                                              ; preds = %317
  %324 = load ptr, ptr %11, align 8
  %325 = getelementptr inbounds %struct.icmphdr, ptr %324, i32 0, i32 0
  %326 = load i8, ptr %325, align 4
  %327 = zext i8 %326 to i32
  %328 = icmp eq i32 %327, 152
  br i1 %328, label %353, label %329

329:                                              ; preds = %323
  %330 = load ptr, ptr %11, align 8
  %331 = getelementptr inbounds %struct.icmphdr, ptr %330, i32 0, i32 0
  %332 = load i8, ptr %331, align 4
  %333 = zext i8 %332 to i32
  %334 = icmp eq i32 %333, 153
  br i1 %334, label %353, label %335

335:                                              ; preds = %329
  %336 = load ptr, ptr %11, align 8
  %337 = getelementptr inbounds %struct.icmphdr, ptr %336, i32 0, i32 0
  %338 = load i8, ptr %337, align 4
  %339 = zext i8 %338 to i32
  %340 = icmp eq i32 %339, 154
  br i1 %340, label %353, label %341

341:                                              ; preds = %335
  %342 = load ptr, ptr %11, align 8
  %343 = getelementptr inbounds %struct.icmphdr, ptr %342, i32 0, i32 0
  %344 = load i8, ptr %343, align 4
  %345 = zext i8 %344 to i32
  %346 = icmp sge i32 %345, 156
  br i1 %346, label %347, label %354

347:                                              ; preds = %341
  %348 = load ptr, ptr %11, align 8
  %349 = getelementptr inbounds %struct.icmphdr, ptr %348, i32 0, i32 0
  %350 = load i8, ptr %349, align 4
  %351 = zext i8 %350 to i32
  %352 = icmp sle i32 %351, 255
  br i1 %352, label %353, label %354

353:                                              ; preds = %347, %335, %329, %323, %317, %311, %305, %299, %293, %287, %281, %275, %269, %257, %251, %245, %233, %227, %221, %215, %209, %203, %197, %191, %185, %179, %173, %167, %161, %155, %149, %143
  store i32 1, ptr %2, align 4
  br label %889

354:                                              ; preds = %347, %341
  br label %355

355:                                              ; preds = %354, %137
  br label %504

356:                                              ; preds = %131
  %357 = load ptr, ptr %8, align 8
  %358 = getelementptr inbounds %struct.ipv6hdr, ptr %357, i32 0, i32 3
  %359 = load i8, ptr %358, align 2
  %360 = zext i8 %359 to i32
  %361 = icmp eq i32 %360, 1
  br i1 %361, label %362, label %503

362:                                              ; preds = %356
  %363 = load ptr, ptr %5, align 8
  %364 = getelementptr i8, ptr %363, i64 14
  %365 = getelementptr i8, ptr %364, i64 40
  store ptr %365, ptr %11, align 8
  %366 = load ptr, ptr %11, align 8
  %367 = icmp ne ptr %366, null
  br i1 %367, label %368, label %502

368:                                              ; preds = %362
  %369 = load ptr, ptr %11, align 8
  %370 = getelementptr inbounds %struct.icmphdr, ptr %369, i32 0, i32 0
  %371 = load i8, ptr %370, align 4
  %372 = zext i8 %371 to i32
  %373 = icmp eq i32 %372, 0
  br i1 %373, label %500, label %374

374:                                              ; preds = %368
  %375 = load ptr, ptr %11, align 8
  %376 = getelementptr inbounds %struct.icmphdr, ptr %375, i32 0, i32 0
  %377 = load i8, ptr %376, align 4
  %378 = zext i8 %377 to i32
  %379 = icmp eq i32 %378, 1
  br i1 %379, label %500, label %380

380:                                              ; preds = %374
  %381 = load ptr, ptr %11, align 8
  %382 = getelementptr inbounds %struct.icmphdr, ptr %381, i32 0, i32 0
  %383 = load i8, ptr %382, align 4
  %384 = zext i8 %383 to i32
  %385 = icmp eq i32 %384, 2
  br i1 %385, label %500, label %386

386:                                              ; preds = %380
  %387 = load ptr, ptr %11, align 8
  %388 = getelementptr inbounds %struct.icmphdr, ptr %387, i32 0, i32 0
  %389 = load i8, ptr %388, align 4
  %390 = zext i8 %389 to i32
  %391 = icmp eq i32 %390, 4
  br i1 %391, label %500, label %392

392:                                              ; preds = %386
  %393 = load ptr, ptr %11, align 8
  %394 = getelementptr inbounds %struct.icmphdr, ptr %393, i32 0, i32 0
  %395 = load i8, ptr %394, align 4
  %396 = zext i8 %395 to i32
  %397 = icmp eq i32 %396, 6
  br i1 %397, label %500, label %398

398:                                              ; preds = %392
  %399 = load ptr, ptr %11, align 8
  %400 = getelementptr inbounds %struct.icmphdr, ptr %399, i32 0, i32 0
  %401 = load i8, ptr %400, align 4
  %402 = zext i8 %401 to i32
  %403 = icmp eq i32 %402, 7
  br i1 %403, label %500, label %404

404:                                              ; preds = %398
  %405 = load ptr, ptr %11, align 8
  %406 = getelementptr inbounds %struct.icmphdr, ptr %405, i32 0, i32 0
  %407 = load i8, ptr %406, align 4
  %408 = zext i8 %407 to i32
  %409 = icmp eq i32 %408, 8
  br i1 %409, label %500, label %410

410:                                              ; preds = %404
  %411 = load ptr, ptr %11, align 8
  %412 = getelementptr inbounds %struct.icmphdr, ptr %411, i32 0, i32 0
  %413 = load i8, ptr %412, align 4
  %414 = zext i8 %413 to i32
  %415 = icmp eq i32 %414, 9
  br i1 %415, label %500, label %416

416:                                              ; preds = %410
  %417 = load ptr, ptr %11, align 8
  %418 = getelementptr inbounds %struct.icmphdr, ptr %417, i32 0, i32 0
  %419 = load i8, ptr %418, align 4
  %420 = zext i8 %419 to i32
  %421 = icmp eq i32 %420, 10
  br i1 %421, label %500, label %422

422:                                              ; preds = %416
  %423 = load ptr, ptr %11, align 8
  %424 = getelementptr inbounds %struct.icmphdr, ptr %423, i32 0, i32 0
  %425 = load i8, ptr %424, align 4
  %426 = zext i8 %425 to i32
  %427 = icmp eq i32 %426, 13
  br i1 %427, label %500, label %428

428:                                              ; preds = %422
  %429 = load ptr, ptr %11, align 8
  %430 = getelementptr inbounds %struct.icmphdr, ptr %429, i32 0, i32 0
  %431 = load i8, ptr %430, align 4
  %432 = zext i8 %431 to i32
  %433 = icmp eq i32 %432, 14
  br i1 %433, label %500, label %434

434:                                              ; preds = %428
  %435 = load ptr, ptr %11, align 8
  %436 = getelementptr inbounds %struct.icmphdr, ptr %435, i32 0, i32 0
  %437 = load i8, ptr %436, align 4
  %438 = zext i8 %437 to i32
  %439 = icmp eq i32 %438, 15
  br i1 %439, label %500, label %440

440:                                              ; preds = %434
  %441 = load ptr, ptr %11, align 8
  %442 = getelementptr inbounds %struct.icmphdr, ptr %441, i32 0, i32 0
  %443 = load i8, ptr %442, align 4
  %444 = zext i8 %443 to i32
  %445 = icmp eq i32 %444, 16
  br i1 %445, label %500, label %446

446:                                              ; preds = %440
  %447 = load ptr, ptr %11, align 8
  %448 = getelementptr inbounds %struct.icmphdr, ptr %447, i32 0, i32 0
  %449 = load i8, ptr %448, align 4
  %450 = zext i8 %449 to i32
  %451 = icmp eq i32 %450, 17
  br i1 %451, label %500, label %452

452:                                              ; preds = %446
  %453 = load ptr, ptr %11, align 8
  %454 = getelementptr inbounds %struct.icmphdr, ptr %453, i32 0, i32 0
  %455 = load i8, ptr %454, align 4
  %456 = zext i8 %455 to i32
  %457 = icmp eq i32 %456, 18
  br i1 %457, label %500, label %458

458:                                              ; preds = %452
  %459 = load ptr, ptr %11, align 8
  %460 = getelementptr inbounds %struct.icmphdr, ptr %459, i32 0, i32 0
  %461 = load i8, ptr %460, align 4
  %462 = zext i8 %461 to i32
  %463 = icmp eq i32 %462, 19
  br i1 %463, label %500, label %464

464:                                              ; preds = %458
  %465 = load ptr, ptr %11, align 8
  %466 = getelementptr inbounds %struct.icmphdr, ptr %465, i32 0, i32 0
  %467 = load i8, ptr %466, align 4
  %468 = zext i8 %467 to i32
  %469 = icmp sge i32 %468, 20
  br i1 %469, label %470, label %476

470:                                              ; preds = %464
  %471 = load ptr, ptr %11, align 8
  %472 = getelementptr inbounds %struct.icmphdr, ptr %471, i32 0, i32 0
  %473 = load i8, ptr %472, align 4
  %474 = zext i8 %473 to i32
  %475 = icmp sle i32 %474, 41
  br i1 %475, label %500, label %476

476:                                              ; preds = %470, %464
  %477 = load ptr, ptr %11, align 8
  %478 = getelementptr inbounds %struct.icmphdr, ptr %477, i32 0, i32 0
  %479 = load i8, ptr %478, align 4
  %480 = zext i8 %479 to i32
  %481 = icmp eq i32 %480, 42
  br i1 %481, label %500, label %482

482:                                              ; preds = %476
  %483 = load ptr, ptr %11, align 8
  %484 = getelementptr inbounds %struct.icmphdr, ptr %483, i32 0, i32 0
  %485 = load i8, ptr %484, align 4
  %486 = zext i8 %485 to i32
  %487 = icmp eq i32 %486, 43
  br i1 %487, label %500, label %488

488:                                              ; preds = %482
  %489 = load ptr, ptr %11, align 8
  %490 = getelementptr inbounds %struct.icmphdr, ptr %489, i32 0, i32 0
  %491 = load i8, ptr %490, align 4
  %492 = zext i8 %491 to i32
  %493 = icmp sge i32 %492, 44
  br i1 %493, label %494, label %501

494:                                              ; preds = %488
  %495 = load ptr, ptr %11, align 8
  %496 = getelementptr inbounds %struct.icmphdr, ptr %495, i32 0, i32 0
  %497 = load i8, ptr %496, align 4
  %498 = zext i8 %497 to i32
  %499 = icmp sle i32 %498, 255
  br i1 %499, label %500, label %501

500:                                              ; preds = %494, %482, %476, %470, %458, %452, %446, %440, %434, %428, %422, %416, %410, %404, %398, %392, %386, %380, %374, %368
  store i32 1, ptr %2, align 4
  br label %889

501:                                              ; preds = %494, %488
  br label %502

502:                                              ; preds = %501, %362
  br label %503

503:                                              ; preds = %502, %356
  br label %504

504:                                              ; preds = %503, %355
  br label %505

505:                                              ; preds = %504, %130
  br label %506

506:                                              ; preds = %505, %99
  br label %508

507:                                              ; preds = %42
  store i32 1, ptr %2, align 4
  br label %889

508:                                              ; preds = %506
  br label %888

509:                                              ; preds = %35
  %510 = load ptr, ptr %6, align 8
  %511 = getelementptr inbounds %struct.ethhdr, ptr %510, i32 0, i32 2
  %512 = load i16, ptr %511, align 1
  %513 = zext i16 %512 to i32
  %514 = icmp eq i32 %513, 8
  br i1 %514, label %515, label %863

515:                                              ; preds = %509
  %516 = load ptr, ptr %5, align 8
  %517 = getelementptr i8, ptr %516, i64 14
  %518 = getelementptr i8, ptr %517, i64 20
  %519 = load ptr, ptr %4, align 8
  %520 = icmp ult ptr %518, %519
  br i1 %520, label %521, label %861

521:                                              ; preds = %515
  %522 = load ptr, ptr %5, align 8
  %523 = getelementptr i8, ptr %522, i64 14
  store ptr %523, ptr %7, align 8
  %524 = load ptr, ptr %7, align 8
  %525 = getelementptr inbounds %struct.iphdr, ptr %524, i32 0, i32 8
  %526 = getelementptr inbounds %struct.anon, ptr %525, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %14, ptr align 4 %526, i64 4, i1 false)
  %527 = load i32, ptr %14, align 4
  %528 = icmp ne i32 %527, 0
  br i1 %528, label %529, label %541

529:                                              ; preds = %521
  %530 = load ptr, ptr @bpf_map_lookup_elem, align 8
  %531 = call ptr %530(ptr noundef @ipv4_bans, ptr noundef %14)
  store ptr %531, ptr %13, align 8
  %532 = load ptr, ptr %13, align 8
  %533 = icmp ne ptr %532, null
  br i1 %533, label %534, label %540

534:                                              ; preds = %529
  %535 = load ptr, ptr %13, align 8
  %536 = load i8, ptr %535, align 1
  %537 = zext i8 %536 to i32
  %538 = icmp ne i32 %537, 0
  br i1 %538, label %539, label %540

539:                                              ; preds = %534
  store i32 1, ptr %2, align 4
  br label %889

540:                                              ; preds = %534, %529
  br label %541

541:                                              ; preds = %540, %521
  %542 = load ptr, ptr %7, align 8
  %543 = getelementptr inbounds %struct.iphdr, ptr %542, i32 0, i32 6
  %544 = load i8, ptr %543, align 1
  %545 = zext i8 %544 to i32
  %546 = icmp eq i32 %545, 17
  br i1 %546, label %547, label %680

547:                                              ; preds = %541
  %548 = load ptr, ptr %5, align 8
  %549 = getelementptr i8, ptr %548, i64 14
  %550 = getelementptr i8, ptr %549, i64 20
  store ptr %550, ptr %9, align 8
  %551 = load ptr, ptr %9, align 8
  %552 = icmp ne ptr %551, null
  br i1 %552, label %553, label %679

553:                                              ; preds = %547
  %554 = load ptr, ptr %9, align 8
  %555 = getelementptr inbounds %struct.udphdr, ptr %554, i32 0, i32 1
  %556 = load i16, ptr %555, align 2
  store i16 %556, ptr %17, align 2
  %557 = load i16, ptr %17, align 2
  %558 = zext i16 %557 to i32
  %559 = icmp ne i32 %558, 0
  br i1 %559, label %560, label %570

560:                                              ; preds = %553
  %561 = load ptr, ptr @bpf_map_lookup_elem, align 8
  %562 = call ptr %561(ptr noundef @port_bans, ptr noundef %17)
  store ptr %562, ptr %16, align 8
  %563 = load ptr, ptr %16, align 8
  %564 = icmp ne ptr %563, null
  br i1 %564, label %565, label %569

565:                                              ; preds = %560
  %566 = load ptr, ptr %16, align 8
  %567 = icmp ne ptr %566, null
  br i1 %567, label %568, label %569

568:                                              ; preds = %565
  store i32 1, ptr %2, align 4
  br label %889

569:                                              ; preds = %565, %560
  br label %570

570:                                              ; preds = %569, %553
  %571 = load ptr, ptr %5, align 8
  %572 = getelementptr i8, ptr %571, i64 14
  %573 = getelementptr i8, ptr %572, i64 20
  %574 = getelementptr i8, ptr %573, i64 8
  %575 = getelementptr i8, ptr %574, i64 12
  %576 = load ptr, ptr %4, align 8
  %577 = icmp ule ptr %575, %576
  br i1 %577, label %578, label %678

578:                                              ; preds = %570
  %579 = load ptr, ptr %5, align 8
  %580 = getelementptr i8, ptr %579, i64 14
  %581 = getelementptr i8, ptr %580, i64 20
  %582 = getelementptr i8, ptr %581, i64 8
  store ptr %582, ptr %12, align 8
  %583 = load ptr, ptr %12, align 8
  %584 = icmp ne ptr %583, null
  br i1 %584, label %585, label %677

585:                                              ; preds = %578
  %586 = load ptr, ptr %12, align 8
  %587 = getelementptr inbounds %struct.dnshdr, ptr %586, i32 0, i32 1
  %588 = load i16, ptr %587, align 2
  %589 = lshr i16 %588, 7
  %590 = and i16 %589, 1
  %591 = trunc i16 %590 to i8
  %592 = zext i8 %591 to i32
  %593 = icmp eq i32 %592, 0
  br i1 %593, label %594, label %656

594:                                              ; preds = %585
  %595 = load ptr, ptr %12, align 8
  %596 = getelementptr inbounds %struct.dnshdr, ptr %595, i32 0, i32 1
  %597 = load i16, ptr %596, align 2
  %598 = lshr i16 %597, 3
  %599 = and i16 %598, 15
  %600 = trunc i16 %599 to i8
  %601 = zext i8 %600 to i32
  %602 = icmp eq i32 %601, 0
  br i1 %602, label %603, label %656

603:                                              ; preds = %594
  store ptr null, ptr %19, align 8
  %604 = load ptr, ptr %3, align 8
  %605 = load ptr, ptr %12, align 8
  %606 = load ptr, ptr %19, align 8
  %607 = load ptr, ptr %12, align 8
  %608 = getelementptr i8, ptr %607, i64 12
  call void @parse_dns_question(ptr noundef %604, ptr noundef %605, ptr noundef %606, ptr noundef %608)
  %609 = load ptr, ptr %19, align 8
  %610 = getelementptr inbounds %struct.dnsquestion, ptr %609, i32 0, i32 2
  %611 = load i16, ptr %610, align 2
  %612 = zext i16 %611 to i32
  %613 = icmp eq i32 %612, 1
  br i1 %613, label %614, label %654

614:                                              ; preds = %603
  %615 = load ptr, ptr %19, align 8
  %616 = getelementptr inbounds %struct.dnsquestion, ptr %615, i32 0, i32 1
  %617 = load i16, ptr %616, align 2
  %618 = zext i16 %617 to i32
  %619 = icmp eq i32 %618, 1
  br i1 %619, label %620, label %621

620:                                              ; preds = %614
  br label %653

621:                                              ; preds = %614
  %622 = load ptr, ptr %19, align 8
  %623 = getelementptr inbounds %struct.dnsquestion, ptr %622, i32 0, i32 1
  %624 = load i16, ptr %623, align 2
  %625 = zext i16 %624 to i32
  %626 = icmp eq i32 %625, 28
  br i1 %626, label %627, label %628

627:                                              ; preds = %621
  br label %652

628:                                              ; preds = %621
  %629 = load ptr, ptr %19, align 8
  %630 = getelementptr inbounds %struct.dnsquestion, ptr %629, i32 0, i32 1
  %631 = load i16, ptr %630, align 2
  %632 = zext i16 %631 to i32
  %633 = icmp eq i32 %632, 5
  br i1 %633, label %634, label %635

634:                                              ; preds = %628
  br label %651

635:                                              ; preds = %628
  %636 = load ptr, ptr %19, align 8
  %637 = getelementptr inbounds %struct.dnsquestion, ptr %636, i32 0, i32 1
  %638 = load i16, ptr %637, align 2
  %639 = zext i16 %638 to i32
  %640 = icmp eq i32 %639, 33
  br i1 %640, label %641, label %642

641:                                              ; preds = %635
  br label %650

642:                                              ; preds = %635
  %643 = load ptr, ptr %19, align 8
  %644 = getelementptr inbounds %struct.dnsquestion, ptr %643, i32 0, i32 1
  %645 = load i16, ptr %644, align 2
  %646 = zext i16 %645 to i32
  %647 = icmp eq i32 %646, 16
  br i1 %647, label %648, label %649

648:                                              ; preds = %642
  br label %649

649:                                              ; preds = %648, %642
  br label %650

650:                                              ; preds = %649, %641
  br label %651

651:                                              ; preds = %650, %634
  br label %652

652:                                              ; preds = %651, %627
  br label %653

653:                                              ; preds = %652, %620
  br label %655

654:                                              ; preds = %603
  store i32 1, ptr %2, align 4
  br label %889

655:                                              ; preds = %653
  br label %676

656:                                              ; preds = %594, %585
  %657 = load ptr, ptr %12, align 8
  %658 = getelementptr inbounds %struct.dnshdr, ptr %657, i32 0, i32 1
  %659 = load i16, ptr %658, align 2
  %660 = lshr i16 %659, 7
  %661 = and i16 %660, 1
  %662 = trunc i16 %661 to i8
  %663 = zext i8 %662 to i32
  %664 = icmp eq i32 %663, 1
  br i1 %664, label %665, label %675

665:                                              ; preds = %656
  %666 = load ptr, ptr %12, align 8
  %667 = getelementptr inbounds %struct.dnshdr, ptr %666, i32 0, i32 1
  %668 = load i16, ptr %667, align 2
  %669 = lshr i16 %668, 3
  %670 = and i16 %669, 15
  %671 = trunc i16 %670 to i8
  %672 = zext i8 %671 to i32
  %673 = icmp eq i32 %672, 0
  br i1 %673, label %674, label %675

674:                                              ; preds = %665
  br label %675

675:                                              ; preds = %674, %665, %656
  br label %676

676:                                              ; preds = %675, %655
  br label %677

677:                                              ; preds = %676, %578
  br label %678

678:                                              ; preds = %677, %570
  br label %679

679:                                              ; preds = %678, %547
  br label %860

680:                                              ; preds = %541
  %681 = load ptr, ptr %7, align 8
  %682 = getelementptr inbounds %struct.iphdr, ptr %681, i32 0, i32 6
  %683 = load i8, ptr %682, align 1
  %684 = zext i8 %683 to i32
  %685 = icmp eq i32 %684, 6
  br i1 %685, label %686, label %711

686:                                              ; preds = %680
  %687 = load ptr, ptr %5, align 8
  %688 = getelementptr i8, ptr %687, i64 14
  %689 = getelementptr i8, ptr %688, i64 20
  store ptr %689, ptr %10, align 8
  %690 = load ptr, ptr %10, align 8
  %691 = icmp ne ptr %690, null
  br i1 %691, label %692, label %710

692:                                              ; preds = %686
  %693 = load ptr, ptr %10, align 8
  %694 = getelementptr inbounds %struct.tcphdr, ptr %693, i32 0, i32 1
  %695 = load i16, ptr %694, align 2
  store i16 %695, ptr %17, align 2
  %696 = load i16, ptr %17, align 2
  %697 = zext i16 %696 to i32
  %698 = icmp ne i32 %697, 0
  br i1 %698, label %699, label %709

699:                                              ; preds = %692
  %700 = load ptr, ptr @bpf_map_lookup_elem, align 8
  %701 = call ptr %700(ptr noundef @port_bans, ptr noundef %17)
  store ptr %701, ptr %16, align 8
  %702 = load ptr, ptr %16, align 8
  %703 = icmp ne ptr %702, null
  br i1 %703, label %704, label %708

704:                                              ; preds = %699
  %705 = load ptr, ptr %16, align 8
  %706 = icmp ne ptr %705, null
  br i1 %706, label %707, label %708

707:                                              ; preds = %704
  store i32 1, ptr %2, align 4
  br label %889

708:                                              ; preds = %704, %699
  br label %709

709:                                              ; preds = %708, %692
  br label %710

710:                                              ; preds = %709, %686
  br label %859

711:                                              ; preds = %680
  %712 = load ptr, ptr %7, align 8
  %713 = getelementptr inbounds %struct.iphdr, ptr %712, i32 0, i32 6
  %714 = load i8, ptr %713, align 1
  %715 = zext i8 %714 to i32
  %716 = icmp eq i32 %715, 1
  br i1 %716, label %717, label %858

717:                                              ; preds = %711
  %718 = load ptr, ptr %5, align 8
  %719 = getelementptr i8, ptr %718, i64 14
  %720 = getelementptr i8, ptr %719, i64 20
  store ptr %720, ptr %11, align 8
  %721 = load ptr, ptr %11, align 8
  %722 = icmp ne ptr %721, null
  br i1 %722, label %723, label %857

723:                                              ; preds = %717
  %724 = load ptr, ptr %11, align 8
  %725 = getelementptr inbounds %struct.icmphdr, ptr %724, i32 0, i32 0
  %726 = load i8, ptr %725, align 4
  %727 = zext i8 %726 to i32
  %728 = icmp eq i32 %727, 0
  br i1 %728, label %855, label %729

729:                                              ; preds = %723
  %730 = load ptr, ptr %11, align 8
  %731 = getelementptr inbounds %struct.icmphdr, ptr %730, i32 0, i32 0
  %732 = load i8, ptr %731, align 4
  %733 = zext i8 %732 to i32
  %734 = icmp eq i32 %733, 1
  br i1 %734, label %855, label %735

735:                                              ; preds = %729
  %736 = load ptr, ptr %11, align 8
  %737 = getelementptr inbounds %struct.icmphdr, ptr %736, i32 0, i32 0
  %738 = load i8, ptr %737, align 4
  %739 = zext i8 %738 to i32
  %740 = icmp eq i32 %739, 2
  br i1 %740, label %855, label %741

741:                                              ; preds = %735
  %742 = load ptr, ptr %11, align 8
  %743 = getelementptr inbounds %struct.icmphdr, ptr %742, i32 0, i32 0
  %744 = load i8, ptr %743, align 4
  %745 = zext i8 %744 to i32
  %746 = icmp eq i32 %745, 4
  br i1 %746, label %855, label %747

747:                                              ; preds = %741
  %748 = load ptr, ptr %11, align 8
  %749 = getelementptr inbounds %struct.icmphdr, ptr %748, i32 0, i32 0
  %750 = load i8, ptr %749, align 4
  %751 = zext i8 %750 to i32
  %752 = icmp eq i32 %751, 6
  br i1 %752, label %855, label %753

753:                                              ; preds = %747
  %754 = load ptr, ptr %11, align 8
  %755 = getelementptr inbounds %struct.icmphdr, ptr %754, i32 0, i32 0
  %756 = load i8, ptr %755, align 4
  %757 = zext i8 %756 to i32
  %758 = icmp eq i32 %757, 7
  br i1 %758, label %855, label %759

759:                                              ; preds = %753
  %760 = load ptr, ptr %11, align 8
  %761 = getelementptr inbounds %struct.icmphdr, ptr %760, i32 0, i32 0
  %762 = load i8, ptr %761, align 4
  %763 = zext i8 %762 to i32
  %764 = icmp eq i32 %763, 8
  br i1 %764, label %855, label %765

765:                                              ; preds = %759
  %766 = load ptr, ptr %11, align 8
  %767 = getelementptr inbounds %struct.icmphdr, ptr %766, i32 0, i32 0
  %768 = load i8, ptr %767, align 4
  %769 = zext i8 %768 to i32
  %770 = icmp eq i32 %769, 9
  br i1 %770, label %855, label %771

771:                                              ; preds = %765
  %772 = load ptr, ptr %11, align 8
  %773 = getelementptr inbounds %struct.icmphdr, ptr %772, i32 0, i32 0
  %774 = load i8, ptr %773, align 4
  %775 = zext i8 %774 to i32
  %776 = icmp eq i32 %775, 10
  br i1 %776, label %855, label %777

777:                                              ; preds = %771
  %778 = load ptr, ptr %11, align 8
  %779 = getelementptr inbounds %struct.icmphdr, ptr %778, i32 0, i32 0
  %780 = load i8, ptr %779, align 4
  %781 = zext i8 %780 to i32
  %782 = icmp eq i32 %781, 13
  br i1 %782, label %855, label %783

783:                                              ; preds = %777
  %784 = load ptr, ptr %11, align 8
  %785 = getelementptr inbounds %struct.icmphdr, ptr %784, i32 0, i32 0
  %786 = load i8, ptr %785, align 4
  %787 = zext i8 %786 to i32
  %788 = icmp eq i32 %787, 14
  br i1 %788, label %855, label %789

789:                                              ; preds = %783
  %790 = load ptr, ptr %11, align 8
  %791 = getelementptr inbounds %struct.icmphdr, ptr %790, i32 0, i32 0
  %792 = load i8, ptr %791, align 4
  %793 = zext i8 %792 to i32
  %794 = icmp eq i32 %793, 15
  br i1 %794, label %855, label %795

795:                                              ; preds = %789
  %796 = load ptr, ptr %11, align 8
  %797 = getelementptr inbounds %struct.icmphdr, ptr %796, i32 0, i32 0
  %798 = load i8, ptr %797, align 4
  %799 = zext i8 %798 to i32
  %800 = icmp eq i32 %799, 16
  br i1 %800, label %855, label %801

801:                                              ; preds = %795
  %802 = load ptr, ptr %11, align 8
  %803 = getelementptr inbounds %struct.icmphdr, ptr %802, i32 0, i32 0
  %804 = load i8, ptr %803, align 4
  %805 = zext i8 %804 to i32
  %806 = icmp eq i32 %805, 17
  br i1 %806, label %855, label %807

807:                                              ; preds = %801
  %808 = load ptr, ptr %11, align 8
  %809 = getelementptr inbounds %struct.icmphdr, ptr %808, i32 0, i32 0
  %810 = load i8, ptr %809, align 4
  %811 = zext i8 %810 to i32
  %812 = icmp eq i32 %811, 18
  br i1 %812, label %855, label %813

813:                                              ; preds = %807
  %814 = load ptr, ptr %11, align 8
  %815 = getelementptr inbounds %struct.icmphdr, ptr %814, i32 0, i32 0
  %816 = load i8, ptr %815, align 4
  %817 = zext i8 %816 to i32
  %818 = icmp eq i32 %817, 19
  br i1 %818, label %855, label %819

819:                                              ; preds = %813
  %820 = load ptr, ptr %11, align 8
  %821 = getelementptr inbounds %struct.icmphdr, ptr %820, i32 0, i32 0
  %822 = load i8, ptr %821, align 4
  %823 = zext i8 %822 to i32
  %824 = icmp sge i32 %823, 20
  br i1 %824, label %825, label %831

825:                                              ; preds = %819
  %826 = load ptr, ptr %11, align 8
  %827 = getelementptr inbounds %struct.icmphdr, ptr %826, i32 0, i32 0
  %828 = load i8, ptr %827, align 4
  %829 = zext i8 %828 to i32
  %830 = icmp sle i32 %829, 41
  br i1 %830, label %855, label %831

831:                                              ; preds = %825, %819
  %832 = load ptr, ptr %11, align 8
  %833 = getelementptr inbounds %struct.icmphdr, ptr %832, i32 0, i32 0
  %834 = load i8, ptr %833, align 4
  %835 = zext i8 %834 to i32
  %836 = icmp eq i32 %835, 42
  br i1 %836, label %855, label %837

837:                                              ; preds = %831
  %838 = load ptr, ptr %11, align 8
  %839 = getelementptr inbounds %struct.icmphdr, ptr %838, i32 0, i32 0
  %840 = load i8, ptr %839, align 4
  %841 = zext i8 %840 to i32
  %842 = icmp eq i32 %841, 43
  br i1 %842, label %855, label %843

843:                                              ; preds = %837
  %844 = load ptr, ptr %11, align 8
  %845 = getelementptr inbounds %struct.icmphdr, ptr %844, i32 0, i32 0
  %846 = load i8, ptr %845, align 4
  %847 = zext i8 %846 to i32
  %848 = icmp sge i32 %847, 44
  br i1 %848, label %849, label %856

849:                                              ; preds = %843
  %850 = load ptr, ptr %11, align 8
  %851 = getelementptr inbounds %struct.icmphdr, ptr %850, i32 0, i32 0
  %852 = load i8, ptr %851, align 4
  %853 = zext i8 %852 to i32
  %854 = icmp sle i32 %853, 255
  br i1 %854, label %855, label %856

855:                                              ; preds = %849, %837, %831, %825, %813, %807, %801, %795, %789, %783, %777, %771, %765, %759, %753, %747, %741, %735, %729, %723
  store i32 1, ptr %2, align 4
  br label %889

856:                                              ; preds = %849, %843
  br label %857

857:                                              ; preds = %856, %717
  br label %858

858:                                              ; preds = %857, %711
  br label %859

859:                                              ; preds = %858, %710
  br label %860

860:                                              ; preds = %859, %679
  br label %862

861:                                              ; preds = %515
  store i32 1, ptr %2, align 4
  br label %889

862:                                              ; preds = %860
  br label %887

863:                                              ; preds = %509
  %864 = load ptr, ptr %6, align 8
  %865 = getelementptr inbounds %struct.ethhdr, ptr %864, i32 0, i32 2
  %866 = load i16, ptr %865, align 1
  %867 = zext i16 %866 to i32
  %868 = icmp eq i32 %867, 3072
  br i1 %868, label %869, label %870

869:                                              ; preds = %863
  br label %886

870:                                              ; preds = %863
  %871 = load ptr, ptr %6, align 8
  %872 = getelementptr inbounds %struct.ethhdr, ptr %871, i32 0, i32 2
  %873 = load i16, ptr %872, align 1
  %874 = zext i16 %873 to i32
  %875 = icmp eq i32 %874, 3328
  br i1 %875, label %876, label %877

876:                                              ; preds = %870
  br label %885

877:                                              ; preds = %870
  %878 = load ptr, ptr %6, align 8
  %879 = getelementptr inbounds %struct.ethhdr, ptr %878, i32 0, i32 2
  %880 = load i16, ptr %879, align 1
  %881 = zext i16 %880 to i32
  %882 = icmp eq i32 %881, 3584
  br i1 %882, label %883, label %884

883:                                              ; preds = %877
  br label %884

884:                                              ; preds = %883, %877
  br label %885

885:                                              ; preds = %884, %876
  br label %886

886:                                              ; preds = %885, %869
  br label %887

887:                                              ; preds = %886, %862
  br label %888

888:                                              ; preds = %887, %508
  store i32 2, ptr %2, align 4
  br label %889

889:                                              ; preds = %888, %861, %855, %707, %654, %568, %539, %507, %500, %353, %127, %96, %67, %34
  %890 = load i32, ptr %2, align 4
  ret i32 %890
}

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: noinline nounwind optnone
define internal void @parse_dns_question(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  store ptr %3, ptr %8, align 8
  %13 = load ptr, ptr %5, align 8
  %14 = getelementptr inbounds %struct.xdp_md, ptr %13, i32 0, i32 1
  %15 = load i32, ptr %14, align 4
  %16 = zext i32 %15 to i64
  %17 = inttoptr i64 %16 to ptr
  store ptr %17, ptr %9, align 8
  %18 = load ptr, ptr %8, align 8
  store ptr %18, ptr %10, align 8
  store i32 0, ptr %11, align 4
  store i32 0, ptr %12, align 4
  br label %19

19:                                               ; preds = %62, %4
  %20 = load i32, ptr %12, align 4
  %21 = icmp slt i32 %20, 256
  br i1 %21, label %22, label %65

22:                                               ; preds = %19
  %23 = load ptr, ptr %10, align 8
  %24 = load i32, ptr %12, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr i8, ptr %23, i64 %25
  %27 = load ptr, ptr %9, align 8
  %28 = icmp ult ptr %26, %27
  br i1 %28, label %29, label %60

29:                                               ; preds = %22
  %30 = load ptr, ptr %10, align 8
  %31 = load i8, ptr %30, align 1
  %32 = sext i8 %31 to i32
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %34, label %47

34:                                               ; preds = %29
  %35 = load ptr, ptr %10, align 8
  %36 = getelementptr i8, ptr %35, i64 1
  %37 = load i16, ptr %36, align 2
  %38 = call i16 @llvm.bswap.i16(i16 %37)
  %39 = load ptr, ptr %7, align 8
  %40 = getelementptr inbounds %struct.dnsquestion, ptr %39, i32 0, i32 1
  store i16 %38, ptr %40, align 2
  %41 = load ptr, ptr %10, align 8
  %42 = getelementptr i8, ptr %41, i64 3
  %43 = load i16, ptr %42, align 2
  %44 = call i16 @llvm.bswap.i16(i16 %43)
  %45 = load ptr, ptr %7, align 8
  %46 = getelementptr inbounds %struct.dnsquestion, ptr %45, i32 0, i32 2
  store i16 %44, ptr %46, align 2
  br label %65

47:                                               ; preds = %29
  %48 = load ptr, ptr %10, align 8
  %49 = load i8, ptr %48, align 1
  %50 = load ptr, ptr %7, align 8
  %51 = getelementptr inbounds %struct.dnsquestion, ptr %50, i32 0, i32 0
  %52 = load i32, ptr %11, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [256 x i8], ptr %51, i64 0, i64 %53
  store i8 %49, ptr %54, align 1
  %55 = load i32, ptr %11, align 4
  %56 = add nsw i32 %55, 1
  store i32 %56, ptr %11, align 4
  %57 = load ptr, ptr %10, align 8
  %58 = getelementptr inbounds i8, ptr %57, i32 1
  store ptr %58, ptr %10, align 8
  br label %59

59:                                               ; preds = %47
  br label %61

60:                                               ; preds = %22
  br label %65

61:                                               ; preds = %59
  br label %62

62:                                               ; preds = %61
  %63 = load i32, ptr %12, align 4
  %64 = add nsw i32 %63, 1
  store i32 %64, ptr %12, align 4
  br label %19, !llvm.loop !3

65:                                               ; preds = %60, %34, %19
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i16 @llvm.bswap.i16(i16) #2

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { argmemonly nocallback nofree nounwind willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"clang version 15.0.7"}
!3 = distinct !{!3, !4}
!4 = !{!"llvm.loop.mustprogress"}
