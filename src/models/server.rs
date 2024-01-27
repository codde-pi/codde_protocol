use std::{
    error::Error,
    fmt::{self},
    sync::mpsc::Sender,
};

use pyo3::{exceptions::PyOSError, pyclass, PyErr};
use serde::Deserialize;

use crate::protocols::server::ServerProtocol;

use super::{
    frame::Frame,
    widget_registry::{Action, Widget, WidgetAction},
};

pub trait ServerCom {
    fn open(&mut self) -> Result<(), ServerStateError>;
    fn on(&mut self, id: u8, widget: &str, action: Action) -> Result<(), ServerStateError>;

    fn callback(&mut self, data: Frame) -> Result<(), ServerStateError>;

    fn listen(&mut self) -> Result<Option<Frame>, ServerStateError>;

    fn serve(&'static mut self) -> Result<ComServerLegacy, ServerStateError>; // TODO

    fn close(&mut self) -> Result<(), ServerStateError>;
}

#[pyclass]
pub struct ComServerLegacy {
    trigger: Sender<bool>,
}

impl ComServerLegacy {
    pub fn new(trigger: Sender<bool>) -> Self {
        ComServerLegacy { trigger }
    }
    pub fn close(&self) -> Result<(), ServerStateError> {
        self.trigger.send(true);
        Ok(())
    }
}

#[derive(Deserialize)]
pub struct ServerStateError; // Implement std::fmt::Display for AppError

impl Error for ServerStateError {}
impl fmt::Display for ServerStateError {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "Bad Server state") // user-facing output
    }
}

// Implement std::fmt::Debug for AppError
impl fmt::Debug for ServerStateError {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "{{ file: {}, line: {} }}", file!(), line!()) // programmer-facing output
    }
}

impl From<rmp_serde::decode::Error> for ServerStateError {
    fn from(error: rmp_serde::decode::Error) -> Self {
        // TODO: cleaner please
        eprint!("{}", error);
        ServerStateError
    }
}
impl std::convert::From<ServerStateError> for PyErr {
    fn from(err: ServerStateError) -> PyErr {
        PyOSError::new_err(err.to_string())
    }
}

/* impl From<frame::_::_serde::Deserialize<'_>> for ServerStateError {
    fn from(error: rmp_serde::decode::Error) -> Self {
        ServerStateError
    }
} */
