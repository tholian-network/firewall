package main

import goebpf "github.com/cilium/ebpf"
import "tholian-endpoint/console"
import "tholian-endpoint/structs"
import "tholian-endpoint/utils"
import "tholian-endpoint/adapters/mitigations/ebpf"
import "encoding/binary"
import "net"
import "strconv"
import "strings"
import "time"

func collectInterfaces() []string {

	var result []string

	ifaces, err := net.Interfaces()

	if err == nil {

		for _, iface := range ifaces {

			if strings.HasPrefix(iface.Name, "enp") || strings.HasPrefix(iface.Name, "eno") {
				result = append(result, iface.Name)
			}

		}

	}

	return result

}

func debugIPMap(bpfmap *goebpf.Map) {

	var key []byte
	var val uint8

	iter := bpfmap.Iterate()

	for iter.Next(&key, &val) {

		ip := net.IP(key)

		if val == 1 {
			console.Warn("IP " + ip.String() + " is blocked!")
		} else {
			console.Info("IP " + ip.String() + " is not blocked!")
		}

	}

}

func debugPortMap(bpfmap *goebpf.Map) {

	var key []byte
	var val uint8

	iter := bpfmap.Iterate()

	for iter.Next(&key, &val) {

		port := binary.BigEndian.Uint16(key)

		if val == 1 {
			console.Warn("Port " + strconv.FormatUint(uint64(port), 10) + " is blocked!")
		} else {
			console.Info("Port " + strconv.FormatUint(uint64(port), 10) + " is not blocked!")
		}

	}

}



func main() {

	if utils.IsBPF() == true && ebpf.SUPPORTED == true {

		console.Info("BPF supported!")

		interfaces := collectInterfaces()

		var is_running bool = false

		for i := 0; i < len(interfaces); i++ {

			var result = ebpf.Attach(interfaces[i])

			if result == true {
				is_running = true
				console.Info("Attached to interface \"" + interfaces[i] + "\"")
			} else {
				console.Error("Cannot Attach to interface \"" + interfaces[i] + "\"")
			}

		}

		if is_running == true {

			network := structs.NewNetwork("eno1", "00:01:02:03:04:05")
			network.SetSockets([]structs.Socket{
				structs.NewSocket("192.168.0.10", 0),
				structs.NewSocket("fe80:0000:0000:0000:1f1d:0456:4470:7b61", 0),
			})

			ebpf.ForbidNetwork(network)

			connection := structs.NewConnection()
			connection.SetSource(structs.NewSocket("8.8.4.4", 53))
			connection.SetTarget(structs.NewSocket("192.168.0.1", 53))
			connection.SetType("server") // blocks the remote client/port
			// connection.SetType("client") // blocks the local client/port

			ebpf.ForbidConnection(connection)

			for true {

				console.Group("Loop")
				debugIPMap(ebpf.BPF.IPv4Bans)
				debugIPMap(ebpf.BPF.IPv6Bans)
				debugPortMap(ebpf.BPF.PortBans)
				console.GroupEnd("")

				time.Sleep(10 * time.Second)

			}

		} else {
			console.Warn("Cannot find any local network interfaces!")
		}

	} else {

		console.Error("BPF not supported!")

	}

}
