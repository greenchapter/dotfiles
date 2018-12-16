#!/usr/bin/env zsh
#
# Bootstrap script for setting up a new macos machine

# Notes
# Based on Gerald baeck Bootstrap Script
# - https://github.com/geraldbaeck/dotfiles/blob/master/osx_scripts/osx_bootstrap.sh

echo "🚀  Start bootstrapping your new mac."

# get sudo rights for all the things
echo -n "Get sudo rights for all the things. Is this ok? (y/n) "
read yesno < /dev/tty

if [ "x$yesno" = "xy" ];then
	sudo -v
else
	echo "Sorry, these script only runs with root rights. 🙈"
	exit
fi


echo -n "Do you want to install Homebrew? (y/n) "
read yesno < /dev/tty

if [ "x$yesno" = "xy" ];then
	# Check for Homebrew, install if we don't have it
	if test ! $(which brew); then
		echo "Installing homebrew..."
		ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	else
		echo "You already have installed homebrew."
	fi
fi


# Update homebrew recipes
brew update

# Install zsh Bash
brew install zsh zsh-completions

# Basic oh-my-zsh Installation
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
