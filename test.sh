#!/bin/bash

ROOT="$(cd "$(dirname "$0")" && pwd)";
LOG_DIR="${ROOT}/logs";
LOG_FILE="${LOG_DIR}/test.log";
BUILD_DIR="${ROOT}/build/linux";
CLI_BINARY="${BUILD_DIR}/tholian-firewall-guard-amd64";
TEST_BINARY="${BUILD_DIR}/tholian-firewall-tests";

mkdir -p "${LOG_DIR}" "${BUILD_DIR}";

exec > >(tee "${LOG_FILE}") 2>&1;

echo "================================================================";
echo "Tholian Firewall test suite";
echo "date: $(date -Is)";
echo "user: $(id -un) (uid $(id -u))";
echo "root: ${ROOT}";
echo "log:  ${LOG_FILE}";
echo "================================================================";
echo "";

if [ "$(id -u)" = "0" ]; then
	SUDO="";
else
	SUDO="sudo";
fi;

FAILED=0;

section() {
	echo "";
	echo "----------------------------------------------------------------";
	echo "==> $*";
	echo "----------------------------------------------------------------";
}

check() {
	if [ "$?" != "0" ]; then
		FAILED=1;
	fi;
}

section "Unit tests (go test -tags guard ./...)";
( cd "${ROOT}/source" && go test -tags guard ./... );
check;

section "Build eBPF module (make.sh ebpf)";
bash "${ROOT}/make.sh" ebpf;
check;

section "Build CLI binary (linux/amd64)";
( cd "${ROOT}/source" && CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -tags guard -o "${CLI_BINARY}" ./cmds/tholian-firewall/main.go );
check;

section "Build centralized test binary (go test -c ./tests)";
( cd "${ROOT}/source" && CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go test -c -tags guard -o "${TEST_BINARY}" ./tests );
check;

if [ ! -x "${TEST_BINARY}" ]; then
	echo "missing test binary: ${TEST_BINARY}";
	echo "RESULT: FAIL";
	exit 1;
fi;

section "Run eBPF test suite (sudo ${TEST_BINARY} -test.v)";
${SUDO} env THOLIAN_TEST_ATTACH="${THOLIAN_TEST_ATTACH:-1}" "${TEST_BINARY}" -test.v;
check;

section "CLI smoke test (sudo ${CLI_BINARY} status)";
${SUDO} "${CLI_BINARY}" status;
check;

section "CLI smoke test (sudo ${CLI_BINARY} search 1.1.1.1)";
${SUDO} "${CLI_BINARY}" search "1.1.1.1";
check;

echo "";
echo "================================================================";
if [ "${FAILED}" = "0" ]; then
	echo "RESULT: PASS";
else
	echo "RESULT: FAIL";
fi;
echo "log: ${LOG_FILE}";
echo "================================================================";

exit ${FAILED};
