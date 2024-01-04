use crate::models::runtime::CoddePiServer;
use pyo3::prelude::*;

#[pymethods]
impl CoddePiServer {
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
