package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
)

func healthcheckHandler(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	fmt.Fprint(w, `{"status": "ok"}`)
}

func myHandler(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	fmt.Fprintln(w, `{"message": "Hello world"}`)
}

func getPort() string {
	if port := os.Getenv("PORT"); port != "" {
		return port
	}
	return "8080"
}

func main() {
	http.HandleFunc("/healthcheck", healthcheckHandler)
	http.HandleFunc("/api/v1/dst03106", myHandler)

	port := getPort()
	host := "0.0.0.0"
	log.Printf("Server running on http://%s:%s\n", host, port)
	err := http.ListenAndServe(host+":"+port, nil)
	if err != nil {
		log.Fatalf("Failed to start server: %v", err)
	}
}
