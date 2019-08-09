#!/bin/bash

echo Please enter the target machine and home directory eg. 192.168.1.1:/home/user

read target

scp .zshrc .vimrc .zsh_plugins.txt $target

ssh $target
curl -sfL git.io/antibody | sudo sh -s - -b /usr/local/bin
sudo apt install python3-pip
source .zshrc
