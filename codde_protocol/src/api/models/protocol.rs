use pyo3::pyclass;

#[pyclass]
#[derive(Clone, Copy)]
pub enum Protocol {
    Socket,
    Bluetooth,
    Http,
    Usb,
}
