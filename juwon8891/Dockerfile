FROM golang:1.22-alpine AS builder

WORKDIR /build

RUN apk update && apk upgrade && apk add --no-cache ca-certificates upx && update-ca-certificates && mkdir /app

COPY . .

RUN --mount=type=cache,target="/root/.cache/go-build" \
    GOCACHE=/root/.cache/go-build \
    CGO_ENABLE=0 \
    GOOS=linux \
    go build -a -ldflags '-s -w' -mod vendor -o /app/cmd ./cmd

RUN upx /app/cmd

FROM scratch

WORKDIR /app
COPY --from=builder /app/cmd ./
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/

EXPOSE 8080

CMD ["/app/cmd"]