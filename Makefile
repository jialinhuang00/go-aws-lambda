build:	
	GOOS=linux go build -o bin/hello main.go

deploy:
	sls deploy -v

clean:
	rm -rf ./bin

