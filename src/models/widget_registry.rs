use std::{any::Any, collections::HashMap};

use codde_pi_protocol_derive::Widget;
use serde::{Deserialize, Serialize};

// use type_info::TypeInfo;

#[typetag::serde(tag = "type")]
pub trait Widget {
    /* fn try_match(&self, s: &str) -> bool;
    fn as_any(&self) -> &dyn Any; */
    fn get_identity(&self, id: u8) -> String;
    fn name(&self) -> String;
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
pub struct Action {
    pub value: TypeFn,
}

#[derive(Deserialize, Serialize, Widget)]
pub struct ClickButton;

#[derive(Deserialize, Serialize, Widget)]
pub struct ToggleButton {
    pub value: bool,
}

#[derive(Serialize, Deserialize)]
pub enum WidgetRegistry {
    Click(ClickButton),
    Toggle(ToggleButton),
}
impl WidgetRegistry {
    pub fn name(&self) -> String {
        match self {
            WidgetRegistry::Click(_) => self.name(),
            WidgetRegistry::Toggle(_) => self.name(),
        }
    }
}
