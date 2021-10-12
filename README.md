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
| master  |   7525   | 101                  | 123                                 |

## Execution

These are very approximate, since the programs are only ran once, but they help
see actually noticeable changes.

*Results example as of 2021-07-04:*

|         Version         | Debug Compilation Time (s) | Debug Execution Time (s) | Release Compilation Time (s) | Release Execution Time (s) | Release Binary Size (MB) | Release Stripped Binary Size (MB) |
|:-----------------------:|:--------------------------:|:------------------------:|:----------------------------:|:--------------------------:|:------------------------:|:---------------------------------:|
| 0.10.0, blocking        |           72.712           |           0.485          |            126.229           |            0.673           |            9.9           |                4.9                |
| 0.10.0, async           |           72.244           |           0.410          |            115.703           |            0.400           |            11            |                5.2                |
| master, blocking (ureq) |           38.549           |           0.399          |            55.934            |            0.386           |            7.3           |                2.6                |
| master, async (reqwest) |           51.014           |           0.432          |            86.594            |            0.412           |            8.5           |                4.0                |

## Conclusion

Read more details at https://nullderef.com/blog/web-api-client.
