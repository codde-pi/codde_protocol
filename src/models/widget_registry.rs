use codde_pi_protocol_derive::WidgetMatch;
use serde::{Deserialize, Serialize};

#[typetag::serde(tag = "type")]
pub trait Widget {}

#[derive(Deserialize, Serialize, WidgetMatch)]
pub struct ClickButton {}

#[typetag::serde]
impl Widget for ClickButton {}

#[derive(Deserialize, Serialize, WidgetMatch)]
pub struct ToggleButton {
    value: bool,
}
#[typetag::serde]
impl Widget for ToggleButton {}

// pub type WidgetRegistry = (ClickButton, ToggleButton);
