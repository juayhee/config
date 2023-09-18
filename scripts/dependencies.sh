#!/bin/bash

set -euo pipefail

# Absolute path to config root
dir=$(realpath "$(dirname "${BASH_SOURCE[0]}")/..")

if command -v apt > /dev/null
then
    echo "Package manager detected: apt"
    source "${dir}"/scripts/apt.sh
elif command -v yum > /dev/null
then
    echo "Package manager detected: yum"
    source "${dir}"/scripts/yum.sh
elif command -v brew > /dev/null
then
    echo "Package manager detected: brew"
    source "${dir}"/scripts/brew.sh
else
    echo "!! Could not detect package manager"
    exit 1
fi
