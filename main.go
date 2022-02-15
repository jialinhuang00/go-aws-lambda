package main

import (
	"context"

	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"
)

type Response events.APIGatewayProxyResponse

func Handler(ctx context.Context) (Response, error) {

	resp := Response{
		StatusCode: 200,
		Headers:    map[string]string{"Content-Type": "text/html"},
		Body:       "<h1>Go Serverless works, here is html format</h1>",
	}

	return resp, nil
}

func main() {
	lambda.Start(Handler)
}
