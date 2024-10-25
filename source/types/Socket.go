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

func (socket *Socket) IsValid() bool {

	var result bool = false

	if socket.Type == "ipv4" {

		if socket.Host == "*" {
			result = true
		} else if socket.Host == "0.0.0.0" {
			result = true
		} else if socket.Host != "0.0.0.0" {
			result = true
		}

	} else if socket.Type == "ipv6" {

		if socket.Host == "*" {
			result = true
		} else if socket.Host == "[0000:0000:0000:0000:0000:0000:0000:0000]" {
			result = true
		} else if socket.Host != "[0000:0000:0000:0000:0000:0000:0000:0000]" {
			result = true
		}

	} else if socket.Type == "domain" {

		if socket.Host != "" {

			if socket.Port != 0 {
				result = true
			}

		}

	}

	return result

}

func (socket *Socket) SetHost(value string) {

	if IsIPv6(value) {

		ipv6 := ParseIPv6(value)

		if ipv6 != nil {
			socket.Host = ipv6.String()
			socket.Scope = ipv6.Scope()
			socket.Type = "ipv6"
		}

	} else if IsIPv4(value) {

		ipv4 := ParseIPv4(value)

		if ipv4 != nil {
			socket.Host = ipv4.String()
			socket.Scope = ipv4.Scope()
			socket.Type = "ipv4"
		}

	} else if IsDomain(value) {

		domain := ParseDomain(value)

		if domain != nil {
			socket.Host = domain.String()
			socket.Scope = "public"
			socket.Type = "domain"
		}

	} else if value == "*" {

		socket.Host = "*"
		socket.Scope = "public"
		socket.Type = "ipv4"

	}

}

func (socket *Socket) SetPort(value uint16) {

	// port 0 is used for host blocking
	if value >= 0 && value < 65535 {
		socket.Port = value
	}

}

func (socket *Socket) SetScope(value string) {

	if value == "private" || value == "public" {
		socket.Scope = value
	}

}
