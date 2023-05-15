package structs

import "tholian-endpoint/console"
import "tholian-endpoint/utils"
import "strconv"
import "strings"

func isHardware(value string) bool {

	if strings.Contains(value, ":") {

		var tmp1 []string = strings.Split(value, ":")
		var tmp2 []int

		for t := 0; t < len(tmp1); t++ {

			num, err := strconv.ParseUint(tmp1[t], 16, 8)

			if err == nil {

				if num >= 0 && num <= 255 {
					tmp2 = append(tmp2, int(num))
				}

			}

		}

		if len(tmp1) == len(tmp2) {
			return true
		}

	}

	return false

}

type Network struct {
	Name      string    `json:"name"`
	Hardware  string    `json:"hardware"`
	Addresses []Address `json:"addresses"`
}

func NewNetwork(name string, hardware string) Network {

	var network Network

	network.SetName(name)
	network.SetHardware(hardware)

	return network

}

func (network *Network) Debug() {

	if network.Name != "" {

		if isHardware(network.Hardware) == false {
			console.Error("networks/" + network.Name + ": Invalid Hardware MAC " + network.Hardware)
		}

		for a := 0; a < len(network.Addresses); a++ {

			var address = network.Addresses[a]

			if address.IsValid() == false {
				console.Error("networks/" + network.Name + ": Invalid Address")
				console.Error(utils.ToJSON(address))
			}

		}

	}

}

func (network *Network) IsValid() bool {

	if network.Name != "" {

		if isHardware(network.Hardware) {

			var result bool = true

			for a := 0; a < len(network.Addresses); a++ {

				if network.Addresses[a].IsValid() == false {
					result = false
					break
				}

			}

			return result

		}

	}

	return false

}

func (network *Network) SetAddresses(values []string) {

	var addresses []Address

	for v := 0; v < len(values); v++ {

		var address = NewAddress(values[v], "")

		if address.IsValid() == true {
			addresses = append(addresses, address)
		}

	}

	network.Addresses = addresses

}

func (network *Network) SetHardware(value string) {

	if isHardware(value) == true {
		network.Hardware = value
	}

}

func (network *Network) SetName(value string) {
	network.Name = strings.TrimSpace(value)
}
