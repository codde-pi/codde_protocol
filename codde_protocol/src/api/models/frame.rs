use anyhow::Result;
use core::fmt;

use super::widget_registry::{ResultBinding, ResultRegistry, ServerStatus, WidgetRegistry};
use pyo3::{pyclass, Py, PyAny, Python};
use rmp_serde::{decode::ReadReader, Deserializer, Serializer};
use serde::{Deserialize, Serialize};

trait Framing<'a, T = Self>: Serialize + Deserialize<'a>
where
    T: Serialize + Deserialize<'a>,
{
    fn bufferize(&self) -> Vec<u8> {
        let mut buf: Vec<u8> = Vec::new();
        match self.serialize(&mut Serializer::new(&mut buf)) {
            Ok(_) => {}
            Err(e) => panic!("Serialization error : {}", e), // TODO: Handle error
        };
        buf
    }
}

#[derive(Debug, Deserialize, Serialize, PartialEq)]
#[pyclass]
pub struct Frame {
    pub id: u8,
    pub data: WidgetRegistry,
}

impl<'a> Framing<'a> for Frame {}
impl<'a> Frame {
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
    pub fn bufferize(&self) -> Vec<u8> {
        Framing::bufferize(self)
    }
    pub fn parse(data: &[u8]) -> Result<Option<Frame>> {
        let mut de: Deserializer<ReadReader<&[u8]>> = Deserializer::new(data);
        match Frame::deserialize(&mut de) {
            Ok(f) => Ok(Some(f)),
            Err(e) => Err(e.into()),
        }
    }
}

#[derive(Debug, Deserialize, Serialize, PartialEq, Clone)]
pub struct ResultFrame {
    pub id: u8,
    pub status: ServerStatus,
    pub data: ResultRegistry,
}
impl<'a> Framing<'a> for ResultFrame {}
impl ResultFrame {
    pub fn bufferize(&self) -> Vec<u8> {
        Framing::bufferize(self)
    }
    pub fn parse(data: &[u8]) -> Result<Option<ResultFrame>> {
        let mut de: Deserializer<ReadReader<&[u8]>> = Deserializer::new(data);
        match ResultFrame::deserialize(&mut de) {
            Ok(f) => Ok(Some(f)),
            Err(e) => Err(e.into()),
        }
    }
}

impl ResultFrame {
    pub fn new(id: u8, status: ServerStatus, data: Py<PyAny>) -> ResultFrame {
        Python::with_gil(|py| {
            let d: ResultBinding = match data.extract(py) {
                Ok(d) => d,
                Err(e) => panic!("Python data failed to be bound: {}", e),
            };

            ResultFrame {
                id,
                status,
                data: ResultRegistry::from_binding(d),
            }
        })
    }
}
impl fmt::Display for ResultFrame {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        fmt::Debug::fmt(self, f)
    }
}
