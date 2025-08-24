FROM golang:alpine AS builder
WORKDIR /app
COPY main.go .
RUN CGO_ENABLED=0 go build -ldflags="-s -w" -o main main.go
# -s : (디버거를 위한) 심볼 테이블 제거, -w: 디버깅 정보 제거

FROM scratch
COPY --from=builder /app/main /main

ENTRYPOINT ["/main"]
