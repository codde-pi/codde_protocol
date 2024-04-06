use anyhow::Result;
use std::collections::HashMap;

use pyo3::{prelude::*, pyclass, Py, PyAny};
use serde::{Deserialize, Serialize};

use crate::base::widget_registry::{Coord, ResultRegistry, ResultWidget, Widget, WidgetRegistry};
use codde_protocol_derive::{ResultWidget, Widget};
pub type WidgetAction = HashMap<String, Action>;

pub type TypeFn = fn(s: WidgetRegistry) -> Result<()>;

#[derive(Debug, Clone)]
pub enum Action {
    RustFn(TypeFn),
    PythonFn(Py<PyAny>),
}
impl IntoPy<PyObject> for ResultRegistry {
    fn into_py(self, py: Python<'_>) -> PyObject {
        match self {
            ResultRegistry::ConfirmResult { status } => ConfirmResult::new(status).into_py(py),
            // match the error result
            ResultRegistry::ErrorResult { error } => ErrorResult::new(error).into_py(py),
        }
    }
}
impl IntoPy<PyObject> for WidgetRegistry {
    fn into_py(self, py: Python<'_>) -> PyObject {
        match self {
            WidgetRegistry::ClickButton {} => ClickButton::new().into_py(py),
            WidgetRegistry::ToggleButton { value } => ToggleButton::new(value).into_py(py),
            WidgetRegistry::ConfirmButton {} => ConfirmButton::new().into_py(py),
            WidgetRegistry::DirectionalButton { direction } => {
                DirectionalButton::new(direction).into_py(py)
            }
            WidgetRegistry::PressButton { pressed } => PressButton::new(pressed).into_py(py),
            // bind joystick
            WidgetRegistry::Joystick { delta, intensity } => {
                Joystick::new(delta, intensity).into_py(py)
            }
        }
    }
}
impl ResultRegistry {
    pub fn from_binding(binding: ResultBinding) -> ResultRegistry {
        match binding {
            ResultBinding::Confirm(res) => ResultRegistry::ConfirmResult { status: res.status },
            ResultBinding::Error(res) => ResultRegistry::ErrorResult { error: res.error },
        }
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
#[derive(Deserialize, Serialize, Widget, Clone)]
#[pyclass]
pub struct DirectionalButton {
    #[pyo3(get)]
    pub direction: u8,
}
#[pymethods]
impl DirectionalButton {
    #[new]
    fn new(direction: u8) -> DirectionalButton {
        DirectionalButton { direction }
    }
}

#[derive(Deserialize, Serialize, Widget, Clone)]
#[pyclass]
pub struct PressButton {
    #[pyo3(get)]
    pub pressed: bool,
}
#[pymethods]
impl PressButton {
    #[new]
    fn new(pressed: bool) -> PressButton {
        PressButton { pressed }
    }
}

// Joytick python implementation
#[derive(Deserialize, Serialize, Widget, Clone)]
#[pyclass]
pub struct Joystick {
    #[pyo3(get)]
    pub delta: Coord,
    #[pyo3(get)]
    pub intensity: f32,
}
#[pymethods]
impl Joystick {
    #[new]
    fn new(delta: Coord, intensity: f32) -> Joystick {
        Joystick { delta, intensity }
    }
}

/*
* RESULT REGISTRY
*/

#[derive(FromPyObject)]
pub enum ResultBinding {
    Confirm(ConfirmResult),
    Error(ErrorResult),
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

// Create an ErrorResult
#[derive(Deserialize, Serialize, ResultWidget, Clone)]
#[pyclass]
pub struct ErrorResult {
    #[pyo3(get)]
    pub error: String,
}
#[pymethods]
impl ErrorResult {
    #[new]
    fn new(error: String) -> ErrorResult {
        ErrorResult { error }
    }
}
