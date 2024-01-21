use std::{
    error::Error,
    fmt::{self},
};

use crate::protocols::server::ServerProtocol;

use super::{
    frame::Frame,
    widget_registry::{Action, Widget, WidgetAction},
};

// TODO: ideally, client and server sides should have different trait,
// since these abstract methods correspond to client naming and not server.
// For server side, replace [connect] by `start` or `open`, and [disconnect] by `stop`, `close` or `shutdown`

pub trait ServerCom {
    /* type Closed: ServerCom;
    type Open: ServerCom;
    type Running: ServerCom; */

    fn open(self) -> Result<ServerProtocol, ServerStateError>;
    /* fn on(&mut self, action: WidgetAction);

    fn callback(&mut self, data: Frame);

    fn listen(&mut self) -> Frame;

    fn serve(self) -> ServerProtocol;

    fn close(self) -> ServerProtocol; */
    fn on(&mut self, id: u8, widget: &str, action: Action) -> Result<(), ServerStateError>;

    fn callback(&mut self, data: Frame);

    fn listen(&mut self) -> Frame;

    fn serve(self) -> Result<ServerProtocol, ServerStateError>;

    fn close(self) -> Result<ServerProtocol, ServerStateError>;
}

pub trait ServerClosed {
    fn open(self) -> Result<ServerProtocol, ServerStateError>;
}

pub trait ServerOpen {
    fn on(&mut self, id: u8, widget: &str, action: Action) -> Result<(), ServerStateError>;

    fn callback(&mut self, data: Frame);

    fn listen(&mut self) -> Frame;

    fn serve(self) -> Result<ServerProtocol, ServerStateError>;

    fn close(self) -> Result<ServerProtocol, ServerStateError>;
}

pub trait ServerRunning {
    // fn new(self) -> Box<dyn ServerRunning>;

    // fn stop(self) -> Box<dyn ServerOpen>;

    fn close(self) -> Box<dyn ServerClosed>;
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
