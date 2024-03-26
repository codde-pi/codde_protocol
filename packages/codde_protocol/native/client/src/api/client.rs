use anyhow::Result;

use crate::api::base::{
    error::ServerStateError,
    frame::{Frame, ResultFrame},
};

/// Client and server sides have different trait,
/// since these abstract methods correspond to client naming and not server.
pub trait ClientCom {
    fn connect(&mut self) -> Result<(), ServerStateError>;

    fn send(&mut self, data: Frame) -> Result<(), ServerStateError>;

    fn receive(&mut self) -> Result<Option<ResultFrame>>;

    fn request(&mut self, data: Frame) -> Result<Option<ResultFrame>> {
        self.send(data)?;
        self.receive()
    }

    fn disconnect(&mut self) -> Result<(), ServerStateError>;

    fn is_connected(&self) -> bool;
}
