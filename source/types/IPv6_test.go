package types

import "testing"

func FuzzParseIPv6(f *testing.F) {

	f.Add("[fe80::1]")
	f.Add("::1")
	f.Add("1:2:3:4:5:6:7:8:9")

	f.Fuzz(func(t *testing.T, value string) {
		_ = IsIPv6(value)
		_ = ParseIPv6(value)
	})

}

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
		"[fe80::1]/7":   true,
		"[fe80::1]/129": false,
		"[fe80::1]/0":   true,
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

func TestParseIPv6AcceptsEquivalents(t *testing.T) {

	values := []string{
		"::1",
		"[::1]",
		"0:0:0:0:0:0:0:1",
		"2001:db8::1",
	}

	expected := "0000:0000:0000:0000:0000:0000:0000:0001"

	for _, value := range values {

		ipv6 := ParseIPv6(value)

		if ipv6 == nil {
			t.Fatalf("ParseIPv6(%q) returned nil", value)
		}

		if value == "2001:db8::1" {
			expected = "2001:0db8:0000:0000:0000:0000:0000:0001"
		}

		if ipv6.String() != expected {
			t.Errorf("ParseIPv6(%q).String() = %q, expected %q", value, ipv6.String(), expected)
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

func TestParseIPv6NonOctetPrefix(t *testing.T) {

	ipv6 := ParseIPv6("2001:db8:1234:5678::1")

	if ipv6 == nil {
		t.Fatal("ParseIPv6 returned nil")
	}

	result := ipv6.Bytes(68)

	if len(result) != 16 {
		t.Fatalf("IPv6.Bytes(68) length = %d", len(result))
	}

	if result[8] != 0 || result[9] != 0 {
		t.Errorf("IPv6.Bytes(68) did not mask the host bits: %v", result)
	}

	if result[0] != 0x20 || result[1] != 0x01 || result[2] != 0x0d || result[3] != 0xb8 {
		t.Errorf("IPv6.Bytes(68) lost the network bits: %v", result)
	}

}

func TestParseIPv6RejectsMalformedInput(t *testing.T) {

	values := []string{
		"",
		"[]",
		"[fe80::1",
		"fe80::1]",
		"1:2:3:4:5:6:7:8:9",
		"::1::2",
		"fe80::1%eth0",
		"fe80::1/64",
		"[::ffff:1.2.3.4]",
		"fe80:::1",
	}

	for _, value := range values {

		if ipv6 := ParseIPv6(value); ipv6 != nil {
			t.Errorf("ParseIPv6(%q) = %v, expected nil", value, ipv6.String())
		}

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
