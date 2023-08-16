# stage 1
FROM golang:alpine AS builder
WORKDIR /build
COPY go.mod go.sum /build/
RUN go mod download
COPY main.go /build/
RUN go build -o main main.go

# stage 2
FROM scratch
COPY --from=builder /build/main .
ENTRYPOINT ["/main"]
