// TODO: refact based on [ServerCom]
use std::{
    io::{Read, Write},
    net::{TcpListener, TcpStream},
};

use crate::models::{
    com::{Com, ComConnected, ComNotConnected},
    frame::Frame,
    widget_action::WidgetAction,
};

pub struct ComSocket {
    address: String,
    port: i64,
}

struct ComSocketNotConnected {
    address: String,
    port: i64,
}

struct ComSocketConnected {
    address: String,
    port: i64,
    stream: TcpStream,
    actions: Vec<WidgetAction>,
}

impl ComNotConnected for ComSocketNotConnected {
    fn connect(self) -> Box<dyn ComConnected> {
        let listener = match TcpListener::bind("127.0.0.1:7878") {
            Ok(listener) => listener,
            Err(err) => panic!("Unable to intanstiate TCP Listener. {:?}", err),
        };
        match listener.accept() {
            Ok(res) => {
                let empty: &[WidgetAction; 0] = &[];
                Box::new(ComSocketConnected {
                    address: self.address,
                    port: self.port,
                    stream: res.0,
                    actions: Vec::new(),
                })
            }
            Err(e) => panic!("Unable to connect  emptyget new TCP connection. {:?}", e),
        }
    }
}

impl Com for ComSocket {
    fn new(self) -> Box<dyn ComNotConnected> {
        Box::new(ComSocketNotConnected {
            address: self.address,
            port: self.port,
        })
    }
}

impl ComConnected for ComSocketConnected {
    fn disconnect(self) -> Box<dyn ComNotConnected> {
        self.stream.shutdown(std::net::Shutdown::Both);
        Box::new(ComSocketNotConnected {
            address: self.address,
            port: self.port,
        })
    }

    fn on(&self, action: WidgetAction) {
        self.actions.push(action);
    }

    fn send(&self, data: Frame) {
        self.stream.write_all(data.bufferize());
    }

    /* fn serve(&self) {
        loop {
            let frame: Frame = self.receive();
            // self.actions.iter().for_each(|action| println!('{action}'));
            // TODO: catch error, stop loop
        }
    } */

    fn receive(&self) -> Frame {
        let mut buf: &[u8];
        self.stream.read(&mut buf);
        Frame::parse(buf)
    }
}
