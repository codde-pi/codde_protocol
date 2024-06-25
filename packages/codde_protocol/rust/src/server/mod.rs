use self::server_com::ServerCom;

// python destination code
pub mod codde_pi_server;
pub mod com_socket;
pub mod models;
pub mod server_com;

pub enum ServerProtocol<T: ServerCom> {
    WebSocket(T),
}
