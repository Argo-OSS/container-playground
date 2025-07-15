package main

import (
	"github.com/SinnoLn/container-playground/2025/helm/SinnoLn/internal/server"
	"log"
	"os"
)

func main() {
	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}

	appServer := server.NewServer(port)

	appServer.SetupRoutes()

	log.Printf("Application starting on port %s...", port)
	if err := appServer.Start(); err != nil {
		log.Fatalf("Server failed to start: %v", err)
	}
}
