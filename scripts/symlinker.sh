#!/bin/bash
set -euo pipefail

# Absolute path to config root
dir=$(realpath "$(dirname "${BASH_SOURCE[0]}")/..")

echo ">> Creating symlinks to ~/.config"
## To .config
# Kitty
rm -rf ~/.config/kitty 2>/dev/null || true
ln -s "${dir}/config/kitty" ~/.config/kitty 
echo "> Symlink set for Kitty"

# NeoVim
rm -rf ~/.config/nvim 2>/dev/null || true
ln -s  "${dir}/config/nvim" ~/.config/nvim 
echo "> Symlink set for NeoVim"
echo ">> Symlinks for '.config' complete."


## To $HOME
# .bashrc
echo ">> Creating symlinks to ~"

rm ~/.bashrc 2>/dev/null || true 
ln -s "${dir}/config/.bashrc" ~/ 
echo "> Symlink set for .bashrc"

echo ">> Symlinks for ~ complete. "

echo "== All symbolic links created. =="

