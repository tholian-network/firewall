package module

import "tholian-firewall/types"
import "bytes"
import "encoding/binary"
import "net"
import "strings"

func ToBPFIPv6(address string, prefix uint8) []byte {

	var result []byte

	if types.IsIPv6(address) {

		result = make([]byte, 4+16)
		binary.NativeEndian.PutUint32(result[0:4], uint32(prefix))

		value := address

		if strings.HasPrefix(value, "[") && strings.HasSuffix(value, "]") {
			value = value[1 : len(value)-1]
		}

		buffer := net.ParseIP(value).To16()

		if buffer != nil {

			tmp := bytes.NewBuffer(buffer)
			binary.Read(tmp, binary.BigEndian, result[4:20])

		}

	}

	return result

}
