#!/usr/bin/bash

set -e
source var.sh

echo -e "[START] Installing and setting up stuff for Vim\n"

mkdir -p $path_to_vim/autoload $path_to_vim/bundle $path_to_vim/colors $path_to_vim/plugged

# Install stuff with package manager
#sudo pacman -S --needed --noconfirm vim-runtime

# Install vim-plug
curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > $path_to_vim/autoload/plug.vim

# Install all the plugins
vim --cmd ":source $path_to_dotfiles/home/.vimrc" \
	-c ":PlugInstall" \
	-c ":CocInstall coc-snippets" \
	-c ":CocInstall coc-json" \
	-c ":qa!" 2>/dev/null

echo -e "[DONE] Installing and setting up stuff for Vim\n"
