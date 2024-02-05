use self::com_socket::ComSocketClient;

pub mod com_socket; // dart destination code
pub enum ClientProtocol {
    Socket(ComSocketClient),
}
