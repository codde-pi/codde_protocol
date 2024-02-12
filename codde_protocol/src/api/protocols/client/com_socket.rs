use anyhow::Result;
use std::{
    io::{Read, Write},
    net::{Shutdown, TcpStream},
};

use crate::api::models::{
    client::ClientCom,
    frame::{Frame, ResultFrame},
    server::ServerStateError,
};

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
            Some(stream) => match stream.write_all(&data.bufferize()) {
                Ok(_) => Ok(()),
                Err(e) => panic!("Failed to write bytes : {}", e),
            },
            None => Err(ServerStateError::no_stream()),
        }
    }

    fn receive(&mut self) -> Result<Option<ResultFrame>> {
        let stream = self.stream.as_mut();
        match stream {
            Some(stream) => {
                let mut buffer = [0; 1024];
                let data: Option<&[u8]> = match stream.read(&mut buffer) {
                    Ok(size) => {
                        println!("Received size : {}", size);
                        match size {
                            0 => None,
                            _ => Some(&buffer[..size]),
                        }
                    }
                    Err(e) => panic!("Failed to read frame : {}", e),
                };
                match data {
                    Some(d) => ResultFrame::parse(d),
                    None => Ok(None),
                }
            }
            None => Err(ServerStateError::no_stream().into()),
        }
    }

    fn disconnect(self) -> Result<(), ServerStateError> {
        match self.stream {
            Some(stream) => {
                let _ = stream.shutdown(Shutdown::Both);
                /* Ok(ClientProtocol::Socket(ComSocketClient {
                    address: self.address,
                    stream: None,
                })) */
                // TODO: sleF.stream = None ?
                Ok(())
            }
            None => Err(ServerStateError::no_stream()),
        }
    }
}
