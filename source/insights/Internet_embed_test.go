//go:build guard || guard_almalinux || guard_alpinelinux || guard_amazonlinux || guard_antergos || guard_archlinux || guard_cblmariner || guard_centos || guard_debian || guard_fedora || guard_gentoolinux || guard_linuxmint || guard_manjaro || guard_opensuse || guard_oraclelinux || guard_photonos || guard_redhat || guard_rockylinux || guard_trisquel || guard_ubuntu || guard_freebsd || guard_netbsd || guard_openbsd

package insights

import "os"
import "testing"
import "tholian-firewall/structs"

func TestEmbeddedInternetDataset(t *testing.T) {

	if os.Getenv("THOLIAN_TEST_DATASET") != "1" {
		t.Skip("set THOLIAN_TEST_DATASET=1 to load the embedded dataset")
	}

	console := structs.NewConsole(nil, nil, 0)

	loadInternet(console)

	if console.HasErrors() == true {
		t.Fatalf("failed to load the embedded dataset: %v", console.Messages)
	}

	subnet := Internet.Search("1.1.1.1")

	if subnet.String() != "1.1.1.0/24" {
		t.Errorf("Search(1.1.1.1) = %q, expected 1.1.1.0/24", subnet.String())
	}

	non_octet := structs.NewSubnet("8.128.0.0", 10)

	if _, ok := Internet.Mapv4[10][non_octet.Hash()]; ok == false {
		t.Fatalf("non-octet prefix hash %q is not present in the dataset", non_octet.Hash())
	}

	for prefix, entries := range Internet.Mapv4 {
		for hash, subnet := range entries {
			if subnet.Hash() != hash {
				t.Fatalf("IPv4 /%d map key %q does not match Subnet.Hash() %q", prefix, hash, subnet.Hash())
			}
		}
	}

	for prefix, entries := range Internet.Mapv6 {
		for hash, subnet := range entries {
			if subnet.Hash() != hash {
				t.Fatalf("IPv6 /%d map key %q does not match Subnet.Hash() %q", prefix, hash, subnet.Hash())
			}
		}
	}

	for _, address := range []string{"8.128.0.1", "20.64.0.1"} {

		subnet := Internet.Search(address)

		if subnet.IsValid() == false {
			t.Errorf("Search(%q) returned an invalid subnet", address)
		}

	}

	network := Internet.SearchASN("AS13335")

	if network.IsValid() == false {
		t.Fatal("SearchASN(AS13335) returned an invalid network")
	}

}
