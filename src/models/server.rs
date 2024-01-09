use super::{frame::Frame, widget_action::WidgetAction};

// TODO: ideally, client and server sides should have different trait,
// since these abstract methods correspond to client naming and not server.
// For server side, replace [connect] by `start` or `open`, and [disconnect] by `stop`, `close` or `shutdown`
pub trait ServerCom {
    fn new(self) -> Box<dyn ServerClosed>;
}

pub trait ServerClosed {
    fn open(self) -> Box<dyn ServerOpen>;
}

pub trait ServerOpen {
    fn on(&self, action: WidgetAction);

    fn callback(&self, data: Frame);

    fn listen(&self) -> Frame;

    fn serve(&self);

    fn close(self) -> Box<dyn ServerClosed>;
}
