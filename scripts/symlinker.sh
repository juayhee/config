#!/bin/bash
set -euo pipefail


echo ">> Creating symlinks to '.config'"
## To .config
# Kitty
rm -rf ~/.config/kitty 2>/dev/null || true
ln -s "${root_dir}/config/kitty" ~/.config/kitty 
echo "> Symlink set for Kitty"

# NeoVim
rm -rf ~/.config/nvim 2>/dev/null || true
ln -s  "${root_dir}/config/nvim" ~/.config/nvim 
echo "> Symlink set for NeoVim"
echo ">> Symlinks for '.config' complete"

echo ">> Creating symlinks to '$HOME'"
## To $HOME
# .bashrc
rm ~/.bashrc 2>/dev/null || true 
ln -s "${root_dir}/config/.bashrc" ~/ 
echo "> Symlink set for .bashrc"

# tmux
rm ~/.tmux.conf 2>/dev/null || true
ln -s "${root_dir}/config/.tmux.conf" ~/
echo "> Symlink set for .tmux.conf"

echo ">> Symlinks for '$HOME' complete"

echo "== All symbolic links created. =="

