use crate::{
    base::{
        protocol::Protocol,
        widget_registry::{ServerStatus, WidgetRegistry},
    },
    server::{
        com_socket::{on, ComSocketServer},
        models::widget_registry::{ConfirmResult, ErrorResult},
    },
};
use pyo3::prelude::*;

/// A Python module implemented in Rust. The name of this function must match
/// the `lib.name` setting in the `Cargo.toml`, else Python will not be able to
/// import the module.
#[pymodule]
fn codde_protocol(_py: Python, m: &Bound<PyModule>) -> PyResult<()> {
    m.add_class::<CoddePiServer>()?;
    m.add_class::<ComSocketServer>()?;
    m.add_class::<Protocol>()?;
    // m.add_class::<Action>()?;
    // m.add_class::<ResultFrame>()?;
    m.add_class::<ServerStatus>()?;
    m.add_class::<ConfirmResult>()?;
    m.add_class::<ErrorResult>()?;
    m.add_class::<WidgetRegistry>()?;
    m.add_function(wrap_pyfunction!(on, m)?)?;

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
