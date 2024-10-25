package types

type Connection struct {
	Source   Socket   `json:"source"`
	Target   Socket   `json:"target"`
	Protocol Protocol `json:"protocol"`
	Type     string   `json:"type"`
}

func NewConnection() Connection {

	var connection Connection

	connection.Source = NewSocket("0.0.0.0", 0)
	connection.Target = NewSocket("0.0.0.0", 0)

	return connection

}

func (connection *Connection) IsIdentical(value Connection) bool {

	var result bool = false

	if connection.Source.Host == value.Source.Host &&
		connection.Source.Port == value.Source.Port &&
		connection.Target.Host == value.Target.Host &&
		connection.Target.Port == value.Target.Port &&
		connection.Protocol == value.Protocol &&
		connection.Type == value.Type {
		result = true
	}

	return result

}

func (connection *Connection) IsValid() bool {

	var result bool = false

	if connection.Type == "client" {

		if connection.Source.Type == "ipv4" && connection.Target.Type == "ipv4" {

			// ipv4:port -> host and port
			// ipv4:0    -> host
			// *:port    -> port

			if connection.Target.Host == "*" && connection.Target.Port != 0 {
				result = true
			} else if connection.Target.Host != "0.0.0.0" && connection.Target.Port != 0 {
				result = true
			} else if connection.Target.Host != "0.0.0.0" && connection.Target.Port == 0 {
				result = true
			}

		} else if connection.Source.Type == "ipv6" && connection.Target.Type == "ipv6" {

			// ipv6:port -> host and port
			// ipv6:0    -> host
			// *:port    -> port

			if connection.Target.Host == "*" && connection.Target.Port != 0 {
				result = true
			} else if connection.Target.Host != "[0000:0000:0000:0000:0000:0000:0000:0000]" && connection.Target.Port != 0 {
				result = true
			} else if connection.Target.Host != "[0000:0000:0000:0000:0000:0000:0000:0000]" && connection.Target.Port == 0 {
				result = true
			}

		} else if connection.Target.Type == "domain" {

			// domain:port -> domain and port
			// domain:0    -> domain

			if connection.Target.Host != "*" {
				result = true
			}

		}

	} else if connection.Type == "server" {

		if connection.Target.Type == "ipv4" {

			// servers can be bound to 0.0.0.0 host

			if connection.Source.Host == "*" && connection.Source.Port != 0 {
				result = true
			} else if connection.Source.Host != "0.0.0.0" && connection.Source.Port != 0 {
				result = true
			} else if connection.Source.Host != "0.0.0.0" && connection.Source.Port == 0 {
				result = true
			} else if connection.Target.Host != "0.0.0.0" && connection.Target.Port != 0 {
				result = true
			} else if connection.Target.Host == "0.0.0.0" && connection.Target.Port != 0 {
				result = true
			}

		} else if connection.Target.Type == "ipv6" {

			// servers can be bound to ::0 host

			if connection.Source.Host == "*" && connection.Source.Port != 0 {
				result = true
			} else if connection.Source.Host != "[0000:0000:0000:0000:0000:0000:0000:0000]" && connection.Source.Port != 0 {
				result = true
			} else if connection.Source.Host != "[0000:0000:0000:0000:0000:0000:0000:0000]" && connection.Source.Port == 0 {
				result = true
			}

		} else if connection.Target.Type == "domain" {

			// Reverse DNS Blocking (?) Not Supported

		}

	} else if connection.Type == "peer" {

		if connection.Source.Type == "ipv4" && connection.Target.Type == "ipv4" {

			if connection.Source.Host != "*" && connection.Target.Host != "*" {

				if connection.Source.Host != "0.0.0.0" && connection.Source.Port != 0 {

					if connection.Target.Host != "0.0.0.0" && connection.Target.Port != 0 {
						result = true
					}

				}

			}

		} else if connection.Source.Type == "ipv6" && connection.Target.Type == "ipv6" {

			if connection.Source.Host != "*" && connection.Target.Host != "*" {

				if connection.Source.Host != "[0000:0000:0000:0000:0000:0000:0000:0000]" && connection.Source.Port != 0 {

					if connection.Target.Host != "[0000:0000:0000:0000:0000:0000:0000:0000]" && connection.Target.Port != 0 {
						result = true
					}

				}

			}

		}

	}

	return result

}

func (connection *Connection) SetSource(value Socket) {

	if value.IsValid() {
		connection.Source = value
	}

}

func (connection *Connection) SetTarget(value Socket) {

	if value.IsValid() {
		connection.Target = value
	}

}

func (connection *Connection) SetProtocol(value Protocol) {

	if value == ProtocolTCP {
		connection.Protocol = value
	} else if value == ProtocolUDP {
		connection.Protocol = value
	} else if value == ProtocolANY {
		connection.Protocol = value
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
