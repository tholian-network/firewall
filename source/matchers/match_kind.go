package matchers

func match_kind(name string, subnet string) Kind {

	has_name := name != "" && name != Any
	has_subnet := subnet != "" && subnet != Any

	if has_name == true && has_subnet == false {
		return KindName
	} else if has_subnet == true && has_name == false {
		return KindSubnet
	} else if has_name == false && has_subnet == false {
		return KindAny
	}

	return KindInvalid

}
