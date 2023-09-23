#!/bin/bash
# set -euo pipefail

root_dir=$(cd "$(dirname $BASH_SOURCE)" && pwd)

# Create necessary directories
mkdir -p ~/.config
mkdir -p ~/.local

## Setup
# Dotfiles
echo ">> Setting up dotfiles..."
source "${root_dir}"/scripts/symlinker.sh

# System dependencies
echo ">> Installing system dependencies..."
source "${root_dir}"/scripts/dependencies.sh

# Source .bashrc
source ~/.bashrc

## Applications
echo ">> Installing applications..."

#  NeoVim
echo "> Installing NeoVim..."
source "${root_dir}"/scripts/neovim.sh

# Zellij
echo "> Installing Zellij..."
source "${root_dir}"/scripts/zellij.sh

# # Kitty
# echo "> Installing Kitty..."
# source "${root_dir}"/scripts/kitty.sh

# Fonts
echo ">> Unpacking fonts..."
source "${root_dir}"/scripts/fonts.sh

source ~/.bashrc
echo "== Bootstrapping complete ==" 

