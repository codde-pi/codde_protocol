import 'package:codde_protocol/codde_protocol.dart' as cpp;

final data = cpp.WidgetRegistry_ToggleButton(value: true);

void main(List<String> args) async {
  cpp.RustLib.init();
  final client =
      await cpp.ComSocketClient.newComSocketClient(address: "localhost:12345");
  client.connect();
  client.send(data);
  client.disconnect();
}
