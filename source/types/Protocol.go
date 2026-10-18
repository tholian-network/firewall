package types

type Protocol string

const (
	ProtocolANY        Protocol = "any"
	ProtocolHTTPS      Protocol = "https"
	ProtocolHTTP       Protocol = "http"
	ProtocolDNS        Protocol = "dns"
	ProtocolDNSoverTLS Protocol = "dns-over-tls"
	ProtocolICMP       Protocol = "icmp"
	ProtocolSSH        Protocol = "ssh"
	ProtocolSOCKS      Protocol = "socks"
	ProtocolWHOIS      Protocol = "whois"
	ProtocolTCP        Protocol = "tcp"
	ProtocolUDP        Protocol = "udp"
)

func (protocol Protocol) IsAny() bool {
	return protocol == "" || protocol == ProtocolANY
}

func (protocol Protocol) IsValid() bool {

	switch protocol {
	case "", ProtocolANY, ProtocolHTTPS, ProtocolHTTP, ProtocolDNS, ProtocolDNSoverTLS, ProtocolICMP, ProtocolSSH, ProtocolSOCKS, ProtocolWHOIS, ProtocolTCP, ProtocolUDP:
		return true
	}

	return false

}

func (protocol Protocol) String() string {
	return string(protocol)
}
