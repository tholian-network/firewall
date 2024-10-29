package matchers

import "strconv"
import "strings"

func toSubnet(value string) (string, uint8) {

	var address string
	var prefix uint8

	if strings.HasPrefix(value, "[") && strings.Contains(value, "]/") {

		tmp1 := value[0 : strings.Index(value, "]/")+1]
		tmp2, err := strconv.ParseUint(strings.Split(value, "]/")[1], 10, 8)

		if err == nil {
			address = strings.ToLower(tmp1)
			prefix = uint8(tmp2)
		}

	} else if strings.HasPrefix(value, "[") && strings.HasSuffix(value, "]") {

		address = strings.ToLower(value)
		prefix = uint8(128)

	} else if strings.Contains(value, ":") && strings.Contains(value, "/") {

		tmp1 := strings.Split(value, "/")[0]
		tmp2, err := strconv.ParseUint(strings.Split(value, "/")[1], 10, 8)

		if err == nil {
			address = strings.ToLower(tmp1)
			prefix = uint8(tmp2)
		}

	} else if strings.Contains(value, ":") {

		address = "[" + strings.ToLower(value) + "]"
		prefix = uint8(128)

	} else if strings.Contains(value, ".") && strings.Contains(value, "/") {

		tmp1 := strings.Split(value, "/")[0]
		tmp2, err := strconv.ParseUint(strings.Split(value, "/")[1], 10, 8)

		if err == nil {
			address = tmp1
			prefix = uint8(tmp2)
		}

	} else if strings.Contains(value, ".") {

		address = value
		prefix = uint8(32)

	}

	return address, prefix

}
