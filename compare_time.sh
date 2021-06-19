#!/bin/sh

set -e

BENCHMARKS=(
    ./bench_new_async
    ./bench_new_blocking
    ./bench_old_async
    ./bench_old_blocking
)

unset CARGO_TARGET_DIR

for bench in $BENCHMARKS; do
    echo ">> BENCHMARKING $bench"
    cd "$bench"

    cargo clean
    cargo fetch
    echo ">> Compilation in debug (may take some time):"
    time cargo build -q
    echo ">> Execution in debug:"
    time ./target/debug/$bench
    echo ">> Compilation in release (may take some time):"
    time cargo build --release -q
    echo ">> Execution in release:"
    time ./target/release/$bench

    cd ..
done
