#!/usr/bin/env zsh
#
# Bootstrap script for setting up a new macos machine

# Notes
# Based on Gerald baeck Bootstrap Script
# - https://github.com/geraldbaeck/dotfiles/blob/master/osx_scripts/osx_bootstrap.sh

echo "\n\n     Start bootstrapping your new mac.\n"
echo -n "       .----.\n"
echo -n "       |\033[1m>_\033[0m  |\n"
echo -n "     __|____|__\n"
echo -n "    |  ______--|\n"
echo -n "     -/.::::.\-\n"
echo -n "      -------- \n\n"

echo -n "     This setup is as simple as described here:\n"
echo -n "     \033[1mhttps://www.youtube.com/watch?v=SGzkUgTgpa4\033[0m\n\n\n"

# Basic oh-my-zsh Installation
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# get sudo rights for all the things

main() {
}


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
		echo "\n  ⏺  Installing homebrew...\n"
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
 	brew update && \
 	brew install \
 	zsh \
 	zsh-completions \
 	htop \
 	bmon
 	echo "\n  ✅ All brew kegs are updated or installed.\n"
else
	echo "Sorry, Supercharged only works with installed brew kegs 🙈"
	exit
fi

# Install NPM Packages
echo -ne '\033[1mWould you like to install the Supercharged NPM packages?\033[0m (yes/no) '
read yesno < /dev/tty

if [ "x$yesno" = "xy" ] || [ "x$yesno" = "xyes" ];then

	echo "\n  ⏺  Installing the latest version of npm...\n"
	npm install npm@latest -g
	echo "\n  ⏺  Installing the latest versions of the supercharged npm packages...\n"
	npm install -g \
	@angular/cli@latest \
	@vue/cli@latest \
	@vue/cli-init@latest \
	pnpm@latest
	echo "\n  ✅ You installed the latest version of the global needed node modules.\n"

fi

# Install oh-my-zsh

echo -ne "\033[1mWould you like to install oh-my-zsh?\033[0m (yes/no) "
read yesno < /dev/tty

if [ "x$yesno" = "xy" ] || [ "x$yesno" = "xyes" ];then

	echo "\n  ⏺  Checking prerequisites...\n"

	if test $(which git); then
		echo ✓ $(git --version) "\n"
	else
		exit
	fi

	if test $(which curl); then
		echo ✓ $(curl --version) "\n"
	else
		exit
	fi

	if test $(which zsh); then
		echo ✓ $(zsh --version) "\n"
	else
		exit
	fi

	echo "  ⏺  Installing oh-my-zsh...\n"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	echo "\n  ✅ Oh-my-zsh is installed.\n"

else
	echo "Sorry, these script only runs with root rights. 🙈"
	exit
fi

main "$@"
