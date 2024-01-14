use std::{
    io::{Read, Write},
    net::{Shutdown, TcpStream},
};

use crate::models::{
    client::{ClientCom, ClientConnected, ClientNotConnected},
    frame::Frame,
    widget_action::WidgetAction,
};

pub struct ComSocketClient {
    address: String,
    port: i64,
}

struct ComSocketDisconnected {
    address: String,
    port: i64,
}

struct ComSocketConnected {
    address: String,
    port: i64,
    stream: TcpStream,
    actions: Vec<WidgetAction>,
}

impl ClientCom for ComSocketClient {
    fn new(self) -> Box<dyn ClientNotConnected> {
        Box::new(ComSocketDisconnected {
            address: self.address,
            port: self.port,
        })
    }
}
impl ClientNotConnected for ComSocketDisconnected {
    fn connect(self) -> Box<dyn crate::models::client::ClientConnected> {
        let stream = match TcpStream::connect("{self.address}:{self.port}") {
            Ok(stream) => stream,
            Err(e) => panic!("Failed to connect: {}", e),
        };
        Box::new(ComSocketConnected {
            address: self.address,
            port: self.port,
            actions: Vec::new(),
            stream,
        })
    }
}

impl ClientConnected for ComSocketConnected {
    // TODO: useful ? If so, implement action triggering
    fn on(&mut self, action: WidgetAction) {
        self.actions.push(action);
    }

    fn send(&mut self, data: Frame) {
        self.stream.write_all(&data.bufferize());
    }

    fn receive(&mut self) -> Frame {
        let mut buf: Vec<u8> = Vec::new();
        self.stream.read(buf.as_mut());
        Frame::parse(buf.as_ref())
    }

    fn disconnect(self) -> Box<dyn ClientNotConnected> {
        self.stream.shutdown(Shutdown::Both);
        Box::new(ComSocketDisconnected {
            address: self.address,
            port: self.port,
        })
    }
}
