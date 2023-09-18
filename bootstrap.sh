#!/bin/bash
set -euo pipefail

root_dir=$(cd "$(dirname $BASH_SOURCE)" && pwd)

# Create necessary directories
mkdir -p ~/.config
mkdir -p ~/.local

## Setup
# System dependencies
echo ">> Installing system dependencies..."
source "${root_dir}"/scripts/dependencies.sh

## Applications
echo ">> Installing applications..."

#  NeoVim
echo "> Installing NeoVim..."
source "${root_dir}"/scripts/neovim.sh

echo "> Installing Zellij..."
source "${root_dir}"/scripts/zellij.sh


# Dotfiles
echo ">> Setting up dotfiles..."
source "${root_dir}"/scripts/symlinker.sh

echo ">> Unpacking fonts..."
source "${root_dir}"/scripts/fonts.sh


# Source .bashrc
source ~/.bashrc

echo "== Bootstrapping complete ==" 

