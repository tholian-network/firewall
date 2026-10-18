//go:build guard || guard_openwrt || guard_almalinux || guard_alpinelinux || guard_amazonlinux || guard_antergos || guard_archlinux || guard_cblmariner || guard_centos || guard_debian || guard_fedora || guard_gentoolinux || guard_linuxmint || guard_manjaro || guard_opensuse || guard_oraclelinux || guard_photonos || guard_redhat || guard_rockylinux || guard_trisquel || guard_ubuntu || guard_freebsd || guard_netbsd || guard_openbsd

package module

import "github.com/cilium/ebpf"
import "tholian-firewall/structs"
import "tholian-firewall/types"
import "errors"

func PermitSocket(console *structs.Console, address string, port uint16) bool {

	var key []byte
	var table *ebpf.Map

	if types.IsIPv6(address) {
		key = ToBPFIPv6Socket(address, port)
		table = Module.IPv6Sockets
	} else if types.IsIPv4(address) {
		key = ToBPFIPv4Socket(address, port)
		table = Module.IPv4Sockets
	} else {
		return false
	}

	if len(key) == 0 || table == nil {
		return false
	}

	err := table.Delete(key)

	if err == nil || errors.Is(err, ebpf.ErrKeyNotExist) {
		return true
	}

	console.Error("adapters/ebpf: Socket Permit Error")
	console.Error(err.Error())

	return false

}
