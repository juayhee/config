#!/bin/bash
set -euo pipefail

root_dir="$(cd "$(dirname "$0")" && pwd)"
echo $root_dir

# Create necessary directories
mkdir -p ~/.config
mkdir -p ~/.local

# Setup
echo ">> Setting up dotfiles..."
source "${root_dir}/scripts/symlinker.sh"

# System dependencies
echo ">> Installing system dependencies..."
source "${root_dir}/scripts/install_dependencies.sh"

# Install NeoVim
echo ">> Installing NeoVim..."
source "${root_dir}/scripts/install_neovim.sh"
