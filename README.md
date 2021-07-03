# Rspotify Benchmarks

This repository includes a few simple tools to benchmark and compare
[Rspotify](https://github.com/ramsayleung/rspotify) releases.

## Statistics

Some parts of Rspotify can be analyzed statically, such as the lines of code
that will need to be maintained, or its number of dependencies.

*Results example as of 2021-07-04:*

| Version | Rust LoC | Dependencies in tree | Dependencies in tree (all features) |
|:-------:|:--------:|----------------------|-------------------------------------|
| 0.10.0  |   11281  | 132                  | 141                                 |
| master  |   7133   | 101                  | 121                                 |

## Execution

These are very approximate, since the programs are only ran once, but they help
see actually noticeable changes.

*Results example as of 2021-07-04:*

|         Version         | Debug Compilation Time (s) | Debug Execution Time (s) | Release Compilation Time (s) | Release Execution Time (s) | Release Binary Size (MB) | Release Stripped Binary Size (MB) |
|:-----------------------:|:--------------------------:|:------------------------:|:----------------------------:|:--------------------------:|:------------------------:|:---------------------------------:|
| 0.10.0, blocking        |           69.775           |           0.202          |            114.098           |            0.200           |            9.8           |                5.0                |
| 0.10.0, async           |           70.479           |           0.206          |            107.744           |            0.229           |            10            |                5.2                |
| master, blocking (ureq) |           37.780           |           0.187          |            50.274            |            0.194           |            7.2           |                2.7                |
| master, async (reqwest) |           49.602           |           0.212          |            81.498            |            0.205           |            8.1           |                3.8                |

## Conclusion

Read more details at https://nullderef.com/blog/rspotify-upgrade.
