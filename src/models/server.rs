use anyhow::{Ok, Result};
use std::{
    error::Error,
    fmt::{self},
    sync::mpsc::Sender,
};

use pyo3::{exceptions::PyOSError, pyclass, types::PyTuple, IntoPy, PyAny, PyErr, Python};
use serde::Deserialize;

use crate::{models::widget_registry::Action, protocols::server::ServerProtocol};

use super::{
    frame::Frame,
    widget_registry::{action_identity, TypeFn, Widget, WidgetAction},
};

pub trait ServerCom {
    fn open(&mut self) -> Result<(), ServerStateError>;
    fn register_action(
        &mut self,
        id: u8,
        widget: &str,
        action: Action,
    ) -> Result<(), ServerStateError>;

    fn callback(&mut self, data: Frame) -> Result<(), ServerStateError>;

    fn listen(&mut self) -> Result<Option<Frame>, ServerStateError>;

    fn serve(&mut self) -> Result<ComServerLegacy>; // TODO

    fn close(&mut self) -> Result<(), ServerStateError>;
}

pub fn execute_action(acts: &WidgetAction, frame: Frame) -> Result<()> {
    // TODO: create custom error for
    // actions

    if acts.contains_key(frame.identity().as_str()) {
        println!("Found frame ! {}", frame.id);
        match acts.get(frame.identity().as_str()) {
            Some(a) => match a {
                Action::RustFn(a) => a(frame.data),
                Action::PythonFn(a) => Python::with_gil(|py| {
                    println!("running action");
                    // let tuple = PyTuple::new(py, &[frame.data.into_py(py)]);
                    a.call1(py, (frame.data,))?;
                    println!("after function");
                    // a.call1(py, tuple)?;
                    // a.call0(py)?;
                    Ok(())
                }),
            },
            None => panic!("Action not found !"),
        }
    } else {
        println!("No key {} found", frame.identity());
        Ok(())
    }
}

#[pyclass]
pub struct ComServerLegacy {
    trigger: Sender<bool>,
}

impl ComServerLegacy {
    pub fn new(trigger: Sender<bool>) -> Self {
        ComServerLegacy { trigger }
    }
    pub fn close(&self) -> Result<()> {
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

/* impl std::ops::FromResidual<Result<std::convert::Infallible, std::io::Error>> for ServerStateError {
    fn from_residual(residual: Result<std::convert::Infallible, std::io::Error>) -> Self {
        ServerStateError
    }
} */

/* impl From<frame::_::_serde::Deserialize<'_>> for ServerStateError {
    fn from(error: rmp_serde::decode::Error) -> Self {
        ServerStateError
    }
} */
