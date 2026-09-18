package actions

import "tholian-firewall/insights"
import "tholian-firewall/structs"
import "tholian-firewall/types"
import "strconv"

func Search(console *structs.Console, target string) []string {

	var result []string

	if types.IsASN(target) {

		network := insights.Internet.SearchASN(target)

		if network.IsValid() {

			result = append(result, network.Name+" ("+strconv.Itoa(len(network.Subnets))+" subnets)")

			for s := 0; s < len(network.Subnets); s++ {
				result = append(result, network.Subnets[s].String())
			}

		}

	} else {

		subnet := insights.Internet.Search(target)

		if subnet.Address != "" {
			result = append(result, subnet.Name+" "+subnet.Address+"/"+strconv.FormatUint(uint64(subnet.Prefix), 10)+" "+subnet.Country)
		}

	}

	return result

}
