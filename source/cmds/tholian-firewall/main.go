package main

// import "tholian-firewall/actions"
import "tholian-firewall/console"

func showUsage() {

	console.Info("")
	console.Info("Tholian Firewall")
	console.Info("Programmable eBPF Firewall")
	console.Info("")

	console.Group("Usage: tholian-firewall [Action] [Subject]")
	console.Log("The supported formats follow RFC2732, meaning an IPv6 with a port has to be written as [IPv6]:Port.")
	console.GroupEnd("------")

	console.Group("Subject    | Syntax            | Description                                     |")
	console.Log("-----------|-------------------|-------------------------------------------------|")
	console.Log("Connection | IP:Port<->IP:Port | Describes incoming and outgoing network traffic |")
	console.Log("Connection | IP:Port->IP:Port  | Describes outgoing network traffic              |")
	console.Log("Connection | IP:Port<-IP:Port  | Describes incoming network traffic              |")
	console.Log("Address    | IP                | Describes an IPv4/IPv6 address                  |")
	console.Log("Subnet     | IP/Prefix         | Describes an IPv4/IPv6 subnet                   |")
	console.Log("Network    | ASN               | Describes an Autonomous System Number           |")
	console.GroupEnd("-----------|-------------------|-------------------------------------------------|")

	console.Group("Action            | Description                  |")
	console.Log("------------------|------------------------------|")
	console.Log("forbid-connection | Forbid a TCP/UDP connection. |")
	console.Log("permit-connection | Permit a TCP/UDP connection. |")
	console.Log("forbid-network    | Forbid an ASN.               |")
	console.Log("permit-network    | Permit an ASN.               |")
	console.Log("forbid-address    | Forbid an IPv4/IPv6 address. |")
	console.Log("permit-address    | Permit an IPv4/IPv6 address. |")
	console.GroupEnd("------------------|------------------------------|")

}

func main() {
	showUsage()
}
