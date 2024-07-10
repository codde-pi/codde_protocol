use anyhow::Result;
use codde_protocol::{
    base::{
        frame::{Frame, ResultFrame},
        widget_registry::{ResultRegistry, ServerStatus, WidgetRegistry},
    },
    server::{
        codde_pi_server::CoddePiServer,
        com_socket::ComSocketServer,
        models::widget_registry::{Action, ConfirmResult},
        server_com::ServerCom,
    },
};
use pyo3::prelude::*;

fn action_test(data: WidgetRegistry) -> Result<()> {
    /* server.callback_result(ResultFrame {
        id: 1,
        status: ServerStatus::Idle,
        data: ResultRegistry::ConfirmResult { status: true },
    }); */
    Ok(())
}

#[test]
fn test_serde() {
    let button = WidgetRegistry::ClickButton {};
    let frame = Frame {
        id: 1,
        data: button.clone(),
    };
    let buffer: Vec<u8> = frame.bufferize();
    assert_eq!(frame, Frame::parse(&buffer).unwrap().unwrap());
    assert_eq!(button, Frame::parse(&buffer).unwrap().unwrap().data);
}

#[test]
fn test_registry_parsing() {
    // NAME
    let button = WidgetRegistry::ToggleButton { value: true };
    assert_eq!(button.name(), "ToggleButton");
    let frame = Frame {
        id: 1,
        data: button.clone(),
    };
    // IDENTITY
    assert_eq!(frame.identity(), "1_ToggleButton");
}

#[test]
fn test_registry_binding() {
    pyo3::prepare_freethreaded_python();
    let button = WidgetRegistry::ConfirmButton {};
    Python::with_gil(|py| {
        /* let m = PyModule::new(py, "codde_protocol").unwrap();
        m.add_class::<ConfirmButton>().unwrap();
        // Import and get sys.modules
        let sys = PyModule::import(py, "sys").unwrap();
        let py_modules: &PyDict = sys.getattr("modules").unwrap().downcast().unwrap();

        // Insert foo into sys.modules
        py_modules.set_item("codde_protocol", m).unwrap();
        // TODO: `PyModule::from_code` doesn't take care about previous imports. use `Python::run...`
        let any_python_button: Py<PyAny> = PyModule::from_code(
            py,
            "import codde_protocol; button = ConfirmButton()",
            "",
            "",
        )
        .unwrap()
        .getattr("button")
        .unwrap()
        .into();
        // TODO: create Python client
        // let python_button: WidgetRegistry = any_python_button.extract(py).unwrap();

        let builtins = PyModule::import(py, "builtins").unwrap();
        builtins
            .getattr("assert")
            .unwrap()
            .call1((button.into_py(py), any_python_button)); */

        let confirm_res = ConfirmResult { status: true }.into_py(py);
        let res_frame = ResultFrame::new(1, ServerStatus::Busy, confirm_res);
        assert_eq!(
            res_frame.data,
            ResultRegistry::ConfirmResult { status: true }
        );
    });
}

#[test]
fn test_action() {}

// TODO: threaded server, expect data send / receive is OK
#[test]
fn test_com_socket() {}

#[test]
fn test_decorator() {
    pyo3::prepare_freethreaded_python();
    Python::with_gil(|py| {
        // Import and get sys.module// Create new module
        let m = PyModule::new(py, "codde_protocol").unwrap();
        m.add_class::<ComSocketServer>().unwrap();
        m.add_class::<CoddePiServer>().unwrap();
        m.add_class::<WidgetRegistry>().unwrap();
        m.add_function(wrap_pyfunction!(codde_protocol::server::com_socket::on, m).unwrap())
            .unwrap();
        let sys = PyModule::import(py, "sys").unwrap();
        let py_modules: &pyo3::types::PyDict = sys.getattr("modules").unwrap().downcast().unwrap();

        // Insert codde_protocol into sys.modules
        py_modules.set_item("codde_protocol", m).unwrap();

        // Run test
        let test_decorator = include_str!(concat!(
            env!("CARGO_MANIFEST_DIR"),
            "/tests/test_decorator.py"
        ));
        let deco = PyModule::from_code(py, test_decorator, "", "").unwrap();
        // let py_modules: &pyo3::types::PyDict = deco.getattr("modules").unwrap().downcast().unwrap();
        // py_modules.set_item("codde_protocol", m).unwrap();
        let app: Py<PyAny> = deco.getattr("main").unwrap().into();
        assert_eq!(app.call0(py).unwrap().extract::<bool>(py).unwrap(), true)
    })
}

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
