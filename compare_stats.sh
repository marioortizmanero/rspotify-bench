#!/bin/sh
# 0.10 release - 33d8f770b3d0bcaaccd0c83c0ab0481edb7e5eaa
# 0.11 release - master

set -e

if [ $# -ne 2 ]; then
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
