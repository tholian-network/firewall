package structs

type Connection struct {
	Source   Socket `json:"source"`
	Target   Socket `json:"target"`
	Protocol string `json:"protocol"`
	Type     string `json:"type"`
}

func NewConnection() Connection {

	var connection Connection

	connection.Source = NewSocket("0.0.0.0", 0)
	connection.Target = NewSocket("0.0.0.0", 0)

	return connection

}

func (connection *Connection) IsValid() bool {

	var result bool = false

	if connection.Type == "client" {

		result = true

		if connection.Source.Type == "ipv4" && connection.Target.Type == "ipv4" {

			if connection.Source.Host == "0.0.0.0" || connection.Source.Port == 0 {
				result = false
			}

			if connection.Target.Host == "0.0.0.0" || connection.Target.Port == 0 {
				result = false
			}

		} else if connection.Source.Type == "ipv6" && connection.Target.Type == "ipv6" {

			if connection.Source.Host == "[0000:0000:0000:0000:0000:0000:0000:0000]" || connection.Source.Port == 0 {
				result = false
			}

			if connection.Target.Host == "[0000:0000:0000:0000:0000:0000:0000:0000]" || connection.Target.Port == 0 {
				result = false
			}

		}

	} else if connection.Type == "server" {

		if connection.Target.Type == "ipv4" {

			// servers can be bound to 0.0.0.0 host
			if connection.Target.Port != 0 {
				result = true
			}

		} else if connection.Target.Type == "ipv6" {

			// servers can be bound to ::0 host
			if connection.Target.Port != 0 {
				result = true
			}

		}

	} else if connection.Type == "peer" {

		result = true

		if connection.Source.Type == "ipv4" && connection.Target.Type == "ipv4" {

			if connection.Source.Host == "0.0.0.0" || connection.Source.Port == 0 {
				result = false
			}

			if connection.Target.Host == "0.0.0.0" || connection.Target.Port == 0 {
				result = false
			}

		} else if connection.Source.Type == "ipv6" && connection.Target.Type == "ipv6" {

			if connection.Source.Host == "[0000:0000:0000:0000:0000:0000:0000:0000]" || connection.Source.Port == 0 {
				result = false
			}

			if connection.Target.Host == "[0000:0000:0000:0000:0000:0000:0000:0000]" || connection.Target.Port == 0 {
				result = false
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
