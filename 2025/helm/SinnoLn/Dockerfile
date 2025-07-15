FROM golang:1.22-alpine AS builder

WORKDIR /app

COPY go.mod ./

RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main ./cmd/main.go

FROM alpine:3.20.2

WORKDIR /root/

COPY --from=builder /app/main .

EXPOSE 8080

CMD ["./main"]