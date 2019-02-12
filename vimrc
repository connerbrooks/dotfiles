if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

set nocompatible " should I do this? vi comp
set encoding=utf-8

syntax on
set number relativenumber  " hybrid linenumbers

set visualbell
set ruler

" Whitespace
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set autoindent
set smartindent
" set wrap
" set textwidth=79
