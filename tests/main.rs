use coddepy::models::{frame::Frame, widget_registry::ClickButton};

fn main() {
    println!("Hello, world!");
    let f = Frame {
        id: 1,
        data: Box::new(ClickButton {}),
    };
    let mut s = flexbuffers::FlexbufferSerializer::new();
    f.serialize(&mut s).unwrap();
    self.stream.write_all(s.view());
    self.stream.read_to_end(&mut buf);
    let mut buf: &[u8];
    flexbuffers::Reader::get_root(buf).unwrap();

    let r = flexbuffers::Reader::get_root(s.view()).unwrap();
    match Frame::deserialize(r) {
        Ok(f) => f,
        Err(e) => panic!("Deserialization error : {}", e),
    }
}
