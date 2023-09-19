#!/bin/bash

set -euo pipefail

platform=$(uname)
# Absolute path to config root
dir=$(realpath "$(dirname "${BASH_SOURCE[0]}")/..")

if [ $platform != "Darwin" ] > /dev/null
then
    if command -v apt # macos has a dummy alias to apt
    then
        echo "Package manager detected: apt"
        source "${dir}"/scripts/apt.sh
    fi
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
