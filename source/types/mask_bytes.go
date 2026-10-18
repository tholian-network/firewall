package types

func mask_bytes(value []byte, prefix uint8) []byte {

	result := make([]byte, len(value))
	copy(result, value)

	full := int(prefix) / 8
	remainder := int(prefix) % 8

	if full >= len(result) {
		return result
	}

	if remainder == 0 {

		for b := full; b < len(result); b++ {
			result[b] = 0
		}

	} else {

		result[full] = result[full] & byte(0xff<<(8-remainder))

		for b := full + 1; b < len(result); b++ {
			result[b] = 0
		}

	}

	return result

}
