//go:build (guard || oversight || guard_almalinux || guard_alpinelinux || guard_amazonlinux || guard_antergos || guard_archlinux || guard_cblmariner || guard_centos || guard_debian || guard_fedora || guard_freebsd || guard_gentoolinux || guard_linuxmint || guard_manjaro || guard_netbsd || guard_opensuse || guard_oraclelinux || guard_photonos || guard_redhat || guard_rockylinux || guard_trisquel || guard_ubuntu)

package insights

import "bytes"
import "compress/gzip"
import "tholian-firewall/console"
import "encoding/json"
import "io"
import _ "embed"

//go:embed Internet.json.gz
var embedded_Internet []byte

func init() {

	buffer := bytes.NewBuffer(embedded_Internet)
	reader, err1 := gzip.NewReader(buffer)

	if err1 == nil {

		decompressed, err2 := io.ReadAll(reader)

		if err2 == nil {

			err3 := json.Unmarshal(decompressed, &Internet)

			if err3 != nil {
				console.Error("Cannot decompress embedded Internet.json.gz")
			}

		} else {
			console.Error("Cannot decompress embedded Internet.json.gz")
		}

	} else {
		console.Error("Cannot decompress embedded Internet.json.gz")
	}

}
