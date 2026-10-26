package e2e

import "bytes"
import "errors"
import "os"
import "os/exec"
import "path/filepath"
import "strings"
import "testing"

const defaultCLIPath = "../build/linux/tholian-firewall-guard-amd64"

type commandResult struct {
	Stdout   string
	Stderr   string
	ExitCode int
}

func binaryPath(t *testing.T) string {

	t.Helper()

	path := os.Getenv("THOLIAN_FIREWALL_BIN")

	if path == "" {
		path = defaultCLIPath
	}

	absolute, err := filepath.Abs(path)

	if err != nil {
		t.Fatalf("cannot resolve CLI binary path %q: %v", path, err)
	}

	info, err := os.Stat(absolute)

	if err != nil {
		t.Fatalf("CLI binary not found at %s: %v", absolute, err)
	}

	if info.IsDir() {
		t.Fatalf("CLI binary path is a directory: %s", absolute)
	}

	if info.Mode()&0111 == 0 {
		t.Fatalf("CLI binary is not executable: %s", absolute)
	}

	return absolute

}

func commandEnv() []string {

	env := make([]string, 0, len(os.Environ())+2)

	for _, value := range os.Environ() {

		if strings.HasPrefix(value, "NO_COLOR=") || strings.HasPrefix(value, "TERM=") {
			continue
		}

		env = append(env, value)

	}

	return append(env, "NO_COLOR=1", "TERM=dumb")

}

func runCLI(t *testing.T, args ...string) commandResult {

	t.Helper()

	command := exec.Command(binaryPath(t), args...)
	command.Env = commandEnv()

	var stdout bytes.Buffer
	var stderr bytes.Buffer

	command.Stdout = &stdout
	command.Stderr = &stderr

	result := commandResult{
		Stdout:   stdout.String(),
		Stderr:   stderr.String(),
		ExitCode: 0,
	}

	err := command.Run()

	if err != nil {

		var exitError *exec.ExitError

		if errors.As(err, &exitError) {
			result.ExitCode = exitError.ExitCode()
		} else {
			t.Fatalf("cannot execute CLI: %v", err)
		}

	}

	result.Stdout = stdout.String()
	result.Stderr = stderr.String()

	return result

}

func output(result commandResult) string {
	return result.Stdout + result.Stderr
}

func requireRoot(t *testing.T) {

	t.Helper()

	if os.Geteuid() != 0 {
		t.Skip("requires root with CAP_BPF/CAP_NET_ADMIN")
	}

}

func requireAttach(t *testing.T) {

	t.Helper()

	if os.Getenv("THOLIAN_TEST_ATTACH") != "1" {
		t.Skip("set THOLIAN_TEST_ATTACH=1 to attach XDP to all interfaces")
	}

}

func TestUsageWithoutArguments(t *testing.T) {

	result := runCLI(t)

	if result.ExitCode != 2 {
		t.Fatalf("exit code = %d, expected 2", result.ExitCode)
	}

	if strings.Contains(output(result), "Usage: tholian-firewall") == false {
		t.Fatalf("usage text missing from output:\n%s", output(result))
	}

}

func TestUsageWithUnknownAction(t *testing.T) {

	result := runCLI(t, "unknown-action")

	if result.ExitCode != 2 {
		t.Fatalf("exit code = %d, expected 2", result.ExitCode)
	}

	if strings.Contains(output(result), "Usage: tholian-firewall") == false {
		t.Fatalf("usage text missing from output:\n%s", output(result))
	}

}

func TestMissingTarget(t *testing.T) {

	result := runCLI(t, "forbid")

	if result.ExitCode != 2 {
		t.Fatalf("exit code = %d, expected 2", result.ExitCode)
	}

	if strings.Contains(output(result), "Usage: tholian-firewall") == false {
		t.Fatalf("usage text missing from output:\n%s", output(result))
	}

}

func TestStatus(t *testing.T) {

	requireRoot(t)

	result := runCLI(t, "status")

	if result.ExitCode != 0 {
		t.Fatalf("exit code = %d, expected 0:\n%s", result.ExitCode, output(result))
	}

	if strings.Contains(output(result), "panic:") {
		t.Fatalf("status panicked:\n%s", output(result))
	}

}

func TestSearchIPv4(t *testing.T) {

	result := runCLI(t, "search", "1.1.1.1")

	if result.ExitCode != 0 {
		t.Fatalf("exit code = %d, expected 0:\n%s", result.ExitCode, output(result))
	}

	if strings.Contains(output(result), "AS13335") == false {
		t.Fatalf("AS13335 missing from output:\n%s", output(result))
	}

	if strings.Contains(output(result), "1.1.1.0/24") == false {
		t.Fatalf("1.1.1.0/24 missing from output:\n%s", output(result))
	}

}

func TestSearchASN(t *testing.T) {

	result := runCLI(t, "search", "AS13335")

	if result.ExitCode != 0 {
		t.Fatalf("exit code = %d, expected 0:\n%s", result.ExitCode, output(result))
	}

	if strings.Contains(output(result), "AS13335") == false {
		t.Fatalf("AS13335 missing from output:\n%s", output(result))
	}

	if strings.Contains(output(result), "subnets") == false {
		t.Fatalf("subnet count missing from output:\n%s", output(result))
	}

}

func TestSearchInvalidTarget(t *testing.T) {

	result := runCLI(t, "search", "not-a-target")

	if result.ExitCode != 1 {
		t.Fatalf("exit code = %d, expected 1:\n%s", result.ExitCode, output(result))
	}

}

func TestSelfTest(t *testing.T) {

	requireRoot(t)
	requireAttach(t)

	result := runCLI(t, "selftest")

	if result.ExitCode != 0 {
		t.Fatalf("exit code = %d, expected 0:\n%s", result.ExitCode, output(result))
	}

	if strings.Contains(output(result), "actions/SelfTest") == false {
		t.Fatalf("self test marker missing from output:\n%s", output(result))
	}

}
