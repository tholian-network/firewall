package types

import "strconv"
import "strings"

type Socket struct {
	Host  string `json:"host"`
	Port  uint16 `json:"port"`
	Scope string `json:"scope"`
	Type  string `json:"type"`
}

func NewSocket(host string, port uint16) Socket {

	var socket Socket

	socket.SetHost(host)
	socket.SetPort(port)

	return socket

}

func ToSocket(value string) Socket {

	var socket Socket
	var host string
	var port uint16

	if strings.HasPrefix(value, "[") && strings.Contains(value, "]:") {

		tmp1 := value[0 : strings.Index(value, "]:")+1]
		tmp2, err := strconv.ParseInt(strings.Split(value, "]:")[1], 10, 16)

		if err == nil {
			host = tmp1
			port = uint16(tmp2)
		}

	} else if strings.HasPrefix(value, "[") && strings.HasSuffix(value, "]") {

		host = value

	} else if strings.Contains(value, ".") && strings.Contains(value, ":") {

		tmp1 := strings.Split(value, ":")[0]
		tmp2, err := strconv.ParseInt(strings.Split(value, ":")[1], 10, 16)

		if err == nil {
			host = tmp1
			port = uint16(tmp2)
		}

	} else if strings.Contains(value, ":") {

		tmp1 := strings.Split(value, ":")[0]
		tmp2, err := strconv.ParseInt(strings.Split(value, ":")[1], 10, 16)

		if err == nil {
			host = tmp1
			port = uint16(tmp2)
		}

	} else if strings.Contains(value, ".") {

		host = value

	}

	if host != "" && port != 0 {
		socket = NewSocket(host, port)
	}

	return socket

}

func (socket *Socket) IsUnset() bool {
	return socket.Host == "" && socket.Port == 0 && socket.Type == ""
}

func (socket *Socket) IsAny() bool {
	return socket.Host == HostAny || socket.Host == HostWildcard
}

func (socket *Socket) IsWildcard() bool {
	return socket.IsAny()
}

func (socket *Socket) IsUnspecified() bool {

	if socket.Host == UnspecifiedIPv4 {
		return true
	}

	host := strings.TrimPrefix(strings.TrimSuffix(socket.Host, "]"), "[")

	return host == UnspecifiedIPv6

}

func (socket *Socket) HasHost() bool {
	return socket.Host != "" && socket.IsAny() == false && socket.IsUnspecified() == false
}

func (socket *Socket) HasPort() bool {
	return socket.Port != 0
}

func (socket *Socket) IsValid() bool {

	if socket.IsUnset() {
		return false
	}

	if socket.Type == AddressTypeIPv4 {

		if socket.IsAny() || socket.IsUnspecified() {
			return true
		}

		return IsIPv4(socket.Host)

	} else if socket.Type == AddressTypeIPv6 {

		if socket.IsAny() || socket.IsUnspecified() {
			return true
		}

		return IsIPv6(socket.Host)

	} else if socket.Type == AddressTypeDomain {
		return IsDomain(socket.Host)
	}

	return false

}

func (socket *Socket) SetHost(value string) {

	if IsIPv6(value) {

		ipv6 := ParseIPv6(value)

		if ipv6 != nil {
			socket.Host = ipv6.String()
			socket.Scope = ipv6.Scope()
			socket.Type = AddressTypeIPv6
		}

	} else if IsIPv4(value) {

		ipv4 := ParseIPv4(value)

		if ipv4 != nil {
			socket.Host = ipv4.String()
			socket.Scope = ipv4.Scope()
			socket.Type = AddressTypeIPv4
		}

	} else if IsDomain(value) {

		domain := ParseDomain(value)

		if domain != nil {
			socket.Host = domain.String()
			socket.Scope = "public"
			socket.Type = AddressTypeDomain
		}

	} else if value == HostAny || value == "all" || value == HostWildcard {

		socket.Host = HostWildcard
		socket.Scope = "public"
		socket.Type = AddressTypeIPv4

	}

}

func (socket *Socket) SetPort(value uint16) {

	// port 0 is used for host blocking
	if value > 0 {
		socket.Port = value
	}

}

func (socket *Socket) SetScope(value string) {

	if value == "private" || value == "public" {
		socket.Scope = value
	}

}
