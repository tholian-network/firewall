package matchers

import "tholian-firewall/types"
import "encoding/hex"
import "strings"

type Network struct {
	Name   string `json:"name"`
	Subnet string `json:"subnet"`
}

func NewNetwork() Network {

	var network Network

	network.Name = "any"
	network.Subnet = "any"

	return network

}

func ToNetwork(value string) Network {

	var network Network

	if strings.Contains(value, "/") {
		network.Name = "any"
		network.SetSubnet(value)
	} else {
		network.SetName(value)
		network.Subnet = "any"
	}

	return network

}

func (network *Network) IsIdentical(value Network) bool {

	var result bool = false

	if network.Name == value.Name && network.Subnet == value.Subnet {
		result = true
	}

	return result

}

func (network *Network) IsValid() bool {

	var result bool = false

	if network.Name != "any" || network.Subnet != "any" {
		result = true
	}

	return result

}

func (network *Network) Matches(name string, subnet string) bool {

	var matches_name bool = false
	var matches_subnet bool = false

	if network.Name == name {
		matches_name = true
	} else if network.Name == "any" {
		matches_name = true
	}

	if network.Subnet != "any" && subnet != "any" && containsSubnet(network.Subnet, subnet) {
		matches_subnet = true
	} else if network.Subnet == "any" {
		matches_subnet = true
	}

	return matches_name && matches_subnet

}

func (network *Network) SetName(value string) {
	network.Name = strings.TrimSpace(value)
}

func (network *Network) SetSubnet(value string) {

	address, prefix := toSubnet(value)

	if address != "" && prefix != 0 {
		network.Subnet = value
	}

}

func (network *Network) Hash() string {

	var hash string

	if network.Name != "any" {

		hash = network.Name

	} else if network.Subnet != "any" {

		address, prefix := toSubnet(network.Subnet)

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
