use crate::models::com::Com;

struct ComSocket {
    address: String,
    port: i32,
}
impl Com for ComSocket {
    fn connect(&self) {
        todo!()
    }

    fn disconnect(&self) {
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
