package router

import (
	"fmt"

	"github.com/gin-gonic/gin"
)

func Route() {
	r := gin.Default()
	r.GET("/ping", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "pong",
		})
	})
	err := r.Run() // listen and serve on 0.0.0.0:8080 (for windows "localhost:8080")
	if err != nil {
		fmt.Printf("%#v\n", err)
	}
}
