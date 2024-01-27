use std::{any::Any, collections::HashMap};

use codde_pi_protocol_derive::Widget;
use pyo3::pyclass;
use serde::{Deserialize, Serialize};

// use type_info::TypeInfo;

#[typetag::serde(tag = "type")]
pub trait Widget {
    /* fn try_match(&self, s: &str) -> bool;
    fn as_any(&self) -> &dyn Any; */
    // fn get_identity(&self, id: u8) -> &str;
    fn name(&self) -> &str;
}
/* #[typetag::serde(tag = "type")]
pub trait Widget {} */
#[derive(Deserialize, Serialize)]
pub enum ServerStatus {
    idle,
    busy,
    error,
}
pub fn action_identity(id: u8, widget: &str) -> String {
    format!("{widget}_{id}")
}
pub type WidgetAction = HashMap<String, Action>;

type TypeFn = fn(s: WidgetRegistry);

#[derive(Clone)]
#[pyclass]
pub struct Action {
    pub value: TypeFn,
}

/*
* WIDGET REGISTRY
*/

#[derive(Deserialize, Serialize, Widget)]
pub struct ClickButton;

#[derive(Deserialize, Serialize, Widget)]
pub struct ToggleButton {
    pub value: bool,
}

#[derive(Deserialize, Serialize, Widget)]
pub struct ConfirmButton;

pub struct ConfirmEvent {
    pub event: bool,
}

#[derive(Serialize, Deserialize)]
pub enum WidgetRegistry {
    Click(ClickButton),
    Toggle(ToggleButton),
    Confirm(ConfirmButton),
}
impl WidgetRegistry {
    pub fn name(&self) -> &str {
        match self {
            WidgetRegistry::Click(s) => s.name(),
            WidgetRegistry::Toggle(s) => s.name(),
            WidgetRegistry::Confirm(s) => s.name(),
        }
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
