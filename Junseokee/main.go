package main

import (
	"fmt"
	"net/http"
	"os"
)

func main() {
	http.HandleFunc("/api/v1/Junseokee", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hello from Junseokee")
	})

	http.HandleFunc("/healthcheck", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "OK")
	})

	port := "8080"
	if fromEnv := os.Getenv("PORT"); fromEnv != "" {
		port = fromEnv
	}

	http.ListenAndServe(":"+port, nil)
}
