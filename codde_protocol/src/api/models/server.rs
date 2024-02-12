use anyhow::{Ok, Result};
use std::{
    error::Error,
    fmt::{self},
};

use pyo3::{exceptions::PyOSError, PyErr, Python};
use serde::Deserialize;

use crate::api::models::widget_registry::Action;

use super::{
    frame::{Frame, ResultFrame},
    widget_registry::WidgetAction,
};

pub trait ServerCom {
    fn open(&mut self) -> Result<(), ServerStateError>;
    fn register_action(&mut self, id: u8, widget: &str, action: Action) -> Result<()>;

    fn callback(&mut self, data: ResultFrame) -> Result<()>;

    fn listen(&mut self) -> Result<Option<Frame>>;

    fn serve(&mut self) -> Result<()>; // TODO

    fn close(&mut self) -> Result<()>;
}

pub fn execute_action(acts: &WidgetAction, frame: Frame) -> Result<()> {
    // TODO: create custom error for actions

    if acts.contains_key(frame.identity().as_str()) {
        println!("Found frame ! {}", frame.id);
        match acts.get(frame.identity().as_str()) {
            Some(a) => match a {
                Action::RustFn(a) => a(frame.data),
                Action::PythonFn(a) => Python::with_gil(|py| {
                    println!("running action");
                    a.call1(py, (frame.data,))?;
                    println!("after function");
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

#[derive(Deserialize)]
pub struct ServerStateError(pub(crate) String); // Implement std::fmt::Display for AppError

impl ServerStateError {
    pub fn no_stream() -> Self {
        ServerStateError(String::from(
            "Stream has not been instanciated. Consider calling `server.open()`",
        ))
    }
}
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
        ServerStateError(format!("{}", error))
    }
}
impl std::convert::From<ServerStateError> for PyErr {
    fn from(err: ServerStateError) -> PyErr {
        PyOSError::new_err(err.to_string())
    }
}
