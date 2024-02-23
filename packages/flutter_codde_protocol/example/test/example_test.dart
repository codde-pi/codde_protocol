import 'package:flutter_codde_protocol/flutter_codde_protocol.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() async {
    await RustLib.init(
        externalLibrary:
            ExternalLibrary.open("../../../target/debug/libcodde_protocol.so"));
  });
  test('Client init', () async {
    final client =
        await ComSocketClient.newComSocketClient(address: 'localhost:12345');
    expect(client.runtimeType, ComSocketClient);
  });
}
