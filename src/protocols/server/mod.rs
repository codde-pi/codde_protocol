use std::sync::mpsc::Sender;

use crate::models::{
    server::{ComServerLegacy, ServerCom, ServerStateError},
    widget_registry::Action,
};

use self::com_socket::ComSocketServer;

// python destination code
pub mod com_socket;

pub enum ServerProtocol<T: ServerCom> {
    Socket(T),
}
/*
impl<T> ServerCom for ServerProtocol<T>
where
    T: ServerCom,
{
    fn on(&mut self, id: u8, widget: &str, action: Action) -> Result<(), ServerStateError> {
        match self {
            ServerProtocol::Socket(this) => this.on(id, widget, action),
        }
    }

    fn open(&mut self) -> Result<(), crate::models::server::ServerStateError> {
        match self {
            ServerProtocol::Socket(this) => this.open(),
        }
    }

    fn callback(
        &mut self,
        data: crate::models::frame::Frame,
    ) -> Result<(), crate::models::server::ServerStateError> {
        todo!()
    }

    fn listen(
        &mut self,
    ) -> Result<Option<crate::models::frame::Frame>, crate::models::server::ServerStateError> {
        todo!()
    }

    fn serve(&mut self) -> Result<ComServerLegacy, crate::models::server::ServerStateError> {
        todo!()
    }

    fn close(&mut self) -> Result<(), crate::models::server::ServerStateError> {
        todo!()
    }
} */
