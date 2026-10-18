//go:build guard || guard_openwrt || guard_almalinux || guard_alpinelinux || guard_amazonlinux || guard_antergos || guard_archlinux || guard_cblmariner || guard_centos || guard_debian || guard_fedora || guard_gentoolinux || guard_linuxmint || guard_manjaro || guard_opensuse || guard_oraclelinux || guard_photonos || guard_redhat || guard_rockylinux || guard_trisquel || guard_ubuntu || guard_freebsd || guard_netbsd || guard_openbsd

package module

import "github.com/cilium/ebpf"
import "errors"
import "tholian-firewall/structs"

func PermitPort(console *structs.Console, port uint16) bool {

	var result bool = false

	if port > 0 {

		if Module.PortBans != nil {

			err := Module.PortBans.Delete(ToBPFPort(port))

			if err == nil {
				result = true
			} else if errors.Is(err, ebpf.ErrKeyNotExist) {
				result = true
			}

		}

	}

	return result

}
