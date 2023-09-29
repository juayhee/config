#!/bin/bash

platform=$(uname)

# Absolute path to config root
dir=$(realpath "$(dirname "${BASH_SOURCE[0]}")/..")

# Work in /tmp
mkdir -p ${dir}/tmp
cd ${dir}/tmp

echo ">> Cloning NeoVim..."

if [ $platform = "Linux" ]
then
	echo ">> Downloading for Linux"
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz

	echo ">> Extracting archive..."
	tar xvzf nvim-linux64.tar.gz
	cp -r nvim-linux64/* ~/.local
else
	echo ">> Downloading for macOS"
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-macos.tar.gz
	xattr -c ./nvim-macos.tar.gz # Avoid security check

	echo ">> Extracting archive..."
	tar xvzf nvim-macos.tar.gz
    rm -f ~/.local/bin/nvim # For some reason running an nvim binary that overwrote
                            # the previous binary results in 'Killed: 9'
                            # Some kind of macOS security issue? So we remove the
                            # old binary first
	cp -r nvim-macos/* ~/.local
fi

rm -r ${dir}/tmp
echo "== NeoVim installed. =="
