#!/bin/bash
set -euo pipefail

root_dir="$(cd "$(dirname "$0")" && pwd)"
echo $root_dir

# Create necessary directories
mkdir -p ~/.config
mkdir -p ~/.local

## Setup
# System dependencies
echo ">> Installing system dependencies..."
source "${root_dir}/scripts/install_dependencies.sh"

echo ">> Setting up dotfiles..."
source "${root_dir}/scripts/symlinker.sh"

echo ">> Unpacking fonts..."
source "${root_dir}/scripts/fonts.sh"

# Install NeoVim
echo ">> Installing NeoVim..."
source "${root_dir}/scripts/install_neovim.sh"

# Source .bashrc
source ~/.bashrc

echo "== Bootstrapping complete ==" 

