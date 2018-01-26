#!/usr/bin/env bash

tmuxFiles=(~/.tmux ~/.tmux.conf ~/.tmux.conf.local)

for file in ${tmuxFiles[@]}
do
    if [ -e $file -o -h $file ]
    then
        rm -rf $file && echo  'deleted:' $file
    fi
done

git clone https://github.com/gpakosz/.tmux.git ~/.tmux

ln -s ~/.tmux/.tmux.conf ~/.tmux.conf
cp ~/.tmux/.tmux.conf.local ~/.tmux.conf.local
