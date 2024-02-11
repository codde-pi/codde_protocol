use std::borrow::BorrowMut;

use crate::{
    api::models::protocol::Protocol,
    api::models::{
        frame::ResultFrame,
        server::ServerCom,
        widget_registry::{
            Action, ClickButton, ConfirmButton, ConfirmResult, ServerStatus, ToggleButton,
            WidgetAction, WidgetRegistry,
        },
    },
    api::protocols::server::{com_socket::ComSocketServer, ServerProtocol},
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

#[pyclass]
pub struct CoddePiServer {}

#[pymethods]
impl CoddePiServer {
    #[staticmethod]
    pub fn use_socket(address: &str) -> ComSocketServer {
        ComSocketServer::new(address)
    }
}
