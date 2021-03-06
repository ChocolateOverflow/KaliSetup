#!/usr/bin/bash

set -e


##############################
# Options and Variables
##############################

source ./var.sh

##############################
# Declare functions
##############################

echo -e "Setting up functions\n"

pre_install(){
	echo -e "[START] Preprocessing\n"

	mkdir -p $path_to_tools $HOME/.config

	echo -e "[DONE] Preprocessing\n"
}

install_pkg(){
	echo -e "[START] Installing with standard package manager\n"

	sudo apt update
	sudo apt upgrade

	echo -e "Installing main tools\n"
	sudo apt install -y $(cat $path_to_pkgs/main.txt | tr '\n' ' ')

	echo -e "[DONE] Installing with standard package manager\n"
}

install_python(){
	echo -e "[START] Installing python modules\n"

	pip3 install -r $path_to_pkgs/python.txt

	echo -e "[DONE] Installing python modules\n"
}

install_manual(){
	echo -e "[START] Installing some tools semi-manually\n"

	# Loop through /manual_install and run every script
	for dir in ./manual_install/*; do
		cd $dir
		bash $dir/install.sh
		cd $path_current
	done

	echo -e "[START] Installing some tools semi-manually\n"
}

dotfiles(){
	echo -e "[START] Installing dot files\n"

	git clone $url_to_dotfiles $path_to_dotfiles

	for line in $path_to_dotfiles/home/.*; do
		target=$(echo $line | cut -d \/ -f 7)
		[ $target != "." ] && [ $target != ".." ] && ln -sf $line $HOME/$target
	done

	for line in $path_to_dotfiles/config/*; do
		target=$(echo $line | cut -d \/ -f 7)
		ln -sf $line $HOME/.config/$target
	done

	echo -e "[DONE] Installing dot files\n"
}

setup(){
	echo -e "[START] Setting up tools\n"

	for dir in ./setup/*; do
		cd $dir
		bash setup.sh
		cd $path_current
	done

	echo -e "[DONE] Setting up tools\n"
}

post_install(){
	echo -e "[START] Post-installtion\n"

	cp ./.custom $HOME
	chmod +x $HOME/.custom/scripts/* $HOME/.custom/scripts/*/*

	echo "updatedb"
	sudo updatedb

	echo -e "[DONE] Post-installtion\n"
}



##############################
# main() - Run all the stuff
##############################

echo -e "Running install and setup\n"

pre_install
install_pkg
install_python
install_manual
dotfiles
setup
post_install

echo -e "Done with everything!\n"
