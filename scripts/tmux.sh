#!/bin/bash

git clone https://github.com/tmux/tmux.git
cd tmux
sh autogen.sh
./configure
make
sudo make install || make install
cd ..
rm -r tmux
