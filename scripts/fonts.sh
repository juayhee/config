#!/bin/bash
set -euo pipefail

# Absolute path to config root
dir=$(realpath "$(dirname "${BASH_SOURCE[0]}")/..")

## Unzip and move font files into ~/.local/share/fonts
echo ">> Extracting files..."
unzip -o "${dir}"/fonts/JetBrainsMono.zip -d "${dir}"/tmp

echo ">> Copying to ~/.local/share/fonts"
mkdir -p ~/.fonts
cp -r "${dir}"/tmp ~/.local/share/fonts

# Reload font cache
echo ">> Refreshing font cache..."
fc-cache -frv

# Clean up
rm -r "${dir}"/tmp

echo "== Font setup complete. =="
