use codde_pi_protocol::{
    models::{
        frame::Frame,
        widget_action::WidgetAction,
        // server::{ServerClosed, ServerCom},
        widget_registry::{ToggleButton, Widget},
    },
    protocols::{
        client::com_socket::{ComSocketClient, ComSocketDisconnected},
        server::com_socket::{ComSocketClosed, ComSocketServer},
    },
};
use codde_protocol::api::models::{
    frame::ResultFrame,
    widget_registry::{ServerStatus, WidgetRegistry},
};

fn action_test(data: WidgetRegistry) -> Result<()> {
    println!("hello func !");
    /* let widget = match data {
        WidgetRegistry::ToggleButton { value } => value,
        _ => panic!("Data error"),
    };
    println!("Value = {}", widget); */
    Ok(())
}

/* fn serialize(f: Frame) {
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
} */

/* fn rmp_serde(f: Frame) {
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
} */
// #[test]
fn test_end_to_end(f: WidgetRegistry) {
    let mut server: ComSocketServer = CoddePiServer::use_socket("localhost:12345");
    server.open();
    server.register_action(1, f.to_string().as_str(), Action::RustFn(|data| {
        server.callback(
                id: 1,
                status: ServerStatus::Idle,
                data: ConfirmResult {
                    status: true,
                }.into_py(),
            );
}));
    /* server.callback(ResultFrame {
        id: 1,
        status: ServerStatus::Idle,
        data: ResultRegistry::ConfirmResult { status: true },
    }); */
    // _.close();
    server.serve();
    thread::sleep(Duration::new(2, 0));
    server.close();
}

fn main() {
    test_end_to_end(WidgetRegistry::ToggleButton { value: false })
}
