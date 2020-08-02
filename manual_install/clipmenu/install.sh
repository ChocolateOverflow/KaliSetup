#!/usr/bin/bash

set -e
source var.sh

cd $path_to_tools

# Install dmenu

sudo apt install libxft-dev libx11-dev libxinerama-dev
git clone https://github.com/ChocolateOverflow/dmenu
cd dmenu
make
sudo make install
cd ..

# Install clip-notify

git clone https://github.com/cdown/clipnotify
sudo apt install libxfixes-dev
sudo cp clipnotify /usr/bin/
cd ..

# Install clipmenu

git clone https://github.com/cdown/clipmenu
sudo make install

cd $path_current
