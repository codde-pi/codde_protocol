// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0-dev.27.

// ignore_for_file: unused_import, unused_element, unnecessary_import, duplicate_ignore, invalid_use_of_internal_member, annotate_overrides, non_constant_identifier_names, curly_braces_in_flow_control_structures, prefer_const_literals_to_create_immutables, unused_field

import 'api/models/frame.dart';
import 'api/models/server.dart';
import 'api/models/widget_registry.dart';
import 'api/protocols/client/codde_pi_client.dart';
import 'api/protocols/client/com_socket.dart';
import 'api/protocols/server/codde_pi_server.dart';
import 'api/protocols/server/com_socket.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:ffi' as ffi;
import 'frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated_io.dart';

abstract class RustLibApiImplPlatform extends BaseApiImpl<RustLibWire> {
  RustLibApiImplPlatform({
    required super.handler,
    required super.wire,
    required super.generalizedFrbRustBinding,
    required super.portManager,
  });

  CrossPlatformFinalizerArg
      get rust_arc_decrement_strong_count_ComSocketClientPtr => wire
          ._rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockComSocketClientPtr;

  CrossPlatformFinalizerArg
      get rust_arc_decrement_strong_count_ComSocketServerPtr => wire
          ._rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockComSocketServerPtr;

  CrossPlatformFinalizerArg get rust_arc_decrement_strong_count_PyPyAnyPtr => wire
      ._rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockPyPyAnyPtr;

  CrossPlatformFinalizerArg
      get rust_arc_decrement_strong_count_WidgetActionPtr => wire
          ._rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockWidgetActionPtr;

  CrossPlatformFinalizerArg get rust_arc_decrement_strong_count_StrPtr => wire
      ._rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockstrPtr;

  CrossPlatformFinalizerArg get rust_arc_decrement_strong_count_U8Ptr => wire
      ._rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLocku8Ptr;

  @protected
  AnyhowException dco_decode_AnyhowException(dynamic raw);

  @protected
  ComSocketClient
      dco_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockComSocketClient(
          dynamic raw);

  @protected
  ComSocketServer
      dco_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockComSocketServer(
          dynamic raw);

  @protected
  PyPyAny
      dco_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockPyPyAny(
          dynamic raw);

  @protected
  ComSocketClient
      dco_decode_Auto_RefMut_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockComSocketClient(
          dynamic raw);

  @protected
  ComSocketServer
      dco_decode_Auto_RefMut_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockComSocketServer(
          dynamic raw);

  @protected
  WidgetAction
      dco_decode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockWidgetAction(
          dynamic raw);

  @protected
  Str dco_decode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockstr(
      dynamic raw);

  @protected
  U8 dco_decode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLocku8(
      dynamic raw);

  @protected
  ComSocketClient
      dco_decode_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockComSocketClient(
          dynamic raw);

  @protected
  ComSocketServer
      dco_decode_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockComSocketServer(
          dynamic raw);

  @protected
  PyPyAny
      dco_decode_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockPyPyAny(
          dynamic raw);

  @protected
  WidgetAction
      dco_decode_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockWidgetAction(
          dynamic raw);

  @protected
  Str dco_decode_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockstr(
      dynamic raw);

  @protected
  U8 dco_decode_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLocku8(
      dynamic raw);

  @protected
  String dco_decode_String(dynamic raw);

  @protected
  bool dco_decode_bool(dynamic raw);

  @protected
  ConfirmResult dco_decode_box_autoadd_confirm_result(dynamic raw);

  @protected
  Coord dco_decode_box_autoadd_coord(dynamic raw);

  @protected
  ErrorResult dco_decode_box_autoadd_error_result(dynamic raw);

  @protected
  Frame dco_decode_box_autoadd_frame(dynamic raw);

  @protected
  ResultBinding dco_decode_box_autoadd_result_binding(dynamic raw);

  @protected
  ResultFrame dco_decode_box_autoadd_result_frame(dynamic raw);

  @protected
  WidgetRegistry dco_decode_box_autoadd_widget_registry(dynamic raw);

  @protected
  ConfirmResult dco_decode_confirm_result(dynamic raw);

  @protected
  Coord dco_decode_coord(dynamic raw);

  @protected
  ErrorResult dco_decode_error_result(dynamic raw);

  @protected
  double dco_decode_f_32(dynamic raw);

  @protected
  Frame dco_decode_frame(dynamic raw);

  @protected
  int dco_decode_i_32(dynamic raw);

  @protected
  Uint8List dco_decode_list_prim_u_8_strict(dynamic raw);

  @protected
  Frame? dco_decode_opt_box_autoadd_frame(dynamic raw);

  @protected
  ResultFrame? dco_decode_opt_box_autoadd_result_frame(dynamic raw);

  @protected
  (int, String) dco_decode_record_u_8_string(dynamic raw);

  @protected
  ResultBinding dco_decode_result_binding(dynamic raw);

  @protected
  ResultFrame dco_decode_result_frame(dynamic raw);

  @protected
  ResultRegistry dco_decode_result_registry(dynamic raw);

  @protected
  ServerStateError dco_decode_server_state_error(dynamic raw);

  @protected
  ServerStatus dco_decode_server_status(dynamic raw);

  @protected
  int dco_decode_u_8(dynamic raw);

  @protected
  void dco_decode_unit(dynamic raw);

  @protected
  int dco_decode_usize(dynamic raw);

  @protected
  WidgetRegistry dco_decode_widget_registry(dynamic raw);

  @protected
  AnyhowException sse_decode_AnyhowException(SseDeserializer deserializer);

  @protected
  ComSocketClient
      sse_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockComSocketClient(
          SseDeserializer deserializer);

  @protected
  ComSocketServer
      sse_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockComSocketServer(
          SseDeserializer deserializer);

  @protected
  PyPyAny
      sse_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockPyPyAny(
          SseDeserializer deserializer);

  @protected
  ComSocketClient
      sse_decode_Auto_RefMut_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockComSocketClient(
          SseDeserializer deserializer);

  @protected
  ComSocketServer
      sse_decode_Auto_RefMut_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockComSocketServer(
          SseDeserializer deserializer);

  @protected
  WidgetAction
      sse_decode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockWidgetAction(
          SseDeserializer deserializer);

  @protected
  Str sse_decode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockstr(
      SseDeserializer deserializer);

  @protected
  U8 sse_decode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLocku8(
      SseDeserializer deserializer);

  @protected
  ComSocketClient
      sse_decode_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockComSocketClient(
          SseDeserializer deserializer);

  @protected
  ComSocketServer
      sse_decode_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockComSocketServer(
          SseDeserializer deserializer);

  @protected
  PyPyAny
      sse_decode_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockPyPyAny(
          SseDeserializer deserializer);

  @protected
  WidgetAction
      sse_decode_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockWidgetAction(
          SseDeserializer deserializer);

  @protected
  Str sse_decode_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockstr(
      SseDeserializer deserializer);

  @protected
  U8 sse_decode_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLocku8(
      SseDeserializer deserializer);

  @protected
  String sse_decode_String(SseDeserializer deserializer);

  @protected
  bool sse_decode_bool(SseDeserializer deserializer);

  @protected
  ConfirmResult sse_decode_box_autoadd_confirm_result(
      SseDeserializer deserializer);

  @protected
  Coord sse_decode_box_autoadd_coord(SseDeserializer deserializer);

  @protected
  ErrorResult sse_decode_box_autoadd_error_result(SseDeserializer deserializer);

  @protected
  Frame sse_decode_box_autoadd_frame(SseDeserializer deserializer);

  @protected
  ResultBinding sse_decode_box_autoadd_result_binding(
      SseDeserializer deserializer);

  @protected
  ResultFrame sse_decode_box_autoadd_result_frame(SseDeserializer deserializer);

  @protected
  WidgetRegistry sse_decode_box_autoadd_widget_registry(
      SseDeserializer deserializer);

  @protected
  ConfirmResult sse_decode_confirm_result(SseDeserializer deserializer);

  @protected
  Coord sse_decode_coord(SseDeserializer deserializer);

  @protected
  ErrorResult sse_decode_error_result(SseDeserializer deserializer);

  @protected
  double sse_decode_f_32(SseDeserializer deserializer);

  @protected
  Frame sse_decode_frame(SseDeserializer deserializer);

  @protected
  int sse_decode_i_32(SseDeserializer deserializer);

  @protected
  Uint8List sse_decode_list_prim_u_8_strict(SseDeserializer deserializer);

  @protected
  Frame? sse_decode_opt_box_autoadd_frame(SseDeserializer deserializer);

  @protected
  ResultFrame? sse_decode_opt_box_autoadd_result_frame(
      SseDeserializer deserializer);

  @protected
  (int, String) sse_decode_record_u_8_string(SseDeserializer deserializer);

  @protected
  ResultBinding sse_decode_result_binding(SseDeserializer deserializer);

  @protected
  ResultFrame sse_decode_result_frame(SseDeserializer deserializer);

  @protected
  ResultRegistry sse_decode_result_registry(SseDeserializer deserializer);

  @protected
  ServerStateError sse_decode_server_state_error(SseDeserializer deserializer);

  @protected
  ServerStatus sse_decode_server_status(SseDeserializer deserializer);

  @protected
  int sse_decode_u_8(SseDeserializer deserializer);

  @protected
  void sse_decode_unit(SseDeserializer deserializer);

  @protected
  int sse_decode_usize(SseDeserializer deserializer);

  @protected
  WidgetRegistry sse_decode_widget_registry(SseDeserializer deserializer);

  @protected
  void sse_encode_AnyhowException(
      AnyhowException self, SseSerializer serializer);

  @protected
  void
      sse_encode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockComSocketClient(
          ComSocketClient self, SseSerializer serializer);

  @protected
  void
      sse_encode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockComSocketServer(
          ComSocketServer self, SseSerializer serializer);

  @protected
  void
      sse_encode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockPyPyAny(
          PyPyAny self, SseSerializer serializer);

  @protected
  void
      sse_encode_Auto_RefMut_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockComSocketClient(
          ComSocketClient self, SseSerializer serializer);

  @protected
  void
      sse_encode_Auto_RefMut_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockComSocketServer(
          ComSocketServer self, SseSerializer serializer);

  @protected
  void
      sse_encode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockWidgetAction(
          WidgetAction self, SseSerializer serializer);

  @protected
  void
      sse_encode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockstr(
          Str self, SseSerializer serializer);

  @protected
  void
      sse_encode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLocku8(
          U8 self, SseSerializer serializer);

  @protected
  void
      sse_encode_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockComSocketClient(
          ComSocketClient self, SseSerializer serializer);

  @protected
  void
      sse_encode_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockComSocketServer(
          ComSocketServer self, SseSerializer serializer);

  @protected
  void
      sse_encode_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockPyPyAny(
          PyPyAny self, SseSerializer serializer);

  @protected
  void
      sse_encode_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockWidgetAction(
          WidgetAction self, SseSerializer serializer);

  @protected
  void
      sse_encode_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockstr(
          Str self, SseSerializer serializer);

  @protected
  void sse_encode_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLocku8(
      U8 self, SseSerializer serializer);

  @protected
  void sse_encode_String(String self, SseSerializer serializer);

  @protected
  void sse_encode_bool(bool self, SseSerializer serializer);

  @protected
  void sse_encode_box_autoadd_confirm_result(
      ConfirmResult self, SseSerializer serializer);

  @protected
  void sse_encode_box_autoadd_coord(Coord self, SseSerializer serializer);

  @protected
  void sse_encode_box_autoadd_error_result(
      ErrorResult self, SseSerializer serializer);

  @protected
  void sse_encode_box_autoadd_frame(Frame self, SseSerializer serializer);

  @protected
  void sse_encode_box_autoadd_result_binding(
      ResultBinding self, SseSerializer serializer);

  @protected
  void sse_encode_box_autoadd_result_frame(
      ResultFrame self, SseSerializer serializer);

  @protected
  void sse_encode_box_autoadd_widget_registry(
      WidgetRegistry self, SseSerializer serializer);

  @protected
  void sse_encode_confirm_result(ConfirmResult self, SseSerializer serializer);

  @protected
  void sse_encode_coord(Coord self, SseSerializer serializer);

  @protected
  void sse_encode_error_result(ErrorResult self, SseSerializer serializer);

  @protected
  void sse_encode_f_32(double self, SseSerializer serializer);

  @protected
  void sse_encode_frame(Frame self, SseSerializer serializer);

  @protected
  void sse_encode_i_32(int self, SseSerializer serializer);

  @protected
  void sse_encode_list_prim_u_8_strict(
      Uint8List self, SseSerializer serializer);

  @protected
  void sse_encode_opt_box_autoadd_frame(Frame? self, SseSerializer serializer);

  @protected
  void sse_encode_opt_box_autoadd_result_frame(
      ResultFrame? self, SseSerializer serializer);

  @protected
  void sse_encode_record_u_8_string(
      (int, String) self, SseSerializer serializer);

  @protected
  void sse_encode_result_binding(ResultBinding self, SseSerializer serializer);

  @protected
  void sse_encode_result_frame(ResultFrame self, SseSerializer serializer);

  @protected
  void sse_encode_result_registry(
      ResultRegistry self, SseSerializer serializer);

  @protected
  void sse_encode_server_state_error(
      ServerStateError self, SseSerializer serializer);

  @protected
  void sse_encode_server_status(ServerStatus self, SseSerializer serializer);

  @protected
  void sse_encode_u_8(int self, SseSerializer serializer);

  @protected
  void sse_encode_unit(void self, SseSerializer serializer);

  @protected
  void sse_encode_usize(int self, SseSerializer serializer);

  @protected
  void sse_encode_widget_registry(
      WidgetRegistry self, SseSerializer serializer);
}

// Section: wire_class

class RustLibWire implements BaseWire {
  factory RustLibWire.fromExternalLibrary(ExternalLibrary lib) =>
      RustLibWire(lib.ffiDynamicLibrary);

  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  RustLibWire(ffi.DynamicLibrary dynamicLibrary)
      : _lookup = dynamicLibrary.lookup;

  void
      rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockComSocketClient(
    ffi.Pointer<ffi.Void> ptr,
  ) {
    return _rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockComSocketClient(
      ptr,
    );
  }

  late final _rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockComSocketClientPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
          'frbgen_codde_protocol_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockComSocketClient');
  late final _rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockComSocketClient =
      _rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockComSocketClientPtr
          .asFunction<void Function(ffi.Pointer<ffi.Void>)>();

  void
      rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockComSocketClient(
    ffi.Pointer<ffi.Void> ptr,
  ) {
    return _rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockComSocketClient(
      ptr,
    );
  }

  late final _rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockComSocketClientPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
          'frbgen_codde_protocol_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockComSocketClient');
  late final _rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockComSocketClient =
      _rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockComSocketClientPtr
          .asFunction<void Function(ffi.Pointer<ffi.Void>)>();

  void
      rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockComSocketServer(
    ffi.Pointer<ffi.Void> ptr,
  ) {
    return _rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockComSocketServer(
      ptr,
    );
  }

  late final _rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockComSocketServerPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
          'frbgen_codde_protocol_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockComSocketServer');
  late final _rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockComSocketServer =
      _rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockComSocketServerPtr
          .asFunction<void Function(ffi.Pointer<ffi.Void>)>();

  void
      rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockComSocketServer(
    ffi.Pointer<ffi.Void> ptr,
  ) {
    return _rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockComSocketServer(
      ptr,
    );
  }

  late final _rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockComSocketServerPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
          'frbgen_codde_protocol_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockComSocketServer');
  late final _rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockComSocketServer =
      _rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockComSocketServerPtr
          .asFunction<void Function(ffi.Pointer<ffi.Void>)>();

  void
      rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockPyPyAny(
    ffi.Pointer<ffi.Void> ptr,
  ) {
    return _rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockPyPyAny(
      ptr,
    );
  }

  late final _rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockPyPyAnyPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
          'frbgen_codde_protocol_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockPyPyAny');
  late final _rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockPyPyAny =
      _rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockPyPyAnyPtr
          .asFunction<void Function(ffi.Pointer<ffi.Void>)>();

  void
      rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockPyPyAny(
    ffi.Pointer<ffi.Void> ptr,
  ) {
    return _rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockPyPyAny(
      ptr,
    );
  }

  late final _rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockPyPyAnyPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
          'frbgen_codde_protocol_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockPyPyAny');
  late final _rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockPyPyAny =
      _rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockPyPyAnyPtr
          .asFunction<void Function(ffi.Pointer<ffi.Void>)>();

  void
      rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockWidgetAction(
    ffi.Pointer<ffi.Void> ptr,
  ) {
    return _rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockWidgetAction(
      ptr,
    );
  }

  late final _rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockWidgetActionPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
          'frbgen_codde_protocol_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockWidgetAction');
  late final _rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockWidgetAction =
      _rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockWidgetActionPtr
          .asFunction<void Function(ffi.Pointer<ffi.Void>)>();

  void
      rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockWidgetAction(
    ffi.Pointer<ffi.Void> ptr,
  ) {
    return _rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockWidgetAction(
      ptr,
    );
  }

  late final _rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockWidgetActionPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
          'frbgen_codde_protocol_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockWidgetAction');
  late final _rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockWidgetAction =
      _rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockWidgetActionPtr
          .asFunction<void Function(ffi.Pointer<ffi.Void>)>();

  void
      rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockstr(
    ffi.Pointer<ffi.Void> ptr,
  ) {
    return _rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockstr(
      ptr,
    );
  }

  late final _rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockstrPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
          'frbgen_codde_protocol_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockstr');
  late final _rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockstr =
      _rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockstrPtr
          .asFunction<void Function(ffi.Pointer<ffi.Void>)>();

  void
      rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockstr(
    ffi.Pointer<ffi.Void> ptr,
  ) {
    return _rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockstr(
      ptr,
    );
  }

  late final _rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockstrPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
          'frbgen_codde_protocol_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockstr');
  late final _rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockstr =
      _rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockstrPtr
          .asFunction<void Function(ffi.Pointer<ffi.Void>)>();

  void
      rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLocku8(
    ffi.Pointer<ffi.Void> ptr,
  ) {
    return _rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLocku8(
      ptr,
    );
  }

  late final _rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLocku8Ptr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
          'frbgen_codde_protocol_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLocku8');
  late final _rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLocku8 =
      _rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLocku8Ptr
          .asFunction<void Function(ffi.Pointer<ffi.Void>)>();

  void
      rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLocku8(
    ffi.Pointer<ffi.Void> ptr,
  ) {
    return _rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLocku8(
      ptr,
    );
  }

  late final _rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLocku8Ptr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
          'frbgen_codde_protocol_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLocku8');
  late final _rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLocku8 =
      _rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLocku8Ptr
          .asFunction<void Function(ffi.Pointer<ffi.Void>)>();
}
