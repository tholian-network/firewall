SHELL := /bin/bash

.DEFAULT_GOAL := help
.DELETE_ON_ERROR:

ROOT := $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST)))))
SOURCE_DIR := $(ROOT)/source
E2E_DIR := $(ROOT)/e2e-tests
EBPF_DIR := $(ROOT)/ebpf
BUILD_DIR ?= $(ROOT)/build/linux
LOG_DIR ?= $(ROOT)/logs
TEST_LOG_FILE ?= $(LOG_DIR)/test.log
TEST_E2E_LOG_FILE ?= $(LOG_DIR)/test_e2e.log
INSIGHTS := $(SOURCE_DIR)/insights/Internet.json.gz

GO ?= go
GOFMT ?= gofmt
CLANG ?= clang
LLC ?= llc
SUDO ?= $(shell if [ "$$EUID" -eq 0 ]; then echo ""; else echo sudo; fi)

GO_TAGS ?= guard
TARGET_VARIANTS ?= guard guard_openwrt
TARGET_ARCHES ?= amd64 arm64
THOLIAN_TEST_ATTACH ?= 1

EBPF_LL := $(EBPF_DIR)/module/module.ll
EBPF_MODULE_DIR := $(SOURCE_DIR)/adapters/mitigations/ebpf/module
EBPF_BE := $(EBPF_MODULE_DIR)/module.bpfeb
EBPF_LE := $(EBPF_MODULE_DIR)/module.bpfel
EBPF_HEADERS := $(wildcard $(EBPF_DIR)/headers/*.h) $(EBPF_DIR)/module/module.h

CLI_BINARY := $(BUILD_DIR)/tholian-firewall-guard-amd64
TEST_BINARY := $(BUILD_DIR)/tholian-firewall-tests
E2E_BINARY := $(BUILD_DIR)/tholian-firewall-e2e

.PHONY: help
help:
	@echo ""
	@echo "Usage: make <target>"
	@echo ""
	@echo "  help               Show this help"
	@echo "  build-cli          Build all Linux CLI binaries"
	@echo "  build-ebpf         Build the eBPF LLVM IR and bytecode"
	@echo "  build-tests        Build the integration and end-to-end test binaries"
	@echo "  check              Run formatting, vet, and unit tests"
	@echo "  test               Run unit tests and integration tests"
	@echo "  test-all           Run both integration and end-to-end tests"
	@echo "  test-e2e           Run end-to-end tests (with sudo)"
	@echo "  test-with-log      Run integration tests and log to ./logs/test.log"
	@echo "  test-e2e-with-log  Run end-to-end tests and log to ./logs/test_e2e.log"
	@echo "  clean              Remove generated binaries and test logs"

.PHONY: check-go-tools check-ebpf-tools
check-go-tools:
	@command -v $(GO) >/dev/null 2>&1 || { echo "missing go: $(GO)"; exit 1; }
	@command -v $(GOFMT) >/dev/null 2>&1 || { echo "missing gofmt: $(GOFMT)"; exit 1; }

check-ebpf-tools:
	@command -v $(CLANG) >/dev/null 2>&1 || { echo "missing clang: $(CLANG)"; exit 1; }
	@command -v $(LLC) >/dev/null 2>&1 || { echo "missing llc: $(LLC)"; exit 1; }

.PHONY: check-insights
check-insights:
	@test -f "$(INSIGHTS)" || { \
		echo "Missing embedded Internet dataset:"; \
		echo ""; \
		echo "    $(INSIGHTS)"; \
		echo ""; \
		echo "This file is required for guard builds and is not tracked by Git."; \
		echo "See README.md."; \
		echo ""; \
		exit 1; \
	}

.PHONY: build-cli cli
build-cli: build-ebpf | check-go-tools check-insights
	@mkdir -p "$(BUILD_DIR)"
	@for variant in $(TARGET_VARIANTS); do \
		for arch in $(TARGET_ARCHES); do \
			echo "Build $$variant / $$arch"; \
			CGO_ENABLED=0 GOOS=linux GOARCH=$$arch $(GO) -C "$(SOURCE_DIR)" build -tags "$$variant" -o "$(BUILD_DIR)/tholian-firewall-$$variant-$$arch" ./cmds/tholian-firewall/main.go || exit 1; \
		done; \
	done

.PHONY: build-ebpf
build-ebpf: $(EBPF_BE) $(EBPF_LE)

$(EBPF_LL): $(EBPF_DIR)/module/module.c $(EBPF_HEADERS) | check-ebpf-tools
	$(CLANG) -S -I"$(EBPF_DIR)/headers" -target bpf -O2 -Wall -Wno-unused-value -Wno-pointer-sign -Wno-compare-distinct-pointer-types -DENABLE_DNSFILTER -Werror -emit-llvm -g -o "$@" "$(EBPF_DIR)/module/module.c"

$(EBPF_BE): $(EBPF_LL) | check-ebpf-tools
	$(LLC) -march=bpfeb -mcpu=v1 -filetype=obj -o "$@" "$(EBPF_LL)"

$(EBPF_LE): $(EBPF_LL) | check-ebpf-tools
	$(LLC) -march=bpfel -mcpu=v1 -filetype=obj -o "$@" "$(EBPF_LL)"

.PHONY: build-tests
build-tests: build-ebpf | check-go-tools check-insights
	@mkdir -p "$(BUILD_DIR)"
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 $(GO) -C "$(SOURCE_DIR)" test -c -tags "$(GO_TAGS)" -o "$(TEST_BINARY)" ./tests
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 $(GO) -C "$(E2E_DIR)" test -c -o "$(E2E_BINARY)" .

.PHONY: check
check: | check-go-tools check-ebpf-tools check-insights
	@failed=0; \
	for dir in "$(SOURCE_DIR)" "$(E2E_DIR)"; do \
		files="$$(cd "$$dir" && $(GOFMT) -l . 2>&1)"; \
		if [ -n "$$files" ]; then \
			printf '%s\n' "$$files"; \
			failed=1; \
		fi; \
	done; \
	if [ $$failed -ne 0 ]; then \
		echo "gofmt: unformatted files"; \
		exit 1; \
	fi; \
	echo "gofmt: clean"
	$(GO) -C "$(SOURCE_DIR)" vet -tags "$(GO_TAGS)" ./...
	$(GO) -C "$(E2E_DIR)" vet ./...
	$(GO) -C "$(SOURCE_DIR)" test -tags "$(GO_TAGS)" -race -cover ./...

.PHONY: test
test: build-tests | check-go-tools
	$(GO) -C "$(SOURCE_DIR)" test -tags "$(GO_TAGS)" -race -cover ./...
	$(SUDO) env THOLIAN_TEST_ATTACH="$(THOLIAN_TEST_ATTACH)" "$(TEST_BINARY)" -test.v

test-e2e: build-cli build-tests | check-go-tools
	$(SUDO) env THOLIAN_FIREWALL_BIN="$(CLI_BINARY)" THOLIAN_TEST_ATTACH="$(THOLIAN_TEST_ATTACH)" "$(E2E_BINARY)" -test.v; \

.PHONY: test-with-log
test-with-log: build-cli build-tests
	@mkdir -p "$(LOG_DIR)"
	@set -o pipefail; { \
		echo "===================="; \
		echo "Tholian Firewall unit test suite"; \
		echo "root: $(ROOT)"; \
		echo "log:  $(TEST_LOG_FILE)"; \
		echo "===================="; \
		echo ""; \
		$(SUDO) env THOLIAN_TEST_ATTACH="$(THOLIAN_TEST_ATTACH)" "$(TEST_BINARY)" -test.v
		status=$$?; \
		echo ""; \
		echo "===================="; \
		if [ $$status -eq 0 ]; then echo "RESULT: PASS"; else echo "RESULT: FAIL"; fi; \
		echo "log: $(TEST_LOG_FILE)"; \
		echo "===================="; \
		exit $$status; \
	} 2>&1 | tee "$(TEST_LOG_FILE)"

.PHONY: test-e2e-with-log
test-e2e-with-log: build-cli build-tests
	@mkdir -p "$(LOG_DIR)"
	@set -o pipefail; { \
		echo "===================="; \
		echo "Tholian Firewall end-to-end test suite"; \
		echo "root: $(ROOT)"; \
		echo "log:  $(TEST_E2E_LOG_FILE)"; \
		echo "===================="; \
		echo ""; \
		$(SUDO) env THOLIAN_FIREWALL_BIN="$(CLI_BINARY)" THOLIAN_TEST_ATTACH="$(THOLIAN_TEST_ATTACH)" "$(E2E_BINARY)" -test.v; \
		status=$$?; \
		echo ""; \
		echo "===================="; \
		if [ $$status -eq 0 ]; then echo "RESULT: PASS"; else echo "RESULT: FAIL"; fi; \
		echo "log: $(TEST_E2E_LOG_FILE)"; \
		echo "===================="; \
		exit $$status; \
	} 2>&1 | tee "$(TEST_E2E_LOG_FILE)"

.PHONY: test-all
test-all:
	@failed=0; \
	$(MAKE) --no-print-directory test     || failed=1; \
	$(MAKE) --no-print-directory test-e2e || failed=1; \
	exit $$failed

.PHONY: clean
clean:
	rm -rf "$(BUILD_DIR)"
	rm -f "$(TEST_LOG_FILE)"
	rm -f "$(TEST_E2E_LOG_FILE)"
