// TODO: refact based on [ServerCom]
use std::{
    collections::HashMap,
    error::Error,
    io::{Read, Write},
    net::{TcpListener, TcpStream},
    sync::mpsc::{channel, Receiver, Sender, TryRecvError},
    thread,
    time::Duration,
};

use rmp_serde::{Deserializer, Serializer};
use serde::Deserialize;

use crate::models::{
    frame::Frame,
    server::{ServerClosed, ServerOpen, ServerStateError},
    // widget_action::WidgetAction,
    widget_registry::{
        action_identity, Action, ToggleButton, Widget, WidgetAction, WidgetRegistry,
    },
};

use super::ServerProtocol;

// #[derive(Debug, PartialEq)]
pub enum ComSocketServer {
    ComSocketClosed {
        address: String,
    },
    ComSocketOpen {
        address: String,
        stream: TcpStream,
        actions: WidgetAction, // TODO: make private
    },

    ComSocketRunning {
        // stream: ComSocketOpen,
        address: String,
        sender: Sender<()>,
    },
}

impl ComSocketServer {
    pub fn new(address: &str) -> ComSocketServer {
        ComSocketServer::ComSocketClosed {
            address: String::from(address),
        }
    }
}

impl ServerClosed for ComSocketServer {
    fn open(self) -> Result<ServerProtocol, ServerStateError> {
        match self {
            ComSocketServer::ComSocketClosed { address } => {
                let listener = match TcpListener::bind(address.as_str()) {
                    Ok(listener) => listener,
                    Err(err) => panic!("Unable to intanstiate TCP Listener. {:?}", err),
                };
                let stream = match listener.accept() {
                    Ok(res) => res.0,
                    Err(e) => panic!("Unable to get new TCP connection. {:?}", e),
                };
                // drop(listener);
                Ok(ServerProtocol::Socket(ComSocketServer::ComSocketOpen {
                    address,
                    stream,
                    actions: HashMap::new(),
                }))
            }
            _ => Err(ServerStateError),
        }
    }
}

impl ServerOpen for ComSocketServer {
    fn callback(&mut self, data: Frame) {
        todo!()
    }

    fn listen(&mut self) -> Frame {
        todo!()
    }

    fn serve(mut self) -> Result<ServerProtocol, ServerStateError> {
        let tuple: Result<(String, WidgetAction), ServerStateError> = match self {
            ComSocketServer::ComSocketOpen {
                ref address,
                stream: _,
                ref actions,
            } => Ok((address.clone(), actions.clone())),
            _ => Err(ServerStateError),
        };
        let addr: String = tuple.as_ref().unwrap().0.clone(); // TODO: to much clone
        let (tx, rx): (Sender<()>, Receiver<()>) = channel();
        // let address = address.clone();
        // let mut acts: WidgetAction = HashMap::new();
        // acts.clone_from(&tuple.as_ref().unwrap().1);

        thread::spawn(move || loop {
            let frame: Frame = ComSocketServer::listen(&mut self);
            let acts = &tuple.as_ref().unwrap().1;
            println!("Found frame ! {}", frame.id);
            /* for action in &self.actions {
                if frame.data.try_match(action.widget) {
                    (action.action)(&frame.data);
                }
            } */
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
        Ok(ServerProtocol::Socket(ComSocketServer::ComSocketRunning {
            // stream: self,
            sender: tx,
            address: addr.to_string(),
        }))
    }

    fn close(self) -> Result<ServerProtocol, ServerStateError> {
        match self {
            ComSocketServer::ComSocketRunning { sender: _, address } => {
                self.stream.shutdown(std::net::Shutdown::Both);
                match self {
                    ComSocketServer::ComSocketOpen {
                        address: _,
                        actions,
                        stream: _,
                    } => Ok(ServerProtocol::Socket(ComSocketServer::ComSocketClosed {
                        address,
                    })),
                    _ => Err(ServerStateError),
                }
            }
            _ => Err(ServerStateError),
        }
    }

    fn on(&mut self, id: u8, widget: &str, action: Action) -> Result<(), ServerStateError> {
        match self {
            ComSocketServer::ComSocketOpen {
                address: _,
                actions,
                stream: _,
            } => {
                actions.insert(action_identity(id, widget), action);
                Ok(())
            }
            _ => Err(ServerStateError),
        }
    }
}

/* impl ServerCom for ComSocket {
    pub fn open(self) -> ComSocket {
        let listener = match TcpListener::bind(self.address.as_str()) {
            Ok(listener) => listener,
            Err(err) => panic!("Unable to intanstiate TCP Listener. {:?}", err),
        };
        let stream = match listener.accept() {
            Ok(res) => res.0,
            Err(e) => panic!("Unable to get new TCP connection. {:?}", e),
        };
        // drop(listener);
        ComSocketOpen {
            address: self.address,
            stream,
            actions: HashMap::new(),
        }
    }
} */

/* impl ComSocketOpen {
    pub fn close(self) -> ComSocketClosed {
        self.stream.shutdown(std::net::Shutdown::Both);
        ComSocketClosed {
            address: self.address,
        }
    }

    pub fn on(&mut self, id: u8, widget: &str, action: Box<dyn Fn(&Box<dyn Widget>) + Send>) {
        self.actions.insert(action_identity(id, widget), action);
    }

    pub fn callback(&mut self, data: Frame) {
        self.stream.write_all(&data.bufferize()); // TODO
    }

    pub fn serve(mut self) -> ComSocketRunning {
        let (tx, rx): (Sender<()>, Receiver<()>) = channel();
        let address = self.address.clone();

        thread::spawn(move || loop {
            let frame: Frame = self.listen();
            println!("Found frame ! {}", frame.id);
            /* for action in &self.actions {
                if frame.data.try_match(action.widget) {
                    (action.action)(&frame.data);
                }
            } */
            if self.actions.contains_key(frame.data.typetag_name()) {
                (&self.actions.get(frame.data.typetag_name()).unwrap())(&frame.data)
            }

            thread::sleep(Duration::from_millis(500));
            // catch errors, stop loop
            match rx.try_recv() {
                // TODO: auto closing :/
                Ok(_) | Err(TryRecvError::Disconnected) => {
                    println!("Terminating.");
                    self.close();
                    break;
                }
                Err(TryRecvError::Empty) => {}
            }
        })
        .join(); // TODO: remove `join`
        ComSocketRunning {
            // stream: self,
            sender: tx,
            address,
        }
    }

    pub fn listen(&mut self) -> Frame {
        println!("listening");
        // let mut buf: Vec<u8> = Vec::new();
        let mut buffer = [0; 1024];
        let data = match self.stream.read(&mut buffer) {
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
                eprintln!("Deserialization error : {}", e);
                panic!("Argh !")
            }
        }
    }
}

impl ComSocketRunning {
    /* pub fn new(self) -> Box<dyn ServerRunning> {
        Box::new(ComSocketRunning {
            stream: self.stream,
            sender: self.sender,
        })
    } */

    /* pub fn stop(self) -> Box<dyn ServerOpen> {
        self.sender.send(());
        Box::new(self.stream)
    } */

    pub fn close(self) -> ComSocketClosed {
        /* {
            self.sender.send(());
            Box::new(self.stream)
        }
        .close() */
        self.sender.send(());
        ComSocketClosed {
            address: self.address,
        }
    }
} */
