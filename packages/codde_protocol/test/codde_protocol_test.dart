import 'package:codde_protocol/codde_protocol.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';
import 'package:test/test.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'codde_protocol_test.mocks.dart';

@GenerateMocks([ComSocketClient])
void main() {
  group('Dart client', () {
    setUp(() async {
      await RustLib.init(
          externalLibrary:
              ExternalLibrary.open("../../target/debug/libcodde_protocol.so"));
    });

    test('Registry test', () async {
      final button = WidgetRegistry.confirmButton();
      final frame = Frame(id: 1, data: button);
      final client = MockComSocketClient();

      when(client.receive()).thenAnswer((_) async => ResultFrame(
          id: 1,
          data: ResultRegistry.confirmResult(status: true),
          status: ServerStatus.idle));

      await client.connect();
      await client.send(data: frame);
      final result = await client.receive();
      await client.disconnect();

      expect(result.runtimeType, ResultFrame);
      expect(result?.data.runtimeType,
          ResultRegistry.confirmResult(status: false).runtimeType);
      expect((result?.data as ResultRegistry_ConfirmResult).status, true);
    });
  });
}
