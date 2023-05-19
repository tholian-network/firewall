package ebpf

import "github.com/cilium/ebpf"
import "github.com/cilium/ebpf/link"
import "tholian-endpoint/console"
import "tholian-endpoint/structs"
import "bytes"
import "encoding/binary"
import "net"
import "strings"

var SUPPORTED bool

var LINKS map[string]*link.Link

func init() {

	LINKS = make(map[string]*link.Link)

	reader := bytes.NewReader(BPF_MODULE)
	spec, err1 := ebpf.LoadCollectionSpecFromReader(reader)

	if err1 == nil {

		err2 := spec.LoadAndAssign(&BPF, nil)

		if err2 == nil {
			SUPPORTED = true
		} else {
			console.Error(err2.Error())
			SUPPORTED = false
		}

	} else {
		console.Error(err1.Error())
		SUPPORTED = false
	}

}

func toDomain(value string) []byte {

	result := make([]byte, 254)
	buffer := []byte(value)

	var max int = 254

	if len(buffer) < 254 {
		max = len(buffer)
	}

	for b := 0; b < max; b++ {
		result[b] = buffer[b]
	}

	return result

}

func toIPv4(value string) []byte {

	result := make([]byte, 4)
	buffer := net.ParseIP(value).To4()

	if buffer != nil {

		tmp := bytes.NewBuffer(buffer)
		binary.Read(tmp, binary.BigEndian, &result)

	}

	return result

}

func toIPv6(value string) []byte {

	if strings.HasPrefix(value, "[") && strings.HasSuffix(value, "]") {
		value = value[1:len(value)-1]
	}

	result := make([]byte, 16)
	buffer := net.ParseIP(value).To16()

	if buffer != nil {

		tmp := bytes.NewBuffer(buffer)
		binary.Read(tmp, binary.BigEndian, &result)

	}

	return result

}

func toPort(value uint16) []byte {

	result := make([]byte, 2)

	binary.BigEndian.PutUint16(result, value)

	return result

}

func forbid(socket structs.Socket) bool {

	var result bool = false

	if socket.Type == "ipv4" {

		if socket.Port != 0 {

			var result_host bool = false
			var result_port bool = false

			if BPF.IPv4Bans != nil {

				err := BPF.IPv4Bans.Update(toIPv4(socket.Host), uint8(1), ebpf.UpdateAny)

				if err == nil {
					result_host = true
				}

			}

			if BPF.PortBans != nil {

				err := BPF.PortBans.Update(toPort(socket.Port), uint8(1), ebpf.UpdateAny)

				if err == nil {
					result_port = true
				}

			}

			if result_host == true && result_port == true {
				result = true
			}

		} else {

			if BPF.IPv4Bans != nil {

				err := BPF.IPv4Bans.Update(toIPv4(socket.Host), uint8(1), ebpf.UpdateAny)

				if err == nil {
					result = true
				}

			}

		}

	} else if socket.Type == "ipv6" {

		if socket.Port != 0 {

			var result_host bool = false
			var result_port bool = false

			if BPF.IPv6Bans != nil {

				err := BPF.IPv6Bans.Update(toIPv6(socket.Host), uint8(1), ebpf.UpdateAny)

				if err == nil {
					result_host = true
				}

			}

			if BPF.PortBans != nil {

				err := BPF.PortBans.Update(toPort(socket.Port), uint8(1), ebpf.UpdateAny)

				if err == nil {
					result_port = true
				}

			}

			if result_host == true && result_port == true {
				result = true
			}

		} else {

			if BPF.IPv6Bans != nil {

				err := BPF.IPv6Bans.Update(toIPv6(socket.Host), uint8(1), ebpf.UpdateAny)

				if err == nil {
					result = true
				}

			}

		}

	} else if socket.Type == "domain" {

		if socket.Port != 0 {

			var result_host bool = false
			var result_port bool = false

			if BPF.DomainBans != nil {

				err := BPF.DomainBans.Update(toDomain(socket.Host), uint8(1), ebpf.UpdateAny)

				if err == nil {
					result_host = true
				}

			}

			if BPF.PortBans != nil {

				err := BPF.PortBans.Update(toPort(socket.Port), uint8(1), ebpf.UpdateAny)

				if err == nil {
					result_port = true
				}

			}

			if result_host == true && result_port == true {
				result = true
			}

		} else {

			if BPF.DomainBans != nil {

				err := BPF.DomainBans.Update(toDomain(socket.Host), uint8(1), ebpf.UpdateAny)

				if err == nil {
					result = true
				}

			}

		}

	}

	return result

}

func permit(socket structs.Socket) bool {

	var result bool = false

	if socket.Type == "ipv4" {

		if BPF.IPv4Bans != nil {

			err := BPF.IPv4Bans.Delete(toIPv4(socket.Host))

			if err == nil {
				result = true
			} else if err == ebpf.ErrKeyNotExist {
				result = true
			}

		}

	} else if socket.Type == "ipv6" {

		if BPF.IPv6Bans != nil {

			err := BPF.IPv6Bans.Delete(toIPv6(socket.Host))

			if err == nil {
				result = true
			} else if err == ebpf.ErrKeyNotExist {
				result = true
			}

		}

	} else if socket.Type == "domain" {

		if BPF.DomainBans != nil {

			err := BPF.DomainBans.Delete(toDomain(socket.Host))

			if err == nil {
				result = true
			} else if err == ebpf.ErrKeyNotExist {
				result = true
			}

		}

	}

	return result

}

func isForbidden(socket structs.Socket) bool {

	var result bool = false

	if socket.Type == "ipv4" {

		if BPF.IPv4Bans != nil {

			var value uint8;

			err := BPF.IPv4Bans.Lookup(toIPv4(socket.Host), &value)

			if err == nil {

				if value == 1 {
					result = true
				}

			} else if err == ebpf.ErrKeyNotExist {
				result = false
			}

		}

	} else if socket.Type == "ipv6" {

		if BPF.IPv6Bans != nil {

			var value uint8;

			err := BPF.IPv6Bans.Lookup(toIPv6(socket.Host), &value)

			if err == nil {

				if value == 1 {
					result = true
				}

			} else if err == ebpf.ErrKeyNotExist {
				result = false
			}

		}

	} else if socket.Type == "domain" {

		if BPF.DomainBans != nil {

			var value uint8;

			err := BPF.DomainBans.Lookup(toDomain(socket.Host), &value)

			if err == nil {

				if value == 1 {
					result = true
				}

			} else if err == ebpf.ErrKeyNotExist {
				result = false
			}

		}

	}

	return result

}
