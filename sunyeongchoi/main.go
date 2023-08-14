package main

import (
	"github.com/gin-gonic/gin"
	"net/http"
)

type sunyeongchoi struct {
	Name 	string 	`json:"name"`
	Age 	string 	`json:"age"`
	Mbti 	string 	`json:"mbti"`
	Hobby 	string 	`json:"hobby"`
}

func main()  {
	router := gin.Default()
	router.GET("/api/v1/sunyeongchoi", getMe)
	router.GET("/healthcheck", healthCheck)
	router.Run(":8080")
}

func getMe(c *gin.Context)  {
	c.IndentedJSON(http.StatusOK, sunyeongchoi{ Name: "최수녕", Age: "만 27세", Mbti: "ISFP", Hobby: "Swimming" })
}

func healthCheck(c *gin.Context) {
	c.String(http.StatusOK, "ok")
}
