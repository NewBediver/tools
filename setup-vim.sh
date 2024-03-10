#!/bin/bash

# step 1: install vim
sudo apt update
sudo apt install vim

# step 2: install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# step 3: copy .vimrc to homedir
cp ./vim/.vimrc ~/
