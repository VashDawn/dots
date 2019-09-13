#!/bin/bash

source ./dots_func.sh

# Create .dotfiles dir and backup old dotfiles dir
[ -d ~/.dotfiles ] && bak_old ~/.dotfiles

git clone https://github.com/vashdawn/dots.git ~/.dotfiles

# Set /etc/vimrc ------------------------------------
VIM_CONF=~/.dotfiles/vim/vimrc
SPACEVIM=~/.dotfiles/vim/.spacevim
[ -e ~/.vimrc -a ! -e ~/.spacevim ] && bak_old ~/.vimrc && ln -s $VIM_CONF ~/.vimrc
[ -e ~/.spacevim ] && bak_old ~/.spacevim && ln -s $SPACEVIM ~/.spacevim
# [ -e ~/.vimrc  ] && [ -e ~/.spacevim ] || bak_old ~/.vimrc


# Set /etc/bash.bashrc --------------------------
BASH_CONF=~/.dotfiles/bash/bashrc
[ -e ~/.bashrc ] && bak_old ~/.bashrc

ln -s $BASH_CONF ~/.bashrc


# Set /etc/zsh/zshrc ------------------------------
./omz/ins.sh


# Set .tmux.conf --------------------------
./tmux/tmux_ins.sh


# Set ipython -----------------------------------
IP_CONF=~/.dotfiles/ipython/ipython_config.py
TARGET_IP_CONF=~/.ipython/profile_default/ipython_config.py
IP_KEYBINDINGS=~/.dotfiles/ipython/keybindings.py
TARGET_IP_KEYBINDINGS=~/.ipython/profile_default/startup/keybindings.py

[ -d ~/.ipython ] || mkdir -p ~/.ipython/profile_default/startup

[ -e $TARGET_IP_CONF ] && bak_old $TARGET_IP_CONF
ln -s $IP_CONF $TARGET_IP_CONF

[ -e $TARGET_IP_KEYBINDINGS ] && bak_old $TARGET_IP_KEYBINDINGS
ln -s $IP_KEYBINDINGS $TARGET_IP_KEYBINDINGS


# Proxy ------------------------------
echo 'Please input your proxy server(x.x.x.x:port): '
read proxy_server
if [ -n $proxy_server ]; then
	wget_proxy="\n
	https_proxy = http://${proxy_server}\n
	http_proxy = http://${proxy_server}\n
	ftp_proxy = http://${proxy_server}\n
	use_proxy = on\n
	continue = on\n
	check_certificate = off\n
	"

	curl_proxy="\n
	-L\n
	proxy = ${proxy_server}\n
	"

    echo -e $curl_proxy >> ~/.curlrc  # for curl

    echo -e $wget_proxy >> ~/.wgetrc  # for wget
else
    echo 'No proxy provided.'
fi

