use std::borrow::BorrowMut;

use crate::{
    models::protocol::Protocol,
    models::{
        frame::ResultFrame,
        server::ServerCom,
        widget_registry::{
            Action, ClickButton, ConfirmButton, ConfirmResult, ServerStatus, ToggleButton,
            WidgetAction, WidgetRegistry,
        },
    },
    protocols::server::{com_socket::ComSocketServer, ServerProtocol},
};
use pyo3::{exceptions::PyException, prelude::*};

/// A Python module implemented in Rust. The name of this function must match
/// the `lib.name` setting in the `Cargo.toml`, else Python will not be able to
/// import the module.
#[pymodule]
fn codde_pi_protocol(_py: Python, m: &PyModule) -> PyResult<()> {
    m.add_class::<CoddePiServer>()?;
    m.add_class::<ComSocketServer>()?;
    m.add_class::<Protocol>()?;
    // m.add_class::<Action>()?;
    m.add_class::<ClickButton>()?;
    m.add_class::<ToggleButton>()?;
    m.add_class::<ConfirmButton>()?;
    // m.add_class::<ResultFrame>()?;
    m.add_class::<ServerStatus>()?;
    m.add_class::<ConfirmResult>()?;

    Ok(())
}
// TODO: pyo3::create_exception!(codde_py, ServerStateError, PyException);

// #[pyclass]
/* pub struct CoddePiServer<T: ServerCom> {
    protocol: ServerProtocol<T>,
}

impl<T> CoddePiServer<T>
where
    T: ServerCom,
{
    pub fn new(protocol: Protocol, address: &str) -> Self {
        match protocol {
            Protocol::Socket => CoddePiServer {
                protocol: ServerProtocol::Socket(ComSocketServer::new(address)),
            }, // CoddePiServer::use_socket(address),,
            Protocol::Bluetooth => todo!(),
            Protocol::Http => todo!(),
            Protocol::Usb => todo!(),
        }
    }

    // #[staticmethod]
    pub fn use_socket(address: &str) -> Self {
        CoddePiServer {
            protocol: ServerProtocol::Socket(ComSocketServer::new(address)),
        }
    }
}

// #[pymethods]
impl<T> ServerCom for CoddePiServer<T>
where
    T: ServerCom,
{
    // #[new]

    fn open(&mut self) {
        /* self.protocol = match &self.protocol {
            ServerProtocol::Socket(this) => {
                ComSocketServer::_open(this.address.clone(), this.actions.clone()).unwrap()
            }
        }; */
        self.protocol.open().unwrap();
    }
    fn on(&mut self, id: u8, widget: &str, action: Action) {
        self.protocol.on(id, widget, action);
    }

    fn serve(&mut self) {
        self.protocol = self.protocol.serve().unwrap();
    }

    fn callback(
        &mut self,
        data: crate::models::frame::Frame,
    ) -> Result<(), crate::models::server::ServerStateError> {
        todo!()
    }

    fn listen(
        &mut self,
    ) -> Result<crate::models::frame::Frame, crate::models::server::ServerStateError> {
        todo!()
    }

    fn close(&mut self) -> Result<(), crate::models::server::ServerStateError> {
        todo!()
    }
} */
#[pyclass]
pub struct CoddePiServer {}

#[pymethods]
impl CoddePiServer {
    #[staticmethod]
    pub fn use_socket(address: &str) -> ComSocketServer {
        ComSocketServer::new(address)
    }
}
