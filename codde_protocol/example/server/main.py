
import codde_pi_protocol as cp
import time
server = cp.CoddePiServer.use_socket('localhost:12345')

def action(*args):
    widget: cp.ToggleButton = args[0]
    print("value received : ", widget.value)
    server.callback(1, cp.ServerStatus.Idle, cp.ConfirmResult(True)) 
    # TODO: DO NOT use ResultFrame object in python code ?
    # try exposing all arguments

if __name__ == "__main__":
    print('open server...')
    server.open()
    server.on(1, "ToggleButton", action)
    # server.callback(1, cp.ServerStatus.Idle, cp.ConfirmResult(True)) 
    server.serve()
    time.sleep(2)
    server.close()
