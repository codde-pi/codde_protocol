import 'package:codde_protocol/codde_protocol.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  setUp(() async => await RustLib.init(
      externalLibrary:
          ExternalLibrary.open("../../target/debug/libcodde_protocol.so")));

  testWidgets('Client init', (tester) async {
    final client = ComSocketClient(address: 'localhost:12345');
    expect(client.runtimeType, ComSocketClient);
  });
}
