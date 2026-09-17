package actions

import "tholian-firewall/adapters/mitigations/ebpf"
import "tholian-firewall/adapters/mitigations/hosts"
import "tholian-firewall/adapters/mitigations/iptables"
import "tholian-firewall/structs"
import "tholian-firewall/types"

func backendAvailable() bool {
	return ebpf.SUPPORTED == true || iptables.SUPPORTED == true || hosts.SUPPORTED == true
}

func forbidAddress(address string) bool {

	if ebpf.SUPPORTED == true {
		return ebpf.ForbidAddress(address)
	}

	if types.IsDomain(address) == true {

		if hosts.SUPPORTED == true {
			return hosts.ForbidDomain(address)
		}

		return false

	}

	if iptables.SUPPORTED == true {
		return iptables.ForbidAddress(address)
	}

	return false

}

func permitAddress(address string) bool {

	if ebpf.SUPPORTED == true {
		return ebpf.PermitAddress(address)
	}

	if types.IsDomain(address) == true {

		if hosts.SUPPORTED == true {
			return hosts.PermitDomain(address)
		}

		return false

	}

	if iptables.SUPPORTED == true {
		return iptables.PermitAddress(address)
	}

	return false

}

func isForbiddenAddress(address string) bool {

	if ebpf.SUPPORTED == true && ebpf.IsForbiddenAddress(address) == true {
		return true
	}

	if types.IsDomain(address) == true {
		return hosts.SUPPORTED == true && hosts.IsForbiddenDomain(address) == true
	}

	return iptables.SUPPORTED == true && iptables.IsForbiddenAddress(address) == true

}

func forbidDomain(domain string) bool {

	if ebpf.SUPPORTED == true {
		return ebpf.ForbidAddress(domain)
	}

	if hosts.SUPPORTED == true {
		return hosts.ForbidDomain(domain)
	}

	return false

}

func permitDomain(domain string) bool {

	if ebpf.SUPPORTED == true {
		return ebpf.PermitAddress(domain)
	}

	if hosts.SUPPORTED == true {
		return hosts.PermitDomain(domain)
	}

	return false

}

func isForbiddenDomain(domain string) bool {

	if ebpf.SUPPORTED == true && ebpf.IsForbiddenAddress(domain) == true {
		return true
	}

	return hosts.SUPPORTED == true && hosts.IsForbiddenDomain(domain) == true

}

func forbidSubnet(address string, prefix uint8) bool {

	if ebpf.SUPPORTED == true {
		return ebpf.ForbidSubnet(address, prefix)
	}

	if iptables.SUPPORTED == true {
		return iptables.ForbidSubnet(address, prefix)
	}

	return false

}

func permitSubnet(address string, prefix uint8) bool {

	if ebpf.SUPPORTED == true {
		return ebpf.PermitSubnet(address, prefix)
	}

	if iptables.SUPPORTED == true {
		return iptables.PermitSubnet(address, prefix)
	}

	return false

}

func isForbiddenSubnet(address string, prefix uint8) bool {

	if ebpf.SUPPORTED == true && ebpf.IsForbiddenSubnet(address, prefix) == true {
		return true
	}

	return iptables.SUPPORTED == true && iptables.IsForbiddenSubnet(address, prefix) == true

}

func isForbiddenSubnetOrAddress(subnet structs.Subnet) bool {

	if subnet.Type == "ipv4" && subnet.Prefix == 32 {
		return isForbiddenAddress(subnet.Address)
	}

	if subnet.Type == "ipv6" && subnet.Prefix == 128 {
		return isForbiddenAddress(subnet.Address)
	}

	return isForbiddenSubnet(subnet.Address, subnet.Prefix)

}

func forbidSubnetOrAddress(subnet structs.Subnet) bool {

	if subnet.Type == "ipv4" && subnet.Prefix == 32 {
		return forbidAddress(subnet.Address)
	}

	if subnet.Type == "ipv6" && subnet.Prefix == 128 {
		return forbidAddress(subnet.Address)
	}

	return forbidSubnet(subnet.Address, subnet.Prefix)

}

func permitSubnetOrAddress(subnet structs.Subnet) bool {

	if subnet.Type == "ipv4" && subnet.Prefix == 32 {
		return permitAddress(subnet.Address)
	}

	if subnet.Type == "ipv6" && subnet.Prefix == 128 {
		return permitAddress(subnet.Address)
	}

	return permitSubnet(subnet.Address, subnet.Prefix)

}

func forbidPort(port uint16) bool {

	if ebpf.SUPPORTED == true {
		return ebpf.ForbidPort(port)
	}

	if iptables.SUPPORTED == true {
		return iptables.ForbidPort(port)
	}

	return false

}

func permitPort(port uint16) bool {

	if ebpf.SUPPORTED == true {
		return ebpf.PermitPort(port)
	}

	if iptables.SUPPORTED == true {
		return iptables.PermitPort(port)
	}

	return false

}

func isForbiddenPort(port uint16) bool {

	if ebpf.SUPPORTED == true && ebpf.IsForbiddenPort(port) == true {
		return true
	}

	return iptables.SUPPORTED == true && iptables.IsForbiddenPort(port) == true

}

func forbidNetwork(network structs.Network) bool {

	if ebpf.SUPPORTED == true {
		return ebpf.ForbidNetwork(network)
	}

	if iptables.SUPPORTED == true {
		return iptables.ForbidNetwork(network)
	}

	return false

}

func permitNetwork(network structs.Network) bool {

	if ebpf.SUPPORTED == true {
		return ebpf.PermitNetwork(network)
	}

	if iptables.SUPPORTED == true {
		return iptables.PermitNetwork(network)
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

func forbidConnection(connection types.Connection) bool {

	if ebpf.SUPPORTED == true {
		return ebpf.ForbidConnection(connection)
	}

	if iptables.SUPPORTED == true {
		return iptables.ForbidConnection(connection)
	}

	return false

}

func permitConnection(connection types.Connection) bool {

	if ebpf.SUPPORTED == true {
		return ebpf.PermitConnection(connection)
	}

	if iptables.SUPPORTED == true {
		return iptables.PermitConnection(connection)
	}

	return false

}
