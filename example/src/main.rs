use codde_pi_protocol::{
    models::{
        frame::Frame,
        // server::{ServerClosed, ServerCom},
        widget_registry::{ToggleButton, Widget, WidgetAction},
    },
    protocols::{
        client::com_socket::{ComSocketClient, ComSocketDisconnected},
        server::com_socket::{ComSocketClosed, ComSocketServer},
    },
};
use std::{
    collections::HashMap,
    io::{Read, Write},
    net::{TcpListener, TcpStream},
    sync::mpsc::{channel, Receiver, Sender, TryRecvError},
    thread,
    time::Duration,
};
fn main() {
    let f = Frame {
        id: 1,
        data: Box::new(ToggleButton { value: true }),
    };
    let client: ComSocketDisconnected = ComSocketClient::new(String::from("localhost"), 12345);
    let mut client = client.connect();
    println!("connected");
    thread::sleep(Duration::from_millis(500));
    // open.listen();
    println!("sending data");
    client.send(f);
    // client.close();
}
