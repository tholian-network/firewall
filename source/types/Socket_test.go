package types

import "testing"

func TestSocket(t *testing.T) {

	socket := NewSocket("1.3.3.7", 65535)

	if socket.Host != "1.3.3.7" || socket.Port != 65535 || socket.Type != AddressTypeIPv4 {
		t.Fatalf("unexpected socket: %+v", socket)
	}

	if socket.IsValid() == false {
		t.Fatal("IPv4 socket should be valid")
	}

	socket = NewSocket("evil.example", 443)

	if socket.Type != AddressTypeDomain || socket.Scope != "public" {
		t.Fatalf("unexpected domain socket: %+v", socket)
	}

	socket = NewSocket("*", 0)

	if socket.Host != HostWildcard || socket.Type != AddressTypeIPv4 {
		t.Fatalf("unexpected wildcard socket: %+v", socket)
	}

}

func TestToSocket(t *testing.T) {

	cases := []struct {
		value string
		host  string
		port  uint16
	}{
		{"1.3.3.7:1338", "1.3.3.7", 1338},
		{"[fe80::1]:1338", "fe80:0000:0000:0000:0000:0000:0000:0001", 1338},
		{"evil.example:1338", "evil.example", 1338},
	}

	for _, c := range cases {

		socket := ToSocket(c.value)

		if socket.Host != c.host || socket.Port != c.port {
			t.Errorf("ToSocket(%q) = %s:%d, expected %s:%d", c.value, socket.Host, socket.Port, c.host, c.port)
		}

	}

}

func TestSocketPredicates(t *testing.T) {

	unset := Socket{}

	if unset.IsUnset() == false || unset.IsValid() == true {
		t.Fatal("the zero socket should be unset and invalid")
	}

	wildcard := NewSocket("*", 1338)

	if wildcard.IsAny() == false || wildcard.HasHost() == true || wildcard.HasPort() == false {
		t.Fatalf("unexpected wildcard socket predicates: %+v", wildcard)
	}

	unspecified := NewSocket(UnspecifiedIPv4, 0)

	if unspecified.IsUnspecified() == false || unspecified.HasHost() == true {
		t.Fatalf("unexpected unspecified socket predicates: %+v", unspecified)
	}

	host_only := NewSocket("1.3.3.7", 0)

	if host_only.HasHost() == false || host_only.HasPort() == true {
		t.Fatalf("unexpected host-only socket predicates: %+v", host_only)
	}

	if host_only.IsValid() == false {
		t.Fatal("host-only IPv4 socket should be valid")
	}

	ipv6_unspecified := NewSocket(UnspecifiedIPv6, 0)

	if ipv6_unspecified.IsUnspecified() == false || ipv6_unspecified.IsValid() == false {
		t.Fatalf("unexpected IPv6 unspecified socket predicates: %+v", ipv6_unspecified)
	}

	invalid := Socket{Host: "", Type: AddressTypeIPv4}

	if invalid.IsValid() == true {
		t.Fatal("a socket without a host should be invalid")
	}

}

