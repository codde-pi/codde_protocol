#!/bin/bash

if [ -z "$1" ]; then
	CURR_VERSION=$(awk '/^version: /{print $2}' packages/codde_protocol/pubspec.yaml | sed 's/\"//g')
else
	CURR_VERSION=$1
fi

ROOT="$(pwd)"

# iOS & macOS
APPLE_HEADER="release_tag_name = '$CURR_VERSION' # generated; do not edit"
sed -i.bak "1 s/.*/$APPLE_HEADER/" packages/flutter_codde_protocol/ios/flutter_codde_protocol.podspec
sed -i.bak "1 s/.*/$APPLE_HEADER/" packages/flutter_codde_protocol/macos/flutter_codde_protocol.podspec
rm packages/flutter_codde_protocol/macos/*.bak packages/flutter_codde_protocol/ios/*.bak

# CMake platforms (Linux, Windows, and Android)
CMAKE_HEADER="set(LibraryVersion \"v$CURR_VERSION\") # generated; do not edit"
for CMAKE_PLATFORM in android linux windows; do
	sed -i.bak "1 s/.*/$CMAKE_HEADER/" packages/flutter_codde_protocol/$CMAKE_PLATFORM/CMakeLists.txt
	rm packages/flutter_codde_protocol/$CMAKE_PLATFORM/*.bak
done

# Workspace
if [[ -n "$1" ]]; then sed -i "s/version: .*/version: $CURR_VERSION/" pubspec.yaml; fi
# Rust
sed -i "0,/version = .*/{s/version = .*/version = \"$CURR_VERSION\"/}" packages/codde_protocol/rust/Cargo.toml
# Rust client
sed -i "0,/version = .*/{s/version = .*/version = \"$CURR_VERSION\"/}" packages/codde_protocol/rust/client/Cargo.toml
# Python
sed -i "0,/version = .*/{s/version = .*/version = \"$CURR_VERSION\"/}" packages/codde_protocol/rust/pyproject.toml
# Dart
sed -i "s/version: .*/version: $CURR_VERSION/" packages/codde_protocol/pubspec.yaml
# Flutter
sed -i "s/version: .*/version: $CURR_VERSION/" packages/flutter_codde_protocol/pubspec.yaml
sed -i "s/codde_protocol: .*/codde_protocol: \^$CURR_VERSION/" packages/flutter_codde_protocol/pubspec.yaml

# git add packages/flutter_codde_protocol/

# Flutter
cp "$ROOT/LICENSE" "$ROOT/README.md" "$ROOT/CHANGELOG.md" "$ROOT/packages/codde_protocol" -f
cp "$ROOT/LICENSE" "$ROOT/README.md" "$ROOT/CHANGELOG.md" "$ROOT/packages/flutter_codde_protocol" -f
# Rust
cp "$ROOT/LICENSE" "$ROOT/README.md" "$ROOT/CHANGELOG.md" "$ROOT/packages/codde_protocol/rust" -f
cp "$ROOT/LICENSE" "$ROOT/README.md" "$ROOT/CHANGELOG.md" "$ROOT/packages/codde_protocol/rust/client" -f
