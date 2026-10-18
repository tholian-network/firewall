package types

import "strconv"
import "strings"

type Domain string

func isASCIILabel(value string) bool {

	var result bool = true

	for v := 0; v < len(value); v++ {

		character := string(value[v])

		if character >= "0" && character <= "9" {
			continue
		} else if character >= "A" && character <= "Z" {
			continue
		} else if character >= "a" && character <= "z" {
			continue
		} else if character == "-" || character == "_" {
			continue
		} else {
			result = false
			break
		}

	}

	return result

}

func IsDomain(value string) bool {

	value = strings.TrimSpace(value)
	value = strings.TrimSuffix(value, ".")

	if value == "" || len(value) > 253 || strings.Contains(value, ".") == false {
		return false
	}

	labels := strings.Split(value, ".")

	if len(labels) < 2 {
		return false
	}

	for l := 0; l < len(labels); l++ {

		if len(labels[l]) < 1 || len(labels[l]) > 63 {
			return false
		}

		if isASCIILabel(labels[l]) == false {
			return false
		}

	}

	tld := labels[len(labels)-1]

	return len(tld) >= 2

}

func IsDomainAndPort(value string) bool {

	if strings.Contains(value, ":") {

		tmp := strings.Split(value, ":")

		if len(tmp) == 2 {

			_, err := strconv.ParseUint(tmp[1], 10, 16)

			if IsDomain(tmp[0]) && err == nil {
				return true
			}

		}

	}

	return false

}

func ParseDomain(value string) *Domain {

	var result *Domain = nil

	if IsDomain(value) {
		domain := Domain(strings.TrimSuffix(strings.TrimSpace(value), "."))
		result = &domain
	}

	return result

}

func ParseDomainAndPort(value string) (*Domain, uint16) {

	var result_domain *Domain = nil
	var result_port uint16 = 0

	if strings.Contains(value, ":") {

		tmp1 := strings.Split(value, ":")

		if len(tmp1) == 2 {

			tmp2 := ParseDomain(tmp1[0])
			num, err := strconv.ParseUint(tmp1[1], 10, 16)

			if tmp2 != nil && err == nil {
				result_domain = tmp2
				result_port = uint16(num)
			}

		}

	}

	return result_domain, result_port

}

func (domain Domain) IsValid() bool {
	return IsDomain(string(domain))
}

func (domain Domain) Bytes() []byte {
	return []byte(domain)
}

func (domain Domain) Scope() string {
	return "public"
}

func (domain Domain) String() string {
	return string(domain)
}
