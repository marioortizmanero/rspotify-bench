# Rspotify Benchmarks

This repository includes a few simple tools to benchmark and compare
[Rspotify](https://github.com/ramsayleung/rspotify) releases.

You'll need nightly installed to run these benchmarks.

## Statistics

Some parts of Rspotify can be analyzed statically, such as the lines of code
that will need to be maintained, or its number of dependencies.

*Results example as of 2021-10-12:*

| Version | Rust LoC | Dependencies in tree | Dependencies in tree (all features) |
|:-------:|:--------:|----------------------|-------------------------------------|
| 0.10.0  |   11281  | 132                  | 141                                 |
| master  |   7525   | 101                  | 123                                 |

## Execution

You can see the full Criterion reports in the `report` directories of each
benchmark.

Note that comparing the blocking clients for now is unfair, because instead of
using `reqwest::blocking`, now it's `ureq`. Furthermore, the async and sync
versions can't be compared either, because the former requires setting up the
tokio runtime and a bunch of other stuff.

The asynchronous clients in both versions should give a rough idea of the actual
differences, though you can tell it's just a quick benchmark; the results
shouldn't be taken too seriously.

*Results example as of 2021-10-12:*

|         Version         | Debug Compilation Time (s) | Release Compilation Time (s) | Benchmarking Time (ms/iter) | Release Binary Size (MB) | Release Stripped Binary Size (MB) |
|:-----------------------:|:--------------------------:|:----------------------------:|:---------------------------:|:------------------------:|:---------------------------------:|
| 0.10.0, blocking        |           72.712           |            126.229           |            271.31           |            9.9           |                4.9                |
| 0.10.0, async           |           72.244           |            115.703           |            428.02           |            11            |                5.2                |
| master, blocking (ureq) |           38.549           |            55.934            |            503.68           |            7.3           |                2.6                |
| master, async (reqwest) |           51.014           |            86.594            |            432.49           |            8.5           |                4.0                |

## Conclusion

Read more details at https://nullderef.com/blog/web-api-client.
