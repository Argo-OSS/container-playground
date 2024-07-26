package main

import (
	"fmt"
	"log"
	"net/http"
)

func defaultHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "My First Go Server!")
}

// /v1/healthcheck 핸들러
func healthCheckHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "OK")
}

func main() {
	http.HandleFunc("/api/v1/jcy0308", defaultHandler)
	http.HandleFunc("/v1/healthcheck", healthCheckHandler)
	
	fmt.Println("Starting server on :8080...")
	if err := http.ListenAndServe(":8080", nil); err != nil {
		log.Fatalf("Server failed to start: %v", err)
	}
}
