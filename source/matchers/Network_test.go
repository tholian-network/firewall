package matchers

import "testing"

func TestNetworkDefaults(t *testing.T) {

	network := NewNetwork()

	if network.Name != "any" || network.Subnet != "any" {
		t.Fatalf("unexpected defaults: %+v", network)
	}

	if network.IsValid() == true {
		t.Fatal("a fresh network matcher should not be valid")
	}

}

func TestNetworkSetSubnet(t *testing.T) {

	network := NewNetwork()
	network.SetSubnet("1.3.3.0/24")

	if network.Subnet != "1.3.3.0/24" {
		t.Fatalf("unexpected subnet: %q", network.Subnet)
	}

	network.SetSubnet("0.0.0.0/0")

	if network.Subnet != "0.0.0.0/0" {
		t.Fatalf("unexpected default route: %q", network.Subnet)
	}

	network.SetSubnet("not a subnet")

	if network.Subnet != "0.0.0.0/0" {
		t.Fatalf("invalid subnet replaced the previous value: %q", network.Subnet)
	}

}

func TestNetworkHash(t *testing.T) {

	network := NewNetwork()
	network.SetSubnet("1.3.3.0/24")

	if network.Hash() != "01030300" {
		t.Fatalf("unexpected network hash: %q", network.Hash())
	}

	network = NewNetwork()
	network.SetName("AS1337")

	if network.Hash() != "AS1337" {
		t.Fatalf("unexpected name hash: %q", network.Hash())
	}

}

func TestNetworkMatches(t *testing.T) {

	network := NewNetwork()
	network.SetSubnet("1.3.3.0/24")

	if network.Matches("any", "1.3.3.7/32") == false {
		t.Fatal("expected the subnet to match a contained address")
	}

	if network.Matches("any", "1.3.4.7/32") == true {
		t.Fatal("subnet matched an unrelated address")
	}

}

func TestNetworkKind(t *testing.T) {

	network := NewNetwork()

	if network.Kind() != KindAny || network.IsAny() == false || network.IsValid() == true {
		t.Fatalf("unexpected fresh network kind: %v", network.Kind())
	}

	network.SetName("AS1337")

	if network.Kind() != KindName || network.HasName() == false || network.HasSubnet() == true || network.IsValid() == false {
		t.Fatalf("unexpected name network kind: %v", network.Kind())
	}

	network.SetSubnet("1.3.3.0/24")

	if network.Kind() != KindSubnet || network.HasName() == true || network.HasSubnet() == false || network.IsValid() == false {
		t.Fatalf("unexpected subnet network kind: %v", network.Kind())
	}

	invalid := Network{Name: "AS1337", Subnet: "1.3.3.0/24"}

	if invalid.Kind() != KindInvalid || invalid.IsValid() == true {
		t.Fatal("a network with both selectors should be invalid")
	}

}

