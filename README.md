# grpc-cpp

Cross-platform C++ binaries for gRPC and Protobuf libraries.

## GitHub Actions Workflows

This repository contains GitHub Actions workflows to build gRPC and Protobuf C++ libraries for multiple platforms:

- **Ubuntu/Linux** (`build-ubuntu.yml`)
- **Windows** (`build-windows.yml`)
- **macOS** (`build-macos.yml`)

### Triggering Builds

#### For Releases
The workflows automatically trigger when a new release is created. The built libraries will be automatically attached to the release as assets with platform-specific naming:
- `grpc-protobuf-ubuntu-{version}.tar.gz`
- `grpc-protobuf-windows-{version}.zip`
- `grpc-protobuf-macos-{version}.tar.gz`

#### Manual Builds
You can also trigger the workflows manually:
1. Go to the "Actions" tab in the GitHub repository
2. Select the desired workflow (Ubuntu, Windows, or macOS)
3. Click "Run workflow"
4. The built artifacts will be available as workflow artifacts for download

### Library Versions
- **gRPC**: v1.75.0
- **Protobuf**: v21.6

### Build Configuration
All libraries are built in Release mode with optimizations enabled for production use.