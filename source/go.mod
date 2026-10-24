module tholian-firewall

go 1.27.1

require (
	golang.org/x/sys v0.49.0 // indirect
	golang.org/x/term v0.47.0 // indirect
)

require (
	github.com/cilium/ebpf v0.18.0
	tholian-core v0.0.0
)

replace tholian-core => ../../core/source
