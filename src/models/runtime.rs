use pyo3::pyclass;

use super::{protocol::Protocol, widget_action::WidgetAction};

#[pyclass(subclass)]
pub struct CoddePiBase {
    protocol: Protocol,
}

#[pyclass(extends=CoddePiBase, subclass)]
pub struct CoddePiServer {
    action_registry: &'static [WidgetAction],
}
