use serde::{Deserialize, Serialize};

#[derive(Deserialize, Serialize)]
pub struct ClickButton {}

#[derive(Deserialize, Serialize)]
pub struct ToggleButton {
    value: bool,
}

pub type WidgetRegistry = (ClickButton, ToggleButton);
