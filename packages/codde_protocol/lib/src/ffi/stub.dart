import 'package:codde_protocol/src/frb_generated.dart';

/// Represents the external library for codde_protocol
///
/// Will be a DynamicLibrary for dart:io or WasmModule for dart:html
typedef ExternalLibrary = Object;

createWrapperImpl(ExternalLibrary lib) => throw UnimplementedError();
