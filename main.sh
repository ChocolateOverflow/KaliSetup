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


	echo -e "Installing main tools\n"
	sudo apt install -y $(cat $path_to_pkgs/main.txt | tr '\n' ' ')

	echo -e "[DONE] Installing with standard package manager\n"
}

install_python(){
	echo -e "[START] Installing python modules\n"

	pip3 install -r $path_to_pkgs/python.txt --user

	echo -e "[DONE] Installing python modules\n"
}

install_gitmake(){
	echo -e "[START] Installing stuff from github with make\n"

	while IFS= read -r line; do
		tmp=$(cat $line | rev | cut -d "/" -f 1 | rev)
		git clone $line "$path_to_tools/$tmp"
		cd "$path_to_tools/$tmp"
		make
		sudo make install
	done < $path_to_pkgs/gitmake.txt
	cd $path_current

	echo -e "[DONE] Installing stuff from github with make\n"
}

install_manual(){
	echo -e "[START] Installing some tools semi-manually\n"

	# Loop through /manual_install and run every script
	for dir in ./manual_install/*; do
		sh $dir/install.sh
	done

	echo -e "[START] Installing some tools semi-manually\n"
}

copy_dotfiles(){
	echo -e "[START] Copying dot files\n"

	cp -r ./dotfiles/home/* $HOME 2>/dev/null
	cp -r ./dotfiles/home/.* $HOME 2>/dev/null
	cp -r ./dotfiles/config/* $HOME/.config 2>/dev/null
	cp -r ./dotfiles/config/.* $HOME/.config 2>/dev/null

	echo -e "[DONE] Copying dot files\n"
}

cron(){
	echo -e "[START] Copying cron jobs\n"

#	cp ./cron/user/* $path_to_cron_user
#	cp ./cron/root/* $path_to_cron_root

	echo -e "[DONE] Copying cron jobs\n"
}

setup(){
	echo -e "[START] Setting up tools\n"

	# Loop through /setup and run every script
	for dir in ./setup/*; do
		sh $dir/setup.sh
	done

	echo -e "[DONE] Setting up tools\n"
}

post_install(){
	echo -e "[START] Post-installtion\n"

	cp ./.custom $HOME
	chmod +x $HOME/.custom/scripts/*

	echo "updatedb"
	sudo updatedb

	chmod +x $HOME/.config/bspwm/bspwmrc

	echo -e "[DONE] Post-installtion\n"
}



##############################
# main() - Run all the stuff
##############################

echo -e "Running install and setup\n"

#pre_install
#install_pkg
#install_python
install_gitmake
#install_manual
#copy_dotfiles
#cron
#setup
#post_install

echo -e "Done with everything!\n"
