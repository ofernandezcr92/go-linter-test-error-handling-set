FROM golang:1.13-alpine as builder
COPY . /go/src/github.com/fahernandez/go-linter-test-error-handling
WORKDIR /go/src/github.com/fahernandez/go-linter-test-error-handling
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o go-linter-test-error-handling main.go

FROM alpine:3.10
RUN apk add --no-cache --update ca-certificates curl tzdata && rm -rf /var/cache/apk/*

COPY --from=builder /go/src/github.com/fahernandez/go-linter-test-error-handling/go-linter-test-error-handling /go-linter-test-error-handling

ENTRYPOINT ["/go-linter-test-error-handling"]