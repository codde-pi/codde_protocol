use crate::api::protocols::client::ComSocketClient;

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
    } */
}
