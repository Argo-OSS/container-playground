package main

import (
  "fmt"
  "net/http"
  "html/template"
)

type PageData struct {
    PageTitle string
}

func main() {
  layout := template.Must(template.ParseFiles("layout.html"))

  http.HandleFunc("/api/v1/D0ri123", func(w http.ResponseWriter, r *http.Request) {
    data := PageData {
      PageTitle: "Gamzadori",
    }
    layout.Execute(w, data)
  })

  http.HandleFunc("/healthcheck", func(w http.ResponseWriter, r *http.Request) {
    data := PageData {
      PageTitle: "OK !!",
    }
    layout.Execute(w, data)
  })

  if err := http.ListenAndServe(":8080", nil); err != nil {
    fmt.Println("에러가 떠버려따")
    panic(err)
  }
}


