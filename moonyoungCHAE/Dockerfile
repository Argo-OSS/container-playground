# stage 1
FROM golang:alpine AS builder
WORKDIR /build
COPY . /build
RUN go mod download && go build -o main main.go

# stage 2
FROM scratch
COPY --from=builder /build/main .
ENTRYPOINT ["/main"]
