package matchers

import "testing"

func TestContainsSubnetIPv4(t *testing.T) {

	cases := []struct {
		a        string
		b        string
		expected bool
	}{
		{"1.3.3.0/24", "1.3.3.7/32", true},
		{"1.3.3.0/24", "1.3.3.0/24", true},
		{"1.3.3.0/24", "1.3.4.0/24", false},
		{"1.3.3.7/32", "1.3.3.0/24", false},
	}

	for _, c := range cases {

		if result := containsSubnet(c.a, c.b); result != c.expected {
			t.Errorf("containsSubnet(%q, %q) = %v, expected %v", c.a, c.b, result, c.expected)
		}

	}

}
