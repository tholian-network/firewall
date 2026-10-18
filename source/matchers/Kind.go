package matchers

const Any = "any"

type Kind uint8

const (
	KindAny Kind = iota
	KindName
	KindSubnet
	KindInvalid
)

