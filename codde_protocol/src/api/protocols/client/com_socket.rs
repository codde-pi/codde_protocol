use anyhow::Result;
use flutter_rust_bridge::frb;
use std::{
    io::{Read, Write},
    net::{Shutdown, TcpStream},
};

use crate::api::models::{
    client::ClientCom,
    frame::{Frame, ResultFrame},
    server::ServerStateError,
};

#[frb(opaque)]
pub struct ComSocketClient {
    pub address: String,
    stream: Option<TcpStream>,
}

impl ComSocketClient {
    pub fn new(address: String) -> ComSocketClient {
        // HACK: Dart doesn't support `&str`
        ComSocketClient {
            address,
            stream: None,
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

    pub fn disconnect(self) -> Result<(), ServerStateError> {
        ClientCom::disconnect(self)
    }
}

impl ClientCom for ComSocketClient {
    #[no_mangle]
    extern "C" fn connect(&mut self) -> Result<(), ServerStateError> {
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
