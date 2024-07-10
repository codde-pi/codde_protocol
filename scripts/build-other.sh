#!/bin/bash

# Setup
ROOT="$(pwd)"
BUILD_DIR="$ROOT/platform-build"
mkdir $BUILD_DIR
cd $BUILD_DIR

# Install build dependencies
cargo install cargo-zigbuild

zig_build() {
	cd "$ROOT/packages/codde_protocol/rust/client" || exit

	local TARGET="$1"
	local PLATFORM_NAME="$2"
	local LIBNAME="$3"
	# export PYO3_CROSS=0
	# export PYO3_CROSS_PYTHON_VERSION=3.11
	# export PYO3_CROSS_LIB_DIR="../target/$TARGET/release/"
	rustup target add "$TARGET"
	cargo zigbuild --target "$TARGET" -r --target-dir target
	# TODO: raise error if LIB is not found
	mkdir "$BUILD_DIR/$PLATFORM_NAME"
	cp "target/$TARGET/release/$LIBNAME" "$BUILD_DIR/$PLATFORM_NAME/"
}

# Build all the dynamic libraries
LINUX_LIBNAME=libcodde_protocol.so
zig_build aarch64-unknown-linux-gnu linux-arm64 $LINUX_LIBNAME
zig_build x86_64-unknown-linux-gnu linux-x64 $LINUX_LIBNAME
WINDOWS_LIBNAME=libcodde_protocol.dll
# TODO: win_build
win_build aarch64-pc-windows-msvc windows-arm64 $WINDOWS_LIBNAME
win_build x86_64-pc-windows-msvc windows-x64 $WINDOWS_LIBNAME

cd $BUILD_DIR || exit

# Archive the dynamic libs
tar -czvf other.tar.gz linux-* windows-*

# Cleanup
rm -rf linux-* windows-*
