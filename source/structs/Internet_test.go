package structs

import "testing"

func TestInternetAddSubnet(t *testing.T) {

	internet := NewInternet()
	subnet := NewSubnet("1.1.1.0", 24)

	if internet.AddSubnet(subnet) == false {
		t.Fatal("AddSubnet failed")
	}

	if internet.AddSubnet(subnet) == true {
		t.Fatal("AddSubnet accepted a duplicate")
	}

	if len(internet.Mapv4[24]) != 1 {
		t.Fatalf("unexpected IPv4 map: %v", internet.Mapv4)
	}

}

func TestInternetAddNetwork(t *testing.T) {

	internet := NewInternet()
	network := NewNetwork("AS13335")
	network.AddSubnet(NewSubnet("1.1.1.0", 24))

	if internet.AddNetwork(network) == false {
		t.Fatal("AddNetwork failed")
	}

	if internet.SearchASN("AS13335").Name != "AS13335" {
		t.Fatal("SearchASN did not find the network")
	}

	invalid := NewNetwork("NOT-AN-ASN")

	if internet.AddNetwork(invalid) == true {
		t.Fatal("AddNetwork accepted a network without an AS prefix")
	}

}

func TestInternetSearchSubnet(t *testing.T) {

	internet := NewInternet()
	internet.AddSubnet(NewSubnet("1.1.0.0", 16))
	internet.AddSubnet(NewSubnet("1.1.1.0", 24))

	subnet := internet.Search("1.1.1.1")

	if subnet.Address != "1.1.1.0" || subnet.Prefix != 24 {
		t.Fatalf("longest prefix match failed: %s/%d", subnet.Address, subnet.Prefix)
	}

	subnet = internet.Search("1.1.2.1")

	if subnet.Address != "1.1.0.0" || subnet.Prefix != 16 {
		t.Fatalf("fallback prefix match failed: %s/%d", subnet.Address, subnet.Prefix)
	}

}

func TestInternetSearchDefaultRoute(t *testing.T) {

	internet := NewInternet()

	if internet.AddSubnet(ToSubnet("0.0.0.0/0")) == false {
		t.Fatal("AddSubnet failed for the default route")
	}

	network := NewNetwork("")
	network.AddSubnet(ToSubnet("1.3.3.7/32"))

	results := internet.SearchNetwork(network)

	if len(results) != 1 {
		t.Fatalf("unexpected default route search results: %v", results)
	}

	if results[0].IsDefaultRoute() == false {
		t.Fatalf("expected a default route, got %+v", results[0])
	}

}

func TestInternetSearchNetwork(t *testing.T) {

	internet := NewInternet()
	network := NewNetwork("AS13335")
	network.AddSubnet(NewSubnet("1.1.1.0", 24))
	internet.AddNetwork(network)

	results := internet.SearchNetwork(network)

	if len(results) != 1 {
		t.Fatalf("unexpected search results: %v", results)
	}

	empty := NewNetwork("")

	results = internet.SearchNetwork(empty)

	if len(results) != 0 {
		t.Fatalf("empty network returned results: %v", results)
	}

}
