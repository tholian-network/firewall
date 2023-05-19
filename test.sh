#!/bin/bash

ROOT="$(pwd)";

# bash "${ROOT}/make.sh" ebpf;
bash "${ROOT}/make.sh" source;

sudo ./build/linux/ebpf-firewall-linux-amd64;

