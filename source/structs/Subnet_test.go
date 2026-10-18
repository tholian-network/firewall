package structs

import "testing"

func TestToSubnet(t *testing.T) {

	cases := []struct {
		value   string
		valid   bool
		output  string
		address string
		prefix  uint8
	}{
		{"1.3.3.0/24", true, "1.3.3.0/24", "1.3.3.0", 24},
		{"1.3.3.7/32", true, "1.3.3.7/32", "1.3.3.7", 32},
		{"0.0.0.0/0", true, "0.0.0.0/0", "0.0.0.0", 0},
		{"[fe80::1]/64", true, "fe80:0000:0000:0000:0000:0000:0000:0001/64", "fe80:0000:0000:0000:0000:0000:0000:0001", 64},
		{"[::]/0", true, "0000:0000:0000:0000:0000:0000:0000:0000/0", "0000:0000:0000:0000:0000:0000:0000:0000", 0},
		{"1.3.3.7/33", false, "", "", 0},
		{"invalid", false, "", "", 0},
	}

	for _, c := range cases {

		subnet := ToSubnet(c.value)

		if subnet.IsValid() != c.valid {
			t.Errorf("ToSubnet(%q).IsValid() = %v, expected %v", c.value, subnet.IsValid(), c.valid)
			continue
		}

		if c.valid == false {
			continue
		}

		if subnet.String() != c.output {
			t.Errorf("ToSubnet(%q).String() = %q, expected %q", c.value, subnet.String(), c.output)
		}

		if subnet.Address != c.address || subnet.Prefix != c.prefix {
			t.Errorf("ToSubnet(%q) = %s/%d, expected %s/%d", c.value, subnet.Address, subnet.Prefix, c.address, c.prefix)
		}

	}

}

func TestSubnetContainsSubnet(t *testing.T) {

	outer := ToSubnet("1.3.3.0/24")
	inner := ToSubnet("1.3.3.7/32")
	other := ToSubnet("1.3.4.7/32")

	if outer.ContainsSubnet(inner) == false {
		t.Fatal("/24 should contain /32")
	}

	if outer.ContainsSubnet(other) == true {
		t.Fatal("/24 should not contain a different /24")
	}

	if outer.ContainsSubnet(outer) == false {
		t.Fatal("identical subnets should be contained")
	}

	if outer.Contains("1.3.3.7") == false {
		t.Fatal("/24 should contain its address")
	}

	if outer.Contains("1.3.4.7") == true {
		t.Fatal("/24 contained an unrelated address")
	}

	defaultRoute := ToSubnet("0.0.0.0/0")

	if defaultRoute.ContainsSubnet(inner) == false {
		t.Fatal("/0 should contain every IPv4 subnet")
	}

	ipv6 := ToSubnet("[fe80::1]/128")

	if ipv6.Contains("[fe80::1]") == false {
		t.Fatal("IPv6 /128 should contain its address")
	}

	if ipv6.Contains("[fe80::2]") == true {
		t.Fatal("IPv6 /128 contained an unrelated address")
	}

}

func TestSubnetPredicates(t *testing.T) {

	ipv4 := ToSubnet("0.0.0.0/0")

	if ipv4.IsUnspecified() == false || ipv4.IsDefaultRoute() == false || ipv4.IsValid() == false {
		t.Fatalf("unexpected IPv4 default route predicates: %+v", ipv4)
	}

	ipv6 := ToSubnet("[::]/0")

	if ipv6.IsUnspecified() == false || ipv6.IsDefaultRoute() == false || ipv6.IsValid() == false {
		t.Fatalf("unexpected IPv6 default route predicates: %+v", ipv6)
	}

	address := ToSubnet("1.3.3.7/32")

	if address.IsUnspecified() == true || address.IsDefaultRoute() == true || address.IsAddress() == false || address.IsValid() == false {
		t.Fatalf("unexpected address predicates: %+v", address)
	}

	if ipv4.IsAddress() == true {
		t.Fatal("a default route should not be an address")
	}

	zero := Subnet{}

	if zero.IsValid() == true {
		t.Fatal("the zero subnet should be invalid")
	}

}

