set nocompatible

" vundle settings
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" My bundles here:
Bundle 'spolu/dwm.vim'
Bundle 'jeffkreeftmeijer/vim-numbertoggle'
Bundle 'scrooloose/nerdtree'
Bundle 'jiangmiao/auto-pairs'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'nathanaelkane/vim-indent-guides'

" Language specific bundles
Bundle 'scrooloose/syntastic'
Bundle 'Rip-Rip/clang_complete'
Bundle 'walm/jshint.vim'
Bundle 'jelera/vim-javascript-syntax'

" Theme bundles
Bundle 'altercation/vim-colors-solarized'
Bundle 'bling/vim-airline'

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
let g:solarized_termtrans=1
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

" Indent Guides
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

" Search settings
set hlsearch
set incsearch
set ignorecase
set smartcase

" Movement setting
set relativenumber
let g:NumberToggleTrigger="<F2>"

" Mouse can select position
set mouse=a

" NerdTree toggle
map <C-e> :NERDTreeToggle<CR>

" Enter clears search
nnoremap <CR> :noh<CR><CR>

" Clang
let g:clang_c_options = '-std=gnull'
let g:clang_cpp_options = '-std=c++ll -stdlib=libc++'

" Extra settings
set noswapfile
inoremap jk <ESC>

filetype plugin indent on
