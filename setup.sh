#!/bin/bash
git clone https://github.com/collinarnett/dev-environment.git
cp .zshrc .vimrc .zsh_plugins.txt ~
$TERM_PATH=~/.config/terminator
mkdir $TERM_PATH
cp -r plugins $TERM_PATH
cp config $TERM_PATH
sudo apt install -y zsh fonts-powerline terminator
chsh -s $(which zsh)
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
curl -sfL git.io/antibody | sudo sh -s - -b /usr/local/bin
sudo apt install python3-pip
source .zshrc
