# The Flutter tooling requires that developers have CMake 3.10 or later
# installed. You should not increase this version, as doing so will cause
# the plugin to fail to compile for some customers of the plugin.
cmake_minimum_required(VERSION 3.10)

project(flutter_codde_protocol_library VERSION 0.0.1 LANGUAGES C)

add_library(flutter_codde_protocol SHARED
  "flutter_codde_protocol.c"
)

set_target_properties(flutter_codde_protocol PROPERTIES
  PUBLIC_HEADER flutter_codde_protocol.h
  OUTPUT_NAME "flutter_codde_protocol"
)

target_compile_definitions(flutter_codde_protocol PUBLIC DART_SHARED_LIB)
