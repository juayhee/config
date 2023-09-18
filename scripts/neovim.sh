#!/bin/bash

set -euo pipefail

# Absolute path to config root
dir=$(realpath "$(dirname "${BASH_SOURCE[0]}")/..")

# Work in /tmp
mkdir -p ${dir}/tmp
cd ${dir}/tmp

echo ">> Cloning NeoVim..."
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
tar xvzf nvim-linux64.tar.gz

echo ">> Extracting archive..."
cp -r nvim-linux64/* ~/.local

rm -r ${dir}/tmp
echo "== NeoVim installed. =="
