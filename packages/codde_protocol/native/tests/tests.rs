use anyhow::Result;
use codde_protocol::api::{
    models::server::ServerCom, protocols::server::com_socket::ComSocketServer,
};
use codde_protocol::api::{
    models::widget_registry::{Action, WidgetRegistry},
    protocols::server::codde_pi_server::CoddePiServer,
};

fn action_test(data: WidgetRegistry) -> Result<()> {
    /* server.callback_result(ResultFrame {
        id: 1,
        status: ServerStatus::Idle,
        data: ResultRegistry::ConfirmResult { status: true },
    }); */
    Ok(())
}

#[test]
fn test_serde() {}

#[test]
fn test_registry_parsing() {}

#[test]
fn test_registry_binding() {}

// TODO: threaded server, expect data send / receive is OK
fn test_com_socket() {}

// #[test]
fn test_end_to_end(f: WidgetRegistry) {
    let mut server: ComSocketServer = CoddePiServer::use_socket("localhost:12345");
    server.open();
    server.register_action(1, f.to_string().as_str(), Action::RustFn(action_test));
    server.serve();
    server.close();
}

fn main() {
    test_end_to_end(WidgetRegistry::ToggleButton { value: false })
}
