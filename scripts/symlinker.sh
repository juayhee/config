#!/bin/bash

# Absolute path to config root
dir=$(realpath "$(dirname "${BASH_SOURCE[0]}")/..")

echo ">> Creating symlinks to ~/.config"
## To .config
# NeoVim
rm -rf ~/.config/nvim 2>/dev/null
ln -s  "${dir}/config/nvim" ~/.config/nvim 
echo "> Symlink set for NeoVim"
echo ">> Symlinks for '.config' complete."

## To $HOME
# .bashrc
echo ">> Creating symlinks to ~"

rm ~/.bashrc 2>/dev/null
ln -s "${dir}/config/.bashrc" ~/ 
echo "> Symlink set for .bashrc"

rm ~/.ideavimrc 2>/dev/null
ln -s "${dir}/config/.ideavimrc" ~/ 
echo "> Symlink set for .ideavimrc"

rm ~/.vimrc 2>/dev/null
ln -s "${dir}/config/.vimrc" ~/ 
echo "> Symlink set for .vimrc"

echo ">> Symlinks for ~ complete. "

echo "== All symbolic links created. =="

