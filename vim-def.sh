#!/usr/bin/env bash
echo '
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
' >> /etc/vimrc
