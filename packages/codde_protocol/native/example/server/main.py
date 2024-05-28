
import codde_protocol as cp
import time
server = cp.CoddePiServer.use_socket('localhost:12345')

@cp.event(server)
def action_1(*args):
    widget: cp.ToggleButton = args[0]
    print("value received : ", widget.value)
    server.callback(1, cp.ServerStatus.Idle, cp.ConfirmResult(True)) 

if __name__ == "__main__":
    print('open server...')
    server.open()
    # server.callback(1, cp.ServerStatus.Idle, cp.ConfirmResult(True)) 
    server.serve()
    time.sleep(2)
    server.close()
