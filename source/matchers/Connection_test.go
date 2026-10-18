package structs

import "testing"

func TestConnectionKind(t *testing.T) {

	connection := NewConnection()

	if connection.IsValid() == true || connection.HasHost() == true || connection.HasPort() == true {
		t.Fatal("a fresh connection matcher should not be valid")
	}

	connection.SetHost("1.3.3.7")
	connection.SetPort(1338)

	if connection.IsValid() == false || connection.HasHost() == false || connection.HasPort() == false {
		t.Fatal("host+port connection matcher should be valid")
	}

	connection.SetHost("any")

	if connection.IsWildcard() == false || connection.HasHost() == true || connection.IsValid() == false {
		t.Fatal("wildcard host+port connection matcher should be valid")
	}

}

func TestConnectionParseSuffixes(t *testing.T) {

	cases := []struct {
		value    string
		host     string
		port     uint16
		protocol string
		typ      string
	}{
		{"1.3.3.7:1338TC", "1.3.3.7", 1338, "tcp", "client"},
		{"1.3.3.7:1338TP", "1.3.3.7", 1338, "tcp", "peer"},
		{"1.3.3.7:1338TS", "1.3.3.7", 1338, "tcp", "server"},
		{"1.3.3.7:1338UC", "1.3.3.7", 1338, "udp", "client"},
		{"1.3.3.7:1338UP", "1.3.3.7", 1338, "udp", "peer"},
		{"1.3.3.7:1338US", "1.3.3.7", 1338, "udp", "server"},
		{"1.3.3.7:1338AC", "1.3.3.7", 1338, "any", "client"},
		{"1.3.3.7:1338AP", "1.3.3.7", 1338, "any", "peer"},
		{"1.3.3.7:1338AS", "1.3.3.7", 1338, "any", "server"},
	}

	for _, c := range cases {

		connection := ToConnection(c.value)

		if connection.Socket.Host != c.host || connection.Socket.Port != c.port {
			t.Errorf("ToConnection(%q) = %s:%d", c.value, connection.Socket.Host, connection.Socket.Port)
		}

		if connection.Protocol != c.protocol || connection.Type != c.typ {
			t.Errorf("ToConnection(%q) = %s/%s, expected %s/%s", c.value, connection.Protocol, connection.Type, c.protocol, c.typ)
		}

	}

}

func TestConnectionHash(t *testing.T) {

	connection := NewConnection()
	connection.SetHost("1.3.3.7")
	connection.SetPort(1338)
	connection.SetProtocol("tcp")
	connection.SetType("client")

	if connection.Hash() != "1.3.3.7:1338TC" {
		t.Fatalf("unexpected connection hash: %q", connection.Hash())
	}

	empty := NewConnection()

	if empty.Hash() != "" {
		t.Fatalf("connection without a port should have no hash: %q", empty.Hash())
	}

}

