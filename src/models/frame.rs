use std::{any::Any, collections::HashMap};

use super::widget_registry::{ServerStatus, Widget, WidgetRegistry};
use serde::{Deserialize, Serialize};

// TODO: PartialEq ?
#[derive(Deserialize, Serialize)]
pub struct Frame {
    pub id: u8,
    pub data: WidgetRegistry,
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
        // println!("parsing {}", data.get(0).unwrap());
        println!("parsing");
        let s = match flexbuffers::Reader::get_root(data) {
            Ok(s) => s,
            Err(e) => panic!("Unable to parse message buffer : {}", e),
        };

        println!("deserializing");
        match Frame::deserialize(s) {
            Ok(f) => f,
            Err(e) => panic!("Deserialization error : {}", e),
        }
    }

    pub fn bufferize(&self) -> Vec<u8> {
        let mut s = flexbuffers::FlexbufferSerializer::new();
        self.serialize(&mut s).unwrap();
        s.view().to_owned()
    }

    pub fn identity() -> String {
        todo!()
    }
}

pub struct ResultFrame {
    pub status: ServerStatus,
    pub data: Option<Box<dyn Any>>,
}
