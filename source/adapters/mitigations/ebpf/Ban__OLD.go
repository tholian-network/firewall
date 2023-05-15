package ebpf

import "github.com/cilium/ebpf"
import "fmt"

func Ban(value string) bool {

	if isIPv4(value) {

		if BPF.IPv4Bans != nil {

			fmt.Println(value, toIPv4(value))

			err := BPF.IPv4Bans.Update(toIPv4(value), uint8(1), ebpf.UpdateAny)

			fmt.Println(err)

		}
		// map.Lookup(key, &outvalue)
		// map.Update(key, value, UpdateAny)

	} else if isIPv6(value) {
	} else if isPort(value) {
	}

	return false
}

// func (objects *BPF_OBJECTS) Unban (ipv4_or_ipv6_or_port string) bool {
//
// 	// map.Delete(key)
//
// 	return false
// }
//
// func IsBanned (value string) bool {
//
// 	if isIPv4(value) {
//
// 		var bpf_value uint8
//
// 		err := objects.BPF_MAPS.IPv4Bans.Lookup(toIPv4(value), bpf_value)
//
// 		fmt.Println(err)
//
// 		if err == nil {
// 			return bpf_value == 1
// 		}
//
// 	} else if isIPv6(value) {
//
// 		// TODO
//
// 	} else if isPort(value) {
//
// 		// TODO
//
// 	}
//
// 	return false
// }
