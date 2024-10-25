package structs

import "tholian-firewall/types"
import "encoding/hex"
import "sort"
import "strings"

type Internet struct {
	Mapv4    map[uint8]map[string]*Subnet `json:"mapv4"`
	Mapv6    map[uint8]map[string]*Subnet `json:"mapv6"`
	Networks map[string]*Network          `json:"networks"`
}

func NewInternet() Internet {

	var internet Internet

	internet.Mapv4 = make(map[uint8]map[string]*Subnet)
	internet.Mapv6 = make(map[uint8]map[string]*Subnet)
	internet.Networks = make(map[string]*Network)

	return internet

}

func (internet *Internet) AddNetwork(value Network) bool {

	var result bool = false

	if strings.HasPrefix(value.Name, "AS") {

		result = true

		var network = value

		internet.Networks[network.Name] = &network

		for s := 0; s < len(network.Subnets); s++ {

			check := internet.AddSubnet(network.Subnets[s])

			if check == false {
				result = false
			}

		}

	}

	return result

}

func (internet *Internet) AddSubnet(value Subnet) bool {

	var result bool = false
	var subnet = value

	if subnet.Type == "ipv6" {

		prefix := subnet.Prefix
		hash := subnet.Hash()

		_, ok1 := internet.Mapv6[prefix]

		if ok1 == false {
			internet.Mapv6[prefix] = make(map[string]*Subnet)
		}

		_, ok2 := internet.Mapv6[prefix][hash]

		if ok2 == true {
			result = false
		} else {
			internet.Mapv6[prefix][hash] = &subnet
			result = true
		}

	} else if subnet.Type == "ipv4" {

		prefix := subnet.Prefix
		hash := subnet.Hash()

		_, ok1 := internet.Mapv4[prefix]

		if ok1 == false {
			internet.Mapv4[prefix] = make(map[string]*Subnet)
		}

		_, ok2 := internet.Mapv4[prefix][hash]

		if ok2 == true {
			result = false
		} else {
			internet.Mapv4[prefix][hash] = &subnet
			result = true
		}

	}

	return result

}

func (internet *Internet) Search(value string) Subnet {

	var result Subnet

	if strings.Contains(value, "/") {

		address := value[0:strings.Index(value, "/")]
		prefix := value[strings.Index(value, "/")+1:]

		if types.IsIPv6(address) {

			ipv6 := types.ParseIPv6(address)

			if ipv6 != nil {
				address = ipv6.String()
				result = internet.SearchSubnet(ToSubnet(address + "/" + prefix))
			}

		} else if types.IsIPv4(address) {

			ipv4 := types.ParseIPv4(address)

			if ipv4 != nil {
				address = ipv4.String()
				result = internet.SearchSubnet(ToSubnet(address + "/" + prefix))
			}

		}

	} else {

		if types.IsIPv6(value) {

			ipv6 := types.ParseIPv6(value)

			if ipv6 != nil {
				value = ipv6.String()
				result = internet.SearchSubnet(ToSubnet(value + "/128"))
			}

		} else if types.IsIPv4(value) {

			ipv4 := types.ParseIPv4(value)

			if ipv4 != nil {
				value = ipv4.String()
				result = internet.SearchSubnet(ToSubnet(value + "/32"))
			}

		}

	}

	return result

}

func (internet *Internet) SearchASN(value string) Network {

	var result Network

	if strings.HasPrefix(value, "AS") {

		tmp, ok := internet.Networks[value]

		if ok == true {
			result = *tmp
		}

	}

	return result

}

func (internet *Internet) SearchNetwork(value Network) []Subnet {

	var result []Subnet

	if value.Name != "" {

		network := internet.SearchASN(value.Name)

		if network.Name != "" {

			for s := 0; s < len(network.Subnets); s++ {
				result = append(result, network.Subnets[s])
			}

		}

	} else if len(value.Subnets) > 0 {

		for s := 0; s < len(value.Subnets); s++ {

			found := internet.SearchSubnet(value.Subnets[s])

			if found.Address != "" && found.Prefix != 0 {
				result = append(result, found)
			}

		}

	}

	return result

}

func (internet *Internet) SearchSubnet(value Subnet) Subnet {

	var result Subnet

	if value.Type == "ipv6" {

		ipv6 := types.ParseIPv6(value.Address)
		prefixes := make([]uint8, 0)

		for prefix := range internet.Mapv6 {
			prefixes = append(prefixes, prefix)
		}

		sort.Slice(prefixes, func(a int, b int) bool {
			return prefixes[a] > prefixes[b]
		})

		for p := 0; p < len(prefixes); p++ {

			prefix := prefixes[p]
			hash := hex.EncodeToString(ipv6.Bytes(prefix))

			tmp, ok := internet.Mapv6[prefix][hash]

			if ok == true {
				result = *tmp
				break
			}

		}

	} else if value.Type == "ipv4" {

		ipv4 := types.ParseIPv4(value.Address)
		prefixes := make([]uint8, 0)

		for prefix := range internet.Mapv4 {
			prefixes = append(prefixes, prefix)
		}

		sort.Slice(prefixes, func(a int, b int) bool {
			return prefixes[a] > prefixes[b]
		})

		for p := 0; p < len(prefixes); p++ {

			prefix := prefixes[p]
			hash := hex.EncodeToString(ipv4.Bytes(prefix))

			tmp, ok := internet.Mapv4[prefix][hash]

			if ok == true {
				result = *tmp
				break
			}

		}

	}

	return result

}

func (internet *Internet) SetNetworks(values []Network) bool {

	var result bool = true

	for v := 0; v < len(values); v++ {

		check := internet.AddNetwork(values[v])

		if check == false {
			result = false
		}

	}

	return result

}

func (internet *Internet) SetSubnets(values []Subnet) bool {

	var result bool = true

	for v := 0; v < len(values); v++ {

		check := internet.AddSubnet(values[v])

		if check == false {
			result = false
		}

	}

	return result

}
