#!/bin/bash

# Install oh-my-zsh
if [ ! -e ~/.oh-my-zsh ]
then
	if [ -e ~/.zshrc ]; then mv ~/.zshrc ~/.zshrc.old; fi  # rename old .zshrc

	git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

# Set /etc/.oh-my-zsh/
if [ -e ~/.oh-my-zsh ]
then
    cp -rf `ls ~/.dotfiles/omz | grep -v ins.sh` ~/.oh-my-zsh/custom/
fi

# if grep -qP '^plugins=\(.+\)' ~/.zshrc
# then
# 	plugins='plugins=(git colored-man-pages vi-mode autojump history history-substring-search)'
# 	sed -ri "s/^plugins=\(.+\)/${plugins}/g" ~/.zshrc
# fi
