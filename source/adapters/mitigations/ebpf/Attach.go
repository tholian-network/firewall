package ebpf

import "github.com/cilium/ebpf/link"
import "net"

func Attach(name string) bool {

	var result bool = false

	iface, err1 := net.InterfaceByName(name)

	if err1 == nil {

		ref, err2 := link.AttachXDP(link.XDPOptions{
			Program:   BPF.Program,
			Interface: iface.Index,
		})

		if err2 == nil {
			defer ref.Close()
			result = true
		}

	}

	return result

}
