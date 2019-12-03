#!/bin/bash

ln -svi ~/dotfiles/.alias ~/
ln -svi ~/dotfiles/.bashrc ~/
ln -svi ~/dotfiles/.inputrc ~/
ln -svi ~/dotfiles/.gitconfig ~/
ln -svi ~/dotfiles/.gitignore ~/

mkdir -p ~/.config/nvim/autoload
ln -svi ~/dotfiles/.config/nvim/autoload/* ~/.config/nvim/autoload/
ln -svi ~/dotfiles/.config/nvim/init.vim ~/.config/nvim/
ln -svi ~/.config/nvim/plugged/vim-colorschemes/colors ~/.config/nvim/colors
