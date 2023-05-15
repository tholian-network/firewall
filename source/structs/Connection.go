package structs

type SocketAddress struct {
	Host string `json:"host"`
	Port uint16 `json:"port"`
}

func NewSocketAddress() SocketAddress {

	var socketaddress SocketAddress

	socketaddress.Host = "0.0.0.0"
	socketaddress.Port = 0

	return socketaddress

}

func (socketaddress *SocketAddress) IsValid() bool {

	var result bool = true

	if socketaddress.Host == "" || socketaddress.Host == "0.0.0.0" {
		result = false
	}

	if socketaddress.Port == 0 {
		result = false
	}

	return result

}

type Connection struct {
	Source   SocketAddress `json:"source"`
	Target   SocketAddress `json:"target"`
	Protocol string        `json:"protocol"`
	Type     string        `json:"type"`
}

func NewConnection() Connection {

	var connection Connection

	connection.Source = NewSocketAddress()
	connection.Target = NewSocketAddress()

	return connection

}

func (connection *Connection) IsValid() bool {

	if connection.Type == "client" {

		var result bool = true

		if connection.Source.Host == "0.0.0.0" || connection.Source.Port == 0 {
			result = false
		}

		if connection.Target.Host == "0.0.0.0" || connection.Target.Port == 0 {
			result = false
		}

		if connection.Protocol != "tcp" && connection.Protocol != "udp" {
			result = false
		}

		return result

	} else if connection.Type == "server" {

		var result bool = true

		// Source Host can be anything
		// (0.0.0.0 is for listeners with unbound network hosts)
		if connection.Source.Port == 0 {
			result = false
		}

		// Target Host has to be 0.0.0.0 or [::]
		if connection.Target.Host != "0.0.0.0" && connection.Target.Host != "[0000:0000:0000:0000:0000:0000:0000:0000]" {
			result = false
		}

		if connection.Protocol != "tcp" && connection.Protocol != "udp" {
			result = false
		}

		return result

	}

	return false

}

func (connection *Connection) SetSource(ip_or_domain string, port uint16) {

	var source = NewSocketAddress()

	if isIPv6(ip_or_domain) {
		source.Host = ip_or_domain
		source.Port = port
	} else if isIPv4(ip_or_domain) {
		source.Host = ip_or_domain
		source.Port = port
	} else if isDomain(ip_or_domain) {
		source.Host = ip_or_domain
		source.Port = port
	}

	if source.Port != 0 {
		connection.Source = source
	}

}

func (connection *Connection) SetTarget(ip_or_domain string, port uint16) {

	var target = NewSocketAddress()

	if isIPv6(ip_or_domain) {
		target.Host = ip_or_domain
		target.Port = port
	} else if isIPv4(ip_or_domain) {
		target.Host = ip_or_domain
		target.Port = port
	} else if isDomain(ip_or_domain) {
		target.Host = ip_or_domain
		target.Port = port
	}

	if target.Port != 0 {
		connection.Target = target
	}

}

func (connection *Connection) SetProtocol(value string) {

	if value == "tcp" {
		connection.Protocol = "tcp"
	} else if value == "udp" {
		connection.Protocol = "udp"
	} else if value == "*" {
		connection.Protocol = "*"
	}

}

func (connection *Connection) SetType(value string) {

	if value == "client" {

		// established, syn_sent, syn_recv, fin_wait1, fin_wait2, new_syn_recv

		connection.Type = "client"

	} else if value == "server" {

		// listen

		connection.Type = "server"

	} else if value == "peer" {

		// both directions

		connection.Type = "peer"

	}

}
