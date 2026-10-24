package types

import "testing"
import "strings"

func TestParseTargetIPv4(t *testing.T) {

	result := ParseTarget("1.3.3.7")

	if result.Kind != TargetNetwork {
		t.Fatalf("expected network, got %v", result.Kind)
	}

	if result.Network.Subnet != "1.3.3.7/32" {
		t.Fatalf("unexpected subnet: %q", result.Network.Subnet)
	}

}

func TestParseTargetIPv4Subnet(t *testing.T) {

	result := ParseTarget("1.3.3.0/24")

	if result.Kind != TargetNetwork {
		t.Fatalf("expected network, got %v", result.Kind)
	}

	if result.Network.Subnet != "1.3.3.0/24" {
		t.Fatalf("unexpected subnet: %q", result.Network.Subnet)
	}

}

func TestParseTargetIPv4Connection(t *testing.T) {

	result := ParseTarget("1.3.3.7:65535")

	if result.Kind != TargetConnection {
		t.Fatalf("expected connection, got %v", result.Kind)
	}

	if result.Connection.Socket.Host != "1.3.3.7" {
		t.Fatalf("unexpected host: %q", result.Connection.Socket.Host)
	}

	if result.Connection.Socket.Port != 65535 {
		t.Fatalf("unexpected port: %d", result.Connection.Socket.Port)
	}

}

func TestParseTargetIPv6(t *testing.T) {

	result := ParseTarget("[fe80::1337]")

	if result.Kind != TargetNetwork {
		t.Fatalf("expected network, got %v", result.Kind)
	}

	if strings.HasSuffix(result.Network.Subnet, "/128") == false {
		t.Fatalf("unexpected subnet: %q", result.Network.Subnet)
	}

}

func TestParseTargetIPv6Subnet(t *testing.T) {

	result := ParseTarget("[fe80::1337]/64")

	if result.Kind != TargetNetwork {
		t.Fatalf("expected network, got %v", result.Kind)
	}

	if strings.HasSuffix(result.Network.Subnet, "/64") == false {
		t.Fatalf("unexpected subnet: %q", result.Network.Subnet)
	}

}

func TestParseTargetIPv6Connection(t *testing.T) {

	result := ParseTarget("[fe80::1337]:1338")

	if result.Kind != TargetConnection {
		t.Fatalf("expected connection, got %v", result.Kind)
	}

	if result.Connection.Socket.Port != 1338 {
		t.Fatalf("unexpected port: %d", result.Connection.Socket.Port)
	}

}

func TestParseTargetDomain(t *testing.T) {

	result := ParseTarget("evil.example")

	if result.Kind != TargetDomain {
		t.Fatalf("expected domain, got %v", result.Kind)
	}

	if result.Domain != "evil.example" {
		t.Fatalf("unexpected domain: %q", result.Domain)
	}

}

func TestParseTargetDomainWithTrailingDot(t *testing.T) {

	result := ParseTarget("evil.example.")

	if result.Kind != TargetDomain {
		t.Fatalf("expected domain, got %v", result.Kind)
	}

	if result.Domain != "evil.example" {
		t.Fatalf("unexpected domain: %q", result.Domain)
	}

}

func TestParseTargetASN(t *testing.T) {

	result := ParseTarget("AS1337")

	if result.Kind != TargetNetwork {
		t.Fatalf("expected network, got %v", result.Kind)
	}

	if result.Network.Name != "AS1337" {
		t.Fatalf("unexpected name: %q", result.Network.Name)
	}

}

func TestParseTargetDefaultRoutes(t *testing.T) {

	ipv4 := ParseTarget("0.0.0.0/0")

	if ipv4.Kind != TargetNetwork || ipv4.Network.Subnet != "0.0.0.0/0" {
		t.Fatalf("unexpected IPv4 default route: %+v", ipv4)
	}

	ipv6 := ParseTarget("[::]/0")

	if ipv6.Kind != TargetNetwork || strings.HasSuffix(ipv6.Network.Subnet, "/0") == false {
		t.Fatalf("unexpected IPv6 default route: %+v", ipv6)
	}

}

func TestTargetIsValid(t *testing.T) {

	cases := []struct {
		target string
		valid  bool
	}{
		{"1.3.3.7", true},
		{"1.3.3.0/24", true},
		{"1.3.3.7:1338", true},
		{"evil.example", true},
		{"AS1337", true},
		{"", false},
		{"1.3.3.7:0", false},
	}

	for _, c := range cases {

		target := ParseTarget(c.target)

		if target.IsValid() != c.valid {
			t.Errorf("ParseTarget(%q).IsValid() = %v, expected %v", c.target, target.IsValid(), c.valid)
		}

	}

}

func TestParseTargetInvalid(t *testing.T) {

	for _, target := range []string{"", "a.b", "1.3.3.7/33", "[fe80::1]/129", "1.3.3.7:0"} {

		result := ParseTarget(target)

		if result.Kind != TargetInvalid {
			t.Errorf("ParseTarget(%q) unexpectedly returned kind %v", target, result.Kind)
		}

	}

}
