FROM golang:alpine AS builder

ENV GO111MODULE=on \
    CGO_ENABLED=0 \
    GOOS=linux \
    GOARCH=amd64

WORKDIR /build

COPY go.mod main.go layout.html ./

RUN go mod tidy

RUN go build -o main .

WORKDIR /dist

RUN cp /build/main .

RUN cp /build/layout.html .

FROM scratch

COPY --from=builder /dist/main .
COPY --from=builder /dist/layout.html .

ENTRYPOINT ["/main"]
