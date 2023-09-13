#!/bin/bash

set -euo pipefail

echo ">> Cloning NeoVim..."
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
tar xvzf nvim-linux64.tar.gz

echo ">> Extracting archive..."
cp -r nvim-linux64/* ~/.local

rm -r nvim-linux64 nvim-linux64.tar.gz
echo ">> NeoVim installed."
