package types

import "testing"

func TestIsIPv6(t *testing.T) {

	cases := map[string]bool{
		"[fe80::1]":     true,
		"fe80::1":       true,
		"::1":           true,
		"[::1]":         true,
		"[2001:db8::1]": true,
		"2001:0db8:0000:0000:0000:0000:0000:0001": true,
		"[fe80::1]:1338": false,
		"[fe80::1]/64":   false,
		"1.2.3.4":        false,
		"[]":             false,
		"":               false,
	}

	for input, expected := range cases {

		if result := IsIPv6(input); result != expected {
			t.Errorf("IsIPv6(%q) = %v, expected %v", input, result, expected)
		}

	}

}

func TestIsIPv6AndPrefix(t *testing.T) {

	cases := map[string]bool{
		"[fe80::1]/64":  true,
		"[fe80::1]/8":   true,
		"[fe80::1]/128": true,
		"[fe80::1]/7":   false,
		"[fe80::1]/129": false,
		"[fe80::1]/0":   false,
		"fe80::1/64":    false,
		"[fe80::1]":     false,
	}

	for input, expected := range cases {

		if result := IsIPv6AndPrefix(input); result != expected {
			t.Errorf("IsIPv6AndPrefix(%q) = %v, expected %v", input, result, expected)
		}

	}

}

func TestIsIPv6AndPort(t *testing.T) {

	cases := map[string]bool{
		"[fe80::1]:1338": true,
		"[fe80::1]":      false,
		"fe80::1:1338":   false,
		"[fe80::1]:":     false,
	}

	for input, expected := range cases {

		if result := IsIPv6AndPort(input); result != expected {
			t.Errorf("IsIPv6AndPort(%q) = %v, expected %v", input, result, expected)
		}

	}

}

func TestParseIPv6AndPrefix(t *testing.T) {

	ipv6, prefix := ParseIPv6AndPrefix("[fe80::1]/64")

	if ipv6 == nil {
		t.Fatalf("ParseIPv6AndPrefix returned nil address")
	}

	if prefix != 64 {
		t.Errorf("ParseIPv6AndPrefix prefix = %d, expected 64", prefix)
	}

	if ipv6.String() != "fe80:0000:0000:0000:0000:0000:0000:0001" {
		t.Errorf("ParseIPv6AndPrefix address = %q", ipv6.String())
	}

}

func TestParseIPv6AndPort(t *testing.T) {

	ipv6, port := ParseIPv6AndPort("[fe80::1]:1338")

	if ipv6 == nil {
		t.Fatalf("ParseIPv6AndPort returned nil address")
	}

	if port != 1338 {
		t.Errorf("ParseIPv6AndPort port = %d, expected 1338", port)
	}

}

func TestIPv6Scope(t *testing.T) {

	private := []string{
		"[fe80::1]",
		"[::1]",
		"[fc00::1]",
		"[fd00::1]",
	}

	for p := 0; p < len(private); p++ {

		ipv6 := ParseIPv6(private[p])

		if ipv6 == nil {
			t.Fatalf("ParseIPv6(%q) returned nil", private[p])
		}

		if scope := ipv6.Scope(); scope != "private" {
			t.Errorf("ParseIPv6(%q).Scope() = %q, expected private", private[p], scope)
		}

	}

	public := "[2001:db8::1]"
	ipv6 := ParseIPv6(public)

	if ipv6 == nil {
		t.Fatalf("ParseIPv6(%q) returned nil", public)
	}

	if scope := ipv6.Scope(); scope != "public" {
		t.Errorf("ParseIPv6(%q).Scope() = %q, expected public", public, scope)
	}

}

func TestIPv6String(t *testing.T) {

	ipv6 := ParseIPv6("[2001:db8::1]")

	if ipv6 == nil {
		t.Fatalf("ParseIPv6 returned nil")
	}

	if ipv6.String() != "2001:0db8:0000:0000:0000:0000:0000:0001" {
		t.Errorf("IPv6.String() = %q", ipv6.String())
	}

}
