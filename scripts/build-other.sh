#!/bin/bash

# Setup
BUILD_DIR=platform-build
mkdir $BUILD_DIR
cd $BUILD_DIR

# Install build dependencies
cargo install cargo-zigbuild

zig_build() {
	local TARGET="$1"
	local PLATFORM_NAME="$2"
	local LIBNAME="$3"
	# export PYO3_CROSS=0
	# export PYO3_CROSS_PYTHON_VERSION=3.11
	# export PYO3_CROSS_LIB_DIR="../target/$TARGET/release/"
	rustup target add "$TARGET"
	cargo zigbuild --target "$TARGET" -r
	# TODO: raise error if LIB is not found
	mkdir "$PLATFORM_NAME"
	cp "../target/$TARGET/release/$LIBNAME" "$PLATFORM_NAME/"
}

# Build all the dynamic libraries
LINUX_LIBNAME=libcodde_protocol.so
zig_build aarch64-unknown-linux-gnu linux-arm64 $LINUX_LIBNAME
zig_build x86_64-unknown-linux-gnu linux-x64 $LINUX_LIBNAME

# Archive the dynamic libs
tar -czvf other.tar.gz linux-*

# Cleanup
rm -rf linux-*
