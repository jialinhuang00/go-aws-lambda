

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
sls deploy
# if get Resource handler returned message: "Lambda function xxxx could not be found"
# do `sls remove` first

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
curl https://lwih1pc1ac.execute-api.us-east-1.amazonaws.com/dev/hello
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