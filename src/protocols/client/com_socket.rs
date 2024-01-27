use rmp_serde::{Deserializer, Serializer};
use serde::Serialize;
use std::{
    io::{Read, Write},
    net::{Shutdown, TcpStream},
};

use crate::models::{client::ClientCom, frame::Frame, server::ServerStateError};

pub struct ComSocketClient {
    pub address: String,
    stream: Option<TcpStream>,
}

impl ComSocketClient {
    pub fn new(address: &str) -> ComSocketClient {
        ComSocketClient {
            address: String::from(address),
            stream: None,
        }
    }
}

impl ClientCom for ComSocketClient {
    fn connect(&mut self) -> Result<(), ServerStateError> {
        self.stream = match TcpStream::connect(self.address.as_str()) {
            Ok(stream) => Some(stream),
            Err(e) => panic!("Failed to connect: {}", e),
        };
        /* Ok(ClientProtocol::Socket(ComSocketClient {
            address: self.address,
            stream: Some(stream),
        })) */
        Ok(())
    }

    fn send(&mut self, data: Frame) -> Result<(), ServerStateError> {
        match self.stream.as_mut() {
            Some(stream) => {
                let mut buf: Vec<u8> = Vec::new();
                data.serialize(&mut Serializer::new(&mut buf)).unwrap();
                match stream.write_all(&buf) {
                    Ok(_) => Ok(()),
                    Err(e) => panic!("Failed to write bytes : {}", e),
                }
                // TODO: call receive
                // let f = self.receive();
                // println!("value : {}", f.id.to_string());
            }
            None => Err(ServerStateError),
        }
    }

    fn receive(&mut self) -> Result<Frame, ServerStateError> {
        let stream = self.stream.as_mut();
        match stream {
            Some(stream) => {
                let mut buf: Vec<u8> = Vec::new();
                stream.read(&mut buf);
                Ok(Frame::parse(&buf))
            }
            None => Err(ServerStateError),
        }
    }

    fn disconnect(self) -> Result<(), ServerStateError> {
        match self.stream {
            Some(stream) => {
                stream.shutdown(Shutdown::Both);
                /* Ok(ClientProtocol::Socket(ComSocketClient {
                    address: self.address,
                    stream: None,
                })) */
                // TODO: sleF.stream = None ?
                Ok(())
            }
            None => Err(ServerStateError),
        }
    }
}
