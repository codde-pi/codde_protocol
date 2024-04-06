#!/bin/bash

CURR_VERSION=codde_protocol-v$(awk '/^version: /{print $2}' packages/codde_protocol/pubspec.yaml)

# iOS & macOS
APPLE_HEADER="release_tag_name = '$CURR_VERSION' # generated; do not edit"
sed -i.bak "1 s/.*/$APPLE_HEADER/" packages/flutter_codde_protocol/ios/flutter_codde_protocol.podspec
sed -i.bak "1 s/.*/$APPLE_HEADER/" packages/flutter_codde_protocol/macos/flutter_codde_protocol.podspec
rm packages/flutter_codde_protocol/macos/*.bak packages/flutter_codde_protocol/ios/*.bak

# CMake platforms (Linux, Windows, and Android)
CMAKE_HEADER="set(LibraryVersion \"$CURR_VERSION\") # generated; do not edit"
for CMAKE_PLATFORM in android linux windows; do
	sed -i.bak "1 s/.*/$CMAKE_HEADER/" packages/flutter_codde_protocol/$CMAKE_PLATFORM/CMakeLists.txt
	rm packages/flutter_codde_protocol/$CMAKE_PLATFORM/*.bak
done

# git add packages/flutter_codde_protocol/
ROOT="$(pwd)"

cp "$ROOT/LICENSE" "$ROOT/README.md" "$ROOT/CHANGELOG.md" "$ROOT/packages/codde_protocol" -f
cp "$ROOT/LICENSE" "$ROOT/README.md" "$ROOT/CHANGELOG.md" "$ROOT/packages/flutter_codde_protocol" -f
