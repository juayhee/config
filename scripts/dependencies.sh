#!/bin/bash

set -euo pipefail

platform=$(uname)
# Absolute path to config root
dir=$(realpath "$(dirname "${BASH_SOURCE[0]}")/..")

# Install brew just in case it isn't there yet
if [ $platform = "Darwin" ]
then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if [ $platform != "Darwin" ]
then
    if command -v apt
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
