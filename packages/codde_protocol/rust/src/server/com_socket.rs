use anyhow::Result;
use std::{
    borrow::BorrowMut,
    collections::HashMap,
    io::{Read, Write},
    net::{TcpListener, TcpStream},
    sync::mpsc::{channel, Receiver, Sender, TryRecvError},
    thread,
    time::Duration,
};

use crate::{
    base::{
        error::ServerStateError,
        frame::{Frame, ResultFrame},
        widget_registry::{action_identity, extract_identity, ServerStatus},
    },
    server::server_com::execute_action,
};

use crate::server::ServerCom;

use pyo3::{
    prelude::*,
    types::{PyCFunction, PyDict},
    PyObject,
};

use log::debug;

use super::models::widget_registry::{clone_action_registry, Action, WidgetAction};

#[pyclass]
pub struct ComSocketServer {
    #[pyo3(get)]
    pub address: String,
    stream: Option<TcpStream>,
    pub actions: WidgetAction,
    trigger: Option<Sender<bool>>,
}

#[pyfunction]
pub fn on(py: Python, server: Py<ComSocketServer>) -> PyResult<Bound<PyCFunction>> {
    let f = move |args: &pyo3::Bound<pyo3::types::PyTuple>, _: Option<&pyo3::Bound<'_, PyDict>>| {
        Python::with_gil(|py| {
            let func: PyObject = args.get_item(0)?.into();
            let f_name = func
                .getattr(py, "__name__")
                .unwrap()
                .extract::<String>(py)
                .unwrap();
            let (uid, name) = extract_identity(f_name);
            server
                .call_method1(py, "on", (uid, name, func.clone_ref(py)))
                .unwrap();
            let g = move |args: &pyo3::Bound<pyo3::types::PyTuple>,
                          kwargs: Option<&pyo3::Bound<'_, PyDict>>| {
                debug!("decorated call");
                Python::with_gil(|py| func.call_bound(py, args, kwargs))
            };
            match PyCFunction::new_closure_bound(py, None, None, g) {
                Ok(r) => Ok(r.into_py(py)),
                Err(e) => Err(e),
            }
        })
    };
    PyCFunction::new_closure_bound(py, None, None, f)
}

#[pymethods]
impl ComSocketServer {
    #[new]
    pub fn new(address: &str) -> ComSocketServer {
        ComSocketServer {
            address: String::from(address),
            stream: None,
            actions: HashMap::new(),
            trigger: None,
        }
    }

    fn on(&mut self, id: u8, widget: &str, action: Py<PyAny>) -> Result<()> {
        // PyFn argument instead of PyAny ?
        debug!("register action: {}", widget);
        ServerCom::register_action(self, id, widget, Action::PythonFn(action))
    }

    pub fn _get_action(&mut self, key: &str) -> Result<Option<&Py<PyAny>>> {
        match self.actions.get(key) {
            Some(action) => match action {
                Action::PythonFn(value) => Ok(Some(value)),
                _ => Err(ServerStateError(String::from("RustFn is not compatible yet")).into()),
            },

            None => Ok(None),
        }
    }

    pub fn open(&mut self) -> Result<(), ServerStateError> {
        ServerCom::open(self)
    }

    pub fn serve(&mut self) -> Result<()> {
        ServerCom::serve(self)
    }

    pub fn callback(&mut self, id: u8, status: ServerStatus, data: Py<PyAny>) -> Result<()> {
        ServerCom::callback_result(self, ResultFrame::new(id, status, data))
    }

    pub fn close(&mut self) -> Result<()> {
        ServerCom::close(self)
    }
}

impl ComSocketServer {
    fn _listen(stream: &mut Option<&TcpStream>) -> Result<Option<Frame>> {
        match stream {
            Some(stream) => {
                let mut buffer = [0; 1024];
                let data: Option<&[u8]> = match stream.read(&mut buffer) {
                    Ok(size) => {
                        println!("Received size : {}", size);
                        match size {
                            0 => None,
                            _ => Some(&buffer[..size]),
                        }
                    }
                    Err(e) => panic!("Failed to read frame : {}", e),
                };
                match data {
                    Some(d) => Frame::parse(d),
                    None => Ok(None),
                }
            }
            None => Err(ServerStateError::no_stream().into()),
        }
    }
}

impl ServerCom for ComSocketServer {
    fn open(&mut self) -> Result<(), ServerStateError> {
        let listener = match TcpListener::bind(self.address.as_str()) {
            Ok(listener) => listener,
            Err(err) => panic!("Unable to intanstiate TCP Listener. {:?}", err),
        };
        self.stream = match listener.accept() {
            Ok(res) => Some(res.0),
            Err(e) => panic!("Unable to get new TCP connection. {:?}", e),
        };
        Ok(())
    }
    fn register_action(&mut self, id: u8, widget: &str, action: Action) -> Result<()> {
        self.actions.insert(action_identity(id, widget), action);
        Ok(())
    }

    // TODO: change method name in order to be used in Rust
    fn callback_result(&mut self, data: ResultFrame) -> Result<()> {
        let stream = &mut *self.stream.borrow_mut();
        match stream {
            Some(s) => {
                s.write_all(&data.bufferize())?;
                Ok(())
            } // TODD,
            None => Err(ServerStateError::no_stream().into()),
        }
    }

    fn listen(&mut self) -> Result<Option<Frame>> {
        let stream = &mut self.stream.as_ref();
        ComSocketServer::_listen(stream)
    }

    fn serve(&mut self) -> Result<()> {
        let tmp_stream: Result<(), ServerStateError> = match &mut self.stream.borrow_mut() {
            Some(_) => Ok(()),
            None => Err(ServerStateError::no_stream()),
        };
        tmp_stream?;

        let new_stream: TcpStream = match self.stream.as_ref() {
            Some(s) => s,
            None => panic!("Stream instance failed to be bound"),
        }
        .try_clone()?;

        let actions = clone_action_registry(&self.actions);
        let (tx, rx): (Sender<bool>, Receiver<bool>) = channel();
        self.trigger = Some(tx.clone());
        let _ = self;

        thread::spawn({
            move || loop {
                thread::sleep(Duration::from_millis(500));
                // catch errors, stop loop
                match rx.try_recv() {
                    Ok(_) => {
                        println!("Terminating.");
                        match new_stream.shutdown(std::net::Shutdown::Both) {
                            Ok(_) => {}
                            Err(e) => panic!("Failed to shutdown server: {}", e),
                            // TODO: better error handling
                        };
                        break;
                    }
                    Err(TryRecvError::Disconnected) => println!("Link broken"),
                    Err(TryRecvError::Empty) => {}
                }
                match ComSocketServer::_listen(Some(&new_stream).borrow_mut()) {
                    Ok(data) => match data {
                        Some(frame) => {
                            // security
                            let acts = &actions;
                            match execute_action(acts, frame) {
                                Ok(_) => {}
                                Err(e) => panic!("Action failed {}", e),
                            };
                            println!("done");
                        }
                        None => continue,
                    },
                    Err(e) => panic!("{}", e),
                };
            }
        });
        Ok(())
    }

    fn close(&mut self) -> Result<()> {
        let trigger = &mut *self.trigger.borrow_mut();
        match trigger {
            Some(trigger) => {
                trigger.send(true)?;
                self.stream = None;
            }
            None => {}
        };
        let stream = &mut *self.stream.borrow_mut();
        match stream {
            Some(stream) => {
                stream.shutdown(std::net::Shutdown::Both)?;
                self.stream = None;
            }
            None => {}
        };
        Ok(())
    }
}
