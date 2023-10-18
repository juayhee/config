#!/bin/bash

platform=$(uname)

# Absolute path to config root
dir=$(realpath "$(dirname "${BASH_SOURCE[0]}")/..")

# Work in /tmp
mkdir -p ${dir}/tmp
cd ${dir}/tmp

echo ">> Cloning NeoVim..."

git clone https://github.com/neovim/neovim
cd neovim
git checkout stable
make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX=~/.local
make install


echo "== NeoVim installed. =="
