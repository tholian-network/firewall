//go:build guard || guard_openwrt || guard_almalinux || guard_alpinelinux || guard_amazonlinux || guard_antergos || guard_archlinux || guard_cblmariner || guard_centos || guard_debian || guard_fedora || guard_gentoolinux || guard_linuxmint || guard_manjaro || guard_opensuse || guard_oraclelinux || guard_photonos || guard_redhat || guard_rockylinux || guard_trisquel || guard_ubuntu

package tests

import "testing"
import "os"
import "bytes"
import "encoding/binary"
import "net"

import "tholian-firewall/adapters/mitigations/ebpf"
import "tholian-firewall/adapters/mitigations/ebpf/module"
import "tholian-firewall/structs"

const (
	xdpAborted  = 0
	xdpDrop     = 1
	xdpPass     = 2
	xdpTx       = 3
	xdpRedirect = 4
)

var test_console = structs.NewConsole(os.Stdout, os.Stderr, 0)

func TestMain(m *testing.M) {

	ebpf.Init(test_console)

	os.Exit(m.Run())

}

func dnsResponsePacket(domain string, address [4]byte) []byte {

	wire := make([]byte, 0)

	for _, label := range bytes.Split([]byte(domain), []byte(".")) {
		wire = append(wire, byte(len(label)))
		wire = append(wire, label...)
	}

	wire = append(wire, 0)

	question := make([]byte, 0)
	question = append(question, wire...)
	question = append(question, 0x00, 0x01) // QTYPE A
	question = append(question, 0x00, 0x01) // QCLASS IN

	answer := make([]byte, 0)
	answer = append(answer, 0xc0, 0x0c)             // name: pointer to offset 12
	answer = append(answer, 0x00, 0x01)             // TYPE A
	answer = append(answer, 0x00, 0x01)             // CLASS IN
	answer = append(answer, 0x00, 0x00, 0x00, 0x3c) // TTL
	answer = append(answer, 0x00, 0x04)             // RDLENGTH
	answer = append(answer, address[0], address[1], address[2], address[3])

	dns := make([]byte, 0)
	dns = append(dns, 0x12, 0x34) // transaction id
	dns = append(dns, 0x81, 0x80) // flags: response, recursion desired/available
	dns = append(dns, 0x00, 0x01) // question count
	dns = append(dns, 0x00, 0x01) // answer count
	dns = append(dns, 0x00, 0x00) // authority count
	dns = append(dns, 0x00, 0x00) // additional count
	dns = append(dns, question...)
	dns = append(dns, answer...)

	udp := make([]byte, 8)
	binary.BigEndian.PutUint16(udp[0:2], 53)
	binary.BigEndian.PutUint16(udp[2:4], 12345)
	binary.BigEndian.PutUint16(udp[4:6], uint16(8+len(dns)))
	binary.BigEndian.PutUint16(udp[6:8], 0)

	ip := make([]byte, 20)
	ip[0] = 0x45
	binary.BigEndian.PutUint16(ip[2:4], uint16(20+len(udp)+len(dns)))
	binary.BigEndian.PutUint16(ip[4:6], 0)
	binary.BigEndian.PutUint16(ip[6:8], 0)
	ip[8] = 64
	ip[9] = 17
	binary.BigEndian.PutUint16(ip[10:12], 0)
	ip[12], ip[13], ip[14], ip[15] = 8, 8, 8, 8
	ip[16], ip[17], ip[18], ip[19] = 192, 168, 1, 1

	eth := make([]byte, 14)
	eth[0], eth[1], eth[2], eth[3], eth[4], eth[5] = 2, 0, 0, 0, 0, 0
	eth[6], eth[7], eth[8], eth[9], eth[10], eth[11] = 6, 0, 0, 0, 0, 0
	binary.BigEndian.PutUint16(eth[12:14], 0x0800)

	packet := make([]byte, 0)
	packet = append(packet, eth...)
	packet = append(packet, ip...)
	packet = append(packet, udp...)
	packet = append(packet, dns...)

	return packet

}

func requireRoot(t *testing.T) {

	t.Helper()

	if os.Geteuid() != 0 {
		t.Skip("requires root with CAP_BPF/CAP_NET_ADMIN")
	}

}

func requireModule(t *testing.T) {

	t.Helper()

	requireRoot(t)

	if module.Loaded == false {
		t.Fatalf("eBPF module failed to load: %v", module.LoadError)
	}

}

func TestModuleLoad(t *testing.T) {

	requireRoot(t)

	if module.Loaded == false {
		t.Fatalf("eBPF module failed to load: %v", module.LoadError)
	}

	if module.Module.Program == nil {
		t.Fatal("xdp_prog_main was not loaded")
	}

	if module.Module.PortBans == nil {
		t.Fatal("port_bans map was not loaded")
	}

	if ebpf.SUPPORTED == false {
		t.Fatal("ebpf.SUPPORTED is false after a successful load")
	}

}

func TestDomainKey(t *testing.T) {

	a := module.ToBPFDomain("evil.example")
	b := module.ToBPFDomain("EVIL.EXAMPLE.")

	if len(a) != 8 {
		t.Fatalf("ToBPFDomain returned %d bytes, expected 8", len(a))
	}

	if bytes.Equal(a, b) == false {
		t.Fatal("ToBPFDomain is not case/root-dot insensitive")
	}

	if len(module.ToBPFDomain("")) != 0 {
		t.Fatal("ToBPFDomain should be empty for an empty domain")
	}

}

func TestAddressRoundTrip(t *testing.T) {

	requireModule(t)

	if ebpf.ForbidAddress(test_console, "1.3.3.7") == false {
		t.Fatal("ForbidAddress failed")
	}

	if ebpf.IsForbiddenAddress(test_console, "1.3.3.7") == false {
		t.Fatal("IsForbiddenAddress returned false after forbid")
	}

	if ebpf.PermitAddress(test_console, "1.3.3.7") == false {
		t.Fatal("PermitAddress failed")
	}

	if ebpf.IsForbiddenAddress(test_console, "1.3.3.7") == true {
		t.Fatal("IsForbiddenAddress returned true after permit")
	}

}

func TestIPv6AddressRoundTrip(t *testing.T) {

	requireModule(t)

	if ebpf.ForbidAddress(test_console, "[fe80::1337]") == false {
		t.Fatal("ForbidAddress failed for IPv6")
	}

	if ebpf.IsForbiddenAddress(test_console, "[fe80::1337]") == false {
		t.Fatal("IsForbiddenAddress returned false after IPv6 forbid")
	}

	if ebpf.PermitAddress(test_console, "[fe80::1337]") == false {
		t.Fatal("PermitAddress failed for IPv6")
	}

	if ebpf.IsForbiddenAddress(test_console, "[fe80::1337]") == true {
		t.Fatal("IsForbiddenAddress returned true after IPv6 permit")
	}

}

func TestSubnetRoundTrip(t *testing.T) {

	requireModule(t)

	if ebpf.ForbidSubnet(test_console, "1.3.3.0", 24) == false {
		t.Fatal("ForbidSubnet failed")
	}

	if ebpf.IsForbiddenSubnet(test_console, "1.3.3.7", 32) == false {
		t.Fatal("IsForbiddenSubnet returned false for a covered address")
	}

	if ebpf.PermitSubnet(test_console, "1.3.3.0", 24) == false {
		t.Fatal("PermitSubnet failed")
	}

	if ebpf.IsForbiddenSubnet(test_console, "1.3.3.7", 32) == true {
		t.Fatal("IsForbiddenSubnet returned true after permit")
	}

}

func TestPortRoundTrip(t *testing.T) {

	requireModule(t)

	if ebpf.ForbidPort(test_console, 1338) == false {
		t.Fatal("ForbidPort failed")
	}

	if ebpf.IsForbiddenPort(test_console, 1338) == false {
		t.Fatal("IsForbiddenPort returned false after forbid")
	}

	if ebpf.PermitPort(test_console, 1338) == false {
		t.Fatal("PermitPort failed")
	}

	if ebpf.IsForbiddenPort(test_console, 1338) == true {
		t.Fatal("IsForbiddenPort returned true after permit")
	}

}

func TestDomainRoundTrip(t *testing.T) {

	requireModule(t)

	if ebpf.ForbidAddress(test_console, "evil.example") == false {
		t.Fatal("ForbidAddress failed for a domain")
	}

	if ebpf.IsForbiddenAddress(test_console, "evil.example") == false {
		t.Fatal("IsForbiddenAddress returned false after domain forbid")
	}

	if ebpf.IsForbiddenAddress(test_console, "EVIL.EXAMPLE") == false {
		t.Fatal("domain matching is not case-insensitive")
	}

	if ebpf.PermitAddress(test_console, "evil.example") == false {
		t.Fatal("PermitAddress failed for a domain")
	}

	if ebpf.IsForbiddenAddress(test_console, "evil.example") == true {
		t.Fatal("IsForbiddenAddress returned true after domain permit")
	}

}

func TestAttachAll(t *testing.T) {

	requireModule(t)

	if os.Getenv("THOLIAN_TEST_ATTACH") != "1" {
		t.Skip("set THOLIAN_TEST_ATTACH=1 to attach XDP to all interfaces")
	}

	attached := ebpf.AttachAll(test_console)

	if attached == 0 {
		t.Fatal("AttachAll attached to zero interfaces")
	}

	ebpf.DetachAll(test_console)

}

func TestDNSDrop(t *testing.T) {

	requireModule(t)

	ebpf.PermitAddress(test_console, "evil.invalid")

	if ebpf.ForbidAddress(test_console, "evil.invalid") == false {
		t.Fatal("ForbidAddress failed for the domain")
	}

	packet := dnsResponsePacket("evil.invalid", [4]byte{1, 3, 3, 7})

	code, _, err := module.Module.Program.Test(packet)

	if err != nil {
		t.Fatalf("BPF_PROG_TEST_RUN failed: %v", err)
	}

	if code != xdpDrop {
		t.Errorf("program returned %d, expected XDP_DROP (%d)", code, xdpDrop)
	}

	ebpf.PermitAddress(test_console, "evil.invalid")

}

func TestDomainResolutionInstall(t *testing.T) {

	requireModule(t)

	ebpf.PermitAddress(test_console, "example.com")

	if ebpf.ForbidAddress(test_console, "example.com") == false {
		t.Fatal("ForbidAddress failed for the domain")
	}

	if ebpf.IsForbiddenAddress(test_console, "example.com") == false {
		t.Fatal("domain was not installed into domain_bans")
	}

	resolved, err := net.LookupIP("example.com")

	if err != nil {
		t.Skipf("DNS lookup failed, skipping resolved address check: %v", err)
	}

	if len(resolved) == 0 {
		t.Skip("DNS returned no addresses")
	}

	installed := 0

	for r := 0; r < len(resolved); r++ {

		if ebpf.IsForbiddenAddress(test_console, resolved[r].String()) {
			installed = installed + 1
		}

	}

	if installed == 0 {
		t.Fatal("no resolved A/AAAA address was installed into the ban maps")
	}

	ebpf.PermitAddress(test_console, "example.com")

}
