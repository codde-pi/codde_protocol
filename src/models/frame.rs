use super::widget_registry::Widget;
use serde::{Deserialize, Serialize};

// TODO: PartialEq ?
#[derive(Deserialize, Serialize)]
pub struct Frame {
    id: u8,
    data: Box<dyn Widget>,
}

impl Frame {
    // const STARTER: &str = "#";

    /* pub fn parse(data: Vec<u8>) -> Self {
        match String::from_utf8(vec![data.remove(0)]) {
            Ok(v) => assert!(v == Frame::STARTER, "No frame starter found !"),
            Err(e) => panic!("Invalid UTF-8 sequence: {}", e),
        };
        let id: u8 = u8::from_ne_bytes([data.remove(0)]);
        // assert!()
        Frame::deserialize(id, data)
    } */

    /* fn serialize(&self) -> Result<Vec<u8>, rmp_serde::encode::Error> {
        to_vec(self)
    }

    fn deserialize(data: Vec<u8>) -> Self {
        from_read(data)
    } */
    pub fn parse(data: &[u8]) -> Frame {
        let s = flexbuffers::Reader::get_root(data).unwrap();

        // TODO: error catching not clean
        match Frame::deserialize(s) {
            Ok(f) => f,
            Err(e) => panic!("Deserialization error : {}", e),
        }
    }

    pub fn bufferize(&self) -> &[u8] {
        let mut s = flexbuffers::FlexbufferSerializer::new();
        self.serialize(&mut s).unwrap();
        s.view()
    }
}
