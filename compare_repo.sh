#!/bin/sh
# Benchmarks from the maintainer's perspective.

set -e

if [ $# -ne 2 ]; then
    echo "Usage: $0 OLD_BRANCH NEW_BRANCH"
    exit 1
fi

# Like '33d8f770b3d0bcaaccd0c83c0ab0481edb7e5eaa'
branch_old=$1
# Like 'master'
branch_new=$2

tmp_dir=$(mktemp -d)
git clone "https://github.com/ramsayleung/rspotify" "$tmp_dir"
rm -rf "$tmp_dir"
