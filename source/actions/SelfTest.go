package actions

import "tholian-firewall/adapters/mitigations/ebpf"
import "tholian-firewall/console"
import "strconv"

func SelfTest() bool {

	var result bool = true

	console.Group("actions/SelfTest")

	if ebpf.SUPPORTED == false {
		console.Error("eBPF backend unavailable")
		console.GroupEndResult(false, "actions/SelfTest")
		return false
	}

	if ebpf.ForbidAddress("1.3.3.7") == false {
		console.Error("forbid address failed")
		result = false
	}

	if ebpf.IsForbiddenAddress("1.3.3.7") == false {
		console.Error("is forbidden address failed")
		result = false
	}

	if ebpf.PermitAddress("1.3.3.7") == false {
		console.Error("permit address failed")
		result = false
	}

	if ebpf.IsForbiddenAddress("1.3.3.7") == true {
		console.Error("address still forbidden after permit")
		result = false
	}

	if ebpf.ForbidSubnet("1.3.3.0", 24) == false {
		console.Error("forbid subnet failed")
		result = false
	}

	if ebpf.IsForbiddenSubnet("1.3.3.7", 32) == false {
		console.Error("is forbidden subnet failed")
		result = false
	}

	if ebpf.PermitSubnet("1.3.3.0", 24) == false {
		console.Error("permit subnet failed")
		result = false
	}

	if ebpf.IsForbiddenSubnet("1.3.3.7", 32) == true {
		console.Error("subnet still forbidden after permit")
		result = false
	}

	if ebpf.ForbidPort(1338) == false {
		console.Error("forbid port failed")
		result = false
	}

	if ebpf.IsForbiddenPort(1338) == false {
		console.Error("is forbidden port failed")
		result = false
	}

	if ebpf.PermitPort(1338) == false {
		console.Error("permit port failed")
		result = false
	}

	if ebpf.IsForbiddenPort(1338) == true {
		console.Error("port still forbidden after permit")
		result = false
	}

	if ebpf.ForbidAddress("evil.example") == false {
		console.Error("forbid domain failed")
		result = false
	}

	if ebpf.IsForbiddenAddress("evil.example") == false {
		console.Error("is forbidden domain failed")
		result = false
	}

	if ebpf.PermitAddress("evil.example") == false {
		console.Error("permit domain failed")
		result = false
	}

	if ebpf.IsForbiddenAddress("evil.example") == true {
		console.Error("domain still forbidden after permit")
		result = false
	}

	attached := ebpf.AttachAll()
	console.Log("attached interfaces: " + strconv.Itoa(attached))

	if attached == 0 {
		console.Error("no network interface could be attached")
		result = false
	}

	console.GroupEndResult(result, "actions/SelfTest")

	return result

}
