use criterion::{criterion_group, criterion_main, Criterion};

pub fn criterion_benchmark(c: &mut Criterion) {
    c.bench_function("main", |b| b.iter(bench_new_blocking::run));
}

criterion_group!(benches, criterion_benchmark);
criterion_main!(benches);
