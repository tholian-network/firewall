package module

import "encoding/binary"

func ToBPFPort(value uint16) []byte {

	var result []byte

	if value > 0 {

		result = make([]byte, 2)
		binary.BigEndian.PutUint16(result, value)

	}

	return result

}
