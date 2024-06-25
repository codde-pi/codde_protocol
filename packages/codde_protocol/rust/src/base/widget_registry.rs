use core::fmt;

use pyo3::pyclass;
use serde::{Deserialize, Serialize};

#[typetag::serde(tag = "type")]
pub trait Widget {}

#[typetag::serde(tag = "type")]
pub trait ResultWidget {}

#[derive(Debug, Deserialize, Serialize, PartialEq, Clone)]
#[pyclass(eq, eq_int)]
pub enum ServerStatus {
    NotInit,
    Idle,
    Busy,
    Error,
}

// Create ClientStatus
#[derive(Debug, Deserialize, Serialize, PartialEq, Clone)]
#[pyclass(eq, eq_int)]
pub enum ClientStatus {
    Connected,
    Disconnected,
}

pub fn action_identity(id: u8, widget: &str) -> String {
    format!("{}_{}", widget.split_whitespace().next().unwrap_or(""), id)
}

pub fn extract_identity(value: String) -> (u8, String) {
    let arr: Vec<&str> = value.split('_').collect();
    (arr[1].parse::<u8>().unwrap(), String::from(arr[0]))
}

#[derive(Serialize, Deserialize, Clone, Debug, PartialEq)]
#[pyclass]
pub struct Coord {
    #[pyo3(get)]
    pub x: f32,
    #[pyo3(get)]
    pub y: f32,
}

#[derive(Serialize, Deserialize, Clone, Debug, PartialEq)]
#[pyclass(get_all)]
pub enum WidgetRegistry {
    ClickButton {},
    ToggleButton { value: bool },
    ConfirmButton {},
    PressButton { pressed: bool },
    DirectionalButton { direction: u8 },
    Joystick { delta: Coord, intensity: f32 },
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
    ErrorResult { error: String },
}

impl fmt::Display for ResultRegistry {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "{:?}", self)
        // or, alternatively:
        // fmt::Debug::fmt(self, f)
    }
}
