# 빌더 스테이지 
FROM golang:1.24.4-alpine AS builder
RUN apk update
RUN apk add git
RUN apk add ca-certificates
RUN apk add upx 

WORKDIR /app

COPY go.mod ./
RUN go mod download

COPY ./cmd ./cmd

RUN go mod tidy
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -ldflags='-s -w' -o main cmd/main.go
RUN upx --lzma main


# scratch 런타임 
FROM scratch
COPY --from=builder /app/main /main
CMD ["/main"]

