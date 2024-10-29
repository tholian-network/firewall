package matchers

import "tholian-firewall/types"
import "strconv"
import "strings"

type Connection struct {
	Socket struct {
		Host string `json:"host"`
		Port uint16 `json:"port"`
	} `json:"socket"`
	Protocol string `json:"protocol"`
	Type     string `json:"type"`
}

func NewConnection() Connection {

	var connection Connection

	connection.Socket.Host = "any"
	connection.Socket.Port = 0
	connection.Protocol = "any"
	connection.Type = "peer"

	return connection

}

func ToConnection(value string) Connection {

	var connection Connection

	connection.Socket.Host = "any"
	connection.Socket.Port = 0
	connection.Protocol = "any"
	connection.Type = "peer"

	connection.Parse(value)

	return connection

}

func (connection *Connection) IsIdentical(value Connection) bool {

	var result bool = false

	if connection.Socket.Host == value.Socket.Host &&
		connection.Socket.Port == value.Socket.Port &&
		connection.Protocol == value.Protocol &&
		connection.Type == value.Type {
		result = true
	}

	return result

}

func (connection *Connection) IsValid() bool {

	var result bool = false

	if uint(connection.Socket.Port) > 0 && uint(connection.Socket.Port) < 65535 {
		result = true
	}

	return result

}

func (connection *Connection) Matches(host string, port uint16, protocol string, typ string) bool {

	var matches_host bool = false
	var matches_port bool = false
	var matches_protocol bool = false
	var matches_type bool = false

	if connection.Socket.Host == host {
		matches_host = true
	} else if connection.Socket.Host == "any" {
		matches_host = true
	}

	if connection.Socket.Port == port {
		matches_port = true
	} else if connection.Socket.Port == 0 {
		matches_port = true
	}

	if connection.Protocol == protocol {
		matches_protocol = true
	} else if connection.Protocol == "any" {
		matches_protocol = true
	}

	if connection.Type == typ {
		matches_type = true
	} else if connection.Type == "any" {
		matches_type = true
	}

	return matches_host && matches_port && matches_protocol && matches_type

}

func (connection *Connection) Parse(value string) {

	if strings.Contains(value, ":") {

		host := strings.TrimSpace(value[0:strings.LastIndex(value, ":")])
		port := strings.TrimSpace(value[strings.LastIndex(value, ":")+1:])

		if strings.HasSuffix(port, "TC") {

			connection.SetProtocol("tcp")
			connection.SetType("client")
			port = port[0 : len(port)-2]

		} else if strings.HasSuffix(port, "TP") {

			connection.SetProtocol("tcp")
			connection.SetType("peer")
			port = port[0 : len(port)-2]

		} else if strings.HasSuffix(port, "TS") {

			connection.SetProtocol("tcp")
			connection.SetType("server")
			port = port[0 : len(port)-2]

		} else if strings.HasSuffix(port, "UC") {

			connection.SetProtocol("udp")
			connection.SetType("client")
			port = port[0 : len(port)-2]

		} else if strings.HasSuffix(port, "UP") {

			connection.SetProtocol("udp")
			connection.SetType("peer")
			port = port[0 : len(port)-2]

		} else if strings.HasSuffix(port, "US") {

			connection.SetProtocol("udp")
			connection.SetType("server")
			port = port[0 : len(port)-2]

		} else if strings.HasSuffix(port, "AC") {

			connection.SetProtocol("any")
			connection.SetType("client")
			port = port[0 : len(port)-2]

		} else if strings.HasSuffix(port, "AP") {

			connection.SetProtocol("any")
			connection.SetType("peer")
			port = port[0 : len(port)-2]

		} else if strings.HasSuffix(port, "AS") {

			connection.SetProtocol("any")
			connection.SetType("server")
			port = port[0 : len(port)-2]

		}

		num, err := strconv.ParseUint(port, 10, 16)

		if err == nil {

			connection.SetHost(host)
			connection.SetPort(uint16(num))

		}

	} else {

		connection.SetHost(value)

	}

}

func (connection *Connection) SetHost(value string) {

	if types.IsIPv6(value) {

		ipv6 := types.ParseIPv6(value)

		if ipv6 != nil {
			connection.Socket.Host = ipv6.String()
		}

	} else if types.IsIPv4(value) {

		ipv4 := types.ParseIPv4(value)

		if ipv4 != nil {
			connection.Socket.Host = ipv4.String()
		}

	} else if types.IsDomain(value) {

		domain := types.ParseDomain(value)

		if domain != nil {
			connection.Socket.Host = domain.String()
		}

	} else if value == "all" || value == "any" || value == "*" {
		connection.Socket.Host = "any"
	}

}

func (connection *Connection) SetPort(value uint16) {

	if value > 0 && value < 65535 {
		connection.Socket.Port = value
	}

}

func (connection *Connection) SetProtocol(value string) {

	if value == "tcp" {
		connection.Protocol = "tcp"
	} else if value == "udp" {
		connection.Protocol = "udp"
	} else if value == "any" {
		connection.Protocol = "any"
	}

}

func (connection *Connection) SetType(value string) {

	if value == "client" {
		connection.Type = "client"
	} else if value == "peer" {
		connection.Type = "peer"
	} else if value == "server" {
		connection.Type = "server"
	} else if value == "any" {
		connection.Type = "peer"
	}

}

func (connection *Connection) Hash() string {

	var hash string

	if connection.Socket.Port != 0 {

		if types.IsIPv6(connection.Socket.Host) {
			hash = connection.Socket.Host
		} else if types.IsIPv4(connection.Socket.Host) {
			hash = connection.Socket.Host
		} else if types.IsDomain(connection.Socket.Host) {
			hash = connection.Socket.Host
		} else {
			hash = connection.Socket.Host
		}

		hash += ":" + strconv.FormatUint(uint64(connection.Socket.Port), 10)

		if connection.Protocol == "tcp" {
			hash += "T"
		} else if connection.Protocol == "udp" {
			hash += "U"
		} else if connection.Protocol == "any" {
			hash += "A"
		}

		if connection.Type == "client" {
			hash += "C"
		} else if connection.Type == "peer" {
			hash += "P"
		} else if connection.Type == "server" {
			hash += "S"
		}

	}

	return hash

}
