use crate::api::{
    models::{client::ClientCom, protocol::Protocol},
    protocols::client::ComSocketClient,
};

// use super::ClientProtocol;

pub struct CoddePiClient {}

impl CoddePiClient {
    pub fn use_socket(address: String) -> ComSocketClient {
        ComSocketClient::new(address)
    }
    /* pub fn new(protocol: Protocol, addr: String) -> ClientProtocol<dyn ClientCom> {
        match protocol {
            Protocol::Socket => ClientProtocol::Socket(ComSocketClient::new(addr)),
            Protocol::Bluetooth => todo!(),
            Protocol::Http => todo!(),
            Protocol::Usb => todo!(),
        }
    }

    fn test() {
        let client: ComSocketClient =
            CoddePiClient::new(Protocol::Socket, "127.0.0.1:8080".to_string());
        client.connect();
    } */
}
