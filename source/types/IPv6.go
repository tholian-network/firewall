package types

import "net/netip"
import "strconv"
import "strings"

type IPv6 [16]byte

func normalizeIPv6(value string) (string, bool) {

	value = strings.TrimSpace(value)

	if strings.HasPrefix(value, "[") || strings.HasSuffix(value, "]") {

		if strings.HasPrefix(value, "[") && strings.HasSuffix(value, "]") {
			value = value[1 : len(value)-1]
		} else {
			return "", false
		}

	}

	if value == "" || strings.Contains(value, ".") || strings.Contains(value, "%") {
		return "", false
	}

	address, err := netip.ParseAddr(value)

	if err != nil || address.Is6() == false {
		return "", false
	}

	return value, true

}

func IsIPv6(value string) bool {

	_, ok := normalizeIPv6(value)

	return ok

}

func IsIPv6AndPrefix(value string) bool {

	if strings.HasPrefix(value, "[") && strings.Contains(value, "]/") {

		tmp := strings.Split(value[1:], "]/")

		if len(tmp) == 2 {

			prefix, err := strconv.ParseUint(tmp[1], 10, 64)

			if IsIPv6("["+tmp[0]+"]") && err == nil && prefix <= 128 {
				return true
			}

		}

	}

	return false

}

func IsIPv6AndPort(value string) bool {

	if strings.HasPrefix(value, "[") && strings.Contains(value, "]:") {

		tmp := strings.Split(value[1:], "]:")

		if len(tmp) == 2 {

			_, err := strconv.ParseUint(tmp[1], 10, 16)

			if IsIPv6("["+tmp[0]+"]") && err == nil {
				return true
			}

		}

	}

	return false

}

func ParseIPv6(raw string) *IPv6 {

	value, ok := normalizeIPv6(raw)

	if ok == false {
		return nil
	}

	address, err := netip.ParseAddr(value)

	if err != nil {
		return nil
	}

	ipv6 := IPv6(address.As16())

	return &ipv6

}

func ParseIPv6AndPrefix(value string) (*IPv6, uint8) {

	var result_ipv6 *IPv6 = nil
	var result_prefix uint8 = 0

	if strings.HasPrefix(value, "[") && strings.Contains(value, "]/") {

		tmp1 := strings.Split(value[1:], "]/")

		if len(tmp1) == 2 {

			tmp2 := ParseIPv6("[" + tmp1[0] + "]")
			num, err := strconv.ParseUint(tmp1[1], 10, 8)

			if tmp2 != nil && err == nil && num <= 128 {
				result_ipv6 = tmp2
				result_prefix = uint8(num)
			}

		}

	}

	return result_ipv6, result_prefix

}

func ParseIPv6AndPort(value string) (*IPv6, uint16) {

	var result_ipv6 *IPv6 = nil
	var result_port uint16 = 0

	if strings.HasPrefix(value, "[") && strings.Contains(value, "]:") {

		tmp1 := strings.Split(value[1:], "]:")

		if len(tmp1) == 2 {

			tmp2 := ParseIPv6("[" + tmp1[0] + "]")
			num, err := strconv.ParseUint(tmp1[1], 10, 16)

			if tmp2 != nil && err == nil {
				result_ipv6 = tmp2
				result_port = uint16(num)
			}

		}

	}

	return result_ipv6, result_port

}

func (ipv6 IPv6) Bytes(prefix uint8) []byte {

	bytes := make([]byte, 16)

	for i := 0; i < len(ipv6); i++ {
		bytes[i] = byte(ipv6[i])
	}

	return mask_bytes(bytes, prefix)

}

func (ipv6 IPv6) IsUnspecified() bool {
	return ipv6 == IPv6{}
}

func (ipv6 IPv6) Scope() string {

	var result string = "public"

	private_ipv6s := []string{

		// RFC3513
		UnspecifiedIPv6,
		"0000:0000:0000:0000:0000:0000:0000:0001",
		"fe80:0000:0000:0000",

		// RFC4193 (unique local addresses)
		"fc00:",
		"fd00:",
	}
	value := ipv6.String()

	for p := 0; p < len(private_ipv6s); p++ {

		if strings.HasPrefix(value, private_ipv6s[p]) {
			result = "private"
			break
		}

	}

	return result

}

func (ipv6 IPv6) String() string {

	tmp := make([]string, 8)

	for i := 0; i < len(ipv6); i += 2 {

		hex1 := strconv.FormatUint(uint64(ipv6[i]), 16)
		hex2 := strconv.FormatUint(uint64(ipv6[i+1]), 16)

		if len(hex1) == 1 {
			hex1 = "0" + hex1
		}

		if len(hex2) == 1 {
			hex2 = "0" + hex2
		}

		tmp[i/2] = hex1 + hex2

	}

	return strings.Join(tmp, ":")

}
