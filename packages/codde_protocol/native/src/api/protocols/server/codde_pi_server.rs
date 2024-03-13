use crate::api::{
    models::{
        protocol::Protocol,
        widget_registry::{
            ClickButton, ConfirmButton, ConfirmResult, DirectionalButton, ErrorResult, Joystick,
            PressButton, ServerStatus, ToggleButton,
        },
    },
    protocols::server::com_socket::ComSocketServer,
};
use flutter_rust_bridge::frb;
use pyo3::prelude::*;

/// A Python module implemented in Rust. The name of this function must match
/// the `lib.name` setting in the `Cargo.toml`, else Python will not be able to
/// import the module.
#[pymodule]
#[frb(opaque)]
fn codde_protocol(_py: Python, m: &PyModule) -> PyResult<()> {
    m.add_class::<CoddePiServer>()?;
    m.add_class::<ComSocketServer>()?;
    m.add_class::<Protocol>()?;
    // m.add_class::<Action>()?;
    m.add_class::<ClickButton>()?;
    m.add_class::<ToggleButton>()?;
    m.add_class::<ConfirmButton>()?;
    m.add_class::<DirectionalButton>()?;
    m.add_class::<Joystick>()?;
    m.add_class::<PressButton>()?;
    // m.add_class::<ResultFrame>()?;
    m.add_class::<ServerStatus>()?;
    m.add_class::<ConfirmResult>()?;
    m.add_class::<ErrorResult>()?;

    Ok(())
}
// TODO: pyo3::create_exception!(codde_py, ServerStateError, PyException);

#[pyclass]
#[frb(opaque)]
pub struct CoddePiServer {}

#[pymethods]
impl CoddePiServer {
    #[staticmethod]
    pub fn use_socket(address: &str) -> ComSocketServer {
        ComSocketServer::new(address)
    }
}
