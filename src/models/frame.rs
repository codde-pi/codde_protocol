use std::{any::Any, collections::HashMap, fmt::format};

use super::widget_registry::{ServerStatus, Widget, WidgetRegistry};
use pyo3::{pyclass, types::PyTuple, IntoPy, Py, Python};
use serde::{Deserialize, Serialize};

// TODO: PartialEq ?
#[derive(Deserialize, Serialize)]
#[pyclass]
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

    pub fn identity(&self) -> String {
        format!(
            "{}_{}",
            self.id,
            match self.data.to_string().split_whitespace().next() {
                Some(s) => s,
                None => "",
            }
        )
    }
}
/* impl IntoPy<PyTuple> for Frame {
    fn into_py(self, py: Python<'_>) -> PyTuple {
        /* let tuple = PyTuple::new(py, [self.into_py(py)]);
        tuple.to_owned() // need match case ? */
        PyTuple::new(py, [self.into_py(py)]).to_owned()
    }
} */

pub struct ResultFrame {
    pub status: ServerStatus,
    pub data: Option<Box<dyn Any>>,
}
