package module

import "strings"
import "encoding/binary"
import "hash/fnv"

func ToBPFDomain(value string) []byte {

	var result []byte

	domain := strings.ToLower(strings.TrimSpace(value))
	domain = strings.TrimSuffix(domain, ".")

	if domain != "" {

		labels := strings.Split(domain, ".")
		wire := make([]byte, 0, len(domain)+2)
		valid := true

		for l := 0; l < len(labels); l++ {

			if len(labels[l]) < 1 || len(labels[l]) > 63 {
				valid = false
				break
			}

			wire = append(wire, byte(len(labels[l])))
			wire = append(wire, []byte(labels[l])...)

		}

		if valid == true {

			wire = append(wire, 0)

			hasher := fnv.New64a()
			hasher.Write(wire)

			result = make([]byte, 8)
			binary.NativeEndian.PutUint64(result, hasher.Sum64())

		}

	}

	return result

}
