build-linux: clean
	docker build -t dms-builder .
	docker run --rm -v "${PWD}":/go/src/terraform-provider-dmsnitch dms-builder go build -o terraform-provider-dmsnitch-linux-amd64

build: clean
	go get -d -v ./...
	go install -v ./...
	go build -o terraform-provider-dmsnitch-darwin-amd64

install:
	cp terraform-provider-dmsnitch  ~/.terraform.d/plugins/

clean:
	rm -f terraform-provider-dmsnitch-*
