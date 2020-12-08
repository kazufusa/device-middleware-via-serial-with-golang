.PHONY: test lint

test:
	go test -race -timeout 30m -coverprofile=coverage.txt -covermode=atomic ./...
	go tool cover -html=coverage.txt -o coverage.html
	go tool cover -func=coverage.txt
	rm -rf ./coverage.txt
	go mod tidy && git diff --exit-code

lint:
	golangci-lint run
