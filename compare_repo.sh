#!/bin/sh
# Benchmarks from the maintainer's perspective.
#
# 0.10 release - 33d8f770b3d0bcaaccd0c83c0ab0481edb7e5eaa
# 0.11 release - master

set -e

if [ $# -ne 2 ]; then
    echo "Usage: $0 [BRANCHES..]"
    exit 1
fi

repo_dir=$(mktemp -d)
git clone "https://github.com/ramsayleung/rspotify" "$repo_dir"
rm -rf "$repo_dir"

for branch in "$@"; do
    echo ">> BENCHMARKING BRANCH $branch"
    echo ">> Line count:"
    tokei "$repo_dir"
done
