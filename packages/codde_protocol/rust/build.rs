use anyhow::Result;
use lib_flutter_rust_bridge_codegen::codegen::{generate, Config, MetaConfig};
use std::io;
use std::{
    fs::{self, File},
    io::{Read, Write},
    path::Path,
};

use lib_flutter_rust_bridge_codegen::codegen;
use lib_flutter_rust_bridge_codegen::utils::logs::configure_opinionated_logging;

fn main() -> anyhow::Result<()> {
    // Uncomment the line below, if you only want to generate bindings on api directory change.
    //
    // NOTE: This accelerates the build process, but you will need to manually trigger binding
    // generation whenever there are changes to definitions outside of the api directory that it
    // depends on.
    //
    println!("cargo:rerun-if-changed=src/client");

    // If you want to see logs
    // Alternatively, use `cargo build -vvv` (instead of `cargo build`) to see logs on screen
    configure_opinionated_logging("./logs/", true)?;

    // Execute code generator with auto-detected config
    codegen::generate(
        Config::from_config_file("../flutter_rust_bridge.yaml")?.unwrap(),
        Default::default(),
    );
    patch_generated_files()
}

fn patch_generated_files() -> anyhow::Result<()> {
    let native_path = "src";
    let input_files = vec![
        format!("{}/frb_generated.rs", native_path),
        format!("{}/frb_generated.io.rs", native_path),
        format!("{}/frb_generated.web.rs", native_path),
    ];

    println!("RUNNING PATCH");
    input_files.into_iter().for_each(|filename| {
        let mut file = File::open(&filename).unwrap();
        let mut contents = String::new();
        file.read_to_string(&mut contents).unwrap();
        /* if contents.contains("// Patched by `codde_protocol`") {
            return;
        } */
        if contents.contains("// Section: imports") {
            // contents.insert_str(i, "use pyo3::prelude::*; ")
        };

        let mut arr: Vec<String> = contents.split('\n').map(|x| x.to_string()).collect();
        // arr.insert(0, String::from("// Patched by `codde_protocol`"));
        let mut must_be_static = false;
        for (index, line) in arr.clone().iter().enumerate() {
            if line.contains("// Section: boilerplate") {
                arr[index].insert_str(line.len() - 1, "#[allow(clippy::not_unsafe_ptr_arg_deref)]");
            }
            if line.contains("// Section: related_funcs") {
                must_be_static = true;
                continue;
            }

            if must_be_static {
                if line.contains("// Section:") {
                    must_be_static = false;
                    continue;
                }
                arr[index] = line.replace("<[u8]>", "<&'static [u8]>");
                arr[index] = arr[index].replace("<str>", "<&'static str>");
            } else {
                arr[index] = line.replace("<[u8]", "<&[u8]");
                arr[index] = arr[index].replace("<str>", "<&str>");
            }
        }
        contents = arr.join("\n");
        contents = contents.replace("Button =>", "Button {} =>");
        contents = contents.replace("Button;", "Button {}");
        contents = contents.replace("ClientProtocol,", "ClientProtocol<T>,");
        contents = contents.replace("ClientProtocol>", "ClientProtocol<T>>");
        contents = contents.replace("ClientProtocol(", "ClientProtocol<T>(");
        contents = contents.replace("ClientProtocol\n", "ClientProtocol<T>\n");
        contents = contents.replace(
            "impl SseDecode for ClientProtocol",
            "impl<T: api::client::ClientCom> SseDecode for ClientProtocol<T>",
        );
        contents = contents.replace(
            "impl SseEncode for ClientProtocol",
            "impl<T: api::client::ClientCom> SseEncode for ClientProtocol<T>",
        );
        let mut f = File::create(filename).unwrap();
        f.write_all(contents.as_bytes()).unwrap();
        let _ = must_be_static;
        drop(file);
        drop(f);
        drop(contents);
        drop(arr);
    });
    Ok(())
}
