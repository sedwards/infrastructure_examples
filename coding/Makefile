GO=go

all: go_example validator

go_example: go_validator/examples/example.go
	$(GO) build -o go_validator/examples/go_example go_validator/examples/example.go

validator: go_validator/main.go go_validator/scan_file.go
	$(GO) build -o go_validator/go_validator go_validator/main.go go_validator/scan_file.go

clean:
	rm go_validator/example/go_example
	rm go_validator/go_validator
