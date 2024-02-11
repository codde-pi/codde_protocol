use std::sync::mpsc::Sender;

use crate::api::models::server::{ServerCom, ServerStateError};

use self::com_socket::ComSocketServer;

// python destination code
pub mod com_socket;

pub enum ServerProtocol<T: ServerCom> {
    Socket(T),
}
