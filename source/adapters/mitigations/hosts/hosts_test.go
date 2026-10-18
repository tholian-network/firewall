package hosts

import "testing"
import "os"
import "tholian-firewall/structs"
import "path/filepath"
import "strings"

var test_console = structs.NewConsole(nil, nil, 0)

func setupHosts(t *testing.T, content string) string {

	t.Helper()

	directory := t.TempDir()
	path := filepath.Join(directory, "hosts")

	if err := os.WriteFile(path, []byte(content), 0644); err != nil {
		t.Fatal(err)
	}

	hostsPath = path
	Hosts = make(map[string][]string)
	SUPPORTED = true

	parseManagedBlock(content)

	return path

}

func TestManagedBlockRoundTrip(t *testing.T) {

	content := "127.0.0.1 localhost\n\n# a comment\n10.0.0.1 router\n\n"
	path := setupHosts(t, content)

	if ForbidDomain(test_console, "evil.example") == false {
		t.Fatal("ForbidDomain returned false")
	}

	if IsForbiddenDomain(test_console, "EVIL.EXAMPLE") == false {
		t.Fatal("domain matching is not case-insensitive")
	}

	buffer, err := os.ReadFile(path)

	if err != nil {
		t.Fatal(err)
	}

	text := string(buffer)

	for _, want := range []string{
		"127.0.0.1 localhost",
		"# a comment",
		"10.0.0.1 router",
		beginMarker,
		endMarker,
		sinkIPv4 + " evil.example",
		sinkIPv6 + " evil.example",
	} {

		if strings.Contains(text, want) == false {
			t.Fatalf("expected %q in /etc/hosts:\n%s", want, text)
		}

	}

	if PermitDomain(test_console, "evil.example") == false {
		t.Fatal("PermitDomain returned false")
	}

	if IsForbiddenDomain(test_console, "evil.example") == true {
		t.Fatal("domain still forbidden after permit")
	}

	buffer, err = os.ReadFile(path)

	if err != nil {
		t.Fatal(err)
	}

	text = string(buffer)

	if strings.Contains(text, "evil.example") == true {
		t.Fatalf("domain survived permit:\n%s", text)
	}

	for _, want := range []string{"127.0.0.1 localhost", "# a comment", "10.0.0.1 router"} {

		if strings.Contains(text, want) == false {
			t.Fatalf("unrelated line %q was lost:\n%s", want, text)
		}

	}

}

func TestForbidDomainIsIdempotent(t *testing.T) {

	path := setupHosts(t, "127.0.0.1 localhost\n")

	if ForbidDomain(test_console, "evil.example") == false {
		t.Fatal("ForbidDomain returned false")
	}

	if ForbidDomain(test_console, "evil.example") == false {
		t.Fatal("second ForbidDomain returned false")
	}

	buffer, _ := os.ReadFile(path)

	if strings.Count(string(buffer), beginMarker) != 1 {
		t.Fatal("managed block was duplicated")
	}

	if strings.Count(string(buffer), "0.0.0.0 evil.example") != 1 {
		t.Fatal("sink entry was duplicated")
	}

}

func TestRenderHostsReplacesBlock(t *testing.T) {

	content := "before\n" + beginMarker + "\n0.0.0.0 old.example\n" + endMarker + "\nafter\n"
	rendered := render_hosts(content, []string{"new.example"})

	if strings.Count(rendered, beginMarker) != 1 {
		t.Fatal("expected exactly one managed block")
	}

	if strings.Contains(rendered, "old.example") == true {
		t.Fatal("stale entry survived the rewrite")
	}

	if strings.Contains(rendered, "0.0.0.0 new.example") == false {
		t.Fatal("new entry missing")
	}

	if strings.Contains(rendered, "before") == false || strings.Contains(rendered, "after") == false {
		t.Fatal("surrounding lines were lost")
	}

}

func TestForbidDomainThroughSymlink(t *testing.T) {

	directory := t.TempDir()
	target := filepath.Join(directory, "hosts-real")
	link := filepath.Join(directory, "hosts")

	if err := os.WriteFile(target, []byte("127.0.0.1 localhost\n"), 0644); err != nil {
		t.Fatal(err)
	}

	if err := os.Symlink(target, link); err != nil {
		t.Fatal(err)
	}

	hostsPath = link
	Hosts = make(map[string][]string)
	SUPPORTED = true

	if ForbidDomain(test_console, "evil.example") == false {
		t.Fatal("ForbidDomain returned false")
	}

	buffer, err := os.ReadFile(target)

	if err != nil {
		t.Fatal(err)
	}

	if strings.Contains(string(buffer), "0.0.0.0 evil.example") == false {
		t.Fatal("the symlink target was not updated")
	}

	info, err := os.Lstat(link)

	if err != nil {
		t.Fatal(err)
	}

	if info.Mode()&os.ModeSymlink == 0 {
		t.Fatal("the hosts path is no longer a symlink")
	}

}

func TestRenderHostsRepairsMissingEndMarker(t *testing.T) {

	content := "before\n" + beginMarker + "\n0.0.0.0 old.example\n"
	rendered := render_hosts(content, []string{"new.example"})

	if strings.Count(rendered, beginMarker) != 1 {
		t.Fatal("expected exactly one managed block")
	}

	if strings.Count(rendered, endMarker) != 1 {
		t.Fatal("expected the managed block to be closed")
	}

	if strings.Contains(rendered, "old.example") == true {
		t.Fatal("stale entry survived the rewrite")
	}

	if strings.Contains(rendered, "before") == false {
		t.Fatal("content before the malformed block was lost")
	}

	if strings.Contains(rendered, "0.0.0.0 new.example") == false {
		t.Fatal("new entry missing")
	}

}

func TestExtractManagedBlock(t *testing.T) {

	content := "x\n" + beginMarker + "\n0.0.0.0 a.example\n" + endMarker + "\ny\n"

	if strings.TrimSpace(extractManagedBlock(content)) != "0.0.0.0 a.example" {
		t.Fatalf("unexpected block: %q", extractManagedBlock(content))
	}

	if extractManagedBlock("no block here") != "" {
		t.Fatal("expected empty block")
	}

}

func TestNormalizeDomain(t *testing.T) {

	if normalizeDomain(" Evil.Example. ") != "evil.example" {
		t.Fatalf("unexpected normalization: %q", normalizeDomain(" Evil.Example. "))
	}

}
