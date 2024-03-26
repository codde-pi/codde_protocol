use anyhow::Result;
use flutter_rust_bridge::frb;
use std::{
    io::{Read, Write},
    net::{Shutdown, TcpStream},
};

use crate::api::base::{
    error::ServerStateError,
    frame::{Frame, ResultFrame},
    widget_registry::ClientStatus,
};

use crate::api::client::ClientCom;

#[frb(opaque)]
pub struct ComSocketClient {
    pub address: String,
    stream: Option<TcpStream>,
    pub status: ClientStatus,
}

impl ComSocketClient {
    #[frb(sync)]
    pub fn new(address: String) -> ComSocketClient {
        // HACK: Dart doesn't support `&str`
        ComSocketClient {
            address,
            stream: None,
            status: ClientStatus::Disconnected,
        }
    }
}

/// Expose method twice for Dart port
/// Rust Flutter Bridge only read direct struct implementations
impl ComSocketClient {
    pub fn connect(&mut self) -> Result<(), ServerStateError> {
        ClientCom::connect(self)
    }

    pub fn send(&mut self, data: Frame) -> Result<(), ServerStateError> {
        ClientCom::send(self, data)
    }

    pub fn receive(&mut self) -> Result<Option<ResultFrame>> {
        ClientCom::receive(self)
    }

    pub fn request(&mut self, data: Frame) -> Result<Option<ResultFrame>> {
        ClientCom::request(self, data)
    }

    pub fn disconnect(&mut self) -> Result<(), ServerStateError> {
        ClientCom::disconnect(self)
    }

    pub fn is_connected(&self) -> bool {
        ClientCom::is_connected(self)
    }
}

impl ClientCom for ComSocketClient {
    fn connect(&mut self) -> Result<(), ServerStateError> {
        self.stream = match TcpStream::connect(self.address.as_str()) {
            Ok(stream) => Some(stream),
            Err(e) => panic!("Failed to connect: {}", e),
        };
        self.status = ClientStatus::Connected;
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

    fn disconnect(&mut self) -> Result<(), ServerStateError> {
        match self.stream.as_mut() {
            Some(stream) => {
                let _ = stream.shutdown(Shutdown::Both);
                /* Ok(ClientProtocol::Socket(ComSocketClient {
                    address: self.address,
                    stream: None,
                })) */
                // TODO: sleF.stream = None ?
                self.status = ClientStatus::Disconnected;
                Ok(())
            }
            None => Err(ServerStateError::no_stream()),
        }
    }

    fn is_connected(&self) -> bool {
        self.status == ClientStatus::Connected
    }
}
