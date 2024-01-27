use std::{error::Error, fmt};

use crate::protocols::client::ClientProtocol;

use super::{frame::Frame, server::ServerStateError};

// TODO: ideally, client and server sides should have different trait,
// since these abstract methods correspond to client naming and not server.
// For server side, replace [connect] by `start` or `open`, and [disconnect] by `stop`, `close` or `shutdown`
pub trait ClientCom {
    fn connect(&mut self) -> Result<(), ServerStateError>;

    fn send(&mut self, data: Frame) -> Result<(), ServerStateError>;

    fn receive(&mut self) -> Result<Frame, ServerStateError>;

    // TODO: request ? <=> send + receive (with timeout)
    fn request(&mut self, data: Frame) -> Result<Frame, ServerStateError> {
        match self.send(data) {
            Ok(_) => self.receive(),
            Err(e) => Err(e),
        }
    }

    fn disconnect(self) -> Result<(), ServerStateError>;
}
