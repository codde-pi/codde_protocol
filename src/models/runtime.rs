use pyo3::pyclass;

use super::protocol::Protocol;

#[pyclass(subclass)]
pub struct CoddePiBase {
    protocol: Protocol,
}

#[pyclass(extends=CoddePiBase, subclass)]
pub struct CoddePiServer {
    action_registry: &[WidgetAction],
}
