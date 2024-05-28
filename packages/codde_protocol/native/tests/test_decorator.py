
from codde_protocol import *

server = CoddePiServer.use_socket('localhost:12345')

@on(server)
def action_1(*args) -> bool:
    widget: ToggleButton = args[0]
    return widget.value

def main() -> str:
    return server._get_action('action_1')(ToggleButton(value=True))
