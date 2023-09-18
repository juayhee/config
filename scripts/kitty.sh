#!/bin/bash

# Absolute path to config root
dir=$(realpath "$(dirname "${BASH_SOURCE[0]}")/..")

# Download Kitty
echo ">> Downloading kitty..."
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

# Symlink the binary to ~/.local/bin (which is on $PATH)
ln -sf ~/.local/kitty.app/kitty ~/.local/bin/kitty
ln -sf ~/.local/kitty.app/kitten ~/.local/bin/kitten

echo "== Kitty installed =="

