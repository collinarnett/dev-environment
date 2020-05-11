#!/usr/bin/env bash

# Linux
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    echo "Setting up config files..."
    cp .vimrc ~
    cp fish ~/.config/    
    echo "Setting up essential apps..."
    sudo apt install -y fish curl terminator python3 python3-pip
    echo "Setting up terminator..."
    $TERM_PATH=~/.config/terminator
    mkdir $TERM_PATH
    cp -r plugins $TERM_PATH
    cp config $TERM_PATH
    chsh -s $(which fish)
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    pip3 install pylint pyls flake8 vint virtualfish
    # Installing terminator-themes
    wget https://git.io/v5Zww -O $HOME"/.config/terminator/plugins/terminator-themes.py"
    # Installing oh-my-fish
    curl -L https://get.oh-my.fish | fish
fi
