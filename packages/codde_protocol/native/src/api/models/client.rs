use anyhow::Result;

use super::{
    frame::{Frame, ResultFrame},
    server::ServerStateError,
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

    fn disconnect(self) -> Result<(), ServerStateError>;
}
