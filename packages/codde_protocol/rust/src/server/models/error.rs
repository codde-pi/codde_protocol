use crate::base::error::ServerStateError;
use pyo3::{exceptions::PyOSError, PyErr};

impl std::convert::From<ServerStateError> for PyErr {
    fn from(err: ServerStateError) -> PyErr {
        PyOSError::new_err(err.to_string())
    }
}
