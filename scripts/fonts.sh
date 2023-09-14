#!/bin/bash

unzip -o "${root_dir}"/fonts/JetBrainsMonoNL-NF.zip -d "${root_dir}"/tmp

# Load into font cache
fc-cache "${root_dir}"/tmp

# Clean up
rm -r "${root_dir}"/tmp

