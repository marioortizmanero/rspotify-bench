#!/usr/bin/env bash
# Compare performance of different releases.

set -e

BENCHMARKS=(
    bench_new_async
    bench_new_blocking
    bench_old_async
    bench_old_blocking
)

unset CARGO_TARGET_DIR

for bench in "${BENCHMARKS[@]}"; do
    echo ">> BENCHMARKING $bench"
    cd "$bench"

    cargo clean
    rm -f .spotify_token_cache.json
    cargo fetch -q
    echo ">> Compilation in debug (may take some time):"
    time cargo build -q
    echo ">> Compilation in release (may take some time):"
    time cargo build --release -q
    echo ">> Benchmarking (may take some time):"
    cargo +nightly bench -q
    echo ">> Release binary size"
    du -h "target/release/$bench"
    echo ">> Release binary size (stripped)"
    cp "target/release/$bench" "target/release/$bench-stripped"
    strip "target/release/$bench-stripped"
    du -h "target/release/$bench-stripped"

    cd -
done
