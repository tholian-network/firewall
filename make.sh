#!/bin/bash

TARGET="";
CLANG="$(which clang)";
GO="$(which go)";
LLC="$(which llc)";
ROOT="$(pwd)";


if [[ "$1" == "all" ]] || [[ "$1" == "--all" ]]; then
	TARGET="all";
elif [[ "$1" == "ebpf" ]] || [[ "$1" == "--ebpf" ]]; then
	TARGET="ebpf";
elif [[ "$1" == "source" ]] || [[ "$1" == "--source" ]]; then
	TARGET="source";
fi;


if [[ "${TARGET}" == "source" ]]; then

	if [[ "$2" != "" ]] || [[ "$3" != "" ]]; then

		case "$2" in
			"android")   TARGET_OS="android";;
			"darwin")    TARGET_OS="darwin";;
			"dragonfly") TARGET_OS="dragonfly";;
			"freebsd")   TARGET_OS="freebsd";;
			"linux")     TARGET_OS="linux";;
			"netbsd")    TARGET_OS="netbsd";;
			"openbsd")   TARGET_OS="openbsd";;
			"windows")   TARGET_OS="windows";;
		esac;

		case "$3" in
			"386")   TARGET_ARCH="386";;
			"amd64") TARGET_ARCH="amd64";;
			"arm")   TARGET_ARCH="arm";;
			"arm64") TARGET_ARCH="arm64";;
		esac;

	else

		os="$(uname -s)";
		arch="$(uname -m)";

		TARGET_OS="";
		TARGET_ARCH="";

		if [[ "${os}" == "Darwin" ]]; then
			TARGET_OS="darwin";
		elif [[ "${os}" == "FreeBSD" ]]; then
			TARGET_OS="freebsd";
		elif [[ "${os}" == "Linux" ]]; then
			TARGET_OS="linux";
		elif [[ "${os}" == "OpenBSD" ]]; then
			TARGET_OS="openbsd";
		elif [[ "${os}" == "WindowsNT" ]] || [[ "${os}" == "Windows_NT" ]]; then
			TARGET_OS="windows";
		fi;

		if [[ "${arch}" == "i386" ]] || [[ "${arch}" == "i686" ]]; then
			TARGET_ARCH="386";
		elif [[ "${arch}" == "amd64" ]] || [[ "${arch}" == "x86_64" ]]; then
			TARGET_ARCH="amd64";
		elif [[ "${arch}" == "armv6l" ]] || [[ "${arch}" == "armv7l" ]]; then
			TARGET_ARCH="arm";
		elif [[ "${arch}" == "aarch64" ]] || [[ "${arch}" == "aarch64_be" ]] || [[ "${arch}" == "armv8b" ]] || [[ "${arch}" == "armv8l" ]]; then
			TARGET_ARCH="arm64";
		fi;

	fi;

fi;



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

	if [[ "${os}" != "windows" ]]; then
		env CGO_ENABLED=0 GOOS="${os}" GOARCH="${arch}" ${GO} build -tags mitigations -o "${folder}/ebpf-firewall-${os}-${arch}" "${ROOT}/source/main.go";
	fi;

	if [[ "$?" == "0" ]]; then
		echo -e "- Build source: ${os} / ${arch} [\e[32mok\e[0m]";
	else
		echo -e "- Build source: ${os} / ${arch} [\e[31mfail\e[0m]";
	fi;

}



if [[ "${GO}" != "" ]] && [[ "${CLANG}" != "" ]] && [[ "${LLC}" != "" ]]; then

	if [[ "${TARGET}" == "" ]]; then

		echo -e "Build Script Usage:";
		echo -e "";
		echo -e "    bash ./make.sh ebpf;               # build eBPF kernel modules";
		echo -e "";
		echo -e "    bash ./make.sh source;             # build source for this machine";
		echo -e "    bash ./make.sh source linux amd64; # build source for specified target machine";
		echo -e "";

		exit 1;

	elif [[ "${TARGET}" == "ebpf" ]]; then

		build_ebpf;

	elif [[ "${TARGET}" == "source" ]]; then

		build_ebpf;

		if [[ "${TARGET_OS}" != "" ]] && [[ "${TARGET_ARCH}" != "" ]]; then
			build_source "${TARGET_OS}" "${TARGET_ARCH}";
		fi;

	fi;

else
	echo -e "Please install go(lang) and LLVM/clang compilers. [\e[31mfail\e[0m]";
	exit 1;
fi;

