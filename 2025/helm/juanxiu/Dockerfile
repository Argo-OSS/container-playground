FROM golang:1.24.4-alpine AS builder
WORKDIR /app
COPY cmd/ ./cmd/
RUN go build -o myapp ./cmd

FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/myapp .
ENV PORT=8080
EXPOSE 8080
CMD ["./myapp"]
