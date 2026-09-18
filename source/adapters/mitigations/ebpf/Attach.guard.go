//go:build guard || guard_openwrt || guard_almalinux || guard_alpinelinux || guard_amazonlinux || guard_antergos || guard_archlinux || guard_cblmariner || guard_centos || guard_debian || guard_fedora || guard_gentoolinux || guard_linuxmint || guard_manjaro || guard_opensuse || guard_oraclelinux || guard_photonos || guard_redhat || guard_rockylinux || guard_trisquel || guard_ubuntu

package ebpf

import "github.com/cilium/ebpf/link"
import "tholian-firewall/adapters/mitigations/ebpf/module"
import "tholian-firewall/structs"
import "net"

func Attach(console *structs.Console, name string) bool {

	var result bool = false

	if SUPPORTED == true {

		_, ok := module.Links[name]

		if ok == true {

			result = true

		} else {

			iface, err1 := net.InterfaceByName(name)

			if err1 != nil {
				console.Error("adapters/ebpf: Network interface \"" + name + "\" not found")
				return false
			}

			ref, err2 := link.AttachXDP(link.XDPOptions{
				Program:   module.Module.Program,
				Interface: iface.Index,
			})

			if err2 != nil {

				ref, err2 = link.AttachXDP(link.XDPOptions{
					Program:   module.Module.Program,
					Interface: iface.Index,
					Flags:     link.XDPGenericMode,
				})

			}

			if err2 == nil {

				console.Info("adapters/ebpf: eBPF Module attached to \"" + name + "\"")
				module.Links[name] = &ref
				result = true

			} else {

				console.Error("adapters/ebpf: eBPF Module attach failed on \"" + name + "\"")
				console.Error(err2.Error())

			}

		}

	}

	return result

}

func AttachAll(console *structs.Console) int {

	var count int = 0

	if SUPPORTED == true {

		interfaces, err := net.Interfaces()

		if err == nil {

			for i := 0; i < len(interfaces); i++ {

				iface := interfaces[i]

				if iface.Flags&net.FlagLoopback != 0 {
					continue
				}

				if iface.Flags&net.FlagUp == 0 {
					continue
				}

				if Attach(console, iface.Name) == true {
					count = count + 1
				}

			}

		} else {
			console.Error(err.Error())
		}

	}

	return count

}
