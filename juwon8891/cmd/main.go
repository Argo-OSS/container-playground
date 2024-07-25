package main

import (
	"log/slog"
	"net/http"
)

func main() {
	mux := http.NewServeMux()
	mux.Handle("/healthcheck", http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Content-Type", "application/json")
		w.WriteHeader(http.StatusOK)
		w.Write([]byte(`{"status": "OK"}`))
	}))

	mux.Handle("/api/v1/juwon8891", http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Content-Type", "application/json")
		w.WriteHeader(http.StatusOK)
		w.Write([]byte(`{"status": "juwon8891"}`))
	}))
	slog.Error(http.ListenAndServe(":8080", mux).Error())
}
