#!/bin/bash

function capture_metrics () {
  local file="stats_$2.log"
  truncate -s 0 $file

  local end_time=$((SECONDS+5))
  while [ $SECONDS -lt $end_time ]; do
    cat /proc/$1/stat >> $file
    sleep 2
  done
}

function capture_pid () {
  echo $! > pid.file
  pid=`cat pid.file`
}

#########
# Rust
#########
cd rust

cargo clean && cargo build --release
cd ..
./rust/target/release/numbers-runner &
capture_pid

capture_metrics $pid "rust"

#########
# JAVA
#########
cd java

./build.sh
./build/libs/numbers-runner -Xmx1M
cd ..

capture_metrics $pid "java"

#########
# Go
#########
cd go/src/go-numbers-runner/

go clean && go build
cd ../../..
./go-numbers-runner &
capture_pid

capture_metrics $pid "go"
