build:	
	GOOS=linux GOARCH=arm64 go build -o build/lambda/hello/bootstrap main.go

zip:
	zip -j build/lambda/hello.zip build/lambda/hello/bootstrap

deploy:
	sls deploy -v

retract:
	sls remove

clean:
	rm -rf ./bin

