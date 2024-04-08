use anyhow::{Ok, Result};

use pyo3::Python;

use crate::{base::error::ServerStateError, server::models::widget_registry::Action};

use crate::base::frame::{Frame, ResultFrame};

use super::models::widget_registry::WidgetAction;

pub trait ServerCom {
    fn open(&mut self) -> Result<(), ServerStateError>;
    fn register_action(&mut self, id: u8, widget: &str, action: Action) -> Result<()>;

    fn callback_result(&mut self, data: ResultFrame) -> Result<()>;

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
