#!/bin/bash

# step 1: install gdb
sudo apt update
sudo apt install zsh curl

# step 2: make zsh as default shell
chsh -s $(which zsh)

# step 3: install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# step 4: install zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# step 5: copy .zshrc to homedir
rm ~/.zshrc
cp ./zsh/.zshrc ~/
