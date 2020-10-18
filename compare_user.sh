#!/bin/sh
# Benchmarks from the user's perspective

set -e

BENCHMARKS="./bench_new_async ./bench_new_blocking ./bench_old_async ./bench_old_blocking"

unset CARGO_TARGET_DIR

for bench in $BENCHMARKS; do
    cd "$bench"
    echo "$bench"

    cargo clean
    cargo build --release >/dev/null 2>&1
    ./target/release/$bench
    cd ..
done
