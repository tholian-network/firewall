//go:build guard || guard_openwrt || guard_almalinux || guard_alpinelinux || guard_amazonlinux || guard_antergos || guard_archlinux || guard_cblmariner || guard_centos || guard_debian || guard_fedora || guard_gentoolinux || guard_linuxmint || guard_manjaro || guard_opensuse || guard_oraclelinux || guard_photonos || guard_redhat || guard_rockylinux || guard_trisquel || guard_ubuntu

package ebpf

import "tholian-firewall/adapters/mitigations/ebpf/module"
import "tholian-firewall/console"
import "tholian-firewall/structs"
import "strconv"

func PermitNetwork(network structs.Network) bool {

	var result bool = false

	if SUPPORTED == true && len(network.Subnets) > 0 {

		result = true

		for s := 0; s < len(network.Subnets); s++ {

			subnet := network.Subnets[s]

			if module.IsForbiddenSubnet(subnet.Address, subnet.Prefix) == false {
				continue
			}

			console.Info("adapters/ebpf: Permit Network \"" + subnet.Address + "/" + strconv.FormatUint(uint64(subnet.Prefix), 10) + "\"")

			if module.PermitSubnet(subnet.Address, subnet.Prefix) == false {
				result = false
			}

		}

	}

	return result

}
