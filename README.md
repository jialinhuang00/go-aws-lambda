

# Environment
#### PC
```bash
brew install go
brew install serverless
```

#### Project
```bash
go get github.com/aws/aws-lambda-go/events
go get github.com/aws/aws-lambda-go/lambda
```
#### Authentication
[:key:Get Access Key](https://console.aws.amazon.com/iam/home#/security_credentials)
```bash
$ serverless config credentials 
  --provider aws 
  --key [AWSAccessKeyId] --secret [AWSSecretKey] -o
```


# Build & Deploy
```bash
GOOS=linux go build -o bin/hello main.go
sls deploy -v
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




