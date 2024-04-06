import 'package:codde_protocol/codde_protocol.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  setUp(() async {
    await RustLib.init(
        externalLibrary:
            ExternalLibrary.open("../../target/debug/libcodde_protocol.so"));
  });
  test('Client init', () async {
    final client = ComSocketClient(address: 'localhost:12345');
    expect(client.runtimeType, ComSocketClient);
  });
}
