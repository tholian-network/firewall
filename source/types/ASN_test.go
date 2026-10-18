package types

import "testing"

func TestIsASN(t *testing.T) {

	if IsASN("AS1337") == false || IsASN("as1337") == true || IsASN("AS") == true || IsASN("AS12X") == true {
		t.Fatal("unexpected ASN validation result")
	}

}

func TestParseASN(t *testing.T) {

	asn := ParseASN("AS1337")

	if asn == nil || asn.String() != "AS1337" {
		t.Fatalf("unexpected ASN parse result: %v", asn)
	}

	asn = ParseASN("1337")

	if asn == nil || asn.String() != "AS1337" {
		t.Fatalf("unexpected numeric ASN parse result: %v", asn)
	}

}

func TestASNIsValid(t *testing.T) {

	if ASN(1337).IsValid() == false {
		t.Fatal("valid ASN reported invalid")
	}

	if ASN(-1).IsValid() == true {
		t.Fatal("negative ASN reported valid")
	}

}
