#!/bin/bash

# Install oh-my-zsh
if [ ! -e ~/.oh-my-zsh ]
then
	git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
	mv ~/.zshrc ~/.zshrc.old
	cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
fi

# Set /etc/.oh-my-zsh/
if [ -e ~/.oh-my-zsh ]
then
	cp -rf ./oh-my-zsh/custom ~/.oh-my-zsh
fi

if grep -qP '^plugins=\(.+\)' ~/.zshrc
then
	plugins='plugins=(git colored-man-pages vi-mode autojump history history-substring-search)'
	sed -ri "s/^plugins=\(.+\)/${plugins}/g" ~/.zshrc
fi
