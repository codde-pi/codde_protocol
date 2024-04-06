#!/bin/bash

# Setup
ROOT="$(pwd)"
BUILD_DIR="$ROOT/platform-build"
mkdir $BUILD_DIR
cd $BUILD_DIR || exit

# Create the jniLibs build directory
JNI_DIR="$ROOT/jniLibs"
mkdir -p $JNI_DIR

# Set up cargo-ndk
cargo install cargo-ndk
rustup target add \
	aarch64-linux-android
# armv7-linux-androideabi \
# x86_64-linux-android \
# i686-linux-android

# Build the android libraries in the jniLibs directory
cd "$ROOT/packages/codde_protocol/native/client" || exit

PYO3_PYTHON=python3.11 \
	PYO3_CROSS=1 \
	PYO3_CROSS_PYTHON_VERSION=3.11 \
	PYO3_CROSS_LIB_DIR=/opt/sysroot/usr/lib \
	PYO3_CROSS_PYTHON_IMPLEMENTATION=CPython \
	cargo ndk -o $JNI_DIR \
	--manifest-path Cargo.toml \
	-t arm64-v8a \
	build --release
# -t x86 \
# -t x86_64 \
# -t armeabi-v7a \

# Archive the dynamic libs
cd $JNI_DIR
tar -czvf "$BUILD_DIR/android.tar.gz" *

# Cleanup
rm -rf $JNI_DIR
