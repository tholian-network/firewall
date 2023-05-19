package ebpf

import "tholian-endpoint/console"
import "github.com/cilium/ebpf"
import "github.com/cilium/ebpf/link"
import "bytes"
import "encoding/binary"
import "net"
import "strconv"
import "strings"

var SUPPORTED bool

var BPF struct {
	Program  *ebpf.Program `ebpf:"xdp_prog_main"`
	IPv4Bans *ebpf.Map     `ebpf:"ipv4_bans"`
	IPv6Bans *ebpf.Map     `ebpf:"ipv6_bans"`
	PortBans *ebpf.Map     `ebpf:"port_bans"`
}

var LINKS map[string]*link.Link

var BPF_SPECIFICATIONS = ebpf.CollectionSpec{
	Maps: map[string]*ebpf.MapSpec{
		"ipv4_bans": {
			Type:       ebpf.Hash,
			KeySize:    4,
			ValueSize:  1,
			MaxEntries: 500000,
		},
		"ipv6_bans": {
			Type:       ebpf.Hash,
			KeySize:    16,
			ValueSize:  1,
			MaxEntries: 500000,
		},
		"port_bans": {
			Type:       ebpf.Hash,
			KeySize:    2,
			ValueSize:  1,
			MaxEntries: 65535,
		},
	},
	Programs: map[string]*ebpf.ProgramSpec{
		"xdp_prog_main": {
			Type:    ebpf.XDP,
			License: "GPL",
		},
	},
}

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

func isDomain(value string) bool {

	if strings.Contains(value, ".") {

		var chunks = strings.Split(value, ".")
		var valid bool = true

		if len(chunks) >= 2 {

			valid = true

			for c := 0; c < len(chunks); c++ {

				var chunk = chunks[c]

				if len(chunk) >= 2 {
					// Do Nothing
				} else {
					valid = false
					break
				}

			}

		} else if len(chunks) == 1 {

			if len(chunks[0]) >= 3 {
				valid = true
			}

		}

		return valid

	}

	return false

}

func isPort(value string) bool {

	if strings.HasPrefix(value, ":") {

		num, err := strconv.Atoi(value[1:])

		if err == nil && num >= 1 && num <= 65535 {
			return true
		}

	}

	return false

}

func isIPv4(value string) bool {

	if strings.Contains(value, ".") {

		var chunks = strings.Split(value, ".")
		var valid bool = true

		if len(chunks) == 4 {

			for c := 0; c < len(chunks); c++ {

				_, err := strconv.ParseUint(chunks[c], 10, 8)

				if err != nil {
					valid = false
					break
				}

			}

		}

		return valid

	}

	return false

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

func isIPv6(value string) bool {

	if strings.HasPrefix(value, "[") && strings.Contains(value, ":") && strings.HasSuffix(value, "]") {

		var chunks = strings.Split(value[1:len(value)-1], ":")
		var valid bool = true

		if len(chunks) == 8 {

			for c := 0; c < len(chunks); c++ {

				_, err := strconv.ParseUint(chunks[c], 16, 64)

				if err != nil {
					valid = false
					break
				}

			}

		}

		return valid

	} else if strings.Contains(value, ":") {

		var chunks = strings.Split(value[1:len(value)-1], ":")
		var valid bool = true

		if len(chunks) == 8 {

			for c := 0; c < len(chunks); c++ {

				_, err := strconv.ParseUint(chunks[c], 16, 64)

				if err != nil {
					valid = false
					break
				}

			}

		}

		return valid

	}

	return false

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
