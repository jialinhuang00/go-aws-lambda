# Environment

#### CLI install

```bash
brew install go
brew install serverless
```

#### Go Package installation

```bash
go install github.com/aws/aws-lambda-go/events
go install github.com/aws/aws-lambda-go/lambda
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
make build
make zip
make deploy

# if anything wrong happened.
make retract


# try try
sls invoke -f hello
```

Output:

```
{
    "statusCode": 200,
    "headers": {
        "Content-Type": "text/html"
    },
    "multiValueHeaders": null,
    "body": "<h1>Go Serverless works, here is html format</h1>"
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

# Misc

## serverless.yml Runtime updated

No longer support go1.x
[here](https://aws.amazon.com/blogs/compute/migrating-aws-lambda-functions-from-the-go1-x-runtime-to-the-custom-runtime-on-amazon-linux-2/)

```
Lambda is deprecating the go1.x runtime in line with Amazon Linux 1 end-of-life, scheduled for December 31, 2023. Customers using Go with Lambda should migrate their functions to the provided.al2 runtime. Benefits include support for AWS Graviton2 processors with better price-performance, and a streamlined invoke path with faster performance.
```

## go get is deprecated

```
Starting from Go version 1.16, go get is no longer the recommended way to manage dependencies. Instead, it is recommended to use Go modules. Using Go modules allows for better management of project dependencies.
```
