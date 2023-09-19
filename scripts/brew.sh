#!/bin/bash

set -euo pipefail

# One-liner to install brew if it is not present
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Installing packages..."
brew install ripgrep \
    curl \
    git
