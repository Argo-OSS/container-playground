package main

import (
	"fmt"
	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
	"github.com/labstack/gommon/log"
	"net/http"
)

const PORT = 8080

func main() {
	e := echo.New()
	e.Use(middleware.Recover())
	e.Use(middleware.Logger())

	e.Any("/healthcheck", func(c echo.Context) error {
		return c.String(http.StatusOK, "Hello World")
	})
	e.Any("/api/v1/daengdaengLee", func(c echo.Context) error {
		return c.String(http.StatusOK, "Hello daengdaengLee")
	})

	err := e.Start(fmt.Sprintf(":%v", PORT))
	if err != nil {
		log.Fatal(err)
	}
}
