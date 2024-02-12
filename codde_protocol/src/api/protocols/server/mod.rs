use crate::api::models::server::ServerCom;

// python destination code
pub mod codde_pi_server;
pub mod com_socket;

pub enum ServerProtocol<T: ServerCom> {
    Socket(T),
}
