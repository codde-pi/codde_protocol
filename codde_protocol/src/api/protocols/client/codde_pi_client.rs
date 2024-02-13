use crate::api::protocols::client::ComSocketClient;

pub struct CoddePiClient {}

impl CoddePiClient {
    pub fn use_socket(address: String) -> ComSocketClient {
        ComSocketClient::new(address)
    }
}
