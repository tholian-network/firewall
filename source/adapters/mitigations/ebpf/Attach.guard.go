//go:build (guard || guard_openwrt || guard_almalinux || guard_alpinelinux || guard_amazonlinux || guard_antergos || guard_archlinux || guard_cblmariner || guard_centos || guard_debian || guard_fedora || guard_gentoolinux || guard_linuxmint || guard_manjaro || guard_opensuse || guard_oraclelinux || guard_photonos || guard_redhat || guard_rockylinux || guard_trisquel || guard_ubuntu)

package ebpf

import "github.com/cilium/ebpf/link"
import "tholian-firewall/adapters/mitigations/ebpf/module"
import "tholian-firewall/console"
import "net"

func Attach(name string) bool {

	var result bool = false

	if SUPPORTED == true {

		_, ok := module.Links[name]

		if ok == true {

			result = true

		} else {

			iface, err1 := net.InterfaceByName(name)

			if err1 == nil {

				ref, err2 := link.AttachXDP(link.XDPOptions{
					Program:   module.Module.Program,
					Interface: iface.Index,
				})

				if err2 == nil {
					console.Info("adapters/ebpf: eBPF Module attached to \"" + name + "\"")
					module.Links[name] = &ref
					result = true
				}

			}

		}

	}

	return result

}
