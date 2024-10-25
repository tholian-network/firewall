package structs

import "tholian-firewall/types"
import "encoding/hex"
import "strconv"
import "strings"

type Subnet struct {
	Name    string `json:"name"`
	Country string `json:"country"`
	Address string `json:"address"`
	Scope   string `json:"scope"`
	Type    string `json:"type"`
	Prefix  uint8  `json:"prefix"`
}

func NewSubnet(address string, prefix uint8) Subnet {

	var subnet Subnet

	subnet.SetAddress(address)
	subnet.SetPrefix(prefix)

	return subnet

}

func ToSubnet(value string) Subnet {

	var subnet Subnet

	subnet.Address = ""
	subnet.Prefix = 0

	subnet.Parse(value)

	return subnet

}

func (subnet *Subnet) Contains(value string) bool {

	var result bool = false

	if types.IsIPv6(value) {

		ipv6 := types.ParseIPv6(value)

		if ipv6 != nil {

			str := ipv6.String()
			tmp := NewSubnet(str[1:len(str)-1], 128)
			result = subnet.ContainsSubnet(tmp)

		}

	} else if types.IsIPv4(value) {

		ipv4 := types.ParseIPv4(value)

		if ipv4 != nil {

			tmp := NewSubnet(ipv4.String(), 32)
			result = subnet.ContainsSubnet(tmp)

		}

	}

	return result

}

func (subnet *Subnet) ContainsSubnet(value Subnet) bool {

	var result bool = false

	if subnet.Type == "ipv4" && value.Type == "ipv4" {

		if value.Prefix > subnet.Prefix {

			ipv4_subnet := types.ParseIPv4(subnet.Address)
			ipv4_value := types.ParseIPv4(value.Address)

			if ipv4_subnet != nil && ipv4_value != nil {

				bytes_subnet := ipv4_subnet.Bytes(subnet.Prefix)
				bytes_value := ipv4_value.Bytes(subnet.Prefix)

				result = true

				for b := 0; b < len(bytes_subnet); b++ {

					if bytes_subnet[b] != bytes_value[b] {
						result = false
						break
					}

				}

			}

		}

	} else if subnet.Type == "ipv6" && value.Type == "ipv6" {

		if value.Prefix > subnet.Prefix {

			ipv6_subnet := types.ParseIPv6(subnet.Address)
			ipv6_value := types.ParseIPv6(value.Address)

			if ipv6_subnet != nil && ipv6_value != nil {

				bytes_subnet := ipv6_subnet.Bytes(subnet.Prefix)
				bytes_value := ipv6_value.Bytes(subnet.Prefix)

				result = true

				for b := 0; b < len(bytes_subnet); b++ {

					if bytes_subnet[b] != bytes_value[b] {
						result = false
						break
					}

				}

			}

		}

	}

	return result

}

func (subnet *Subnet) IsIdentical(value Subnet) bool {

	var result bool = false

	if subnet.Address == value.Address && subnet.Prefix == value.Prefix {
		result = true
	}

	return result

}

func (subnet *Subnet) IsValid() bool {

	var result bool = false

	if subnet.Type == "ipv4" {

		if subnet.Address != "" && subnet.Address != "0.0.0.0" {

			if subnet.Prefix != 0 {
				result = true
			}

		}

	} else if subnet.Type == "ipv6" {

		if subnet.Address != "" && subnet.Address != "[0000:0000:0000:0000:0000:0000:0000:0000]" {

			if subnet.Prefix != 0 {
				result = true
			}

		}

	}

	return result

}

func (subnet *Subnet) Parse(value string) {

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

	if address != "" {
		subnet.SetAddress(address)
	}

	if prefix != 0 {
		subnet.SetPrefix(prefix)
	}

}

func (subnet *Subnet) SetCountry(value string) {

	if len(value) == 2 && value != "XX" {
		subnet.Country = value
	}

}

func (subnet *Subnet) SetName(value string) {

	value = strings.TrimSpace(value)

	if value != "" {
		subnet.Name = value
	}

}

func (subnet *Subnet) SetAddress(value string) {

	if types.IsIPv6(value) {

		ipv6 := types.ParseIPv6(value)

		if ipv6 != nil {
			subnet.Address = ipv6.String()
			subnet.Scope = ipv6.Scope()
			subnet.Type = "ipv6"
		}


	} else if types.IsIPv4(value) {

		ipv4 := types.ParseIPv4(value)

		if ipv4 != nil {
			subnet.Address = ipv4.String()
			subnet.Scope = ipv4.Scope()
			subnet.Type = "ipv4"
		}

	}

}

func (subnet *Subnet) SetPrefix(value uint8) {

	if subnet.Type == "ipv4" {

		if value >= 0 && value <= 32 {
			subnet.Prefix = value
		}

	} else if subnet.Type == "ipv6" {

		if value >= 0 && value <= 128 {
			subnet.Prefix = value
		}

	}

}

func (subnet *Subnet) SetScope(value string) {

	if value == "private" || value == "public" {
		subnet.Scope = value
	}

}

func (subnet *Subnet) Addresses() uint {

	var result uint

	if subnet.Prefix != 0 {

		if subnet.Type == "ipv4" {
			result = 1 << (32 - subnet.Prefix)
		} else if subnet.Type == "ipv6" {
			result = 1 << (128 - subnet.Prefix)
		}

	}

	return result

}

func (subnet *Subnet) Hash() string {

	var hash string

	if subnet.Type == "ipv4" {

		ipv4 := types.ParseIPv4(subnet.Address)

		if ipv4 != nil {
			bytes := ipv4.Bytes(subnet.Prefix)
			hash = hex.EncodeToString(bytes)
		}

	} else if subnet.Type == "ipv6" {

		ipv6 := types.ParseIPv6(subnet.Address)

		if ipv6 != nil {
			bytes := ipv6.Bytes(subnet.Prefix)
			hash = hex.EncodeToString(bytes)
		}

	}

	return hash

}

func (subnet *Subnet) String() string {

	var result string

	if subnet.Address != "" && subnet.Prefix != 0 {
		result = subnet.Address + "/" + strconv.FormatUint(uint64(subnet.Prefix), 10)
	}

	return result

}
