import codde_protocol as cp

server = cp.CoddePiServer.use_socket("localhost:12345")


@cp.on(server)
def action_1(*args) -> bool:
    widget: cp.WidgetRegistry.ToggleButton = args[0]
    return widget.value


def main() -> str:
    return server._get_action("action_1")(cp.WidgetRegistry.ToggleButton(value=True))
