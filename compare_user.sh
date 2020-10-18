#!/bin/sh
# Benchmarks from the user's perspective

set -e

BENCHMARKS="./bench_new_async ./bench_new_blocking ./bench_old_async ./bench_old_blocking"

unset CARGO_TARGET_DIR

for bench in $BENCHMARKS; do
    echo ">> BENCHMARKING $branch"
    cd "$bench"
    echo "$bench"

    cargo clean
    echo ">> Compilation benchmark:"
    cargo build --release
    echo ">> Runtime benchmark:"
    time ./target/release/$bench
    cd ..
done
