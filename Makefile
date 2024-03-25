build:	
	GOOS=linux GOARCH=arm64 go build -o build/lambda/hello/bootstrap main.go

zip:
	zip -j build/lambda/hello.zip build/lambda/hello/bootstrap

deploy:
	sls deploy --verbose

retract:
	sls remove

clean:
	rm -rf ./build

