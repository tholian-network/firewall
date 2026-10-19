//go:build guard || oversight || guard_almalinux || guard_alpinelinux || guard_amazonlinux || guard_antergos || guard_archlinux || guard_cblmariner || guard_centos || guard_debian || guard_fedora || guard_freebsd || guard_gentoolinux || guard_linuxmint || guard_manjaro || guard_netbsd || guard_opensuse || guard_oraclelinux || guard_photonos || guard_redhat || guard_rockylinux || guard_trisquel || guard_ubuntu

package insights

import "bytes"
import "tholian-core/structs"
import _ "embed"

//go:embed Internet.json.gz
var embedded_Internet []byte

func init() {
	initialize = load_internet
}

func load_internet(console *structs.Console) {

	if err := parse_internet(bytes.NewReader(embedded_Internet)); err != nil {
		console.Error("Cannot load embedded Internet.json.gz: " + err.Error())
	}

}
