use crate::api::com_socket::ComSocketClient;

// use super::{client::ClientCom, ClientProtocol};
use crate::api::base::protocol::Protocol;

pub struct CoddePiClient {}

impl CoddePiClient {
    pub fn use_socket(address: String) -> ComSocketClient {
        // let _ = Protocol::WebSocket; // generate Protocol in dart side
        ComSocketClient::new(address)
    }
    /* pub fn new(protocol: Protocol, addr: String) -> ClientProtocol<dyn ClientCom> {
        match protocol {
            Protocol::WebSocket => ClientProtocol::Socket(ComSocketClient::new(addr)),
            Protocol::Bluetooth => todo!(),
            Protocol::Http => todo!(),
            Protocol::Usb => todo!(),
        }
    } */
    pub fn new(_protocol: Protocol, _addr: String) -> ComSocketClient {
        todo!()
    }
}
