package main

import (
	"github.com/labstack/echo/v4"
)

func main() {
	e := echo.New()
	e.GET("/api/v1/moonyoungCHAE", func(c echo.Context) error {
		return nil
	})
	e.GET("/healthcheck", func(c echo.Context) error {
		return nil
	})
	e.Logger.Fatal(e.Start(":8080"))
}
