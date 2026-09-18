package structs

import "sync"
import "testing"

func TestConsoleConcurrentAccess(t *testing.T) {

	console := NewConsole(nil, nil, 0)

	var writers sync.WaitGroup
	var readers sync.WaitGroup

	for w := 0; w < 16; w++ {

		writers.Add(1)

		go func(id int) {

			defer writers.Done()

			for i := 0; i < 200; i++ {

				console.Log("log " + string(rune('a'+id)))
				console.Info("info")
				console.Warn("warn")
				console.Error("error")
				console.Group("group")
				console.GroupEnd("group")
				console.Progress("progress")
				console.SetOffset(1)
				console.DisableMethod("Info")
				console.EnableMethod("Info")
				console.Clear("group")

			}

		}(w)

	}

	for r := 0; r < 8; r++ {

		readers.Add(1)

		go func() {

			defer readers.Done()

			for i := 0; i < 500; i++ {
				_ = console.GetOffset()
				_ = console.Length()
				_ = console.HasErrors()
				_ = console.UseColors()
				_ = console.UseMethod("Log")
			}

		}()

	}

	writers.Wait()
	readers.Wait()

	if console.Length() == 0 {
		t.Fatal("expected messages to be recorded")
	}

}

func TestConsoleRenderConcurrent(t *testing.T) {

	source := NewConsole(nil, nil, 0)
	target := NewConsole(nil, nil, 0)

	source.Log("one")
	source.Info("two")
	source.Warn("three")

	var waitgroup sync.WaitGroup

	for r := 0; r < 8; r++ {

		waitgroup.Add(1)

		go func() {
			defer waitgroup.Done()
			source.Render(target)
		}()

	}

	waitgroup.Wait()

	if target.Length() == 0 {
		t.Fatal("expected rendered messages")
	}

}
