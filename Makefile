build:	
	GOOS=linux GOARCH=arm64 go build -o build/lambda/hello/bootstrap main.go

deploy:
	sls deploy -v

retract:
	sls remove

clean:
	rm -rf ./bin

