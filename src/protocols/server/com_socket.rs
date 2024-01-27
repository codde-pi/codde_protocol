// TODO: refact based on [ServerCom]
use std::{
    borrow::BorrowMut,
    collections::HashMap,
    io::{Read, Write},
    net::{TcpListener, TcpStream},
    sync::mpsc::{channel, Receiver, Sender, TryRecvError},
    thread,
    time::Duration,
};

use rmp_serde::{decode::ReadReader, Deserializer};
use serde::Deserialize;

use crate::models::{
    frame::Frame,
    server::{ComServerLegacy, ServerCom, ServerStateError},
    widget_registry::{action_identity, Action, ClickButton, WidgetAction, WidgetRegistry},
};

use super::ServerProtocol;
use pyo3::prelude::*;

// #[derive(Debug, PartialEq)]

#[pyclass]
pub struct ComSocketServer {
    pub address: String,
    stream: Option<TcpStream>,
    pub actions: WidgetAction,
    trigger: Option<Sender<bool>>,
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

    pub fn on(&mut self, id: u8, widget: &str, action: Action) -> Result<(), ServerStateError> {
        ServerCom::on(self, id, widget, action)
    }

    pub fn open(&mut self) -> Result<(), ServerStateError> {
        ServerCom::open(self)
    }

    pub fn serve<'a>(&'a mut self) -> Result<ComServerLegacy, ServerStateError> {
        ServerCom::serve(self)
    }
}

impl ComSocketServer {
    fn _listen(stream: &mut Option<TcpStream>) -> Result<Option<Frame>, ServerStateError> {
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
    fn on(&mut self, id: u8, widget: &str, action: Action) -> Result<(), ServerStateError> {
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
        let stream = &mut *self.stream.borrow_mut();
        ComSocketServer::_listen(stream)
    }

    fn serve<'a>(&'a mut self) -> Result<ComServerLegacy, ServerStateError> {
        // let stream = &mut *self.stream.borrow_mut();
        match self.stream {
            Some(_) => {
                let addr: String = self.address.clone(); // TODO: to much clone
                let actions = self.actions.clone();
                let (tx, rx): (Sender<bool>, Receiver<bool>) = channel();
                // let address = address.clone();
                // let mut acts: WidgetAction = HashMap::new();
                // acts.clone_from(&tuple.as_ref().unwrap().1);
                // self.trigger = Some(tx.clone());

                thread::spawn({
                    move || loop {
                        thread::sleep(Duration::from_millis(500));
                        // catch errors, stop loop
                        match rx.try_recv() {
                            // TODO: auto closing :/
                            Ok(_) => {
                                println!("Terminating.");
                                self.close();
                                break;
                            }
                            Err(TryRecvError::Disconnected) => println!("Link broken"),
                            Err(TryRecvError::Empty) => {}
                        }
                        match ComSocketServer::_listen(&mut self.stream) {
                            Ok(data) => match data {
                                Some(frame) => {
                                    // security
                                    let acts = &self.actions;
                                    println!("Found frame ! {}", frame.id);
                                    if acts.contains_key(
                                        action_identity(frame.id, frame.data.name()).as_str(),
                                    ) {
                                        match acts.get(
                                            action_identity(frame.id, frame.data.name()).as_str(),
                                        ) {
                                            Some(a) => {
                                                println!("running action");
                                                (a.value)(frame.data);
                                            }
                                            None => panic!("Action not found !"),
                                        }
                                    } else {
                                        println!("No key {} found", frame.data.name())
                                    }
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
            None => Err(ServerStateError),
        }
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
