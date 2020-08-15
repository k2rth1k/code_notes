.Phony: proto
proto:
	@echo "compiling proto files...."
	for i in $$(find . -maxdepth 4 -mindepth 1 -name '*.proto'); do \
  				protoc -I/usr/local/include -I. \
  					-I$(GOPATH)/src \
  					-I${GOPATH}/src/github.com/grpc-ecosystem/grpc-gateway \
  					--grpc-gateway_out=logtostderr=true:. \
  					--go_out=plugins=grpc:. \
                	-I$(GOPATH)/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis \
                	--swagger_out=logtostderr=true:. \
               		 $$i; \
    done;

.Phony: build
build:	proto
	@echo "building application...."
	@go build -o build/amd64/go_programming main.go
	@echo "successfully built application"

.Phony: run
run: build
	@echo "starting service....."
	@./build/amd64/go_programming

.Phony: go
go: ## go checks module packages
	$(ECHO) go list -mod=readonly -u -m all
	$(ECHO) go mod verify
	$(ECHO) go mod tidy
	$(ECHO) go mod vendor