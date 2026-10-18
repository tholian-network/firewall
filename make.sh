#!/bin/bash

ROOT="$(cd "$(dirname "$0")" && pwd)";

CLANG="$(command -v clang)";
GO="$(command -v go)";
LLC="$(command -v llc)";

FAILED=0;

fail() {

	echo -e "- $* [\e[31mfail\e[0m]";
	FAILED=1;

}

ok() {

	echo -e "- $* [\e[32mok\e[0m]";

}

require_insights() {

	if [ ! -f "${ROOT}/source/insights/Internet.json.gz" ]; then
		echo -e "Missing embedded Internet dataset:";
		echo -e "";
		echo -e "    ${ROOT}/source/insights/Internet.json.gz";
		echo -e "";
		echo -e "This file is required for guard builds and is not tracked by Git.";
		echo -e "See README.md (Building / Internet dataset).";
		echo -e "";
		exit 1;
	fi;

}

build_ebpf() {

	cd "${ROOT}/ebpf" || exit 1;

	${CLANG} -S -I"${ROOT}/ebpf/headers" -target bpf -O2 -Wall -Wno-unused-value -Wno-pointer-sign -Wno-compare-distinct-pointer-types -DENABLE_DNSFILTER -Werror -emit-llvm -g -o "${ROOT}/ebpf/module/module.ll" "${ROOT}/ebpf/module/module.c";

	if [[ "$?" == "0" ]]; then
		ok "Generate eBPF LLVM code";
	else
		fail "Generate eBPF LLVM code";
		return;
	fi;

	${LLC} -march=bpfeb -mcpu=v1 -filetype=obj -o "${ROOT}/source/adapters/mitigations/ebpf/module/module.bpfeb" "${ROOT}/ebpf/module/module.ll";

	if [[ "$?" == "0" ]]; then
		ok "Generate eBPF big-endian module";
	else
		fail "Generate eBPF big-endian module";
	fi;

	${LLC} -march=bpfel -mcpu=v1 -filetype=obj -o "${ROOT}/source/adapters/mitigations/ebpf/module/module.bpfel" "${ROOT}/ebpf/module/module.ll";

	if [[ "$?" == "0" ]]; then
		ok "Generate eBPF little-endian module";
	else
		fail "Generate eBPF little-endian module";
	fi;

}

build_source() {

	#
	# Available build tags to reduce file size
	#
	# guard:
	# - includes source/adapters/mitigations/ebpf Kernel Modules
	# - includes source/insights
	#
	# guard_openwrt:
	# - includes source/adapters/mitigations/ebpf Kernel Modules
	#

	local os="$1";
	local arch="$2";
	local variant="$3";
	local folder="${ROOT}/build/${os}";

	mkdir -p "${folder}";

	cd "${ROOT}/source" || exit 1;

	env CGO_ENABLED=0 GOOS="${os}" GOARCH="${arch}" ${GO} build -tags "${variant}" -o "${folder}/tholian-firewall-${variant}-${arch}" "${ROOT}/source/cmds/tholian-firewall/main.go";

	if [[ "$?" == "0" ]]; then
		ok "Build source: ${os} / ${arch} / ${variant}";
	else
		fail "Build source: ${os} / ${arch} / ${variant}";
	fi;

}



if [[ "${GO}" == "" ]] || [[ "${CLANG}" == "" ]] || [[ "${LLC}" == "" ]]; then
	echo -e "Please install go(lang) and LLVM/clang compilers. [\e[31mfail\e[0m]";
	exit 1;
fi;

if [[ "$1" == "ebpf" ]]; then

	build_ebpf;

elif [[ "$1" == "source" ]]; then

	require_insights;

	build_ebpf;

	build_source linux amd64 guard;
	build_source linux arm64 guard;

	build_source linux amd64 guard_openwrt;
	build_source linux arm64 guard_openwrt;

else

	echo -e "Build Script Usage:";
	echo -e "";
	echo -e "    bash ./make.sh ebpf;";
	echo -e "    bash ./make.sh source;";
	echo -e "";

	exit 1;

fi;

exit ${FAILED};
