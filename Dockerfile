FROM golang:1.12-alpine as builder
COPY . /go/src/github.com/fahernandez/go-linter-test-error-handling
WORKDIR /go/src/github.com//fahernandezgo-linter-test-error-handling

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o first-app main.go

RUN ls /go/src/github.com/fahernandez/go-linter-test-error-handling
RUN chmod +x /go/src/github.com/fahernandez/go-linter-test-error-handling
ENTRYPOINT ["/go/src/github.com/fahernandez/go-linter-test-error-handling"]
