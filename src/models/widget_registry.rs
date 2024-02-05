use anyhow::Result;
use core::fmt;
use std::{
    any::{Any, TypeId},
    collections::HashMap,
};

use codde_pi_protocol_derive::Widget;
use pyo3::{prelude::*, pyclass, types::PyTuple, Py, PyAny};
use serde::{Deserialize, Serialize};

// use type_info::TypeInfo;

#[typetag::serde(tag = "type")]
pub trait Widget {}
/* #[typetag::serde(tag = "type")]
pub trait Widget {} */
#[derive(Deserialize, Serialize)]
pub enum ServerStatus {
    idle,
    busy,
    error,
}
pub fn action_identity(id: u8, widget: &str) -> String {
    format!(
        "{}_{}",
        id,
        match widget.split_whitespace().next() {
            Some(s) => s,
            None => "",
        }
    )
}

pub fn extract_identity(value: String) -> (u8, String) {
    let arr: Vec<&str> = value.split("_").collect();
    (arr[1].as_bytes()[0], String::from(arr[0]))
}

pub type WidgetAction = HashMap<String, Action>;

pub type TypeFn = fn(s: WidgetRegistry) -> Result<()>;

/* #[derive(Clone)]
#[pyclass]
pub struct Action {
    pub value: TypeFn,
}

impl Action {
    #[new]
    fn new(value: TypeFn) -> Self {
        Action { value }
    }
} */

#[derive(Debug, Clone)]
pub enum Action {
    RustFn(TypeFn),
    PythonFn(Py<PyAny>),
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

#[derive(Deserialize, Serialize, Widget)]
#[pyclass]
pub struct ClickButton;

#[pymethods]
impl ClickButton {
    #[new]
    fn new() -> Self {
        ClickButton {}
    }
}

#[derive(Deserialize, Serialize, Widget)]
#[pyclass]
pub struct ToggleButton {
    #[pyo3(get)]
    pub value: bool,
}
#[pymethods]
impl ToggleButton {
    #[new]
    fn new(value: bool) -> Self {
        ToggleButton { value }
    }
}

#[derive(Deserialize, Serialize, Widget, Clone)]
#[pyclass]
pub struct ConfirmButton {}
#[pymethods]
impl ConfirmButton {
    #[new]
    fn new() -> Self {
        ConfirmButton {}
    }
}

pub struct ConfirmEvent {
    pub event: bool,
}

#[derive(Serialize, Deserialize, Clone, Debug)]
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

pub enum WidgetEvent {
    Confirm(ConfirmEvent),
}

// TODO: implement and use when adding action ?
/* pub impl WidgetEvent {
    pub fn event_of(&self, widget_name: &str) -> Option<WidgetEvent> {
        match widget_name {
            WidgetRegistry::Confirm(_) => WidgetEvent(ConfirmEvent)
        }
    }
} */
