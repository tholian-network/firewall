package module

import "bytes"
import "encoding/binary"
import "testing"

func TestToBPFDomainCaseAndRootDot(t *testing.T) {

	a := ToBPFDomain("evil.example")
	b := ToBPFDomain("EVIL.EXAMPLE.")
	c := ToBPFDomain("evil.example.")

	if len(a) != 8 {
		t.Fatalf("ToBPFDomain returned %d bytes", len(a))
	}

	if bytes.Equal(a, b) == false || bytes.Equal(a, c) == false {
		t.Fatal("ToBPFDomain is not case/root-dot insensitive")
	}

	if len(ToBPFDomain("")) != 0 {
		t.Fatal("ToBPFDomain should be empty for an empty domain")
	}

	label := ""
	for l := 0; l < 64; l++ {
		label += "a"
	}

	if len(ToBPFDomain(label+".example")) != 0 {
		t.Fatal("ToBPFDomain accepted a label longer than 63 bytes")
	}

}

func TestToBPFPort(t *testing.T) {

	if len(ToBPFPort(0)) != 0 {
		t.Fatal("ToBPFPort(0) should be empty")
	}

	result := ToBPFPort(65535)

	if len(result) != 2 {
		t.Fatalf("ToBPFPort(65535) length = %d", len(result))
	}

	if binary.BigEndian.Uint16(result) != 65535 {
		t.Fatalf("ToBPFPort(65535) = %v", result)
	}

}

func TestToBPFIPv4(t *testing.T) {

	result := ToBPFIPv4("1.3.3.7", 24)

	if len(result) != 8 {
		t.Fatalf("ToBPFIPv4 length = %d", len(result))
	}

	if binary.NativeEndian.Uint32(result[0:4]) != 24 {
		t.Fatalf("unexpected prefix: %v", result[0:4])
	}

	if bytes.Equal(result[4:8], []byte{1, 3, 3, 7}) == false {
		t.Fatalf("unexpected address: %v", result[4:8])
	}

	if len(ToBPFIPv4("not-an-address", 24)) != 0 {
		t.Fatal("ToBPFIPv4 accepted an invalid address")
	}

}

func TestToBPFIPv4Socket(t *testing.T) {

	result := ToBPFIPv4Socket("1.3.3.7", 65535)

	if len(result) != 6 {
		t.Fatalf("ToBPFIPv4Socket length = %d", len(result))
	}

	if bytes.Equal(result[0:4], []byte{1, 3, 3, 7}) == false {
		t.Fatalf("unexpected address: %v", result[0:4])
	}

	if binary.BigEndian.Uint16(result[4:6]) != 65535 {
		t.Fatalf("unexpected port: %v", result[4:6])
	}

	if len(ToBPFIPv4Socket("1.3.3.7", 0)) != 0 {
		t.Fatal("ToBPFIPv4Socket accepted port 0")
	}

}

func TestToBPFIPv6Socket(t *testing.T) {

	result := ToBPFIPv6Socket("[fe80::1337]", 1338)

	if len(result) != 18 {
		t.Fatalf("ToBPFIPv6Socket length = %d", len(result))
	}

	expected := []byte{0xfe, 0x80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x13, 0x37}

	if bytes.Equal(result[0:16], expected) == false {
		t.Fatalf("unexpected address: %v", result[0:16])
	}

	if binary.BigEndian.Uint16(result[16:18]) != 1338 {
		t.Fatalf("unexpected port: %v", result[16:18])
	}

}

func TestToBPFIPv6(t *testing.T) {

	result := ToBPFIPv6("[fe80::1337]", 64)

	if len(result) != 20 {
		t.Fatalf("ToBPFIPv6 length = %d", len(result))
	}

	if binary.NativeEndian.Uint32(result[0:4]) != 64 {
		t.Fatalf("unexpected prefix: %v", result[0:4])
	}

	expected := []byte{0xfe, 0x80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x13, 0x37}

	if bytes.Equal(result[4:20], expected) == false {
		t.Fatalf("unexpected address: %v", result[4:20])
	}

	if len(ToBPFIPv6("not-an-address", 64)) != 0 {
		t.Fatal("ToBPFIPv6 accepted an invalid address")
	}

}
