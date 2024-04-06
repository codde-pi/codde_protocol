use lib_flutter_rust_bridge_codegen::codegen::{generate, Config, MetaConfig};
use std::io;
use std::{
    fs::{self, File},
    io::{Read, Write},
    path::Path,
};

const RUST_INPUT: &str = "src/base/mod.rs";
const BASE_INPUT: &str = "../src/base";
const BASE_OUTPUT: &str = "src/api/base";

fn main() {
    // Tell Cargo that if the input Rust code changes, rerun this build script
    println!("cargo:rerun-if-changed={}", BASE_INPUT);
    println!("cargo:rerun-if-changed={}", RUST_INPUT);

    let _ = duplicate_base().unwrap();

    let config = Config::from_config_file("flutter_rust_bridge.yaml");
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
        Err(e) => panic!("Failed to generate bridge : {}", e),
    };
    // FIXME: Dart build runner command is missing :/

    // Format the generated Dart code
    _ = std::process::Command::new("fvm")
        .arg("dart")
        .arg("format")
        .arg("..")
        .spawn();

    patch_generated_files();

    // Format the generated Rust code
    _ = std::process::Command::new("rustfmt")
        .arg("src/lib.rs")
        .spawn();
}

fn duplicate_base() -> io::Result<()> {
    // Get the source and destination directories
    let src_dir = Path::new(BASE_INPUT);
    let dest_dir = Path::new(BASE_OUTPUT);

    if dest_dir.exists() {
        fs::remove_dir_all(dest_dir)?;
    }
    // Create the destination directory if it doesn't exist
    if !dest_dir.exists() {
        fs::create_dir_all(dest_dir)?;
    }
    // let mut f = File::create(dest_dir.join("mod.rs"))?;

    // Copy the contents of the source directory to the destination directory
    for entry in fs::read_dir(src_dir)? {
        let entry = entry?;
        let path = entry.path();
        let file_name = path.file_name().unwrap();
        let dest_path = dest_dir.join(file_name);

        if path.is_dir() {
            fs::create_dir_all(&dest_path)?;
        } else {
            fs::copy(&path, &dest_path)?;
            fix_base_file(&dest_path)?;
            // f.write_all(format!("pub mod {};\n", file_name.to_str().unwrap()).as_bytes())?;
        }
    }
    Ok(())
}

fn fix_base_file(path: &Path) -> io::Result<()> {
    let mut file = File::open(path)?;
    let mut contents = String::new();
    file.read_to_string(&mut contents)?;
    let mut arr: Vec<String> = contents.split('\n').map(|x| x.to_string()).collect();

    for (index, line) in arr.clone().iter().enumerate() {
        if line.contains("use pyo3::")
        /* || line.contains("#[pyclass]")
        || line.contains("#[pyo3(get)]") */
        {
            arr.remove(index);
            continue;
        }
    }
    contents = arr.join("\n");
    contents = contents.replace("#[pyclass]", "");
    contents = contents.replace("#[pyo3(get)]", "");
    let mut f = File::create(path)?;
    f.write_all(contents.as_bytes())?;
    Ok(())
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
        if let Some(_) = contents.find("// Section: imports") {
            // contents.insert_str(i, "use pyo3::prelude::*; ")
        };
        let mut arr: Vec<String> = contents.split('\n').map(|x| x.to_string()).collect();
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
    }
}
