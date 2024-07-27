package main

import (
		"fmt"
		"net/http"
)

func healthcheck(w http.ResponseWriter, req *http.Request) {
		fmt.Fprint(w, "ok")
}

func iamhansko(w http.ResponseWriter, req *http.Request) {
		fmt.Fprint(w, "iamhansko")
}

func main() {
		http.HandleFunc("/healthcheck", healthcheck)
		http.HandleFunc("/api/v1/iamhansko", iamhansko)
		http.ListenAndServe(":8080", nil)
}