use pyo3::{pyclass, FromPyObject};

#[pyclass]
#[derive(Clone, Copy)]
pub enum Protocol {
    Socket,
    Bluetooth,
    Http,
    Usb,
}
