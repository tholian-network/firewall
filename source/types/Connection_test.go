package types

import "testing"

func TestConnection(t *testing.T) {

	connection := NewConnection()

	if connection.IsValid() == true {
		t.Fatal("a fresh connection should not be valid")
	}

	connection.SetType("client")
	connection.SetSource(NewSocket("0.0.0.0", 0))
	connection.SetTarget(NewSocket("1.3.3.7", 1338))
	connection.SetProtocol(ProtocolTCP)

	if connection.IsValid() == false {
		t.Fatal("client connection should be valid")
	}

	if connection.Protocol != ProtocolTCP {
		t.Fatalf("unexpected protocol: %q", connection.Protocol)
	}

	if connection.IsIdentical(connection) == false {
		t.Fatal("connection should be identical to itself")
	}

}

func TestConnectionIsValid(t *testing.T) {

	client := NewConnection()
	client.SetType(ConnectionTypeClient)
	client.SetTarget(NewSocket("1.3.3.7", 1338))

	if client.IsValid() == false {
		t.Fatal("client with a target should be valid")
	}

	server := NewConnection()
	server.SetType(ConnectionTypeServer)
	server.SetSource(NewSocket("1.3.3.7", 1338))

	if server.IsValid() == false {
		t.Fatal("server with a source should be valid")
	}

	peer := NewConnection()
	peer.SetType(ConnectionTypePeer)
	peer.SetSource(NewSocket("1.3.3.7", 1338))
	peer.SetTarget(NewSocket("1.3.3.7", 1338))

	if peer.IsValid() == false {
		t.Fatal("peer with both endpoints should be valid")
	}

	peer.Protocol = Protocol("unknown")

	if peer.IsValid() == true {
		t.Fatal("peer with an unknown protocol should be invalid")
	}

}

