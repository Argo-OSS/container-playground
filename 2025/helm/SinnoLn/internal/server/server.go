package server

import (
	"github.com/SinnoLn/container-playground/2025/helm/SinnoLn/internal/handler"
	"log"
	"net/http"
)

type Server struct {
	port string
}

func NewServer(port string) *Server {
	return &Server{port: port}
}

func (s *Server) SetupRoutes() {
	log.Println("Setting up routes...")
	http.HandleFunc("/api/v1/SinnoLn", handler.SinnoLnHandler)
	http.HandleFunc("/healthcheck", handler.HealthCheckHandler)
	log.Println("Routes set up successfully.")
}

func (s *Server) Start() error {
	log.Printf("Starting HTTP server on :%s", s.port)
	return http.ListenAndServe(":"+s.port, nil)
}
