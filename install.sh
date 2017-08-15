#!/bin/bash

# Set /etc/vimrc ------------------------------------
VIM_CONF=./vim/vimrc
if [ -f /etc/vimrc ]
then
    sudo cat $VIM_CONF >> /etc/vimrc
else
	sudo cp -f $VIM_CONF /etc/vimrc
fi
# ------------------------------------


# Set /etc/zsh/zshrc ------------------------------
ZSH_CONF=./zsh/zshrc
if [ -f /etc/zsh/zshrc ]
then
    sudo cat $ZSH_CONF >> /etc/zsh/zshrc
else
	sudo cp -f $ZSH_CONF /etc/zsh/zshrc
fi
# --------------------------------


# Set /etc/bash.bashrc --------------------------
BASH_CONF=./bash/bashrc
if [ -f /etc/bash.bashrc ]
then
    sudo cat $BASH_CONF >> /etc/bash.bashrc
fi
# ------------------------------


# Set .tmux.conf --------------------------
TMUX_CONF=./tmux/tmux.conf
TARGET_TMUX_CONF=~/.tmux.conf
if [ -f $TARGET_TMUX_CONF ]
then
    cat $TMUX_CONF >> $TARGET_TMUX_CONF
else
    cp -f $TMUX_CONF $TARGET_TMUX_CONF
fi
# --------------------------


# Set ipython -----------------------------------
IP_CONF=./ipython/ipython_config.py
TARGET_IP_CONF=~/.ipython/profile_default/ipython_config.py
IP_KEYBINDINGS=./ipython/keybindings.py
TARGET_IP_KEYBINDINGS=~/.ipython/profile_default/startup/keybindings.py

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


# Set proxy for "curl" and "wget" ----------------------------------
echo '
https_proxy = http://10.118.1.86:8123
http_proxy = http://10.118.1.86:8123
ftp_proxy = http://10.118.1.86:8123
use_proxy = on
continue = on
check_certificate = off
' >> ~/.wgetrc

echo '
-L
proxy = 10.118.1.86:8123
' >> ~/.curlrc
# --------------------------------
