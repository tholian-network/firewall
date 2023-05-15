package main

import "tholian-endpoint/console"
import "tholian-endpoint/structs"
import "tholian-endpoint/utils"
import "tholian-endpoint/adapters/mitigations/ebpf"

func main() {

	if utils.IsBPF() == true && ebpf.SUPPORTED == true {

		console.Info("eBPF supported!")

		network1 := structs.NewNetwork("eno1", "00:01:02:03:04:05")
		network1.SetAddresses([]string{"192.168.13.37", "192.168.13.38"})

		// TODO: Block traffic from the set of IP addresses on the network
		ebpf.ForbidNetwork(network1)


		network2 := structs.NewNetwork("eno1", "00:01:02:03:04:05")
		network2.SetAddresses([]string{"192.168.13.37"})

		// TODO: Allow traffic from the set of IP addresses on the network
		ebpf.PermitNetwork(network2)

	} else {

		console.Error("eBPF not supported!")

	}

}
