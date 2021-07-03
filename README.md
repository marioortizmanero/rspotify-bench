# Rspotify Benchmarks

This repository includes a few tools to benchmark and compare Rspotify releases.

## Statistics

Some parts of Rspotify can be analyzed statically, such as the lines of code
that will need to be maintained, or the dependencies one has to pull in order to
build it.

*Results example as of 2021-07-04:*

| Version | Rust LoC | Dependencies in tree | Dependencies in tree (all features) |
|:-------:|:--------:|----------------------|-------------------------------------|
| 0.10.0  |   11281  | 132                  | 141                                 |
| master  |   7133   | 101                  | 121                                 |

## Execution

These are very approximate, since they're only ran once, but they help see
actually noticeable changes.

*Results example as of 2021-07-04:*

|         Version         | Debug Compilation Time (s) | Debug Execution Time (s) | Release Compilation Time (s) | Release Execution Time (s) |
|:-----------------------:|:--------------------------:|:------------------------:|:----------------------------:|:--------------------------:|
| 0.10.0, blocking        |           69.775           |           0.202          |            114.098           |            0.200           |
| 0.10.0, async           |           70.479           |           0.206          |            107.744           |            0.229           |
| master, blocking (ureq) |           37.780           |           0.187          |            50.274            |            0.194           |
| master, async (reqwest) |           49.602           |           0.212          |            81.498            |            0.205           |
