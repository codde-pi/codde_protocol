import 'package:codde_protocol/codde_protocol.dart';

final data = WidgetRegistry_ToggleButton(value: true);
final frame = Frame(id: 1, data: data);

void main(List<String> args) async {
  await RustLib.init();
  final client =
      await ComSocketClient.newComSocketClient(address: "localhost:12345");
  client.connect();
  client.send(data: frame);
  client.disconnect();
}
