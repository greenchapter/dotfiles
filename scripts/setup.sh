#!/usr/bin/env zsh
#
# Bootstrap script for setting up a new macos machine

# Notes
# Based on Gerald baeck Bootstrap Script
# - https://github.com/geraldbaeck/dotfiles/blob/master/osx_scripts/osx_bootstrap.sh

echo "\n\nStart bootstrapping your new mac.\n"
echo -n "       .----.\n"
echo -n "       |>_  |\n"
echo -n "     __|____|__\n"
echo -n "    |  ______--|\n"
echo -n "     -/.::::.\-\n"
echo -n "      -------- \n\n"

# get sudo rights for all the things
echo -ne '\033[1mGet sudo rights for all the things. Is this ok?\033[0m (yes/no) '
read yesno < /dev/tty

if [ "x$yesno" = "xy" ] || [ "x$yesno" = "xyes" ];then
	sudo -v
else
	echo "Sorry, these script only runs with root rights. 🙈"
	exit
fi

# Install Homebrew

echo -ne '\033[1mDo you want to install Homebrew?\033[0m (yes/no) '
read yesno < /dev/tty

if [ "x$yesno" = "xy" ] || [ "x$yesno" = "xyes" ];then
	# Check for Homebrew, install if we don't have it
	if test ! $(which brew); then
		echo "Installing homebrew..."
		ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	else
		echo "\n  ✅ You already have installed homebrew.\n"
	fi
fi

# Install or Update brew kegs

echo -ne '\033[1mInstall the Supercharged Homebrew Packages?\033[0m (yes/no) '
read yesno < /dev/tty

if [ "x$yesno" = "xy" ] || [ "x$yesno" = "xyes" ];then
	echo "\n  ⏺  Installing homebrew packages 🍻...\n"
 	brew update && brew install zsh zsh-completions htop bmon
 	echo "\n  ✅ All brew kegs are updated or installed.\n"
else
	echo "Sorry, Supercharged only works with installed brew kegs 🙈"
	exit
fi



# Basic oh-my-zsh Installation
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
