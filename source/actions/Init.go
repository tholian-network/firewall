package actions

import "tholian-firewall/adapters/mitigations/ebpf"

func Init() bool {

	var attached int = 0

	if ebpf.SUPPORTED == true {
		attached = ebpf.AttachAll()
	}

	if ebpf.SUPPORTED == true && attached > 0 {
		return true
	}

	return false

}
