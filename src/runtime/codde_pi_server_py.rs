use crate::models::{protocol::Protocol, runtime::CoddePiServer, widget_action::WidgetAction};
use pyo3::{prelude::*, types::PyList};

#[pyclass]
pub struct CoddePiBase {
    pub protocol: Protocol,
}

#[pyclass]
pub struct CoddePiServer {
    pub protocol: Protocol,
    pub action_registry: Py<PyList>,
}
#[pymethods]
impl CoddePiServer {
    #[new]
    fn new(protocol: Protocol, action_registry: Py<PyList>) -> Self {
        CoddePiServer {
            protocol,
            action_registry,
        }
    }
    fn open(&self) {
        todo!()
    }

    fn listen(&self) {
        todo!()
    }

    fn close(&self) {
        todo!()
    }
}

#[pymodule]
fn coddepy(_py: Python<'_>, m: &PyModule) -> PyResult<()> {
    m.add_class::<CoddePiServer>()?;
    Ok(())
}
