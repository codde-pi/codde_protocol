// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0-dev.27.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../../frb_generated.dart';
import 'frame.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';
import 'widget_registry.dart';

Future<void> executeAction(
        {required WidgetAction acts, required Frame frame, dynamic hint}) =>
    RustLib.instance.api.executeAction(acts: acts, frame: frame, hint: hint);

// Rust type: RustOpaqueMoi<flutter_rust_bridge::for_generated::rust_async::RwLock<WidgetAction>>
@sealed
class WidgetAction extends RustOpaque {
  WidgetAction.dcoDecode(List<dynamic> wire)
      : super.dcoDecode(wire, _kStaticData);

  WidgetAction.sseDecode(int ptr, int externalSizeOnNative)
      : super.sseDecode(ptr, externalSizeOnNative, _kStaticData);

  static final _kStaticData = RustArcStaticData(
    rustArcIncrementStrongCount:
        RustLib.instance.api.rust_arc_increment_strong_count_WidgetAction,
    rustArcDecrementStrongCount:
        RustLib.instance.api.rust_arc_decrement_strong_count_WidgetAction,
    rustArcDecrementStrongCountPtr:
        RustLib.instance.api.rust_arc_decrement_strong_count_WidgetActionPtr,
  );
}

class ServerStateError {
  final String field0;

  const ServerStateError({
    required this.field0,
  });

  static Future<ServerStateError> noStream({dynamic hint}) =>
      RustLib.instance.api.serverStateErrorNoStream(hint: hint);

  @override
  int get hashCode => field0.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ServerStateError &&
          runtimeType == other.runtimeType &&
          field0 == other.field0;
}
