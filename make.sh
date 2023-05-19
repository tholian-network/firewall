#!/bin/bash

CLANG="$(which clang)";
GO="$(which go)";
LLC="$(which llc)";
ROOT="$(pwd)";

build_ebpf() {

	cd "${ROOT}/kernel";

	# TODO: Add -DENABLE_DNSFILTER once it's ready
	${CLANG} -S -I"${ROOT}/kernel/headers" -target bpf -O2 -Wall -Wno-unused-value -Wno-pointer-sign -Wno-compare-distinct-pointer-types -Werror -emit-llvm -g -c -o "${ROOT}/kernel/ebpf/module.ll" "${ROOT}/kernel/ebpf/module.c"

	if [[ "$?" == "0" ]]; then
		echo -e "- Generate eBPF LLVM code: ${os} [\e[32mok\e[0m]";
	else
		echo -e "- Generate eBPF LLVM code: ${os} [\e[31mfail\e[0m]";
	fi;

	${LLC} -march=bpfeb -mcpu=v1 -filetype=obj -o "${ROOT}/source/adapters/mitigations/ebpf/module.bpfeb" "${ROOT}/kernel/ebpf/module.ll";

	if [[ "$?" == "0" ]]; then
		echo -e "- Generate eBPF big-endian module: ${os} [\e[32mok\e[0m]";
	else
		echo -e "- Generate eBPF big-endian module: ${os} [\e[31mfail\e[0m]";
	fi;

	${LLC} -march=bpfel -mcpu=v1 -filetype=obj -o "${ROOT}/source/adapters/mitigations/ebpf/module.bpfel" "${ROOT}/kernel/ebpf/module.ll";

	if [[ "$?" == "0" ]]; then
		echo -e "- Generate eBPF little-endian module: ${os} [\e[32mok\e[0m]";
	else
		echo -e "- Generate eBPF little-endian module: ${os} [\e[31mfail\e[0m]";
	fi;

}

build_source() {

	#
	# Available build tags to reduce file size
	#
	# mitigations:
	# - includes source/adapters/mitigations/ebpf Kernel Modules
	#

	local os="$1";
	local arch="$2";
	local folder="${ROOT}/build/${os}";

	mkdir -p "${folder}";

	cd "${ROOT}/source";

	env CGO_ENABLED=0 GOOS="${os}" GOARCH="${arch}" ${GO} build -tags mitigations -o "${folder}/ebpf-firewall-${os}-${arch}" "${ROOT}/source/main.go";

	if [[ "$?" == "0" ]]; then
		echo -e "- Build source: ${os} / ${arch} [\e[32mok\e[0m]";
	else
		echo -e "- Build source: ${os} / ${arch} [\e[31mfail\e[0m]";
	fi;

}



if [[ "${GO}" != "" ]] && [[ "${CLANG}" != "" ]] && [[ "${LLC}" != "" ]]; then

	if [[ "$1" == "ebpf" ]]; then

		build_ebpf;

	elif [[ "$1" == "source" ]]; then

		build_ebpf;

		build_source linux amd64;
		build_source linux arm64;

	else

		echo -e "Build Script Usage:";
		echo -e "";
		echo -e "    bash ./make.sh ebpf;               # build eBPF kernel modules";
		echo -e "    bash ./make.sh source;             # build source for this machine";
		echo -e "";

		exit 1;

	fi;

else
	echo -e "Please install go(lang) and LLVM/clang compilers. [\e[31mfail\e[0m]";
	exit 1;
fi;

