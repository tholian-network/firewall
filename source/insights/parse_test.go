package insights

import "bytes"
import "compress/gzip"
import "encoding/json"
import "testing"
import "tholian-firewall/structs"

func example_internet() []byte {

	internet := structs.NewInternet()

	subnet := structs.NewSubnet("1.1.1.0", 24)
	subnet.SetName("Cloudflare")

	network := structs.NewNetwork("AS13335")
	network.AddSubnet(subnet)

	internet.AddNetwork(network)

	var buffer bytes.Buffer
	writer := gzip.NewWriter(&buffer)

	if err := json.NewEncoder(writer).Encode(&internet); err != nil {
		panic(err)
	}

	if err := writer.Close(); err != nil {
		panic(err)
	}

	return buffer.Bytes()

}

func TestParseInternet(t *testing.T) {

	Internet = structs.NewInternet()

	if err := parse_internet(bytes.NewReader(example_internet())); err != nil {
		t.Fatalf("parse_internet failed: %v", err)
	}

	subnet := Internet.Search("1.1.1.1")

	if subnet.Address != "1.1.1.0" || subnet.Prefix != 24 {
		t.Fatalf("unexpected subnet lookup result: %s/%d", subnet.Address, subnet.Prefix)
	}

	network := Internet.SearchASN("AS13335")

	if network.Name != "AS13335" || len(network.Subnets) != 1 {
		t.Fatalf("unexpected network lookup result: %v", network)
	}

}

func TestParseInternetRejectsInvalidGzip(t *testing.T) {

	Internet = structs.NewInternet()

	if err := parse_internet(bytes.NewReader([]byte("not gzip"))); err == nil {
		t.Fatal("parse_internet accepted invalid gzip data")
	}

	if len(Internet.Networks) != 0 {
		t.Fatal("invalid input replaced the global Internet data")
	}

}

func TestParseInternetRejectsInvalidJSON(t *testing.T) {

	var buffer bytes.Buffer
	writer := gzip.NewWriter(&buffer)
	writer.Write([]byte("{"))
	writer.Close()

	if err := parse_internet(bytes.NewReader(buffer.Bytes())); err == nil {
		t.Fatal("parse_internet accepted invalid JSON")
	}

}
