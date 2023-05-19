package structs

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
	Name     string   `json:"name"`
	Hardware string   `json:"hardware"`
	Sockets  []Socket `json:"sockets"`
}

func NewNetwork(name string, hardware string) Network {

	var network Network

	network.SetName(name)
	network.SetHardware(hardware)
	network.Sockets = make([]Socket, 0)

	return network

}

func (network *Network) IsValid() bool {

	if network.Name != "" {

		if isHardware(network.Hardware) {

			var result bool = true

			for s := 0; s < len(network.Sockets); s++ {

				if network.Sockets[s].IsValid() == false {
					result = false
					break
				}

			}

			return result

		}

	}

	return false

}

func (network *Network) SetHardware(value string) {

	if isHardware(value) == true {
		network.Hardware = value
	}

}

func (network *Network) SetName(value string) {
	network.Name = strings.TrimSpace(value)
}

func (network *Network) AddSocket(value Socket) {

	var found bool = false

	for s := 0; s < len(network.Sockets); s++ {

		if network.Sockets[s].Host == value.Host && network.Sockets[s].Port == value.Port {
			found = true
			break
		}

	}

	if found == false && value.IsValid() {
		network.Sockets = append(network.Sockets, value)
	}

}

func (network *Network) RemoveSocket(value Socket) {

	var index int = -1

	for s := 0; s < len(network.Sockets); s++ {

		if network.Sockets[s].Host == value.Host && network.Sockets[s].Port == value.Port {
			index = s
			break
		}

	}

	if index != -1 {
		network.Sockets = append(network.Sockets[:index], network.Sockets[index+1:]...)
	}

}

func (network *Network) SetSockets(values []Socket) {

	var sockets []Socket

	for v := 0; v < len(values); v++ {

		if values[v].IsValid() == true {
			sockets = append(sockets, values[v])
		}

	}

	network.Sockets = sockets

}
