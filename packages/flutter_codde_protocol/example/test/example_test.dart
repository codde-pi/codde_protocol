import 'package:flutter_codde_protocol/flutter_codde_protocol.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';
import 'package:test/test.dart';

void main() {
  setUp(() async {
    await RustLib.init(
        externalLibrary: ExternalLibrary.open(
            "../../codde_protocol/native/client/target/release/libcodde_protocol.so"));
  });
  test('Client init', () async {
    final client = ComSocketClient(address: 'localhost:12345');
    expect(client.runtimeType, ComSocketClient);
  });
}
