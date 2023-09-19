#!/bin/bash

set -euo pipefail


echo "Installing packages..."
brew install ripgrep \
    curl \
    git
