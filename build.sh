#!/bin/bash

PROJECT_DIR=$(dirname "$0")

cd "$PROJECT_DIR"

cd builder
cargo build --release
cd ..

./builder/target/release/builder


cd output

if [[ "$1" == "demo" ]]; then
    echo "start server"
    python3 -m http.server 8000
else
    echo "over"
fi