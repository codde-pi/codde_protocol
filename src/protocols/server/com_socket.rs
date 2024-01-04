use crate::com::codde_com::{CoddeCom, CoddeProtocol};

struct ComSocket {
    address: String,
    port: i32,
    protocol: CoddeProtocol,
}
impl CoddeCom for ComSocket {
    fn open(&self) {
        todo!()
    }

    fn close(&self) {
        todo!()
    }

    fn on(&self) {
        todo!()
    }

    fn send(&self) {
        todo!()
    }

    fn receive(&self) {
        todo!()
    }
}
