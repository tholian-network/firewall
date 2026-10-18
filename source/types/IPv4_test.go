package types

import "testing"

func FuzzParseIPv4(f *testing.F) {

	f.Add("1.3.3.7")
	f.Add("1.3.3.256")
	f.Add("")

	f.Fuzz(func(t *testing.T, value string) {
		_ = IsIPv4(value)
		_ = ParseIPv4(value)
	})

}

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
		"1.3.3.7/7":  true,
		"1.3.3.7/0":  true,
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

func TestParseIPv4NonOctetPrefix(t *testing.T) {

	ipv4 := ParseIPv4("1.3.255.7")

	if ipv4 == nil {
		t.Fatal("ParseIPv4 returned nil")
	}

	cases := []struct {
		prefix   uint8
		expected []byte
	}{
		{0, []byte{0, 0, 0, 0}},
		{1, []byte{0, 0, 0, 0}},
		{12, []byte{1, 0, 0, 0}},
		{17, []byte{1, 3, 128, 0}},
		{20, []byte{1, 3, 240, 0}},
		{24, []byte{1, 3, 255, 0}},
		{31, []byte{1, 3, 255, 6}},
		{32, []byte{1, 3, 255, 7}},
	}

	for _, c := range cases {

		result := ipv4.Bytes(c.prefix)

		if len(result) != len(c.expected) {
			t.Fatalf("IPv4.Bytes(%d) length = %d", c.prefix, len(result))
		}

		for b := 0; b < len(result); b++ {
			if result[b] != c.expected[b] {
				t.Errorf("IPv4.Bytes(%d) = %v, expected %v", c.prefix, result, c.expected)
				break
			}
		}

	}

}

