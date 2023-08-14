FROM golang:alpine AS builder

LABEL maintainer="sn0716@naver.com" \
      version="1.0.0" \
      description="container playground dockerfile"

ENV CGO_ENABLED=0 \
    GOOS=linux \
    GOARCH=amd64

WORKDIR /app
COPY . /app
RUN go build -o main .

FROM scratch
COPY --from=builder /app/main .
EXPOSE 8080

ENTRYPOINT ["./main"]