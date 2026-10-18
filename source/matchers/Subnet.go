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

	subnet.Name = Any
	subnet.Subnet = Any

	return subnet

}

func ToSubnet(value string) Subnet {

	var subnet Subnet

	if strings.Contains(value, "/") {
		subnet.Name = Any
		subnet.SetSubnet(value)
	} else {
		subnet.SetName(value)
	}

	return subnet

}

func (subnet *Subnet) Kind() Kind {
	return match_kind(subnet.Name, subnet.Subnet)
}

func (subnet *Subnet) IsAny() bool {
	return subnet.Kind() == KindAny
}

func (subnet *Subnet) HasName() bool {
	return subnet.Kind() == KindName
}

func (subnet *Subnet) HasSubnet() bool {
	return subnet.Kind() == KindSubnet
}

func (subnet *Subnet) IsIdentical(value Subnet) bool {

	var result bool = false

	if subnet.Name == value.Name && subnet.Subnet == value.Subnet {
		result = true
	}

	return result

}

func (subnet *Subnet) IsValid() bool {
	return subnet.HasName() || subnet.HasSubnet()
}

func (subnet *Subnet) Matches(name string, net string) bool {

	if subnet.Kind() == KindInvalid {
		return false
	}

	matches_name := true
	matches_subnet := true

	if subnet.HasName() {
		matches_name = subnet.Name == name
	}

	if subnet.HasSubnet() {
		matches_subnet = net != "" && net != Any && contains_subnet(subnet.Subnet, net)
	}

	return matches_name && matches_subnet

}

func (subnet *Subnet) SetName(value string) {
	subnet.Name = strings.TrimSpace(value)
	subnet.Subnet = Any
}

func (subnet *Subnet) SetSubnet(value string) {

	address, _ := toSubnet(value)

	if address != "" {
		subnet.Name = Any
		subnet.Subnet = value
	}

}

func (subnet *Subnet) Hash() string {

	var hash string

	if subnet.HasName() {

		hash = subnet.Name

	} else if subnet.HasSubnet() {

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
