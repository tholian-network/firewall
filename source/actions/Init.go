package actions

import "tholian-firewall/adapters/mitigations/ebpf"
import "tholian-firewall/adapters/mitigations/hosts"
import "tholian-firewall/adapters/mitigations/iptables"
import "tholian-firewall/structs"

func Init(console *structs.Console) bool {

	if ebpf.SUPPORTED == true {
		if ebpf.AttachAll(console) > 0 {
			return true
		}
	}

	return iptables.SUPPORTED == true || hosts.SUPPORTED == true

}
