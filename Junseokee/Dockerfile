# syntax=docker/dockerfile:1

FROM golang:1.21-alpine as builder

WORKDIR /app

COPY go.mod ./
COPY *.go ./

RUN go mod download && \
    go build -o /myapp


FROM alpine

COPY --from=builder /myapp ./main

EXPOSE 8080

ENTRYPOINT ["./main"]