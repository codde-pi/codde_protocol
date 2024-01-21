use std::{
    error::Error,
    fmt::{self},
};

use crate::protocols::server::ServerProtocol;

use super::{
    frame::Frame,
    widget_registry::{Action, Widget, WidgetAction},
};

pub trait ServerCom {
    fn open(self) -> Result<ServerProtocol, ServerStateError>;
    fn on(&mut self, id: u8, widget: &str, action: Action) -> Result<(), ServerStateError>;

    fn callback(&mut self, data: Frame) -> Result<(), ServerStateError>;

    fn listen(&mut self) -> Result<Frame, ServerStateError>;

    fn serve(self) -> Result<ServerProtocol, ServerStateError>;

    fn close(self) -> Result<ServerProtocol, ServerStateError>;
}

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
