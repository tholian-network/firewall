package main

import "tholian-firewall/actions"
import "tholian-firewall/adapters/mitigations/ebpf"
import "tholian-firewall/console"
import "os"

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

	console.Group("Action   | Description                                                     |")
	console.Log("---------|-----------------------------------------------------------------|")
	console.Log("check    | Checks whether a Target's network traffic is already forbidden. |")
	console.Log("forbid   | Forbid a Target's network traffic.                              |")
	console.Log("permit   | Permit a Target's network traffic.                              |")
	console.Log("search   | Search for a Target's Network/ASN details.                      |")
	console.Log("init     | Load the eBPF Module and attach it to all interfaces.           |")
	console.Log("load     | Load a rules file with line-separated instructions.             |")
	console.Log("status   | Show the eBPF Module status of forbidden targets.               |")
	console.Log("selftest | Run an in-process eBPF map round-trip self test.                |")
	console.GroupEnd("---------|-----------------------------------------------------------------|")

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

	if len(os.Args) >= 2 {

		if os.Args[1] == "forbid" && len(os.Args) == 3 {

			if actions.Forbid(os.Args[2]) == true {
				os.Exit(0)
			} else {
				os.Exit(1)
			}

		} else if os.Args[1] == "permit" && len(os.Args) == 3 {

			if actions.Permit(os.Args[2]) == true {
				os.Exit(0)
			} else {
				os.Exit(1)
			}

		} else if os.Args[1] == "check" && len(os.Args) == 3 {

			if ebpf.SUPPORTED == false {
				console.Error("tholian-firewall: no eBPF backend available")
				os.Exit(3)
			}

			if actions.Check(os.Args[2]) == true {
				os.Exit(1)
			} else {
				os.Exit(0)
			}

		} else if os.Args[1] == "search" && len(os.Args) == 3 {

			results := actions.Search(os.Args[2])

			if len(results) > 0 {

				for r := 0; r < len(results); r++ {
					console.Log(results[r])
				}

				os.Exit(0)

			} else {
				os.Exit(1)
			}

		} else if os.Args[1] == "init" && len(os.Args) == 2 {

			if actions.Init() == true {
				os.Exit(0)
			} else {
				os.Exit(1)
			}

		} else if os.Args[1] == "load" && len(os.Args) == 3 {

			if actions.Load(os.Args[2]) == true {
				os.Exit(0)
			} else {
				os.Exit(1)
			}

		} else if os.Args[1] == "status" && len(os.Args) == 2 {

			results := actions.Status()

			for r := 0; r < len(results); r++ {
				console.Log(results[r])
			}

			os.Exit(0)

		} else if os.Args[1] == "selftest" && len(os.Args) == 2 {

			if actions.SelfTest() == true {
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
