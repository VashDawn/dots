#!/usr/bin/env bash

source ./dots_func.sh

tmuxFiles=(~/.tmux ~/.tmux.conf ~/.tmux.conf.local)

for file in ${tmuxFiles[@]}
do
    if [ -e $file -o -h $file ]
    then
        rm -rf $file && echo  'deleted:' $file
    fi
done

git clone https://github.com/gpakosz/.tmux.git ~/.tmux

if [ $? ]; then
    ln -s ~/.tmux/.tmux.conf ~/.tmux.conf
    cp ~/.tmux/.tmux.conf.local ~/.tmux.conf.local
else
    TMUX_CONF=~/.dotfiles/tmux/tmux.conf
    TARGET_TMUX_CONF=~/.tmux.conf

    if [ -e $TARGET_TMUX_CONF ]; then bak_old $TARGET_TMUX_CONF; fi
    ln -s $TMUX_CONF ~/.tmux.conf
fi

