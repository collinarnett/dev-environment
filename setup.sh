#!/usr/bin/env bash
git clone https://github.com/collinarnett/dev-environment.git
cd dev-environment

# OSX
if [ "$(uname)" == "Darwin" ]; then
    echo "Setting up config files..."
    cp .zshrc .vimrc .zsh_plugins.txt ~
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"    
    brew cask install iterm2 
    brew install zsh fonts-powerline python3 python3-pip
    chsh -s $(which zsh)
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    curl -sfL git.io/antibody | sudo sh -s - -b /usr/local/bin
    pip3 install pylint pyls flake8 vint

# Linux
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    echo "Setting up config files..."
    cp .zshrc .vimrc .zsh_plugins.txt ~    
    echo "Setting up terminator..."
    $TERM_PATH=~/.config/terminator
    mkdir $TERM_PATH
    cp -r plugins $TERM_PATH
    cp config $TERM_PATH
    echo "Setting up essential apps..."
    sudo apt install -y zsh fonts-powerline terminator python3 python3-pip
    chsh -s $(which zsh)
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    curl -sfL git.io/antibody | sudo sh -s - -b /usr/local/bin
    pip3 install pylint pyls flake8 vint
fi

npm install eslint
