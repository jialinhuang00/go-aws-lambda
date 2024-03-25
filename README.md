# Why

the Serverless Framework is specifically aimed at integrating cloud resources. It abstracts and automates the configuration and deployment of cloud resources, making it easier for developers to build and manage serverless applications

## Use Cases

- lower traffic APIs but requiring scalability.
- Background jobs like image processing, sending emails or data cleanup.

# Build Prepare

## CLI install

```bash
brew install go
brew install serverless
```

## Go Package Installation

the packages will be automatically installed by go build according to the definitions in `go.mod`, without the need for manual download.

1. ~~go install github.com/aws/aws-lambda-go/events~~
2. ~~go install github.com/aws/aws-lambda-go/lambda~~

## Authentication

[:key: Get Access Key](https://console.aws.amazon.com/iam/home#/security_credentials)

```bash
$ serverless config credentials \
  --provider aws \
  --key [AWSAccessKeyId] --secret [AWSSecretKey] -o
```

## Build & Deploy

```bash
# If there is already an output file/directory, remember to clear it first,
# or else it will display make: 'build' is up to date."
make build
make zip
sls deploy --verbose

# If it's determined to be an error on the AWS side,
# you can try removing all resources first
make retract

# if success, try try
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

Using curl also works

```bash
curl https://xxx.execute-api.us-east-1.amazonaws.com/dev/hello
```

# Misc

1. serverless.yml Runtime updated.
   No longer support go1.x
   [here](https://aws.amazon.com/blogs/compute/migrating-aws-lambda-functions-from-the-go1-x-runtime-to-the-custom-runtime-on-amazon-linux-2/)

   > Lambda is deprecating the go1.x runtime in line with Amazon Linux 1 end-of-life, scheduled for December 31, 2023. Customers using Go with Lambda should migrate their functions to the provided.al2 runtime. Benefits include support for AWS Graviton2 processors with better price-performance, and a streamlined invoke path with faster performance.

2. go get is deprecated

   > Starting from Go version 1.16, go get is no longer the recommended way to manage dependencies. Instead, it is recommended to use Go modules. Using Go modules allows for better management of project dependencies.

3. Why build as linux with arm64

   > The Lambda runtime environment is built on the Amazon Linux platform but differs from the traditional Amazon Linux distribution and may undergo updates and improvements over time.

4. Build Cases

   [Go (Golang) GOOS and GOARCH](https://gist.github.com/asukakenji/f15ba7e588ac42795f421b48b8aede63)

- [❌] go build -o build/lambda/hello/bootstrap main.go

- [✅] `GOOS=linux GOARCH=arm64` go build -o build/lambda/hello/bootstrap main.go
- [❌] `GOOS=linux GOARCH=amd64` go build -o build/lambda/hello/bootstrap main.go
- [✅] `GOOS=linux` go build -o build/lambda/hello/bootstrap main.go

- [❌] `GOOS=darwin GOARCH=amd64` go build -o build/lambda/hello/bootstrap main.go
- [❌] `GOOS=windows GOARCH=amd64` go build -o build/lambda/hello/bootstrap main.go
