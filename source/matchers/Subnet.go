package matchers

import "tholian-firewall/types"
import "encoding/hex"
import "strings"

type Subnet struct {
	Name   string `json:"name"`
	Subnet string `json:"subnet"`
}

func NewSubnet() Subnet {

	var subnet Subnet

	subnet.Name = "any"
	subnet.Subnet = "any"

	return subnet

}

func ToSubnet(value string) Subnet {

	var subnet Subnet

	if strings.Contains(value, "/") {
		subnet.Name = "any"
		subnet.SetSubnet(value)
	} else {
		subnet.SetName(value)
		subnet.Subnet = "any"
	}

	return subnet

}

func (subnet *Subnet) IsIdentical(value Subnet) bool {

	var result bool = false

	if subnet.Name == value.Name && subnet.Subnet == value.Subnet {
		result = true
	}

	return result

}

func (subnet *Subnet) IsValid() bool {

	var result bool = false

	if subnet.Name != "any" || subnet.Subnet != "any" {
		result = true
	}

	return result

}

func (subnet *Subnet) Matches(name string, net string) bool {

	var matches_name bool = false
	var matches_subnet bool = false

	if subnet.Name == name {
		matches_name = true
	} else if subnet.Name == "any" {
		matches_name = true
	}

	if subnet.Subnet != "any" && net != "any" && containsSubnet(subnet.Subnet, net) {
		matches_subnet = true
	} else if subnet.Subnet == "any" {
		matches_subnet = true
	}

	return matches_name && matches_subnet

}

func (subnet *Subnet) SetName(value string) {
	subnet.Name = strings.TrimSpace(value)
}

func (subnet *Subnet) SetSubnet(value string) {

	address, prefix := toSubnet(value)

	if address != "" && prefix != 0 {
		subnet.Subnet = value
	}

}

func (subnet *Subnet) Hash() string {

	var hash string

	if subnet.Name != "any" {

		hash = subnet.Name

	} else if subnet.Subnet != "any" {

		address, prefix := toSubnet(subnet.Subnet)

		if types.IsIPv6(address) {

			ipv6 := types.ParseIPv6(address)

			if ipv6 != nil {
				bytes := ipv6.Bytes(prefix)
				hash = hex.EncodeToString(bytes)
			}

		} else if types.IsIPv4(address) {

			ipv4 := types.ParseIPv4(address)

			if ipv4 != nil {
				bytes := ipv4.Bytes(prefix)
				hash = hex.EncodeToString(bytes)
			}

		}

	}

	return hash

}
