use codde_protocol::api::{
    models::{
        client::ClientCom,
        frame::{Frame, ResultFrame},
        widget_registry::{ToggleButton, Widget, WidgetAction, WidgetRegistry},
    },
    protocols::client::com_socket::ComSocketClient,
};
use std::{any, thread, time::Duration};
fn main() {
    let f = Frame {
        id: 1,
        data: WidgetRegistry::ToggleButton { value: true },
    };
    let mut client: ComSocketClient = ComSocketClient::new(String::from("localhost:12345"));
    client.connect();
    println!("connected");
    thread::sleep(Duration::from_millis(500));
    println!("sending data");
    client.send(f);
    thread::sleep(Duration::new(1, 0));
    let res = client.receive();
    match res {
        Ok(r) => println!("client receiving : {}", r.unwrap()),
        Err(e) => eprintln!("client ERROR : {}", e),
    };
    client.disconnect();
    // client.close();
}

fn test() {
    let mut client: ComSocketClient =
        CoddePiClient::new(Protocol::Socket, "127.0.0.1:8080".to_string()).into();
    client.trying(); // is_connected();
                     //
    let mut client2: ComSocketClient = CoddePiClient::use_socket("127.0.0.1:8080".to_string());
    client2.trying();
}
