// TODO: refact based on [ServerCom]
use std::{
    collections::HashMap,
    io::{Read, Write},
    net::{TcpListener, TcpStream},
    sync::mpsc::{channel, Receiver, Sender, TryRecvError},
    thread,
    time::Duration,
};

use rmp_serde::Deserializer;
use serde::Deserialize;

use crate::models::{
    frame::Frame,
    server::{ServerCom, ServerStateError},
    widget_registry::{action_identity, Action, WidgetAction},
};

use super::ServerProtocol;

// #[derive(Debug, PartialEq)]

pub struct ComSocketServer {
    pub address: String,
    stream: Option<TcpStream>,
    pub actions: WidgetAction,
    trigger: Option<Sender<()>>,
}

impl ComSocketServer {
    pub fn new(address: &str) -> ComSocketServer {
        ComSocketServer {
            address: String::from(address),
            stream: None,
            actions: HashMap::new(),
            trigger: None,
        }
    }
}

impl ServerCom for ComSocketServer {
    fn open(mut self) -> Result<ServerProtocol, ServerStateError> {
        let listener = match TcpListener::bind(self.address.as_str()) {
            Ok(listener) => listener,
            Err(err) => panic!("Unable to intanstiate TCP Listener. {:?}", err),
        };
        let stream = match listener.accept() {
            Ok(res) => res.0,
            Err(e) => panic!("Unable to get new TCP connection. {:?}", e),
        };
        // drop(listener);
        Ok(ServerProtocol::Socket(ComSocketServer {
            address: self.address,
            stream: Some(stream),
            actions: self.actions,
            trigger: None,
        }))
    }

    fn on(&mut self, id: u8, widget: &str, action: Action) -> Result<(), ServerStateError> {
        // TODO: simplify ? always returning OK
        self.actions.insert(action_identity(id, widget), action);
        Ok(())
    }

    fn callback(&mut self, data: Frame) -> Result<(), ServerStateError> {
        // TODO: return Result
        match self.stream {
            Some(mut stream) => {
                stream.write_all(&data.bufferize());
                Ok(())
            } // TODD,
            None => Err(ServerStateError),
        }
    }

    fn listen(&mut self) -> Result<Frame, ServerStateError> {
        // TODO: return Result
        println!("listening");
        match self.stream {
            Some(stream) => {
                // let mut buf: Vec<u8> = Vec::new();
                let mut buffer = [0; 1024];
                let data = match stream.read(&mut buffer) {
                    Ok(size) => {
                        println!("Received size : {}", size);
                        &buffer[..size]
                    }
                    Err(e) => panic!("Failed to read frame : {}", e),
                };
                let mut de = Deserializer::new(data);
                match Deserialize::deserialize(&mut de) {
                    Ok(f) => {
                        // println!("HELLO : {}", f.id);
                        f
                    }
                    Err(e) => {
                        Err(ServerStateError)
                        // eprintln!("Deserialization error : {}", e);
                        // panic!("Argh !")
                    }
                }
            }
            None => Err(ServerStateError),
        }
    }

    fn serve(self) -> Result<ServerProtocol, ServerStateError> {
        match self.stream {
            Some(stream) => {
                let addr: String = self.address.clone(); // TODO: to much clone
                let actions = self.actions.clone();
                let (tx, rx): (Sender<()>, Receiver<()>) = channel();
                // let address = address.clone();
                // let mut acts: WidgetAction = HashMap::new();
                // acts.clone_from(&tuple.as_ref().unwrap().1);

                thread::spawn(move || loop {
                    let frame: Frame = ComSocketServer::listen(&mut self).unwrap(); // TODO: more
                                                                                    // security
                    let acts = self.actions;
                    println!("Found frame ! {}", frame.id);
                    if acts.contains_key(&frame.data.name()) {
                        (acts.get(&frame.data.name()).unwrap().value)(frame.data);
                    }

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
                })
                .join(); // TODO: remove `join`
                Ok(ServerProtocol::Socket(ComSocketServer {
                    stream: None,
                    trigger: Some(tx),
                    address: addr.to_string(),
                    actions,
                }))
            }
            None => Err(ServerStateError),
        }
    }

    fn close(self) -> Result<ServerProtocol, ServerStateError> {
        match self.stream {
            Some(stream) => {
                stream.shutdown(std::net::Shutdown::Both);
                Ok(ServerProtocol::Socket(ComSocketServer {
                    address: self.address,
                    stream: None,
                    actions: self.actions,
                    trigger: None,
                }))
            }
            None => Err(ServerStateError),
        }
    }
}
