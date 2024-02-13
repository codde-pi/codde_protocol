default: gen lint

gen:
    export REPO_DIR="$PWD"; $HOME/.cargo/bin/flutter_rust_bridge_codegen generate \
        --rust-input "$REPO_DIR/codde_protocol/src/api/**/*.rs" \
        --dart-output "$REPO_DIR/lib/src/codde_protocol/" \

lint:
    cd codde_protocol && cargo fmt
    dart format .
