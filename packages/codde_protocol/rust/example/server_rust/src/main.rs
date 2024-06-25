use std::{thread, time::Duration};

use codde_protocol::api::{
    models::widget_registry::{Action, ResultRegistry},
    protocols::server::{codde_pi_server::CoddePiServer, com_socket::ComSocketServer},
};
use codde_protocol::api::{
    models::{
        client::ClientCom,
        frame::{Frame, ResultFrame},
        server::ServerCom,
        widget_registry::{
            ConfirmResult, ServerStatus, ToggleButton, Widget, WidgetAction, WidgetRegistry,
        },
    },
    protocols::client::com_socket::ComSocketClient,
};
use pyo3::{IntoPy, Python};
fn main() {
    let mut server: ComSocketServer = CoddePiServer::use_socket("localhost:12345");
    server.open();
    /* server.register_action(1, "ToggleButton", Action::RustFn(|data| {
    server.callback(id: 1, status: ServerStatus::Idle, data: ConfirmResult(status false).into_py(),)})); */
    server.register_action(1, "PressButton", Action::RustFn(press_button_1));

    thread::sleep(Duration::new(2, 0));
    Python::with_gil(|py| {
        server.callback(
            1,
            ServerStatus::Idle,
            ConfirmResult { status: true }.into_py(py),
        );
    });
    // _.close();
    server.serve();
    thread::sleep(Duration::new(2, 0));
    server.close();
}

fn press_button_1(data: WidgetRegistry) -> Result<()> {
    Ok(())
}
