#!/bin/bash

TARGET="";
CLANG="$(which clang)";
CURL="$(which curl)";
LLC="$(which llc)";
ROOT="$(pwd)";



build_ebpf() {

	cd "${ROOT}";

	${CLANG} -S -I"${ROOT}/headers" -target bpf -O2 -Wall -Wno-unused-value -Wno-pointer-sign -Wno-compare-distinct-pointer-types -Werror -emit-llvm -c -o "${ROOT}/ebpf/module.ll" "${ROOT}/ebpf/module.c"

	if [[ "$?" == "0" ]]; then
		echo -e "- Generate eBPF LLVM code: ${os} [\e[32mok\e[0m]";
	else
		echo -e "- Generate eBPF LLVM code: ${os} [\e[31mfail\e[0m]";
	fi;

	${LLC} -march=bpfeb -filetype=obj -o "${ROOT}/build/module.bpfeb" "${ROOT}/ebpf/module.ll";

	if [[ "$?" == "0" ]]; then
		echo -e "- Generate eBPF big-endian module: ${os} [\e[32mok\e[0m]";
	else
		echo -e "- Generate eBPF big-endian module: ${os} [\e[31mfail\e[0m]";
	fi;

	${LLC} -march=bpfel -filetype=obj -o "${ROOT}/build/module.bpfel" "${ROOT}/ebpf/module.ll";

	if [[ "$?" == "0" ]]; then
		echo -e "- Generate eBPF little-endian module: ${os} [\e[32mok\e[0m]";
	else
		echo -e "- Generate eBPF little-endian module: ${os} [\e[31mfail\e[0m]";
	fi;

}



build_ebpf;

