#!/bin/bash

# step 1: install vim
sudo apt update
sudo apt install vim-nox

# step 2: install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# step 3: copy .vimrc to homedir
rm ~/.vimrc
cp ./vim/.vimrc ~/

# step 4: install cmake and python
apt install build-essential cmake python2 python3-dev

# step 5: install mono-complete, go, node, jave and npm
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_current.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
apt install mono-complete golang nodejs openjdk-17-jdk openjdk-17-jre npm

# step 6: build ycm
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --all
