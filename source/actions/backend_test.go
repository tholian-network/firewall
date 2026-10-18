package actions

import "testing"
import "tholian-firewall/adapters/mitigations/ebpf"
import "tholian-firewall/adapters/mitigations/hosts"
import "tholian-firewall/adapters/mitigations/iptables"
import "tholian-firewall/types"

func disable_backends() func() {

	ebpf_local := ebpf.SUPPORTED
	iptables_local := iptables.SUPPORTED
	hosts_local := hosts.SUPPORTED

	ebpf.SUPPORTED = false
	iptables.SUPPORTED = false
	hosts.SUPPORTED = false

	return func() {
		ebpf.SUPPORTED = ebpf_local
		iptables.SUPPORTED = iptables_local
		hosts.SUPPORTED = hosts_local
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
