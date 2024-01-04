use pyo3::{pyclass, FromPyObject};

#[pyclass]
pub struct WidgetAction {
    id: i64,
    widget: i32,    // TODO: ident ?,
    action: String, // take widget data in parameter
}
