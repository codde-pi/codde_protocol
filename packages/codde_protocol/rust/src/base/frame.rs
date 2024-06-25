use anyhow::Result;
use core::fmt;

use super::widget_registry::{ResultRegistry, ServerStatus, WidgetRegistry};
use pyo3::pyclass;
use rmp_serde::{decode::ReadReader, Deserializer, Serializer};
use serde::{Deserialize, Serialize};

#[derive(Debug, Deserialize, Serialize, PartialEq)]
#[pyclass]
pub struct Frame {
    pub id: u8,
    pub data: WidgetRegistry,
}

impl Frame {
    pub fn identity(&self) -> String {
        format!("{}_{}", self.id, self.data.name())
    }
    pub fn bufferize(&self) -> Vec<u8> {
        let mut buf: Vec<u8> = Vec::new();
        match self.serialize(&mut Serializer::new(&mut buf)) {
            Ok(_) => {}
            Err(e) => panic!("Serialization error : {}", e), // TODO: Handle error
        };
        buf
    }
    pub fn parse(data: &[u8]) -> Result<Option<Frame>> {
        let mut de: Deserializer<ReadReader<&[u8]>> = Deserializer::new(data);
        match Frame::deserialize(&mut de) {
            Ok(f) => Ok(Some(f)),
            Err(e) => Err(e.into()),
        }
    }
}

/// Since ResultFrame is instanciated by private methods, it doesn't implement `[pyclass]`
#[derive(Debug, Deserialize, Serialize, PartialEq, Clone)]
pub struct ResultFrame {
    pub id: u8,
    pub status: ServerStatus,
    pub data: ResultRegistry,
}
impl ResultFrame {
    pub fn bufferize(&self) -> Vec<u8> {
        let mut buf: Vec<u8> = Vec::new();
        match self.serialize(&mut Serializer::new(&mut buf)) {
            Ok(_) => {}
            Err(e) => panic!("Serialization error : {}", e), // TODO: Handle error
        };
        buf
    }
    pub fn parse(data: &[u8]) -> Result<Option<ResultFrame>> {
        let mut de: Deserializer<ReadReader<&[u8]>> = Deserializer::new(data);
        match ResultFrame::deserialize(&mut de) {
            Ok(f) => Ok(Some(f)),
            Err(e) => Err(e.into()),
        }
    }
}

impl fmt::Display for ResultFrame {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        fmt::Debug::fmt(self, f)
    }
}
