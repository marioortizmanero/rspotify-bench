#!/usr/bin/env bash
# Compare statistics such as line count or dependencies of different releases.
#
# 0.10 release - 33d8f770b3d0bcaaccd0c83c0ab0481edb7e5eaa
# 0.11 release - master
#
# Example usage:
#   ./compare_stats.sh 33d8f770b3d0bcaaccd0c83c0ab0481edb7e5eaa master

set -e

if [ $# -lt 1 ]; then
    echo "Usage: $0 [BRANCHES..]"
    exit 1
fi

repo_dir=$(mktemp -d)
git clone "https://github.com/ramsayleung/rspotify" "$repo_dir" >/dev/null 2>&1
cd "$repo_dir"

for branch in "$@"; do
    echo ">> BENCHMARKING BRANCH $branch"
    git checkout "$branch" >/dev/null 2>&1

    echo ">> Line count:"
    tokei "$repo_dir"

    deps=$(cargo tree -q --edges normal --charset ascii | sed 's/[-|`]//g' | awk '{print $1}' | sort | uniq | wc -l)
    deps_all=$(cargo tree -q --all-features --edges normal --charset ascii | sed 's/[-|`]//g' | awk '{print $1}' | sort | uniq | wc -l)
    echo ">> Dependencies in tree: $deps"
    echo ">> Dependencies in tree with all features: $deps_all"
done

rm -rf "$repo_dir"
