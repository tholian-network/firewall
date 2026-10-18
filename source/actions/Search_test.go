package actions

import "testing"
import "strings"
import "tholian-firewall/insights"
import "tholian-firewall/structs"

func TestSearchWithFixture(t *testing.T) {

	previous := insights.Internet
	defer func() { insights.Internet = previous }()

	internet := structs.NewInternet()
	network := structs.NewNetwork("AS13335")
	network.AddSubnet(structs.NewSubnet("1.1.1.0", 24))
	internet.AddNetwork(network)
	insights.Internet = internet

	console := structs.NewConsole(nil, nil, 0)

	results := Search(console, "1.1.1.1")

	if len(results) != 1 || strings.Contains(results[0], "1.1.1.0/24") == false {
		t.Fatalf("unexpected address search results: %v", results)
	}

	results = Search(console, "AS13335")

	if len(results) != 2 || strings.Contains(results[0], "AS13335") == false {
		t.Fatalf("unexpected ASN search results: %v", results)
	}

}

func TestSearchEmptyInternet(t *testing.T) {

	previous := insights.Internet
	defer func() { insights.Internet = previous }()

	insights.Internet = structs.NewInternet()

	console := structs.NewConsole(nil, nil, 0)

	if len(Search(console, "1.1.1.1")) != 0 {
		t.Fatal("search returned results for an empty Internet fixture")
	}

}
