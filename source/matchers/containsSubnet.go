package matchers

import "tholian-firewall/types"

func containsSubnet(subnet_a string, subnet_b string) bool {

	var result bool = false

	address_a, prefix_a := toSubnet(subnet_a)
	address_b, prefix_b := toSubnet(subnet_b)

	if prefix_b > prefix_a {

		bytes_a := make([]byte, 0)
		bytes_b := make([]byte, 0)

		if types.IsIPv6(address_a) && types.IsIPv6(address_b) {

			ipv6_a := types.ParseIPv6(address_a)
			ipv6_b := types.ParseIPv6(address_b)

			bytes_a = ipv6_a.Bytes(prefix_a)
			bytes_b = ipv6_b.Bytes(prefix_b)

		} else if types.IsIPv4(address_a) && types.IsIPv4(address_b) {

			ipv4_a := types.ParseIPv4(address_a)
			ipv4_b := types.ParseIPv4(address_b)

			bytes_a = ipv4_a.Bytes(prefix_a)
			bytes_b = ipv4_b.Bytes(prefix_b)

		}

		if len(bytes_a) > 0 && len(bytes_b) > 0 {

			result = true

			for b := 0; b < len(bytes_a); b++ {

				if bytes_a[b] != bytes_b[b] {
					result = false
					break
				}

			}

		}

	}

	return result

}
