#!/bin/bash

set -euo pipefail

if command -v apt > /dev/null
then
    echo "Package manager detected: apt"
    source "${root_dir}/scripts/install_apt.sh"
elif command -v yum > /dev/null
then
    echo "Package manager detected: yum"
    source "${root_dir}/scripts/install_yum.sh"
elif command -v brew > /dev/null
then
    echo "Package manager detected: brew"
    source "${root_dir}/scripts/install_brew.sh"
else
    echo "!! Could not detect package manager"
    exit 1
fi
