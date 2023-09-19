#!/bin/bash
set -euo pipefail

platform=$(uname)

# Absolute path to config root
dir=$(realpath "$(dirname "${BASH_SOURCE[0]}")/..")

## Unzip and move font files into ~/.local/share/fonts
echo ">> Extracting files..."
unzip -o "${dir}"/fonts/JetBrainsMono.zip -d "${dir}"/tmp

# Reload font cache
echo ">> Refreshing font cache..."
if [ $platform = "Linux" ]
then
    echo ">> Copying to ~/.local/share/fonts"
    mkdir -p ~/.fonts
    cp -r "${dir}"/tmp ~/.local/share/fonts
    fc-cache -frv
elif [ $platform = "Darwin" ]
then
    cp -r "${dir}"/tmp ~/Library/Fonts
fi

# Clean up
rm -r "${dir}"/tmp

echo "== Font setup complete. =="
