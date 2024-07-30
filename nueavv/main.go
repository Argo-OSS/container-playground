package main

import (
    "net/http"
    "github.com/labstack/echo/v4"
    "github.com/labstack/echo/v4/middleware"
)

func main() {
    // Echo 인스턴스 생성
    e := echo.New()

    // 미들웨어 설정
    e.Use(middleware.Logger())
    e.Use(middleware.Recover())

    // 경로 설정
    e.GET("/api/v1/nueavv", healthCheck)
    e.GET("/healthcheck", healthCheck)

    // 서버 시작
    e.Logger.Fatal(e.Start(":8080"))
}

// 헬스체크 핸들러 함수
func healthCheck(c echo.Context) error {
    return c.String(http.StatusOK, "ok")
}
