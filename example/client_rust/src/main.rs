use codde_pi_protocol::{
    models::{
        client::ClientCom,
        frame::Frame,
        widget_registry::{ToggleButton, Widget, WidgetAction, WidgetRegistry},
    },
    protocols::client::com_socket::ComSocketClient,
};
use std::{thread, time::Duration};
fn main() {
    let f = Frame {
        id: 1,
        data: WidgetRegistry::ToggleButton { value: true },
    };
    let mut client: ComSocketClient = ComSocketClient::new("localhost:12345");
    client.connect();
    println!("connected");
    thread::sleep(Duration::from_millis(500));
    // open.listen();
    println!("sending data");
    client.send(f);
    client.disconnect();
    // client.close();
}
