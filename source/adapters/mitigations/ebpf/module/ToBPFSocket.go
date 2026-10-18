package module

import "encoding/binary"
import "tholian-firewall/types"

func ToBPFIPv4Socket(address string, port uint16) []byte {

	if port == 0 || types.IsIPv4(address) == false {
		return nil
	}

	ipv4 := types.ParseIPv4(address)

	if ipv4 == nil {
		return nil
	}

	result := make([]byte, 4+2)
	copy(result[0:4], (*ipv4)[:])
	binary.BigEndian.PutUint16(result[4:6], port)

	return result

}

func ToBPFIPv6Socket(address string, port uint16) []byte {

	if port == 0 || types.IsIPv6(address) == false {
		return nil
	}

	ipv6 := types.ParseIPv6(address)

	if ipv6 == nil {
		return nil
	}

	result := make([]byte, 16+2)
	copy(result[0:16], (*ipv6)[:])
	binary.BigEndian.PutUint16(result[16:18], port)

	return result

}
