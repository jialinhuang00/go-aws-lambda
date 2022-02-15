

# Environment
#### Pc package installation
```bash
brew install go
brew install serverless
```

#### Go Package installation
```bash
go get github.com/aws/aws-lambda-go/events
go get github.com/aws/aws-lambda-go/lambda
```

#### Authentication
[:key: Get Access Key](https://console.aws.amazon.com/iam/home#/security_credentials)
```bash
$ serverless config credentials 
  --provider aws 
  --key [AWSAccessKeyId] --secret [AWSSecretKey] -o
```


# Build & Deploy
> Before you try to deploy, make some change, or sls will skip if no any updates.
```bash
GOOS=linux go build -o bin/hello main.go

# if get Resource handler returned message: "Lambda function xxxx could not be found"
# do `sls remove` first
sls deploy

# Deploying go-aws-lambda-hello to stage dev (us-east-1)

# ✔ Service deployed to stack go-aws-lambda-hello-dev (84s)

# endpoint: GET - https://xxx.execute-api.us-east-1.amazonaws.com/dev/hello
# functions:
#   hello: go-aws-lambda-hello-dev-hello (5.1 MB)

sls invoke -f hello
```
Output:
```
{
    "statusCode": 200,
    "headers": null,
    "multiValueHeaders": null,
    "body": "{\"message\":\"Go Serverless works\"}"
}
```
Using curl
```bash
curl https://xxx.execute-api.us-east-1.amazonaws.com/dev/hello
```

# BUILD CASES
#### WORKS
with `handler: bin/hello.exe`
```
$ GOOS=linux go build -o bin/hello.exe main.go
```

with `handler: bin/hello`
```
$ GOOS=linux go build -o bin/hello main.go
```

with `handler: bin/hello`
```
$ go build -o bin/hello main.go
```


#### FAILED
with `handler: bin/hello`

```
$ GOOS=darwin GOARCH=amd64 go build -o bin/hello main.go
```


with `handler: bin/hello.exe`
```
$ GOOS=darwin GOARCH=amd64 go build -o bin/hello.exe main.go
```