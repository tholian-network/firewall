package actions

import "tholian-firewall/adapters/mitigations/ebpf"
import "tholian-firewall/adapters/mitigations/hosts"
import "tholian-firewall/adapters/mitigations/iptables"
import "tholian-firewall/structs"
import "tholian-firewall/types"

func backendAvailable() bool {
	return ebpf.SUPPORTED == true || iptables.SUPPORTED == true || hosts.SUPPORTED == true
}

func forbidAddress(console *structs.Console, address string) bool {

	if ebpf.SUPPORTED == true {
		return ebpf.ForbidAddress(console, address)
	}

	if types.IsDomain(address) == true {

		if hosts.SUPPORTED == true {
			return hosts.ForbidDomain(console, address)
		}

		return false

	}

	if iptables.SUPPORTED == true {
		return iptables.ForbidAddress(console, address)
	}

	return false

}

func permitAddress(console *structs.Console, address string) bool {

	if ebpf.SUPPORTED == true {
		return ebpf.PermitAddress(console, address)
	}

	if types.IsDomain(address) == true {

		if hosts.SUPPORTED == true {
			return hosts.PermitDomain(console, address)
		}

		return false

	}

	if iptables.SUPPORTED == true {
		return iptables.PermitAddress(console, address)
	}

	return false

}

func isForbiddenAddress(console *structs.Console, address string) bool {

	if ebpf.SUPPORTED == true && ebpf.IsForbiddenAddress(console, address) == true {
		return true
	}

	if types.IsDomain(address) == true {
		return hosts.SUPPORTED == true && hosts.IsForbiddenDomain(console, address) == true
	}

	return iptables.SUPPORTED == true && iptables.IsForbiddenAddress(console, address) == true

}

func forbidDomain(console *structs.Console, domain string) bool {

	if ebpf.SUPPORTED == true {
		return ebpf.ForbidAddress(console, domain)
	}

	if hosts.SUPPORTED == true {
		return hosts.ForbidDomain(console, domain)
	}

	return false

}

func permitDomain(console *structs.Console, domain string) bool {

	if ebpf.SUPPORTED == true {
		return ebpf.PermitAddress(console, domain)
	}

	if hosts.SUPPORTED == true {
		return hosts.PermitDomain(console, domain)
	}

	return false

}

func isForbiddenDomain(console *structs.Console, domain string) bool {

	if ebpf.SUPPORTED == true && ebpf.IsForbiddenAddress(console, domain) == true {
		return true
	}

	return hosts.SUPPORTED == true && hosts.IsForbiddenDomain(console, domain) == true

}

func forbidSubnet(console *structs.Console, address string, prefix uint8) bool {

	if ebpf.SUPPORTED == true {
		return ebpf.ForbidSubnet(console, address, prefix)
	}

	if iptables.SUPPORTED == true {
		return iptables.ForbidSubnet(console, address, prefix)
	}

	return false

}

func permitSubnet(console *structs.Console, address string, prefix uint8) bool {

	if ebpf.SUPPORTED == true {
		return ebpf.PermitSubnet(console, address, prefix)
	}

	if iptables.SUPPORTED == true {
		return iptables.PermitSubnet(console, address, prefix)
	}

	return false

}

func isForbiddenSubnet(console *structs.Console, address string, prefix uint8) bool {

	if ebpf.SUPPORTED == true && ebpf.IsForbiddenSubnet(console, address, prefix) == true {
		return true
	}

	return iptables.SUPPORTED == true && iptables.IsForbiddenSubnet(console, address, prefix) == true

}

func isForbiddenSubnetOrAddress(console *structs.Console, subnet structs.Subnet) bool {

	if subnet.Type == "ipv4" && subnet.Prefix == 32 {
		return isForbiddenAddress(console, subnet.Address)
	}

	if subnet.Type == "ipv6" && subnet.Prefix == 128 {
		return isForbiddenAddress(console, subnet.Address)
	}

	return isForbiddenSubnet(console, subnet.Address, subnet.Prefix)

}

func forbidSubnetOrAddress(console *structs.Console, subnet structs.Subnet) bool {

	if subnet.Type == "ipv4" && subnet.Prefix == 32 {
		return forbidAddress(console, subnet.Address)
	}

	if subnet.Type == "ipv6" && subnet.Prefix == 128 {
		return forbidAddress(console, subnet.Address)
	}

	return forbidSubnet(console, subnet.Address, subnet.Prefix)

}

func permitSubnetOrAddress(console *structs.Console, subnet structs.Subnet) bool {

	if subnet.Type == "ipv4" && subnet.Prefix == 32 {
		return permitAddress(console, subnet.Address)
	}

	if subnet.Type == "ipv6" && subnet.Prefix == 128 {
		return permitAddress(console, subnet.Address)
	}

	return permitSubnet(console, subnet.Address, subnet.Prefix)

}

func forbidPort(console *structs.Console, port uint16) bool {

	if ebpf.SUPPORTED == true {
		return ebpf.ForbidPort(console, port)
	}

	if iptables.SUPPORTED == true {
		return iptables.ForbidPort(console, port)
	}

	return false

}

func permitPort(console *structs.Console, port uint16) bool {

	if ebpf.SUPPORTED == true {
		return ebpf.PermitPort(console, port)
	}

	if iptables.SUPPORTED == true {
		return iptables.PermitPort(console, port)
	}

	return false

}

func isForbiddenPort(console *structs.Console, port uint16) bool {

	if ebpf.SUPPORTED == true && ebpf.IsForbiddenPort(console, port) == true {
		return true
	}

	return iptables.SUPPORTED == true && iptables.IsForbiddenPort(console, port) == true

}

func forbidNetwork(console *structs.Console, network structs.Network) bool {

	if ebpf.SUPPORTED == true {
		return ebpf.ForbidNetwork(console, network)
	}

	if iptables.SUPPORTED == true {
		return iptables.ForbidNetwork(console, network)
	}

	return false

}

func permitNetwork(console *structs.Console, network structs.Network) bool {

	if ebpf.SUPPORTED == true {
		return ebpf.PermitNetwork(console, network)
	}

	if iptables.SUPPORTED == true {
		return iptables.PermitNetwork(console, network)
	}

	return false

}

func connectionHost(connection types.Connection) string {

	if types.IsDomain(connection.Target.Host) == true {
		return connection.Target.Host
	}

	if types.IsDomain(connection.Source.Host) == true {
		return connection.Source.Host
	}

	return ""

}

func forbidConnection(console *structs.Console, connection types.Connection) bool {

	if ebpf.SUPPORTED == true {
		return ebpf.ForbidConnection(console, connection)
	}

	if iptables.SUPPORTED == true {
		return iptables.ForbidConnection(console, connection)
	}

	return false

}

func permitConnection(console *structs.Console, connection types.Connection) bool {

	if ebpf.SUPPORTED == true {
		return ebpf.PermitConnection(console, connection)
	}

	if iptables.SUPPORTED == true {
		return iptables.PermitConnection(console, connection)
	}

	return false

}
