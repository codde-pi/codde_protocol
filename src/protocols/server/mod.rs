use crate::models::server::ServerClosed;

use self::com_socket::ComSocketServer;

// python destination code
pub mod com_socket;

pub enum ServerProtocol {
    Socket(ComSocketServer),
}
