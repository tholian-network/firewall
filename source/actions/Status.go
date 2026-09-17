package actions

import "tholian-firewall/adapters/mitigations/ebpf"

func Status() []string {

	if ebpf.SUPPORTED == true {
		return ebpf.Status()
	}

	return nil

}
