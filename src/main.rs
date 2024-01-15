use std::{collections::HashMap, thread, time::Duration};

use codde_pi_protocol::{
    models::{
        frame::Frame,
        // server::{ServerClosed, ServerCom},
        widget_registry::{ToggleButton, Widget, WidgetAction},
    },
    protocols::{
        client::com_socket::{ComSocketClient, ComSocketDisconnected},
        server::com_socket::{ComSocketClosed, ComSocketServer},
    },
};
use serde::{Deserialize, Serialize};

fn action_test(data: &Box<dyn Widget>) {
    println!(
        "Value = {}",
        match data.as_any().downcast_ref::<ToggleButton>() {
            Some(r) => r.value,
            None => false,
        }
    );
}

fn main() {
    println!("Hello, world!");
    let f = Frame {
        id: 1,
        data: Box::new(ToggleButton { value: true }),
    };
    /* let action = WidgetAction {
        id: 1,
        widget: "ToggleButton",
        action: Box::new(action_test),
    }; */
    let mut action: WidgetAction = HashMap::new();
    action.insert(String::from("ToggleButton_1"), Box::new(action_test));
    // serialize(f);
    end_to_end(f, action);
    // rmp_serde(f);
}

fn end_to_end(f: Frame, action: WidgetAction) {
    let closed: ComSocketClosed = ComSocketServer::new("localhost:12345");

    let mut open = closed.open();
    open.on(1, "ToggleButton", Box::new(action_test));
    open.serve();
}

fn serialize(f: Frame) {
    let mut s = flexbuffers::FlexbufferSerializer::new();
    f.serialize(&mut s).unwrap();
    /* self.stream.write_all(s.view());
    self.stream.read_to_end(&mut buf); */
    let mut buf: Vec<u8> = Vec::new();
    // flexbuffers::from_buffer(buf);
    flexbuffers::Reader::get_root(s.view()).unwrap();

    let r = flexbuffers::Reader::get_root(s.view()).unwrap();
    let frame = match Frame::deserialize(r) {
        Ok(fr) => fr,
        Err(e) => panic!("Deserialization error : {}", e),
    };
    assert_eq!(f.id, frame.id);
    println!(
        "values : {}",
        frame
            .data
            .as_any()
            .downcast_ref::<ToggleButton>()
            .unwrap()
            .value
    )
}

fn rmp_serde(f: Frame) {
    let mut buf = Vec::new();
    f.serialize(&mut rmp_serde::encode::Serializer::new(&mut buf))
        .unwrap();
    let inbuf = buf.as_slice();
    let mut deserializer = rmp_serde::decode::Deserializer::new(inbuf);
    let frame = Frame::deserialize(&mut deserializer).unwrap();
    assert_eq!(f.id, frame.id);
    println!(
        "values : {}",
        frame
            .data
            .as_any()
            .downcast_ref::<ToggleButton>()
            .unwrap()
            .value
    )
}

// fn main() {}
