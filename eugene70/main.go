package main

import (
	"fmt"
	"net/http"
	"os"
)

func main() {
	http.HandleFunc("/api/v1/", func(w http.ResponseWriter, r *http.Request) {
		githubUsername := r.URL.Path[len("/api/v1/"):]
		fmt.Fprintf(w, "Hello, %s!", githubUsername)
	})

	http.HandleFunc("/healthcheck", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "OK")
	})

	port := "8080"
	if fromEnv := os.Getenv("PORT"); fromEnv != "" {
		port = fromEnv
	}

	fmt.Printf("Starting server on port %s\n", port)
	if err := http.ListenAndServe(":"+port, nil); err != nil {
		fmt.Printf("Error starting server: %s\n", err)
	}
}
