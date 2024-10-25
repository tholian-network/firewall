//go:build (guard || guard_openwrt || guard_almalinux || guard_alpinelinux || guard_amazonlinux || guard_antergos || guard_archlinux || guard_cblmariner || guard_centos || guard_debian || guard_fedora || guard_gentoolinux || guard_linuxmint || guard_manjaro || guard_opensuse || guard_oraclelinux || guard_photonos || guard_redhat || guard_rockylinux || guard_trisquel || guard_ubuntu)

package ebpf

var SUPPORTED bool

func init() {
	SUPPORTED = false
}
