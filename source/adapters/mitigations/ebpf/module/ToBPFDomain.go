package module

func ToBPFDomain(value string) []byte {

	var result []byte

	result = make([]byte, 254)
	buffer := []byte(value)

	bytes := 254

	if len(buffer) < 254 {
		bytes = len(buffer)
	}

	for b := 0; b < bytes; b++ {
		result[b] = buffer[b]
	}

	return result

}
