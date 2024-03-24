use pyo3::pyclass;

#[derive(Clone, Copy)]
#[pyclass]
pub enum Protocol {
    WebSocket,
    Bluetooth,
    Http,
    Usb,
}
