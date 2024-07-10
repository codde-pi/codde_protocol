use pyo3::pyclass;

#[derive(Clone, Copy, PartialEq)]
#[pyclass(eq, eq_int)]
pub enum Protocol {
    WebSocket,
    Bluetooth,
    Http,
    Usb,
}
