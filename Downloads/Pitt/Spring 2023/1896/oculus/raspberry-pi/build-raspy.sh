#!/bin/bash -e

USER=treads
PI_IP=192.168.0.133
TARGET=aarch64-unknown-linux-gnu

sudo apt update
sudo apt install -y libclang-dev libv4l-dev

# build binary ~:Q
cargo build --release --target $TARGET

# upload binary
ssh-copy-id $USER@$PI_IP
scp -r ./target/$TARGET/release/video-streaming $USER@$PI_IP:/tmp/
scp -r ./target/$TARGET/release/servo-control-websocket $USER@$PI_IP:/tmp/
scp -r ./target/$TARGET/release/servo-control-test $USER@$PI_IP:/tmp/
