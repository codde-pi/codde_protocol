// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0-dev.24.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../../../frb_generated.dart';
import '../../models/frame.dart';
import '../../models/server.dart';
import '../../models/widget_registry.dart';
import '../server.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

// Rust type: RustOpaqueMoi<flutter_rust_bridge::for_generated::rust_async::RwLock<ComSocketServer>>
@sealed
class ComSocketServer extends RustOpaque {
  ComSocketServer.dcoDecode(List<dynamic> wire)
      : super.dcoDecode(wire, _kStaticData);

  ComSocketServer.sseDecode(int ptr, int externalSizeOnNative)
      : super.sseDecode(ptr, externalSizeOnNative, _kStaticData);

  static final _kStaticData = RustArcStaticData(
    rustArcIncrementStrongCount:
        RustLib.instance.api.rust_arc_increment_strong_count_ComSocketServer,
    rustArcDecrementStrongCount:
        RustLib.instance.api.rust_arc_decrement_strong_count_ComSocketServer,
    rustArcDecrementStrongCountPtr:
        RustLib.instance.api.rust_arc_decrement_strong_count_ComSocketServerPtr,
  );

  static Future<ServerProtocol> open(
          {required String address,
          required Map<String, Action> actions,
          dynamic hint}) =>
      RustLib.instance.api
          .comSocketServerOpen(address: address, actions: actions, hint: hint);

  Future<void> callback(
          {required int id,
          required ServerStatus status,
          required PyPyAny data,
          dynamic hint}) =>
      RustLib.instance.api.comSocketServerCallback(
        that: this,
        id: id,
        status: status,
        data: data,
      );

  Future<void> close({dynamic hint}) =>
      RustLib.instance.api.comSocketServerClose(
        that: this,
      );

  static Future<ComSocketServer> newComSocketServer(
          {required Str address, dynamic hint}) =>
      RustLib.instance.api.comSocketServerNew(address: address, hint: hint);

  Future<void> open({dynamic hint}) => RustLib.instance.api.comSocketServerOpen(
        that: this,
      );

  Future<void> serve({dynamic hint}) =>
      RustLib.instance.api.comSocketServerServe(
        that: this,
      );
}

// Rust type: RustOpaqueMoi<flutter_rust_bridge::for_generated::rust_async::RwLock<T>>
@sealed
class T extends RustOpaque {
  T.dcoDecode(List<dynamic> wire) : super.dcoDecode(wire, _kStaticData);

  T.sseDecode(int ptr, int externalSizeOnNative)
      : super.sseDecode(ptr, externalSizeOnNative, _kStaticData);

  static final _kStaticData = RustArcStaticData(
    rustArcIncrementStrongCount:
        RustLib.instance.api.rust_arc_increment_strong_count_T,
    rustArcDecrementStrongCount:
        RustLib.instance.api.rust_arc_decrement_strong_count_T,
    rustArcDecrementStrongCountPtr:
        RustLib.instance.api.rust_arc_decrement_strong_count_TPtr,
  );
}

// Rust type: RustOpaqueMoi<flutter_rust_bridge::for_generated::rust_async::RwLock<fn (s : WidgetRegistry) -> Result < () >>>
@sealed
class FnSWidgetRegistryResult extends RustOpaque {
  FnSWidgetRegistryResult.dcoDecode(List<dynamic> wire)
      : super.dcoDecode(wire, _kStaticData);

  FnSWidgetRegistryResult.sseDecode(int ptr, int externalSizeOnNative)
      : super.sseDecode(ptr, externalSizeOnNative, _kStaticData);

  static final _kStaticData = RustArcStaticData(
    rustArcIncrementStrongCount: RustLib
        .instance.api.rust_arc_increment_strong_count_FnSWidgetRegistryResult,
    rustArcDecrementStrongCount: RustLib
        .instance.api.rust_arc_decrement_strong_count_FnSWidgetRegistryResult,
    rustArcDecrementStrongCountPtr: RustLib.instance.api
        .rust_arc_decrement_strong_count_FnSWidgetRegistryResultPtr,
  );
}
