package types

type Connection struct {
	Source   Socket   `json:"source"`
	Target   Socket   `json:"target"`
	Protocol Protocol `json:"protocol"`
	Type     string   `json:"type"`
}

func NewConnection() Connection {

	var connection Connection

	return connection

}

func (connection *Connection) IsClient() bool {
	return connection.Type == ConnectionTypeClient
}

func (connection *Connection) IsServer() bool {
	return connection.Type == ConnectionTypeServer
}

func (connection *Connection) IsPeer() bool {
	return connection.Type == ConnectionTypePeer
}

func isValidEndpointRule(socket Socket) bool {

	if socket.IsValid() == false {
		return false
	}

	if socket.IsUnset() || socket.IsUnspecified() {
		return false
	}

	return socket.HasHost() || (socket.IsAny() && socket.HasPort())

}

func isValidEndpoint(socket Socket) bool {
	return socket.IsValid() && socket.HasHost() && socket.HasPort()
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

	if connection.Protocol.IsValid() == false {
		return false
	}

	if connection.IsClient() {
		return isValidEndpointRule(connection.Target)
	} else if connection.IsServer() {
		return isValidEndpointRule(connection.Source)
	} else if connection.IsPeer() {
		return isValidEndpoint(connection.Source) && isValidEndpoint(connection.Target)
	}

	return false

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

	if value.IsValid() {
		connection.Protocol = value
	}

}

func (connection *Connection) SetType(value string) {

	if value == ConnectionTypeClient {

		// established, syn_sent, syn_recv, fin_wait1, fin_wait2, new_syn_recv

		connection.Type = ConnectionTypeClient

	} else if value == ConnectionTypeServer {

		// listen

		connection.Type = ConnectionTypeServer

	} else if value == ConnectionTypePeer {

		// both directions

		connection.Type = ConnectionTypePeer

	}

}
