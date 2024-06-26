// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0-dev.30.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../../frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';
import 'widget_registry.dart';

// Rust type: RustOpaqueMoi<flutter_rust_bridge::for_generated::rust_async::RwLock<[u8]>>
@sealed
class U8 extends RustOpaque {
  U8.dcoDecode(List<dynamic> wire) : super.dcoDecode(wire, _kStaticData);

  U8.sseDecode(int ptr, int externalSizeOnNative)
      : super.sseDecode(ptr, externalSizeOnNative, _kStaticData);

  static final _kStaticData = RustArcStaticData(
    rustArcIncrementStrongCount:
        RustLib.instance.api.rust_arc_increment_strong_count_U8,
    rustArcDecrementStrongCount:
        RustLib.instance.api.rust_arc_decrement_strong_count_U8,
    rustArcDecrementStrongCountPtr:
        RustLib.instance.api.rust_arc_decrement_strong_count_U8Ptr,
  );
}

class Frame {
  final int id;
  final WidgetRegistry data;

  const Frame({
    required this.id,
    required this.data,
  });

  Future<Uint8List> bufferize({dynamic hint}) =>
      RustLib.instance.api.frameBufferize(
        that: this,
        hint: hint,
      );

  Future<String> identity({dynamic hint}) => RustLib.instance.api.frameIdentity(
        that: this,
        hint: hint,
      );

  static Future<Frame?> parse({required U8 data, dynamic hint}) =>
      RustLib.instance.api.frameParse(
        data: data,
        hint: hint,
      );

  @override
  int get hashCode => id.hashCode ^ data.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Frame &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          data == other.data;
}

/// Since ResultFrame is instanciated by private methods, it doesn't implement `[pyclass]`
class ResultFrame {
  final int id;
  final ServerStatus status;
  final ResultRegistry data;

  const ResultFrame({
    required this.id,
    required this.status,
    required this.data,
  });

  Future<Uint8List> bufferize({dynamic hint}) =>
      RustLib.instance.api.resultFrameBufferize(
        that: this,
        hint: hint,
      );

  static Future<ResultFrame?> parse({required U8 data, dynamic hint}) =>
      RustLib.instance.api.resultFrameParse(
        data: data,
        hint: hint,
      );

  @override
  int get hashCode => id.hashCode ^ status.hashCode ^ data.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResultFrame &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          status == other.status &&
          data == other.data;
}
