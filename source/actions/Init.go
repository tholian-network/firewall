package actions

import "tholian-firewall/adapters/mitigations/ebpf"
import "tholian-firewall/adapters/mitigations/hosts"
import "tholian-firewall/adapters/mitigations/iptables"

func Init() bool {

	if ebpf.SUPPORTED == true {
		if ebpf.AttachAll() > 0 {
			return true
		}
	}

	return iptables.SUPPORTED == true || hosts.SUPPORTED == true

}
