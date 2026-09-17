package actions

import "tholian-firewall/matchers"
import "tholian-firewall/types"
import "strconv"

type Target struct {
	Kind       string
	Domain     string
	Network    matchers.Network
	Connection matchers.Connection
}

func ParseTarget(value string) Target {

	var result Target

	if types.IsASN(value) {

		asn := types.ParseASN(value)

		if asn != nil {
			result.Kind = "network"
			result.Network = matchers.NewNetwork()
			result.Network.SetName(asn.String())
		}

	} else if types.IsIPv6AndPrefix(value) {

		ipv6, prefix := types.ParseIPv6AndPrefix(value)

		if ipv6 != nil && prefix != 0 {
			result.Kind = "network"
			result.Network = matchers.NewNetwork()
			result.Network.SetSubnet(ipv6.String() + "/" + strconv.FormatUint(uint64(prefix), 10))
		}

	} else if types.IsIPv6AndPort(value) {

		ipv6, port := types.ParseIPv6AndPort(value)

		if ipv6 != nil && port != 0 {
			result.Kind = "connection"
			result.Connection = matchers.NewConnection()
			result.Connection.SetHost(ipv6.String())
			result.Connection.SetPort(port)
		}

	} else if types.IsIPv6(value) {

		ipv6 := types.ParseIPv6(value)

		if ipv6 != nil {
			result.Kind = "network"
			result.Network = matchers.NewNetwork()
			result.Network.SetSubnet(ipv6.String() + "/128")
		}

	} else if types.IsIPv4AndPrefix(value) {

		ipv4, prefix := types.ParseIPv4AndPrefix(value)

		if ipv4 != nil && prefix != 0 {
			result.Kind = "network"
			result.Network = matchers.NewNetwork()
			result.Network.SetSubnet(ipv4.String() + "/" + strconv.FormatUint(uint64(prefix), 10))
		}

	} else if types.IsIPv4AndPort(value) {

		ipv4, port := types.ParseIPv4AndPort(value)

		if ipv4 != nil && port != 0 {
			result.Kind = "connection"
			result.Connection = matchers.NewConnection()
			result.Connection.SetHost(ipv4.String())
			result.Connection.SetPort(port)
		}

	} else if types.IsIPv4(value) {

		ipv4 := types.ParseIPv4(value)

		if ipv4 != nil {
			result.Kind = "network"
			result.Network = matchers.NewNetwork()
			result.Network.SetSubnet(ipv4.String() + "/32")
		}

	} else if types.IsDomainAndPort(value) {

		domain, port := types.ParseDomainAndPort(value)

		if domain != nil && port != 0 {
			result.Kind = "connection"
			result.Connection = matchers.NewConnection()
			result.Connection.SetHost(domain.String())
			result.Connection.SetPort(port)
		}

	} else if types.IsDomain(value) {

		domain := types.ParseDomain(value)

		if domain != nil {
			result.Kind = "domain"
			result.Domain = domain.String()
		}

	}

	return result

}
