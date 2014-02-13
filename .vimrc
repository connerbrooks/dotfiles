set nocompatible

" vundle settings
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My bundles here:
Bundle 'Lokaltog/vim-easymotion'
Bundle 'altercation/vim-colors-solarized'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'bling/vim-airline'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'jeffkreeftmeijer/vim-numbertoggle'
Bundle 'spolu/dwm.vim'
Bundle 'walm/jshint.vim'
Bundle 'scrooloose/syntastic'

" Overtone/Clojure plugings
Bundle 'guns/vim-clojure-static'
Bundle 'tpope/vim-fireplace'
Bundle 'tpope/vim-classpath'
Bundle 'editorconfig/editorconfig-vim'

" Theme settings
syntax on
set t_Co=256
set encoding=utf-8
set laststatus=2
colorscheme solarized 
let g:airline_powerline_fonts = 1
let g:airline_theme="solarized"
execute "set colorcolumn=" . join(range(81,335), ',')
set background=dark 

" Whitespace settings
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
set autoindent
set smartindent
set cindent

" Search settings
set hlsearch
set incsearch
set ignorecase
set smartcase

" Movement setting
set relativenumber
let g:NumberToggleTrigger="<F2>"
set mouse=a

" NerdTree
map <C-n> :NERDTreeToggle<CR>
" autocmd vimenter * NERDTree
nnoremap <CR> :noh<CR><CR>

" Extra settings
set noswapfile
inoremap jk <ESC>
" let mapleader = ","

" Spellcheck
set spell spelllang=en_us

filetype plugin indent on
