package types

import "tholian-core/matchers"
import "tholian-core/types"
import "strconv"

type TargetKind uint8

const (
	TargetInvalid TargetKind = iota
	TargetNetwork
	TargetConnection
	TargetDomain
)

type Target struct {
	Kind       TargetKind
	Domain     string
	Network    matchers.Network
	Connection matchers.Connection
}

func (target *Target) IsValid() bool {

	switch target.Kind {
	case TargetNetwork:
		return target.Network.IsValid()
	case TargetConnection:
		return target.Connection.IsValid()
	case TargetDomain:
		return target.Domain != ""
	}

	return false

}

func (target *Target) IsNetwork() bool {
	return target.Kind == TargetNetwork
}

func (target *Target) IsConnection() bool {
	return target.Kind == TargetConnection
}

func (target *Target) IsDomain() bool {
	return target.Kind == TargetDomain
}

func ParseTarget(value string) Target {

	var result Target

	if types.IsASN(value) {

		asn := types.ParseASN(value)

		if asn != nil {
			result.Kind = TargetNetwork
			result.Network = matchers.NewNetwork()
			result.Network.SetName(asn.String())
		}

	} else if types.IsIPv6AndPrefix(value) {

		ipv6, prefix := types.ParseIPv6AndPrefix(value)

		if ipv6 != nil {
			result.Kind = TargetNetwork
			result.Network = matchers.NewNetwork()
			result.Network.SetSubnet(ipv6.String() + "/" + strconv.FormatUint(uint64(prefix), 10))
		}

	} else if types.IsIPv6AndPort(value) {

		ipv6, port := types.ParseIPv6AndPort(value)

		if ipv6 != nil && port != 0 {
			result.Kind = TargetConnection
			result.Connection = matchers.NewConnection()
			result.Connection.SetHost(ipv6.String())
			result.Connection.SetPort(port)
		}

	} else if types.IsIPv6(value) {

		ipv6 := types.ParseIPv6(value)

		if ipv6 != nil {
			result.Kind = TargetNetwork
			result.Network = matchers.NewNetwork()
			result.Network.SetSubnet(ipv6.String() + "/128")
		}

	} else if types.IsIPv4AndPrefix(value) {

		ipv4, prefix := types.ParseIPv4AndPrefix(value)

		if ipv4 != nil {
			result.Kind = TargetNetwork
			result.Network = matchers.NewNetwork()
			result.Network.SetSubnet(ipv4.String() + "/" + strconv.FormatUint(uint64(prefix), 10))
		}

	} else if types.IsIPv4AndPort(value) {

		ipv4, port := types.ParseIPv4AndPort(value)

		if ipv4 != nil && port != 0 {
			result.Kind = TargetConnection
			result.Connection = matchers.NewConnection()
			result.Connection.SetHost(ipv4.String())
			result.Connection.SetPort(port)
		}

	} else if types.IsIPv4(value) {

		ipv4 := types.ParseIPv4(value)

		if ipv4 != nil {
			result.Kind = TargetNetwork
			result.Network = matchers.NewNetwork()
			result.Network.SetSubnet(ipv4.String() + "/32")
		}

	} else if types.IsDomainAndPort(value) {

		domain, port := types.ParseDomainAndPort(value)

		if domain != nil && port != 0 {
			result.Kind = TargetConnection
			result.Connection = matchers.NewConnection()
			result.Connection.SetHost(domain.String())
			result.Connection.SetPort(port)
		}

	} else if types.IsDomain(value) {

		domain := types.ParseDomain(value)

		if domain != nil {
			result.Kind = TargetDomain
			result.Domain = domain.String()
		}

	}

	return result

}
