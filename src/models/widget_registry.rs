use std::{any::Any, collections::HashMap};

use codde_pi_protocol_derive::Widget;
use serde::{Deserialize, Serialize};

// use type_info::TypeInfo;

#[typetag::serde(tag = "type")]
pub trait Widget {
    fn try_match(&self, s: &str) -> bool;
    fn as_any(&self) -> &dyn Any;
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
pub type WidgetAction = HashMap<String, Box<dyn Fn(&Box<dyn Widget>) + Send>>;

#[derive(Deserialize, Serialize, Widget)]
pub struct ClickButton;

#[derive(Deserialize, Serialize, Widget)]
pub struct ToggleButton {
    pub value: bool,
}
