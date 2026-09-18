//go:build (guard || guard_openwrt || guard_almalinux || guard_alpinelinux || guard_amazonlinux || guard_antergos || guard_archlinux || guard_cblmariner || guard_centos || guard_debian || guard_fedora || guard_gentoolinux || guard_linuxmint || guard_manjaro || guard_opensuse || guard_oraclelinux || guard_photonos || guard_redhat || guard_rockylinux || guard_trisquel || guard_ubuntu) && (arm64be || armbe || mips || mips64 || mips64p32 || ppc64 || s390 || s390x || sparc || sparc64)

package module

import "github.com/cilium/ebpf"
import "github.com/cilium/ebpf/link"
import "github.com/cilium/ebpf/rlimit"
import "tholian-firewall/structs"
import "errors"
import "strings"
import "bytes"
import _ "embed"

func reportError(console *structs.Console, err error) {

	var verifier *ebpf.VerifierError

	if errors.As(err, &verifier) {
		if len(verifier.Log) > 0 {
			console.Error(strings.Join(verifier.Log, "\n"))
		}
	}

	console.Error(err.Error())

}

//go:embed module.bpfeb
var embedded_bpf_module []byte

var Links map[string]*link.Link

var Loaded bool
var LoadError error

var Module struct {
	Program      *ebpf.Program `ebpf:"xdp_prog_main"`
	DomainBans   *ebpf.Map     `ebpf:"domain_bans"`
	IPv4Bans     *ebpf.Map     `ebpf:"ipv4_bans"`
	IPv4Warnings *ebpf.Map     `ebpf:"ipv4_warnings"`
	IPv6Bans     *ebpf.Map     `ebpf:"ipv6_bans"`
	IPv6Warnings *ebpf.Map     `ebpf:"ipv6_warnings"`
	PortBans     *ebpf.Map     `ebpf:"port_bans"`
}

func probe() bool {

	if Module.Program == nil || Module.PortBans == nil {
		return false
	}

	var value uint8

	err := Module.PortBans.Lookup(uint16(65534), &value)

	if err == nil || errors.Is(err, ebpf.ErrKeyNotExist) {
		return true
	}

	return false

}

func Init(console *structs.Console) {

	Links = make(map[string]*link.Link)

	Loaded = false

	if err := rlimit.RemoveMemlock(); err != nil {
		console.Warn("adapters/ebpf: " + err.Error())
	}

	reader := bytes.NewReader(embedded_bpf_module)
	spec, err1 := ebpf.LoadCollectionSpecFromReader(reader)

	if err1 != nil {

		LoadError = err1
		reportError(console, err1)
		console.Error("adapters/ebpf: eBPF Module disabled")

		return

	}

	err2 := spec.LoadAndAssign(&Module, nil)

	if err2 != nil {

		LoadError = err2
		reportError(console, err2)
		console.Error("adapters/ebpf: eBPF Module disabled")

		return

	}

	if probe() == false {

		LoadError = errors.New("eBPF Module probe failed")
		console.Error(LoadError.Error())
		console.Error("adapters/ebpf: eBPF Module disabled")

		return

	}

	Loaded = true
	console.Info("adapters/ebpf: eBPF Module loaded")

}

func Close() {

	for name, ref := range Links {

		if ref != nil && *ref != nil {
			(*ref).Close()
		}

		delete(Links, name)

	}

	if Module.Program != nil {
		Module.Program.Close()
		Module.Program = nil
	}

	if Module.DomainBans != nil {
		Module.DomainBans.Close()
		Module.DomainBans = nil
	}

	if Module.IPv4Bans != nil {
		Module.IPv4Bans.Close()
		Module.IPv4Bans = nil
	}

	if Module.IPv4Warnings != nil {
		Module.IPv4Warnings.Close()
		Module.IPv4Warnings = nil
	}

	if Module.IPv6Bans != nil {
		Module.IPv6Bans.Close()
		Module.IPv6Bans = nil
	}

	if Module.IPv6Warnings != nil {
		Module.IPv6Warnings.Close()
		Module.IPv6Warnings = nil
	}

	if Module.PortBans != nil {
		Module.PortBans.Close()
		Module.PortBans = nil
	}

	Loaded = false

}
