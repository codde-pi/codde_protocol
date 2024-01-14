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
    fn on(&mut self, action: WidgetAction);

    fn callback(&mut self, data: Frame);

    fn listen(&mut self) -> Frame;

    fn serve(self) -> Box<dyn ServerRunning>;

    fn close(self) -> Box<dyn ServerClosed>;
}

pub trait ServerRunning {
    // fn new(self) -> Box<dyn ServerRunning>;

    // fn stop(self) -> Box<dyn ServerOpen>;

    fn close(self) -> Box<dyn ServerClosed>;
}
