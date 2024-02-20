use lib_flutter_rust_bridge_codegen::codegen::{generate, Config, MetaConfig};
use std::{
    fs::File,
    io::{Read, Write},
};

const RUST_INPUT: &str = "src/api/mod.rs";

fn main() {
    // Tell Cargo that if the input Rust code changes, rerun this build script
    println!("cargo:rerun-if-changed={}", RUST_INPUT);

    let config = Config::from_config_file("../../../flutter_rust_bridge.yaml");
    let res = match config {
        Ok(c) => match c {
            // Generate Rust & Dart ffi bridges
            Some(conf) => generate(conf, MetaConfig { watch: false }),
            None => panic!("No config found in `./flutter_rust_bridge.yaml`"),
        },
        Err(e) => panic!("Failed to parse flutter rust bridge config file : {}", e),
    };

    match res {
        Ok(_) => {}
        Err(e) => eprintln!("Failed to generate bridge : {}", e),
    };

    // Format the generated Dart code
    _ = std::process::Command::new("flutter")
        .arg("format")
        .arg("..")
        .spawn();

    patch_generated_files();
}

fn patch_generated_files() {
    let native_path = "src";
    let input_files = vec![
        format!("{}/frb_generated.rs", native_path),
        format!("{}/frb_generated.io.rs", native_path),
        format!("{}/frb_generated.web.rs", native_path),
    ];

    println!("RUNNING PATCH");
    for filename in input_files {
        let mut file = File::open(&filename).unwrap();
        let mut contents = String::new();
        file.read_to_string(&mut contents).unwrap();
        /* if contents.contains("// Patched by `codde_protocol`") {
            return;
        } */
        match contents.find("// Section: imports") {
            Some(i) => contents.insert_str(i, "use pyo3::prelude::*; "),
            None => {}
        };
        let mut arr: Vec<String> = contents.split("\n").map(|x| x.to_string()).collect();
        // arr.insert(0, String::from("// Patched by `codde_protocol`"));
        let mut must_be_static = false;
        for (index, line) in arr.clone().iter().enumerate() {
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
        let mut f = File::create(filename).unwrap();
        f.write_all(contents.as_bytes()).unwrap();
        let _ = must_be_static;
        drop(file);
        drop(f);
        drop(contents);
        drop(arr);
    }
}
