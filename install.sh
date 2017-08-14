#!/usr/bin/env bash

# Set /etc/vimrc ------------------------------------
vim_config='
" Based configuration ---------------------------
syntax on
set number
set relativenumber
set hlsearch
set ignorecase
set smartcase

set tabstop=4
set softtabstop=4
set shiftwidth=4
" -------------------------------------

" Key bindings ------------------------------
let g:mapleader = "\<Space>"
nno <leader>w :w<cr>
nno <leader>q :q<cr>
nno <leader>x :x<cr>
nno <leader>Q :qa!<cr>

nno tt :tabnew<cr>

ino jj <Esc>
" -------------------------
'
if [ -f /etc/vimrc ]
then
    sudo echo $vim_config >> /etc/vimrc
fi
# ------------------------------------


# Set /etc/zsh/zshrc ------------------------------
zsh_conf='
# Enable vi-mode -------------
bindkey -v
bindkey -M viins 'jj' vi-cmd-mode

# Alias ----------------
alias tmux='tmux -2'
'
if [ -f /etc/zsh/zshrc ]
then
    sudo echo $zsh_conf >> /etc/zsh/zshrc
fi
# --------------------------------


# Set /etc/bash.bashrc --------------------------
bash_conf="
# Alias ---------------------
alias ls='ls --color'
alias la='ls -al'

# Enable vi-mode -----------------------------
set -o vi
bind -m vi-insert '\"jj\": vi-movement-mode'
" 
if [ -f /etc/bash.bashrc ]
then
    sudo echo $bash_conf >> /etc/bash.bashrc
fi
# ------------------------------


# Set .tmux.conf --------------------------
TMUX_CONF="./tmux/tmux.conf"
TARGET_TMUX_CONF="~/.tmux.conf"
if [ -f $TARGET_TMUX_CONF ]
then
    cat $TMUX_CONF >> $TARGET_TMUX_CONF
else
    cp -f $TMUX_CONF $TARGET_TMUX_CONF
fi
# --------------------------


# Set ipython -----------------------------------
IP_CONF="./ipython/ipython_config.py"
TARGET_IP_CONF="~/.ipython/profile_default/ipython_config.py"
IP_KEYBINDINGS="./ipython/keybindings.py"
TARGET_IP_KEYBINDINGS="~/.ipython/profile_default/startup/keybindings.py"

if [ -f $TARGET_IP_CONF ]
then
    cat $IP_CONF >> $TARGET_IP_CONF
else
    cp -f $IP_CONF $TARGET_IP_CONF
fi

if [ -f $TARGET_IP_KEYBINDINGS ]
then
    cat $IP_KEYBINDINGS >> $TARGET_IP_KEYBINDINGS
else
    cp -f $IP_KEYBINDINGS $TARGET_IP_KEYBINDINGS
fi
# ---------------------------------
