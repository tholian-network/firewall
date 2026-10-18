package types

import "testing"

func FuzzParseDomain(f *testing.F) {

	f.Add("evil.example")
	f.Add("evil.example.")
	f.Add("")

	f.Fuzz(func(t *testing.T, value string) {
		_ = IsDomain(value)
		_ = ParseDomain(value)
	})

}

func TestIsDomainLimits(t *testing.T) {

	label63 := ""
	for l := 0; l < 63; l++ {
		label63 += "a"
	}

	label64 := label63 + "a"

	if IsDomain(label63+".example") == false {
		t.Fatal("a 63-byte label should be valid")
	}

	if IsDomain(label64+".example") == true {
		t.Fatal("a 64-byte label should be invalid")
	}

	if IsDomain("evil.example.") == false {
		t.Fatal("a trailing root dot should be accepted")
	}

	domain := ParseDomain("evil.example.")

	if domain == nil || domain.String() != "evil.example" {
		t.Fatalf("ParseDomain did not normalize the trailing dot: %v", domain)
	}

}

func TestIsDomainAndPort(t *testing.T) {

	if IsDomainAndPort("evil.example:443") == false {
		t.Fatal("expected a valid domain and port")
	}

	domain, port := ParseDomainAndPort("evil.example:443")

	if domain == nil || domain.String() != "evil.example" || port != 443 {
		t.Fatalf("unexpected domain parse: %v %d", domain, port)
	}

	if IsDomainAndPort("evil.example:0") == false {
		t.Fatal("port 0 parses but is rejected later by SetPort")
	}

}

func TestDomainIsValid(t *testing.T) {

	if Domain("evil.example").IsValid() == false {
		t.Fatal("valid domain reported invalid")
	}

	if Domain("invalid").IsValid() == true {
		t.Fatal("invalid domain reported valid")
	}

}

