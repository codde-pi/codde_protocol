use rmp_serde::{Deserializer, Serializer};
use serde::Serialize;
use std::{
    collections::HashMap,
    io::{Read, Write},
    net::{Shutdown, TcpStream},
};

use crate::models::frame::Frame;

pub struct ComSocketClient {}

pub struct ComSocketDisconnected {
    address: String,
    port: u16,
}

pub struct ComSocketConnected {
    address: String,
    port: u16,
    stream: TcpStream,
}

impl ComSocketClient {
    pub fn new(address: String, port: u16) -> ComSocketDisconnected {
        ComSocketDisconnected { address, port }
    }
}
impl ComSocketDisconnected {
    pub fn connect(self) -> ComSocketConnected {
        let stream = match TcpStream::connect((self.address.as_str(), self.port)) {
            Ok(stream) => stream,
            Err(e) => panic!("Failed to connect: {}", e),
        };
        ComSocketConnected {
            address: self.address,
            port: self.port,
            stream,
        }
    }
}

impl ComSocketConnected {
    // TODO: useful ? If so, implement action triggering
    /* pub fn on(&mut self, action: Box<dyn Fn(&Box<dyn Widget>) + Send>) {
        self.actions.push(action);
    } */

    pub fn send(&mut self, data: Frame) {
        let mut buf: Vec<u8> = Vec::new();
        data.serialize(&mut Serializer::new(&mut buf)).unwrap();
        match self.stream.write_all(&buf) {
            Ok(_) => (),
            Err(e) => panic!("Failed to write bytes : {}", e),
        };
        // TODO: call receive
        // let f = self.receive();
        // println!("value : {}", f.id.to_string());
    }

    fn receive(&mut self) -> Frame {
        let mut buf: Vec<u8> = Vec::new();
        self.stream.read(&mut buf);
        Frame::parse(&buf)
    }

    pub fn disconnect(self) -> ComSocketDisconnected {
        self.stream.shutdown(Shutdown::Both);
        ComSocketDisconnected {
            address: self.address,
            port: self.port,
        }
    }
}
