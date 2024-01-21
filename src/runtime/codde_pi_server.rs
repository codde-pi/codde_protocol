use crate::{
    models::{
        protocol::Protocol,
        server::{ServerClosed, ServerStateError},
    },
    protocols::server::{com_socket::ComSocketServer, ServerProtocol},
};

pub struct CoddePiServer {
    protocol: ServerProtocol,
}

impl CoddePiServer {
    fn new(protocol: Protocol, address: &str) -> Self {
        // CoddePiServer { protocol }
        match protocol {
            Protocol::socket => CoddePiServer {
                protocol: ServerProtocol::Socket(ComSocketServer::ComSocketClosed {
                    address: String::from(address),
                }),
            }, // CoddePiServer::use_socket(address),,
            Protocol::bluetooth => todo!(),
            Protocol::http => todo!(),
            Protocol::usb => todo!(),
        }
    }

    fn use_socket(address: &str) -> Self {
        CoddePiServer {
            protocol: ServerProtocol::Socket(ComSocketServer::ComSocketClosed {
                address: String::from(address),
            }),
        }
        // CoddePiServer::new(ComSocketServer::new(address).unwrap(), address)
    }
}

impl ServerClosed for CoddePiServer {
    fn open(self) -> Result<ServerProtocol, ServerStateError> {
        match self.protocol {
            ServerProtocol::Socket(this) => this.open(),
        }
    }
}
