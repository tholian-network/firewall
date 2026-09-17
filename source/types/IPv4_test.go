package types

import "testing"

func TestIsIPv4(t *testing.T) {

	cases := map[string]bool{
		"1.3.3.7":         true,
		"0.0.0.0":         true,
		"255.255.255.255": true,
		"1.3.3":           false,
		"1.3.3.256":       false,
		"1.3.3.7/24":      false,
		"example.com":     false,
	}

	for input, expected := range cases {

		if result := IsIPv4(input); result != expected {
			t.Errorf("IsIPv4(%q) = %v, expected %v", input, result, expected)
		}

	}

}

func TestIsIPv4AndPrefix(t *testing.T) {

	cases := map[string]bool{
		"1.3.3.0/24": true,
		"1.3.3.7/32": true,
		"1.3.3.7/8":  true,
		"1.3.3.7/7":  false,
		"1.3.3.7/33": false,
		"1.3.3.7":    false,
	}

	for input, expected := range cases {

		if result := IsIPv4AndPrefix(input); result != expected {
			t.Errorf("IsIPv4AndPrefix(%q) = %v, expected %v", input, result, expected)
		}

	}

}

func TestIsIPv4AndPort(t *testing.T) {

	cases := map[string]bool{
		"1.3.3.7:1338": true,
		"1.3.3.7:":     false,
		"1.3.3.7":      false,
	}

	for input, expected := range cases {

		if result := IsIPv4AndPort(input); result != expected {
			t.Errorf("IsIPv4AndPort(%q) = %v, expected %v", input, result, expected)
		}

	}

}

func TestIPv4Bytes(t *testing.T) {

	ipv4 := ParseIPv4("1.3.3.7")

	if ipv4 == nil {
		t.Fatalf("ParseIPv4 returned nil")
	}

	masked := ipv4.Bytes(24)

	if len(masked) != 4 {
		t.Fatalf("IPv4.Bytes(24) length = %d, expected 4", len(masked))
	}

	if masked[0] != 1 || masked[1] != 3 || masked[2] != 3 || masked[3] != 0 {
		t.Errorf("IPv4.Bytes(24) = %v, expected [1 3 3 0]", masked)
	}

}
