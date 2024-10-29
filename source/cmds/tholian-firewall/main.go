package main

import "tholian-firewall/actions"
import "tholian-firewall/console"
import "tholian-firewall/matchers"
import "tholian-firewall/types"
import "os"
import "strconv"

func showUsage() {

	console.Info("")
	console.Info("Tholian Firewall")
	console.Info("Programmable eBPF Firewall")
	console.Info("")

	console.Group("Usage: tholian-firewall [Action] [Target]")
	console.Log("The supported syntax formats follow RFC2732")
	console.Log("IPv6 with a Prefix has to be written as [IPv6]/Prefix")
	console.Log("IPv6 with a Port has to be written as [IPv6]:Port")
	console.GroupEnd("------")

	console.Group("Target     | Syntax            | Description                                     |")
	console.Log("-----------|-------------------|-------------------------------------------------|")
	console.Log("Network    | ASN               | Describes an Autonomous System Number           |")
	console.Log("Address    | IP                | Describes an IPv4/IPv6 address                  |")
	console.Log("Subnet     | IP/Prefix         | Describes an IPv4/IPv6 subnet                   |")
	console.Log("Connection | IP:Port           | Describes incoming and outgoing network traffic |")
	console.GroupEnd("-----------|-------------------|-------------------------------------------------|")

	console.Group("Action | Description                                                     |")
	console.Log("-------|-----------------------------------------------------------------|")
	console.Log("check  | Checks whether a Target's network traffic is already forbidden. |")
	console.Log("forbid | Forbid a Target's network traffic.                              |")
	console.Log("permit | Permit a Target's network traffic.                              |")
	console.Log("search | Search for a Target's Network/ASN details.                      |")
	console.GroupEnd("-------|-----------------------------------------------------------------|")

	console.Group("Examples")
	console.Log("# ASN example")
	console.Log("tholian-firewall forbid \"ASN1337\";")
	console.Log("")
	console.Log("# IPv4 examples")
	console.Log("tholian-firewall forbid \"1.3.3.7\";")
	console.Log("tholian-firewall forbid \"1.3.3.0/24\";")
	console.Log("tholian-firewall forbid \"1.3.3.7:1338\";")
	console.Log("")
	console.Log("# IPv6 examples")
	console.Log("tholian-firewall forbid \"[fe80::1337]\";")
	console.Log("tholian-firewall forbid \"[fe80::1337]/64\";")
	console.Log("tholian-firewall forbid \"[fe80::1337]:1338\";")
	console.GroupEnd("--------")

}

func main() {

	if len(os.Args) == 3 {

		if os.Args[1] == "forbid" {

			result := false

			if types.IsASN(os.Args[2]) {

				asn := types.ParseASN(os.Args[2])

				if asn != nil {

					network := matchers.NewNetwork()
					network.SetName(asn.String())

					result = actions.ForbidNetwork(network)

				}

			} else if types.IsIPv6AndPrefix(os.Args[2]) {

				ipv6, prefix := types.ParseIPv6AndPrefix(os.Args[2])

				if ipv6 != nil && prefix != 0 {

					network := matchers.NewNetwork()
					network.SetSubnet(ipv6.String() + "/" + strconv.FormatUint(uint64(prefix), 10))

					result = actions.ForbidNetwork(network)

				}

			} else if types.IsIPv6AndPort(os.Args[2]) {

				ipv6, port := types.ParseIPv6AndPort(os.Args[2])

				if ipv6 != nil && port != 0 {

					connection := matchers.NewConnection()
					connection.SetHost(ipv6.String())
					connection.SetPort(port)

					result = actions.ForbidConnection(connection)

				}

			} else if types.IsIPv6(os.Args[2]) {

				ipv6 := types.ParseIPv6(os.Args[2])

				if ipv6 != nil {

					network := matchers.NewNetwork()
					network.SetSubnet(ipv6.String() + "/128")

					result = actions.ForbidNetwork(network)

				}

			} else if types.IsIPv4AndPrefix(os.Args[2]) {

				ipv4, prefix := types.ParseIPv4AndPrefix(os.Args[2])

				if ipv4 != nil && prefix != 0 {

					network := matchers.NewNetwork()
					network.SetSubnet(ipv4.String() + "/" + strconv.FormatUint(uint64(prefix), 10))

					result = actions.ForbidNetwork(network)

				}

			} else if types.IsIPv4AndPort(os.Args[2]) {

				ipv4, port := types.ParseIPv4AndPort(os.Args[2])

				if ipv4 != nil && port != 0 {

					connection := matchers.NewConnection()
					connection.SetHost(ipv4.String())
					connection.SetPort(port)

					result = actions.ForbidConnection(connection)

				}

			} else if types.IsIPv4(os.Args[2]) {

				ipv4 := types.ParseIPv4(os.Args[2])

				if ipv4 != nil {

					network := matchers.NewNetwork()
					network.SetSubnet(ipv4.String() + "/32")

					result = actions.ForbidNetwork(network)

				}

			}

			if result == true {
				os.Exit(0)
			} else {
				os.Exit(1)
			}

		} else if os.Args[1] == "permit" {

			result := false

			if types.IsASN(os.Args[2]) {

				asn := types.ParseASN(os.Args[2])

				if asn != nil {

					network := matchers.NewNetwork()
					network.SetName(asn.String())

					result = actions.PermitNetwork(network)

				}

			} else if types.IsIPv6AndPrefix(os.Args[2]) {

				ipv6, prefix := types.ParseIPv6AndPrefix(os.Args[2])

				if ipv6 != nil && prefix != 0 {

					network := matchers.NewNetwork()
					network.SetSubnet(ipv6.String() + "/" + strconv.FormatUint(uint64(prefix), 10))

					result = actions.PermitNetwork(network)

				}

			} else if types.IsIPv6AndPort(os.Args[2]) {

				ipv6, port := types.ParseIPv6AndPort(os.Args[2])

				if ipv6 != nil && port != 0 {

					connection := matchers.NewConnection()
					connection.SetHost(ipv6.String())
					connection.SetPort(port)

					result = actions.PermitConnection(connection)

				}

			} else if types.IsIPv6(os.Args[2]) {

				ipv6 := types.ParseIPv6(os.Args[2])

				if ipv6 != nil {

					network := matchers.NewNetwork()
					network.SetSubnet(ipv6.String() + "/128")

					result = actions.PermitNetwork(network)

				}

			} else if types.IsIPv4AndPrefix(os.Args[2]) {

				ipv4, prefix := types.ParseIPv4AndPrefix(os.Args[2])

				if ipv4 != nil && prefix != 0 {

					network := matchers.NewNetwork()
					network.SetSubnet(ipv4.String() + "/" + strconv.FormatUint(uint64(prefix), 10))

					result = actions.PermitNetwork(network)

				}

			} else if types.IsIPv4AndPort(os.Args[2]) {

				ipv4, port := types.ParseIPv4AndPort(os.Args[2])

				if ipv4 != nil && port != 0 {

					connection := matchers.NewConnection()
					connection.SetHost(ipv4.String())
					connection.SetPort(port)

					result = actions.PermitConnection(connection)

				}

			} else if types.IsIPv4(os.Args[2]) {

				ipv4 := types.ParseIPv4(os.Args[2])

				if ipv4 != nil {

					network := matchers.NewNetwork()
					network.SetSubnet(ipv4.String() + "/32")

					result = actions.PermitNetwork(network)

				}

			}

			if result == true {
				os.Exit(0)
			} else {
				os.Exit(1)
			}

		} else {
			showUsage()
			os.Exit(2)
		}

	} else {

		showUsage()
		os.Exit(2)

	}

}
