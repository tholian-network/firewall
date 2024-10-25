package types

import "strconv"
import "strings"

type ASN int

func IsASN(value string) bool {

	var result bool = false

	if strings.HasPrefix(value, "AS") && len(value) >= 3 {

		result = true

		for v := 2; v < len(value); v++ {

			chr := string(value[v])

			if chr >= "0" && chr <= "9" {
				continue
			} else {
				result = false
				break
			}

		}

	}

	return result

}

func ParseASN(value string) *ASN {

	var result *ASN = nil

	if strings.HasPrefix(value, "AS") {

		num, err := strconv.ParseInt(value[2:], 10, 64)

		if err == nil {
			asn := ASN(num)
			result = &asn
		}

	} else {

		num, err := strconv.ParseInt(value, 10, 64)

		if err == nil {
			asn := ASN(num)
			result = &asn
		}

	}

	return result

}

func (asn ASN) String() string {
	return "AS" + strconv.Itoa(int(asn))
}
