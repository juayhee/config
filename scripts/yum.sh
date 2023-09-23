#!/bin/bash

set -euo pipefail

try_sudo() {
  sudo "$@" || "$@"
}

packages="git curl ripgrep fontconfig"

try_sudo yum update -y
try_sudo yum upgrade -y

try_sudo yum groupinstall -y "Development Tools"
try_sudo yum install -y yum-utils

# Add repository for ripgrep
try_sudo yum-config-manager --add-repo=https://copr.fedorainfracloud.org/coprs/carlwgeorge/ripgrep/repo/epel-7/carlwgeorge-ripgrep-epel-7.repo

# Start install
try_sudo yum install -y $packages
