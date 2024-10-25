package module

import "tholian-firewall/types"
import "bytes"
import "encoding/binary"
import "net"

func ToBPFIPv4(address string, prefix uint8) []byte {

	var result []byte

	if types.IsIPv4(address) {

		result = make([]byte, 4+4)
		binary.NativeEndian.PutUint32(result[0:4], uint32(prefix))

		buffer := net.ParseIP(address).To4()

		if buffer != nil {

			tmp := bytes.NewBuffer(buffer)
			binary.Read(tmp, binary.BigEndian, result[4:8])

		}

	}

	return result

}
