package actions

import "tholian-firewall/adapters/mitigations/ebpf"
import "tholian-firewall/adapters/mitigations/hosts"
import "tholian-firewall/adapters/mitigations/iptables"
import "tholian-firewall/structs"

func Status(console *structs.Console) []string {

	var result []string

	if ebpf.SUPPORTED == true {

		entries := ebpf.Status()

		for e := 0; e < len(entries); e++ {
			result = append(result, "ebpf "+entries[e])
		}

	}

	if iptables.SUPPORTED == true {

		entries := iptables.Status()

		for e := 0; e < len(entries); e++ {
			result = append(result, "iptables "+entries[e])
		}

	}

	if hosts.SUPPORTED == true {

		entries := hosts.Status()

		for e := 0; e < len(entries); e++ {
			result = append(result, "hosts "+entries[e])
		}

	}

	return result

}
