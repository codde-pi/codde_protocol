#!/bin/bash

# Setup
ROOT="$(pwd)"
BUILD_DIR="$ROOT/platform-build"
mkdir $BUILD_DIR

cd "$ROOT/packages/codde_protocol/rust/client" || exit
# Build static libs
for TARGET in \
	aarch64-apple-ios x86_64-apple-ios aarch64-apple-ios-sim \
	x86_64-apple-darwin aarch64-apple-darwin; do
	rustup target add $TARGET
	cargo build -r --target=$TARGET --target-dir=target
done

# Create XCFramework zip
FRAMEWORK="CoddeProtocol.xcframework"
LIBNAME=libcodde_protocol.a
mkdir mac-lipo ios-sim-lipo
MAC_LIPO=mac-lipo/$LIBNAME
IOS_SIM_LIPO=ios-sim-lipo/$LIBNAME
lipo -create -output $IOS_SIM_LIPO \
	target/aarch64-apple-ios-sim/release/$LIBNAME \
	target/x86_64-apple-ios/release/$LIBNAME
lipo -create -output $MAC_LIPO \
	target/aarch64-apple-darwin/release/$LIBNAME \
	target/x86_64-apple-darwin/release/$LIBNAME
xcodebuild -create-xcframework \
	-library $IOS_SIM_LIPO \
	-library $MAC_LIPO \
	-library target/aarch64-apple-ios/release/$LIBNAME \
	-output $FRAMEWORK
zip -r "$BUILD_DIR/$FRAMEWORK.zip" $FRAMEWORK

# Cleanup
rm -rf ios-sim-lipo mac-lipo $FRAMEWORK
