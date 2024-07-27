FROM golang:1.20 AS builder

WORKDIR /app

COPY main.go ./

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o app main.go

EXPOSE 8080

CMD ["./app"]
