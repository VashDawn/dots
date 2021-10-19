#!/usr/bin/env bash

# A function to backup old dotfiles --------
function bak_old () {
    [ ! -d ~/dotfiles.old ] && mkdir ~/dotfiles.old
	now=`date +%Y%m%d%H%M%S`
	origin_name=`echo $1`
	bak_name=${origin_name##*/}"_"$now
	[ -e $1 ] && mv -f $1 ~/dotfiles.old/$bak_name
}

