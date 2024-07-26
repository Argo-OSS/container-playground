# Dockerfile
FROM golang:1.16 as builder

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /my-web-service

FROM scratch

COPY --from=builder /my-web-service /my-web-service

EXPOSE 8080

CMD ["/my-web-service"]

