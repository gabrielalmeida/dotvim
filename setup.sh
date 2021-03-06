#!/bin/bash

if [ ! -d ~/.vim_backup ]; then
  echo "Creating backup directory."
  mkdir ~/.vim_backup
fi

if [ ! -d ~/.vim_swp ]; then
  echo "Creating swp directory."
  mkdir ~/.vim_swp
fi

echo "Creating vim symlinks"
ln -nsf "$PWD"/vimrc ~/.vimrc
ln -nsf "$PWD"/vim ~/.vim

if [ -d vim/bundle ]; then
  echo "Cleaning bundle directory."
  rm -rf vim/bundle/*
fi

if [ ! -d vim/bundle ]; then
  echo "Creating bundle directory."
  mkdir -p "$PWD"/vim/bundle
fi

echo "Cloning neobundle into bundle directory"
git clone https://github.com/Shougo/neobundle.vim vim/bundle/neobundle.vim

echo "Installing bundles"
"$PWD"/vim/bundle/neobundle.vim/bin/neoinstall

echo "Vim setup is complete"
