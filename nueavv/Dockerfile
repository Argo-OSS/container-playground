# Build stage
FROM golang:1.19-alpine AS builder

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY main.go .

RUN go build -o nueavv main.go

FROM alpine:3.20.2

# Set the Current Working Directory inside the container
WORKDIR /root/

# Copy the Pre-built binary file from the previous stage
COPY --from=builder /app/nueavv .

# Expose port 8080 to the outside world
EXPOSE 8080

# Command to run the executable
CMD ["./nueavv"]
