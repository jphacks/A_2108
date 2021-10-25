package router

import (
	"io"

	"github.com/jphacks/A_2108/src/domain"
)

type htttpReq struct {
	method string
	url    string
	body   io.Reader
}

type testData []struct {
	name         string
	req          htttpReq
	statusCode   int
	responseBody interface{}
}

func routerTestData() testData {
	return testData{
		// ここにテストケースを追加してください
		{
			name: "/fire success test",
			req: htttpReq{
				method: "GET",
				url:    "/fire",
				body:   nil,
			},
			statusCode: 200,
			responseBody: domain.Fire1{
				A: 1,
				B: "mieruka?",
			},
		},
		{
			name: "/fire pathpara success test",
			req: htttpReq{
				method: "GET",
				url:    "/fire/pathpara/100",
				body:   nil,
			},
			statusCode: 200,
			responseBody: domain.Fire1{
				A: 1,
				B: "100",
			},
		},
	}
}