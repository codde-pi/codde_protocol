use anyhow::Result;
use std::collections::HashMap;

use pyo3::{prelude::*, pyclass, Py, PyAny};
use serde::{Deserialize, Serialize};

use crate::base::widget_registry::{ResultRegistry, ResultWidget, WidgetRegistry};
use codde_protocol_derive::ResultWidget;
pub type WidgetAction = HashMap<String, Action>;

pub type TypeFn = fn(s: WidgetRegistry) -> Result<()>;

#[derive(Debug)]
pub enum Action {
    RustFn(TypeFn),
    PythonFn(Py<PyAny>),
}

/* impl IntoPy<PyObject> for Action {
    fn into_py(self, py: Python<'_>) -> PyObject {
        match self {
            Action::RustFn(f) => todo!(),
            Action::PythonFn(f) => f.into_py(py),
        }
    }
} */

pub fn clone_action(action: &Action) -> Action {
    match action {
        Action::RustFn(f) => Action::RustFn(*f),
        Action::PythonFn(f) => Python::with_gil(|py| Action::PythonFn(f.clone_ref(py))),
    }
}

pub fn clone_action_registry(action: &WidgetAction) -> WidgetAction {
    let mut new_action = WidgetAction::new();
    for (k, v) in action {
        new_action.insert(k.clone(), clone_action(v));
    }
    new_action
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
