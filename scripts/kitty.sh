#!/bin/bash

set -euo pipefail

platform=$(uname)

# Absolute path to config root
dir=$(realpath "$(dirname "${BASH_SOURCE[0]}")/..")

# Download Kitty
echo ">> Downloading kitty..."
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

if [ $platform = "Linux" ] 
then
    # Symlink the binary to ~/.local/bin (which is on $PATH)
    ln -sfn ~/.local/kitty.app/bin/kitty ~/.local/bin/kitty
    ln -sfn ~/.local/kitty.app/bin/kitten ~/.local/bin/kitten
fi

echo "== Kitty installed =="

