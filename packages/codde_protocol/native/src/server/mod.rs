use anyhow::Result;
use pyo3::{prelude::*, pyclass, Py, PyAny};

use self::server::ServerCom;

// python destination code
pub mod codde_pi_server;
pub mod com_socket;
pub mod models;
pub mod server;

pub enum ServerProtocol<T: ServerCom> {
    WebSocket(T),
}
