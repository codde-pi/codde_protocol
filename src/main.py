
import codde_pi_protocol as cp
import time

def action(*args):
    widget: cp.ToggleButton = args[0]
    print("value received : ", widget.value)

if __name__ == "__main__":
    server = cp.CoddePiServer.use_socket('localhost:12345')
    print('open server...')
    server.open()
    server.on(1, "ToggleButton", action)
    server.serve()
    time.sleep(2)
    server.close()
