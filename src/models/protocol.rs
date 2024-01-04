use pyo3::pyclass;

#[pyclass]
#[derive(Clone, Copy)]
pub enum Protocol {
    socket,
    bluetooth,
    http,
    usb,
}
