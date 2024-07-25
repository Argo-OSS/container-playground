FROM golang:1.22-alpine AS builder

ENV CGO_ENABLED=0 \
    GOOS=linux \
    GOARCH=amd64

WORKDIR /app

COPY go.mod go.sum main.go ./
RUN go mod tidy
RUN go build main.go

FROM alpine:3.20

WORKDIR /app

COPY --from=builder /app/main ./

ENTRYPOINT ["/app/main"]
