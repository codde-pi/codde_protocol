use std::{
    error::Error,
    fmt::{self},
};

use serde::Deserialize;

#[derive(Deserialize)]
pub struct ServerStateError(pub String); // Implement std::fmt::Display for AppError

impl ServerStateError {
    pub fn no_stream() -> ServerStateError {
        ServerStateError(String::from(
            "Stream has not been instanciated. Consider calling `server.open()`",
        ))
    }
}
impl Error for ServerStateError {}
impl fmt::Display for ServerStateError {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "Bad Server state") // user-facing output
    }
}

// Implement std::fmt::Debug for AppError
impl fmt::Debug for ServerStateError {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "{{ file: {}, line: {} }}", file!(), line!()) // programmer-facing output
    }
}

impl From<rmp_serde::decode::Error> for ServerStateError {
    fn from(error: rmp_serde::decode::Error) -> ServerStateError {
        // TODO: cleaner please
        eprint!("{}", error);
        ServerStateError(format!("{}", error))
    }
}
