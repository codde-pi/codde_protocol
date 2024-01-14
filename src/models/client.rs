use super::{frame::Frame, widget_action::WidgetAction};

// TODO: ideally, client and server sides should have different trait,
// since these abstract methods correspond to client naming and not server.
// For server side, replace [connect] by `start` or `open`, and [disconnect] by `stop`, `close` or `shutdown`
pub trait ClientCom {
    fn new(self) -> Box<dyn ClientNotConnected>;
}

pub trait ClientNotConnected {
    fn connect(self) -> Box<dyn ClientConnected>;
}

pub trait ClientConnected {
    fn on(&mut self, action: WidgetAction);

    fn send(&mut self, data: Frame);

    fn receive(&mut self) -> Frame;

    fn disconnect(self) -> Box<dyn ClientNotConnected>;
}
