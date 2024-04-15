use crate::base::{
    frame::ResultFrame,
    widget_registry::{ResultRegistry, ServerStatus},
};

use super::widget_registry::ResultBinding;
use pyo3::{Py, PyAny, Python};

impl ResultFrame {
    pub fn new(id: u8, status: ServerStatus, data: Py<PyAny>) -> ResultFrame {
        Python::with_gil(|py| {
            let d: ResultBinding = match data.extract(py) {
                Ok(d) => d,
                Err(e) => panic!("Python data failed to be bound: {}", e),
            };

            ResultFrame {
                id,
                status,
                data: ResultRegistry::from_binding(d),
            }
        })
    }
}
