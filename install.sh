#!/bin/bash

# Create .dotfiles dir and old.dotfiles dir ----------------------
if [ -d ~/.dotfiles ]; then mv ~/.dotfiles "~/old_dotfiles"`date +%Y%m%d%H%M%S`; fi
git clone https://github.com/vashdawn/dots.git ~/.dotfiles

[ ! -d ~/old.dotfiles ] && mkdir ~/old.dotfiles

# A function to backup old dotfiles --------
function bak_old () {
    now=`date +%Y%m%d%H%M%S`
    target_name=${$1##*/}"_"$now
    [ -e $1 ] && mv -f $1 ~/old.dotfiles/$target_name
}


# A function to create dotfile symbol links
function ln_dot () {
    ln -s $1 $2
}

# Set /etc/vimrc ------------------------------------
VIM_CONF=~/.dotfiles/vim/vimrc
if [ -e ~/.vimrc ]; then bak_old ~/.vimrc; fi
ln -s $VIM_CONF ~/.vimrc
# ------------------------------------


# Set /etc/zsh/zshrc ------------------------------
ZSH_CONF=~/.dotfiles/zsh/zshrc
if [ -e ~/.zshrc ]; then bak_old ~/.zshrc; fi
ln -s $ZSH_CONF ~/.zshrc
# --------------------------------


# Set /etc/bash.bashrc --------------------------
BASH_CONF=~/.dotfiles/bash/bashrc
if [ -e ~/.bashrc ]; then bak_old ~/.bashrc; fi

ln -s $BASH_CONF ~/.bashrc
# ------------------------------


# Set .tmux.conf --------------------------
# Let grml-zsh-config work
# If 'setopt no_global_rcs' in ~/.zshenv
if [ -e ~/.zshenv ]; then bak_old ~/.zshenv; fi

TMUX_CONF=~/.dotfiles/tmux/tmux.conf
TARGET_TMUX_CONF=~/.tmux.conf

if [ -e $TARGET_TMUX_CONF ]; then bak_old $TARGET_TMUX_CONF; fi

ln -s $TMUX_CONF $TARGET_TMUX_CONF
# --------------------------


# Set ipython -----------------------------------
IP_CONF=~/.dotfiles/ipython/ipython_config.py
TARGET_IP_CONF=~/.ipython/profile_default/ipython_config.py
IP_KEYBINDINGS=~/.dotfiles/ipython/keybindings.py
TARGET_IP_KEYBINDINGS=~/.ipython/profile_default/startup/keybindings.py

if [ ! -d ~/.ipython ] && mkdir -p ~/.ipython/profile_default/startup

if [ -e $TARGET_IP_CONF ]; then bak_old $TARGET_IP_CONF; fi
ln -s $IP_CONF $TARGET_IP_CONF

if [ -e $TARGET_IP_KEYBINDINGS ]; then bak_old $TARGET_IP_KEYBINDINGS; fi
ln -s $IP_KEYBINDINGS $TARGET_IP_KEYBINDINGS
# ---------------------------------


# Proxy ------------------------------
echo 'Please input your proxy server(x.x.x.x:port): '
read proxy_server
if [ -z $proxy_server ]; then exit; fi
    # Set proxy for "curl" and "wget" ----------------------------------
    echo "
    https_proxy = http://${proxy_server}
    http_proxy = http://${proxy_server}
    ftp_proxy = http://${proxy_server}
    use_proxy = on
    continue = on
    check_certificate = off
    " >> ~/.wgetrc

    echo "
    -L
    proxy = ${proxy_server}
    " >> ~/.curlrc
    # --------------------------------
