package actions

import "testing"
import "tholian-firewall/adapters/mitigations/ebpf"
import "tholian-firewall/adapters/mitigations/hosts"
import "tholian-firewall/adapters/mitigations/iptables"
import "tholian-firewall/matchers"
import "tholian-firewall/types"

func TestBuildConnectionClientIPv4(t *testing.T) {

	search := matchers.NewConnection()
	search.Type = "client"
	search.Socket.Host = "1.3.3.7"
	search.Socket.Port = 1338

	connection := buildConnection(search)

	if connection.Type != "client" {
		t.Fatalf("unexpected type: %q", connection.Type)
	}

	if connection.Source.Host != "0.0.0.0" {
		t.Fatalf("unexpected source: %q", connection.Source.Host)
	}

	if connection.Target.Host != "1.3.3.7" {
		t.Fatalf("unexpected target: %q", connection.Target.Host)
	}

	if connection.IsValid() == false {
		t.Fatal("client connection should be valid")
	}

}

func TestBuildConnectionServerAnyPort(t *testing.T) {

	search := matchers.NewConnection()
	search.Type = "server"
	search.Socket.Host = "any"
	search.Socket.Port = 1338

	connection := buildConnection(search)

	if connection.Type != "server" {
		t.Fatalf("unexpected type: %q", connection.Type)
	}

	if connection.Source.Host != "*" || connection.Target.Host != "*" {
		t.Fatalf("unexpected endpoints: %q %q", connection.Source.Host, connection.Target.Host)
	}

	if connection.IsValid() == false {
		t.Fatal("server connection should be valid")
	}

}

func TestBuildConnectionPeerIPv6(t *testing.T) {

	search := matchers.NewConnection()
	search.Type = "peer"
	search.Socket.Host = "[fe80::1337]"
	search.Socket.Port = 1338

	connection := buildConnection(search)

	if connection.Type != "peer" {
		t.Fatalf("unexpected type: %q", connection.Type)
	}

	if connection.Source.Host != connection.Target.Host {
		t.Fatal("peer endpoints should match")
	}

}

func TestConnectionHostDetection(t *testing.T) {

	connection := types.NewConnection()

	connection.Target.Host = "evil.example"

	if connectionHost(connection) != "evil.example" {
		t.Fatalf("expected target domain, got %q", connectionHost(connection))
	}

	connection.Target.Host = "1.3.3.7"
	connection.Source.Host = "evil.example"

	if connectionHost(connection) != "evil.example" {
		t.Fatalf("expected source domain, got %q", connectionHost(connection))
	}

	connection.Source.Host = "8.8.8.8"

	if connectionHost(connection) != "" {
		t.Fatalf("expected no domain, got %q", connectionHost(connection))
	}

}

func TestBackendAvailable(t *testing.T) {

	ebpf_local := ebpf.SUPPORTED
	iptables_local := iptables.SUPPORTED
	hosts_local := hosts.SUPPORTED

	ebpf.SUPPORTED = false
	iptables.SUPPORTED = false
	hosts.SUPPORTED = false

	if backendAvailable() == true {
		t.Fatal("backendAvailable reported true with no backends")
	}

	hosts.SUPPORTED = true

	if backendAvailable() == false {
		t.Fatal("backendAvailable reported false with the hosts backend")
	}

	ebpf.SUPPORTED = ebpf_local
	iptables.SUPPORTED = iptables_local
	hosts.SUPPORTED = hosts_local

}
