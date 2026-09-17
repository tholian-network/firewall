package iptables

import "testing"
import "os"
import "path/filepath"
import "strconv"
import "strings"

func fakeIptables(t *testing.T, logPath string, checkExit int) string {

	t.Helper()

	directory := t.TempDir()
	path := filepath.Join(directory, "iptables")

	script := "#!/bin/sh\n" +
		"printf '%s\\n' \"$*\" >> \"" + logPath + "\"\n" +
		"if [ \"$1\" = \"-C\" ]; then exit " + strconv.Itoa(checkExit) + "; fi\n" +
		"exit 0\n"

	if err := os.WriteFile(path, []byte(script), 0755); err != nil {
		t.Fatal(err)
	}

	return path

}

func configureIptables(program string) {

	programIPv4 = program
	programIPv6 = ""
	SUPPORTED_IPV4 = true
	SUPPORTED_IPV6 = false
	SUPPORTED = true

	managedMutex.Lock()
	managed = nil
	managedMutex.Unlock()

}

func readFakeLog(t *testing.T, path string) []string {

	t.Helper()

	buffer, err := os.ReadFile(path)

	if err != nil {
		return nil
	}

	text := strings.TrimSpace(string(buffer))

	if text == "" {
		return nil
	}

	return strings.Split(text, "\n")

}

func assertLines(t *testing.T, actual []string, expected []string) {

	t.Helper()

	if len(actual) != len(expected) {
		t.Fatalf("expected %d commands, got %d: %v", len(expected), len(actual), actual)
	}

	for i := 0; i < len(expected); i++ {
		if actual[i] != expected[i] {
			t.Fatalf("command %d: expected %q, got %q", i, expected[i], actual[i])
		}
	}

}

func TestForbidAddressIPv4(t *testing.T) {

	logPath := filepath.Join(t.TempDir(), "commands.log")
	configureIptables(fakeIptables(t, logPath, 1))

	if ForbidAddress("1.3.3.7") == false {
		t.Fatal("ForbidAddress returned false")
	}

	assertLines(t, readFakeLog(t, logPath), []string{
		"-C INPUT -s 1.3.3.7 -j DROP",
		"-A INPUT -s 1.3.3.7 -j DROP",
		"-C OUTPUT -d 1.3.3.7 -j DROP",
		"-A OUTPUT -d 1.3.3.7 -j DROP",
	})

	if len(Status()) != 2 {
		t.Fatalf("expected 2 tracked rules, got %d", len(Status()))
	}

}

func TestIsForbiddenAddress(t *testing.T) {

	logPath := filepath.Join(t.TempDir(), "commands.log")
	configureIptables(fakeIptables(t, logPath, 0))

	if IsForbiddenAddress("1.3.3.7") == false {
		t.Fatal("IsForbiddenAddress returned false")
	}

	if PermitAddress("1.3.3.7") == false {
		t.Fatal("PermitAddress returned false")
	}

	if len(Status()) != 0 {
		t.Fatalf("Status still tracks %d rules after permit", len(Status()))
	}

}

func TestForbidAddressIPv6Unsupported(t *testing.T) {

	logPath := filepath.Join(t.TempDir(), "commands.log")
	configureIptables(fakeIptables(t, logPath, 1))

	if ForbidAddress("[fe80::1337]") == true {
		t.Fatal("ForbidAddress returned true without ip6tables support")
	}

	if len(readFakeLog(t, logPath)) != 0 {
		t.Fatal("no command should be executed without ip6tables support")
	}

}

func TestForbidPortUsesFamilies(t *testing.T) {

	logPath := filepath.Join(t.TempDir(), "commands.log")
	configureIptables(fakeIptables(t, logPath, 1))

	if ForbidPort(1338) == false {
		t.Fatal("ForbidPort returned false")
	}

	lines := readFakeLog(t, logPath)
	added := 0

	for l := 0; l < len(lines); l++ {
		if strings.HasPrefix(lines[l], "-A ") {
			added = added + 1
		}
	}

	if added != 4 {
		t.Fatalf("expected 4 port rules, got %d: %v", added, lines)
	}

}

func TestIsForbiddenPort(t *testing.T) {

	logPath := filepath.Join(t.TempDir(), "commands.log")
	configureIptables(fakeIptables(t, logPath, 0))

	if IsForbiddenPort(1338) == false {
		t.Fatal("IsForbiddenPort returned false")
	}

}

func TestForbidAddressFailure(t *testing.T) {

	directory := t.TempDir()
	path := filepath.Join(directory, "iptables")

	script := "#!/bin/sh\nexit 3\n"

	if err := os.WriteFile(path, []byte(script), 0755); err != nil {
		t.Fatal(err)
	}

	configureIptables(path)

	if ForbidAddress("1.3.3.7") == true {
		t.Fatal("ForbidAddress returned true despite a failing program")
	}

}

func TestResolveProgram(t *testing.T) {

	programIPv4 = "/usr/sbin/iptables"
	programIPv6 = "/usr/sbin/ip6tables"

	program, address := resolveProgram("1.3.3.7")

	if program != programIPv4 || address != "1.3.3.7" {
		t.Fatalf("unexpected IPv4 resolution: %q %q", program, address)
	}

	program, address = resolveProgram("[fe80::1337]")

	if program != programIPv6 || address != "fe80:0000:0000:0000:0000:0000:0000:1337" {
		t.Fatalf("unexpected IPv6 resolution: %q %q", program, address)
	}

}
