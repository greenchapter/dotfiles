#!/bin/sh

echo "cloning dotfiles."

# git clone https://github.com/greenchapter/dotfiles.git $HOME/.dotfiles

echo "init submodules."
# (cd $HOME/.dotfiles && git submodule update --init)

for i in $(ls); do
   echo "Link ${i} to $HOME/.$(basename ${i}).";
   # ln -s ${i} "$HOME/.$(basename ${i})";
 done

echo "Done."
