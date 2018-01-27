#!/bin/bash

source ./dots_func.sh

[ -e ~/.zshrc ] && bak_old ~/.zshrc  # backup old .zshrc

[ -d ~/.oh-my-zsh ] && rm -rf ~/.oh-my-zsh  # clear old .oh-my-zsh

# Install oh-my-zsh

shopt -s extglob

git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

if [ $? ]
then
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

    cp -rf omz/!(ins.sh) ~/.oh-my-zsh/custom/
else
    [ -e ~/.zshrc ] && bak_old ~/.zshrc
    ln -s ~/.dotfiles/zsh/zshrc ~/.zshrc
fi

shopt -u extglob


# if grep -qP '^plugins=\(.+\)' ~/.zshrc
# then
# 	plugins='plugins=(git colored-man-pages vi-mode autojump history history-substring-search)'
# 	sed -ri "s/^plugins=\(.+\)/${plugins}/g" ~/.zshrc
# fi
