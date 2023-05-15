package console

var Messages []Message

func init() {
	Messages = make([]Message, 0)
}

type Message struct {
	Method string `json:"type"`
	Value  string `json:"value"`
}

func NewMessage(method string, value string) Message {

	var message Message

	message.Method = method
	message.Value = value

	return message

}
