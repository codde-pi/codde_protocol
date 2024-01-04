use pyo3::{pyclass, types::PyList, FromPyObject, Py};

use super::{protocol::Protocol, widget_action::WidgetAction};

#[pyclass]
pub struct CoddePiBase {
    pub protocol: Protocol,
}

#[pyclass]
pub struct CoddePiServer {
    pub protocol: Protocol,
    pub action_registry: Py<PyList>,
}
