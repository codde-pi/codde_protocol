use anyhow::Result;
use core::fmt;
use std::collections::HashMap;

use codde_protocol_derive::{ResultWidget, Widget};
use pyo3::{prelude::*, pyclass, Py, PyAny};
use serde::{Deserialize, Serialize};

#[typetag::serde(tag = "type")]
pub trait Widget {}

#[typetag::serde(tag = "type")]
pub trait ResultWidget {}

#[derive(Debug, Deserialize, Serialize, PartialEq, Clone)]
#[pyclass]
pub enum ServerStatus {
    Idle,
    Busy,
    Error,
}
pub fn action_identity(id: u8, widget: &str) -> String {
    format!("{}_{}", id, widget.split_whitespace().next().unwrap_or(""))
}

pub fn extract_identity(value: String) -> (u8, String) {
    let arr: Vec<&str> = value.split('_').collect();
    (arr[1].as_bytes()[0], String::from(arr[0]))
}

pub type WidgetAction = HashMap<String, Action>;

pub type TypeFn = fn(s: WidgetRegistry) -> Result<()>;

#[derive(Debug, Clone)]
pub enum Action {
    RustFn(TypeFn),
    PythonFn(Py<PyAny>),
}

#[derive(Serialize, Deserialize, Clone, Debug, PartialEq)]
pub enum WidgetRegistry {
    ClickButton {},
    ToggleButton { value: bool },
    ConfirmButton {},
}

impl IntoPy<PyObject> for WidgetRegistry {
    fn into_py(self, py: Python<'_>) -> PyObject {
        match self {
            WidgetRegistry::ClickButton {} => ClickButton::new().into_py(py),
            WidgetRegistry::ToggleButton { value } => ToggleButton::new(value).into_py(py),
            WidgetRegistry::ConfirmButton {} => ConfirmButton::new().into_py(py),
        }
    }
}
impl fmt::Display for WidgetRegistry {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "{:?}", self)
        // or, alternatively:
        // fmt::Debug::fmt(self, f)
    }
}

impl WidgetRegistry {
    pub fn name(&self) -> String {
        WidgetRegistry::to_string(self)
            .split_whitespace()
            .next()
            .unwrap_or("")
            .to_string()
    }
}

#[derive(Serialize, Deserialize, Clone, Debug, PartialEq)]
pub enum ResultRegistry {
    ConfirmResult { status: bool },
}

impl IntoPy<PyObject> for ResultRegistry {
    fn into_py(self, py: Python<'_>) -> PyObject {
        match self {
            ResultRegistry::ConfirmResult { status } => ConfirmResult::new(status).into_py(py),
        }
    }
}

impl ResultRegistry {
    pub fn from_binding(binding: ResultBinding) -> ResultRegistry {
        match binding {
            ResultBinding::Confirm(res) => ResultRegistry::ConfirmResult { status: res.status },
        }
    }
}
impl fmt::Display for ResultRegistry {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "{:?}", self)
        // or, alternatively:
        // fmt::Debug::fmt(self, f)
    }
}

/// Bind de tous les widgets : Un coup une classe compatible python class, de l'autre le
/// meme nom version enum et un match pour que lorsque l'objet python arrive il soit transformé en
/// struct compatible, puis bindé en enum du widget registry
///
/// La [Frame] possèderait l'enum WidgetRegsitry, la conversion se ferait uniquement au niveau des
/// méthodes du `Server`

/*
* WIDGET REGISTRY
*/

#[derive(Deserialize, Serialize, Widget, Clone)]
#[pyclass]
pub struct ClickButton;
#[pymethods]
impl ClickButton {
    #[new]
    fn new() -> ClickButton {
        ClickButton {}
    }
}

#[derive(Deserialize, Serialize, Widget, Clone)]
#[pyclass]
pub struct ToggleButton {
    #[pyo3(get)]
    pub value: bool,
}
#[pymethods]
impl ToggleButton {
    #[new]
    fn new(value: bool) -> ToggleButton {
        ToggleButton { value }
    }
}

#[derive(Deserialize, Serialize, Widget, Clone)]
#[pyclass]
pub struct ConfirmButton {}
#[pymethods]
impl ConfirmButton {
    #[new]
    fn new() -> ConfirmButton {
        ConfirmButton {}
    }
}

/*
* RESULT REGISTRY
*/

#[derive(FromPyObject)]
pub enum ResultBinding {
    Confirm(ConfirmResult),
}

#[derive(Deserialize, Serialize, ResultWidget, Clone)]
#[pyclass]
pub struct ConfirmResult {
    #[pyo3(get)]
    pub status: bool,
}
#[pymethods]
impl ConfirmResult {
    #[new]
    fn new(status: bool) -> ConfirmResult {
        ConfirmResult { status }
    }
}
