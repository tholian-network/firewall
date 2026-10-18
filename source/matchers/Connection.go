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

	connection.Socket.Host = Any
	connection.Socket.Port = 0
	connection.Protocol = ProtocolAny
	connection.Type = ConnectionTypePeer

	return connection

}

func ToConnection(value string) Connection {

	var connection Connection

	connection.Socket.Host = Any
	connection.Socket.Port = 0
	connection.Protocol = ProtocolAny
	connection.Type = ConnectionTypePeer

	connection.Parse(value)

	return connection

}

func (connection *Connection) HasHost() bool {
	return connection.Socket.Host != "" && connection.Socket.Host != Any && connection.Socket.Host != types.HostWildcard
}

func (connection *Connection) HasPort() bool {
	return connection.Socket.Port != 0
}

func (connection *Connection) IsWildcard() bool {
	return connection.Socket.Host == Any || connection.Socket.Host == types.HostWildcard
}

func (connection *Connection) IsDomain() bool {
	return types.IsDomain(connection.Socket.Host)
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

	if connection.Type != ConnectionTypeClient && connection.Type != ConnectionTypeServer && connection.Type != ConnectionTypePeer {
		return false
	}

	if connection.HasHost() {

		if types.IsIPv4(connection.Socket.Host) == false &&
			types.IsIPv6(connection.Socket.Host) == false &&
			types.IsDomain(connection.Socket.Host) == false {
			return false
		}

	}

	if connection.Protocol != "" && connection.Protocol != ProtocolAny && connection.Protocol != ProtocolTCP && connection.Protocol != ProtocolUDP {
		return false
	}

	return connection.HasHost() || connection.HasPort()

}

func (connection *Connection) Matches(host string, port uint16, protocol string, typ string) bool {

	if connection.IsValid() == false {
		return false
	}

	matches_host := connection.HasHost() == false || connection.Socket.Host == host
	matches_port := connection.HasPort() == false || connection.Socket.Port == port
	matches_protocol := connection.Protocol == "" || connection.Protocol == ProtocolAny || connection.Protocol == protocol
	matches_type := connection.Type == Any || connection.Type == typ

	return matches_host && matches_port && matches_protocol && matches_type

}

func (connection *Connection) Parse(value string) {

	if strings.Contains(value, ":") {

		host := strings.TrimSpace(value[0:strings.LastIndex(value, ":")])
		port := strings.TrimSpace(value[strings.LastIndex(value, ":")+1:])

		if strings.HasSuffix(port, "TC") {

			connection.SetProtocol(ProtocolTCP)
			connection.SetType(ConnectionTypeClient)
			port = port[0 : len(port)-2]

		} else if strings.HasSuffix(port, "TP") {

			connection.SetProtocol(ProtocolTCP)
			connection.SetType(ConnectionTypePeer)
			port = port[0 : len(port)-2]

		} else if strings.HasSuffix(port, "TS") {

			connection.SetProtocol(ProtocolTCP)
			connection.SetType(ConnectionTypeServer)
			port = port[0 : len(port)-2]

		} else if strings.HasSuffix(port, "UC") {

			connection.SetProtocol(ProtocolUDP)
			connection.SetType(ConnectionTypeClient)
			port = port[0 : len(port)-2]

		} else if strings.HasSuffix(port, "UP") {

			connection.SetProtocol(ProtocolUDP)
			connection.SetType(ConnectionTypePeer)
			port = port[0 : len(port)-2]

		} else if strings.HasSuffix(port, "US") {

			connection.SetProtocol(ProtocolUDP)
			connection.SetType(ConnectionTypeServer)
			port = port[0 : len(port)-2]

		} else if strings.HasSuffix(port, "AC") {

			connection.SetProtocol(ProtocolAny)
			connection.SetType(ConnectionTypeClient)
			port = port[0 : len(port)-2]

		} else if strings.HasSuffix(port, "AP") {

			connection.SetProtocol(ProtocolAny)
			connection.SetType(ConnectionTypePeer)
			port = port[0 : len(port)-2]

		} else if strings.HasSuffix(port, "AS") {

			connection.SetProtocol(ProtocolAny)
			connection.SetType(ConnectionTypeServer)
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

	} else if value == "all" || value == Any || value == types.HostWildcard {
		connection.Socket.Host = Any
	}

}

func (connection *Connection) SetPort(value uint16) {

	if value > 0 {
		connection.Socket.Port = value
	}

}

func (connection *Connection) SetProtocol(value string) {

	if value == ProtocolTCP {
		connection.Protocol = ProtocolTCP
	} else if value == ProtocolUDP {
		connection.Protocol = ProtocolUDP
	} else if value == ProtocolAny {
		connection.Protocol = ProtocolAny
	}

}

func (connection *Connection) SetType(value string) {

	if value == ConnectionTypeClient {
		connection.Type = ConnectionTypeClient
	} else if value == ConnectionTypePeer {
		connection.Type = ConnectionTypePeer
	} else if value == ConnectionTypeServer {
		connection.Type = ConnectionTypeServer
	} else if value == Any {
		connection.Type = ConnectionTypePeer
	}

}

func (connection *Connection) Hash() string {

	var hash string

	if connection.HasPort() {

		hash = connection.Socket.Host + ":" + strconv.FormatUint(uint64(connection.Socket.Port), 10)

		if connection.Protocol == ProtocolTCP {
			hash += "T"
		} else if connection.Protocol == ProtocolUDP {
			hash += "U"
		} else if connection.Protocol == ProtocolAny {
			hash += "A"
		}

		if connection.Type == ConnectionTypeClient {
			hash += "C"
		} else if connection.Type == ConnectionTypePeer {
			hash += "P"
		} else if connection.Type == ConnectionTypeServer {
			hash += "S"
		}

	}

	return hash

}
