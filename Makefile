all: build-protoc

build-protoc:
	cd ./src/svc/proto/; \
	grpc_tools_ruby_protoc --ruby_out=. --grpc_out=. ./mather.proto; \
	cd ../../../

build-binary-linux-amd64:
	mkdir -p ./.bin; \
	rubyc -o ./.bin/mather-rb-server-linux-amd64 --clean-tmpdir ./src/cmd/server/mather

build-binary-darwin-amd64:
	mkdir -p ./.bin; \
	rubyc -o ./.bin/mather-rb-server-darwin-amd64 --clean-tmpdir ./src/cmd/server/mather

install-binary-linux-amd64:
	sudo chmod +x ./.bin/mather-rb-server-linux-amd64; \
	sudo mv ./.bin/mather-rb-server-linux-amd64 /usr/local/bin/mather-rb-server

install-binary-darwin-amd64:
	sudo chmod +x ./.bin/mather-rb-server-darwin-amd64; \
	sudo mv ./.bin/mather-rb-server-darwin-amd64 /usr/local/bin/mather-rb-server

clean:
	rm -rf ./.bin
	rm ./src/svc/proto/*pb.*

run:
	./src/cmd/server/mather
