BIN_DIR=bin

all: build

build: build-linux build-windows build-macos-arm64 build-macos-amd64

build-linux:
	DOCKER_BUILDKIT=1 docker build --progress=plain -f Dockerfile.ubuntu -t grpc-cpp-ubuntu .
	DOCKER_BUILDKIT=1 docker run --rm -v $(CURDIR)/$(BIN_DIR):/out grpc-cpp-ubuntu cp /grpc-protobuf-ubuntu.tar.gz /out/

build-windows:
	DOCKER_BUILDKIT=1 docker build --progress=plain -f Dockerfile.windows -t grpc-cpp-windows .
	DOCKER_BUILDKIT=1 docker run --rm -v $(CURDIR)/$(BIN_DIR):/out grpc-cpp-windows powershell -Command "Copy-Item -Path C:/grpc-protobuf-windows.zip -Destination /out/grpc-protobuf-windows.zip"

build-macos-arm64:
	DOCKER_BUILDKIT=1 docker build --progress=plain -f Dockerfile.macos-arm64 -t grpc-cpp-macos-arm64 .
	DOCKER_BUILDKIT=1 docker run --rm -v $(CURDIR)/$(BIN_DIR):/out grpc-cpp-macos-arm64 cp /grpc-protobuf-macos-arm64.tar.gz /out/

build-macos-amd64:
	DOCKER_BUILDKIT=1 docker build --progress=plain -f Dockerfile.macos-amd64 -t grpc-cpp-macos-amd64 .
	DOCKER_BUILDKIT=1 docker run --rm -v $(CURDIR)/$(BIN_DIR):/out grpc-cpp-macos-amd64 cp /grpc-protobuf-macos-amd64.tar.gz /out/

.PHONY: all build build-linux build-windows build-macos-arm64 build-macos-amd64
