use crate::{
    models::{
        protocol::Protocol,
        server::{ServerCom, ServerStateError},
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
                protocol: ServerProtocol::Socket(ComSocketServer::new(address)),
            }, // CoddePiServer::use_socket(address),,
            Protocol::bluetooth => todo!(),
            Protocol::http => todo!(),
            Protocol::usb => todo!(),
        }
    }

    fn use_socket(address: &str) -> Self {
        CoddePiServer {
            protocol: ServerProtocol::Socket(ComSocketServer::new(address)),
        }
    }
}

impl ServerCom for CoddePiServer {
    fn open(self) -> Result<ServerProtocol, ServerStateError> {
        match self.protocol {
            ServerProtocol::Socket(this) => this.open(),
        }
    }

    fn on(
        &mut self,
        id: u8,
        widget: &str,
        action: crate::models::widget_registry::Action,
    ) -> Result<(), ServerStateError> {
        todo!()
    }

    fn callback(&mut self, data: crate::models::frame::Frame) -> Result<(), ServerStateError> {
        todo!()
    }

    fn listen(&mut self) -> Result<crate::models::frame::Frame, ServerStateError> {
        todo!()
    }

    fn serve(self) -> Result<ServerProtocol, ServerStateError> {
        todo!()
    }

    fn close(self) -> Result<ServerProtocol, ServerStateError> {
        todo!()
    }
}
