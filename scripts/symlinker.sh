#!/bin/bash

# Absolute path to config root
dir=$(realpath "$(dirname "${BASH_SOURCE[0]}")/..")

echo ">> Creating symlinks to ~/.config"
## To .config
# Kitty
rm -rf ~/.config/kitty 2>/dev/null
ln -s "${dir}/config/kitty" ~/.config/kitty 
echo "> Symlink set for Kitty"

# Zellij
rm -rf ~/.config/zellij 2>/dev/null
ln -s "${dir}/config/zellij" ~/.config/zellij 
echo "> Symlink set for Zellij"

# NeoVim
rm -rf ~/.config/nvim 2>/dev/null
ln -s  "${dir}/config/nvim" ~/.config/nvim 
echo "> Symlink set for NeoVim"
echo ">> Symlinks for '.config' complete."

# To ~/notes
rm -rf ~/notes 2>/dev/null
ln -s "${dir}"/notes ~/notes
echo ">> Symlinks for 'notes' complete."

## To $HOME
# .bashrc
echo ">> Creating symlinks to ~"

rm ~/.bashrc 2>/dev/null
ln -s "${dir}/config/.bashrc" ~/ 
echo "> Symlink set for .bashrc"

rm ~/.gitignore 2>/dev/null
ln -s "${dir}/config/.gitignore" ~/ 
echo "> Symlink set for .gitignore"

echo ">> Symlinks for ~ complete. "

echo "== All symbolic links created. =="

