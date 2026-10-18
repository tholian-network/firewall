package types

import "testing"

func TestProtocolIsValid(t *testing.T) {

	if ProtocolANY.IsValid() == false || ProtocolTCP.IsValid() == false || ProtocolUDP.IsValid() == false {
		t.Fatal("known protocols should be valid")
	}

	if Protocol("unknown").IsValid() == true {
		t.Fatal("unknown protocol should be invalid")
	}

	if ProtocolTCP.IsAny() == true || ProtocolANY.IsAny() == false {
		t.Fatal("unexpected protocol any predicate")
	}

}

