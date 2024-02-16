import 'package:codde_protocol/src/frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';

typedef ExternalLibrary = WasmModule;

createWrapperImpl(ExternalLibrary module) => Impl.wasm(module);
