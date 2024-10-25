package structs

import "sort"
import "strings"

type Network struct {
	Name    string   `json:"name"`
	Subnets []Subnet `json:"subnets"`
}

func NewNetwork(name string) Network {

	var network Network

	network.SetName(name)
	network.Subnets = make([]Subnet, 0)

	return network

}

func (network *Network) IsValid() bool {

	if network.Name != "" {

		var result bool = true

		for s := 0; s < len(network.Subnets); s++ {

			if network.Subnets[s].IsValid() == false {
				result = false
				break
			}

		}

		return result

	}

	return false

}

func (network *Network) SetName(value string) {
	network.Name = strings.TrimSpace(value)
}

func (network *Network) AddSubnet(value Subnet) {

	if value.IsValid() {

		var found bool = false

		for s := 0; s < len(network.Subnets); s++ {

			if network.Subnets[s].IsIdentical(value) {
				found = true
				break
			}

		}

		if found == false {
			network.Subnets = append(network.Subnets, value)
		}

	}

}

func (network *Network) RemoveSubnet(value Subnet) {

	var index int = -1

	for s := 0; s < len(network.Subnets); s++ {

		if network.Subnets[s].IsIdentical(value) {
			index = s
			break
		}

	}

	if index != -1 {
		network.Subnets = append(network.Subnets[:index], network.Subnets[index+1:]...)
	}

}

func (network *Network) SetSubnets(value []Subnet) {

	var filtered []Subnet

	for v := 0; v < len(value); v++ {

		if value[v].IsValid() {
			filtered = append(filtered, value[v])
		}

	}

	sort.Slice(filtered, func(a int, b int) bool {

		if filtered[a].Prefix == filtered[b].Prefix {

			hash_a := filtered[a].Hash()
			hash_b := filtered[b].Hash()

			return hash_a < hash_b

		} else {

			return filtered[a].Prefix < filtered[b].Prefix

		}

	})

	network.Subnets = filtered

}
