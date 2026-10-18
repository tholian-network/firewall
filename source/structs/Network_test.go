package structs

import "testing"

func TestNetworkDeduplicatesSubnets(t *testing.T) {

	network := NewNetwork("AS13335")

	network.AddSubnet(ToSubnet("1.1.1.0/24"))
	network.AddSubnet(ToSubnet("1.1.1.0/24"))

	if len(network.Subnets) != 1 {
		t.Fatalf("expected 1 subnet, got %d", len(network.Subnets))
	}

	network.RemoveSubnet(ToSubnet("1.1.1.0/24"))

	if len(network.Subnets) != 0 {
		t.Fatalf("expected 0 subnets, got %d", len(network.Subnets))
	}

}

func TestNetworkPredicates(t *testing.T) {

	network := NewNetwork("")

	if network.HasName() == true || network.HasSubnets() == true || network.IsValid() == true {
		t.Fatal("an empty network should be invalid")
	}

	network.SetName("AS13335")
	network.AddSubnet(ToSubnet("1.1.1.0/24"))

	if network.HasName() == false || network.HasSubnets() == false || network.IsValid() == false {
		t.Fatal("a populated network should be valid")
	}

}

