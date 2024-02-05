// TODO: refact based on [ServerCom]
use anyhow::Result;
use std::{
    borrow::BorrowMut,
    collections::HashMap,
    io::{Read, Write},
    net::{TcpListener, TcpStream},
    ops::DerefMut,
    sync::mpsc::{channel, Receiver, Sender, TryRecvError},
    thread,
    time::Duration,
};

use rmp_serde::{decode::ReadReader, Deserializer};
use serde::Deserialize;

use crate::models::{
    frame::Frame,
    server::{execute_action, ComServerLegacy, ServerCom, ServerStateError},
    widget_registry::{
        action_identity, extract_identity, Action, ClickButton, TypeFn, Widget, WidgetAction,
        WidgetRegistry,
    },
};

use super::ServerProtocol;
use pyo3::{prelude::*, types::*};

// #[derive(Debug, PartialEq)]

#[pyclass]
pub struct ComSocketServer {
    pub address: String,
    stream: Option<TcpStream>,
    pub actions: WidgetAction,
    trigger: Option<Sender<bool>>,
}

// TODO: pass ComSocketServer in argument
/* pub fn exectime(py: Python, wraps: PyObject) -> PyResult<&PyCFunction> {
    PyCFunction::new_closure(
        py,
        None,
        None,
        move |args: &PyTuple, kwargs: Option<&PyDict>| -> PyResult<PyObject> {
            Python::with_gil(|py| {
                let now = Instant::now();
                let ret = wraps.call(py, args, kwargs);
                println!("elapsed (ms): {}", now.elapsed().as_millis());
                ret
            })
        },
    )
} */
/* #[pyfunction]
pub fn average_exectime<'a>(
    py: Python<'a>,
    server: &mut ComSocketServer,
) -> PyResult<&'a PyCFunction> {
    let f = move |args: &PyTuple, _kwargs: Option<&PyDict>| -> PyResult<Py<PyCFunction>> {
        Python::with_gil(|py| {
            let wraps: PyObject = args.get_item(0)?.into();
            let g = move |args: &PyTuple, kwargs: Option<&PyDict>| {
                Python::with_gil(|py| {
                    let f = |s: WidgetRegistry| {
                        wraps.call(py, PyTuple::new(py, [s.get_value(py)]), kwargs)
                    };
                    let name = wraps.getattr(py, "__name__").unwrap();
                    let (id, name) = extract_identity(name.to_string());
                    server.register_action(id, name.as_str(), Action { value: f });
                })
            };
            match PyCFunction::new_closure(py, None, None, g) {
                Ok(r) => Ok(r.into()),
                Err(e) => Err(e),
            }
        })
    };
    PyCFunction::new_closure(py, None, None, f)
} */

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

    /* pub fn exectime(&mut self, py: Python, wraps: PyObject) -> PyResult<&PyCFunction> {
        PyCFunction::new_closure(
            py,
            None,
            None,
            move |args: &PyTuple, kwargs: Option<&PyDict>| -> PyResult<PyObject> {
                Python::with_gil(|py| {
                    let ret = wraps.call(py, args, kwargs);
                    ret
                })
            },
        )
    } */
    fn on(&mut self, id: u8, widget: &str, action: Py<PyAny>) -> Result<(), ServerStateError> {
        // PyFn argument isntead of PyAny ?
        ServerCom::register_action(self, id, widget, Action::PythonFn(action))
    }
    /* fn register_action(
        &mut self,
        id: u8,
        widget: &str,
        action: Action,
    ) -> Result<(), ServerStateError> {
        ServerCom::register_action(self, id, widget, action)
    } */

    pub fn open(&mut self) -> Result<(), ServerStateError> {
        ServerCom::open(self)
    }

    pub fn serve(&mut self) -> Result<ComServerLegacy> {
        ServerCom::serve(self)
    }

    pub fn close(&mut self) -> Result<(), ServerStateError> {
        ServerCom::close(self)
    }
}

impl ComSocketServer {
    fn _listen(stream: &mut Option<&TcpStream>) -> Result<Option<Frame>, ServerStateError> {
        match stream {
            Some(stream) => {
                // let mut buf: Vec<u8> = Vec::new();
                let mut buffer = [0; 1024];
                let data: Option<&[u8]> = match stream.read(&mut buffer) {
                    Ok(size) => {
                        println!("Received size : {}", size);
                        match size {
                            0 => None,
                            _ => Some(&buffer[..size]),
                        }
                        // Some(&buffer[..size])
                    }
                    Err(e) => panic!("Failed to read frame : {}", e),
                };
                match data {
                    Some(d) => {
                        let mut de: Deserializer<ReadReader<&[u8]>> = Deserializer::new(d);
                        match Frame::deserialize(&mut de) {
                            Ok(f) => {
                                // println!("HELLO : {}", f.id);
                                Ok(Some(f))
                            }
                            Err(e) => {
                                // panic!("{}", e);
                                Err(e.into())
                                // eprintln!("Deserialization error : {}", e);
                                // panic!("Argh !")
                            }
                        }
                    }
                    None => Ok(None),
                }
                // let frame = Deserialize::deserialize(&mut de).unwrap(); // TODO: catch serde error
                // Ok(frame)
            }
            None => Err(ServerStateError),
        }
    }

    pub fn _open(
        address: String,
        actions: WidgetAction,
    ) -> Result<ServerProtocol<ComSocketServer>, ServerStateError> {
        let listener = match TcpListener::bind(address.as_str()) {
            Ok(listener) => listener,
            Err(err) => panic!("Unable to intanstiate TCP Listener. {:?}", err),
        };
        let stream = match listener.accept() {
            Ok(res) => res.0,
            Err(e) => panic!("Unable to get new TCP connection. {:?}", e),
        };
        // drop(listener);
        Ok(ServerProtocol::Socket(ComSocketServer {
            address: address,
            stream: Some(stream),
            actions: actions,
            trigger: None,
        }))
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
    fn register_action(
        &mut self,
        id: u8,
        widget: &str,
        action: Action,
    ) -> Result<(), ServerStateError> {
        // TODO: simplify ? always returning OK
        self.actions.insert(action_identity(id, widget), action);

        Ok(())
    }

    fn callback(&mut self, data: Frame) -> Result<(), ServerStateError> {
        // TODO: return Result
        let stream = &mut *self.stream.borrow_mut();
        match stream {
            Some(s) => {
                s.write_all(&data.bufferize());
                Ok(())
            } // TODD,
            None => Err(ServerStateError),
        }
    }

    fn listen(&mut self) -> Result<Option<Frame>, ServerStateError> {
        // TODO: return Result
        println!("listening");
        let stream = &mut self.stream.as_ref();
        ComSocketServer::_listen(stream)
    }

    fn serve(&mut self) -> Result<ComServerLegacy> {
        // let stream = &mut *self.stream.borrow_mut();
        let tmp_stream: Result<(), ServerStateError> = match &mut self.stream.borrow_mut() {
            Some(stream) => Ok({}),
            None => Err(ServerStateError),
        };

        tmp_stream?;
        // let tmp_stream = self.stream.unwrap();
        let mut new_stream = self.stream.as_ref().unwrap().try_clone()?;

        let addr: String = self.address.clone(); // TODO: to much clone
        let actions = self.actions.clone();
        let (tx, rx): (Sender<bool>, Receiver<bool>) = channel();
        // let address = address.clone();
        // let mut acts: WidgetAction = HashMap::new();
        // acts.clone_from(&tuple.as_ref().unwrap().1);
        self.trigger = Some(tx.clone());
        drop(self);

        thread::spawn({
            move || loop {
                thread::sleep(Duration::from_millis(500));
                // catch errors, stop loop
                match rx.try_recv() {
                    // TODO: auto closing :/
                    Ok(_) => {
                        println!("Terminating.");
                        // self.close();
                        new_stream.shutdown(std::net::Shutdown::Both);
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
        // .join(); // TODO: remove `join`
        /* Ok(ServerProtocol::Socket(ComSocketServer {
            stream: None,
            trigger: Some(tx),
            address: addr.to_string(),
            actions,
        })) */
        Ok(ComServerLegacy::new(tx.clone()))
    }

    fn close(&mut self) -> Result<(), ServerStateError> {
        let trigger = &mut *self.trigger.borrow_mut();
        match trigger {
            Some(trigger) => {
                println!("trigger found");
                trigger.send(true);
                self.stream = None;
            }
            None => {
                panic!("No trigger")
            }
        };
        let stream = &mut *self.stream.borrow_mut();
        match stream {
            Some(stream) => {
                stream.shutdown(std::net::Shutdown::Both);
                /* Ok(ServerProtocol::Socket(ComSocketServer {
                    address: self.address,
                    stream: None,
                    actions: self.actions,
                    trigger: None,
                })) */
                self.stream = None;
                Ok(())
            }
            None => Err(ServerStateError),
        }
    }
}
