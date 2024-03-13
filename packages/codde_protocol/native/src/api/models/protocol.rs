use pyo3::pyclass;

#[derive(Clone, Copy)]
#[pyclass]
pub enum Protocol {
    Socket,
    Bluetooth,
    Http,
    Usb,
}
