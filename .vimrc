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
Bundle 'jelera/vim-javascript-syntax'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'jeffkreeftmeijer/vim-numbertoggle'
Bundle 'spolu/dwm.vim'
Bundle 'walm/jshint.vim'
Bundle 'scrooloose/syntastic'
Bundle 'jiangmiao/auto-pairs'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'Rip-Rip/clang_complete'

" Theme bundles
Bundle 'altercation/vim-colors-solarized'
Bundle 'bling/vim-airline'

" Java plugins
Bundle 'adragomir/javacomplete'

" Overtone/Clojure plugins
Bundle 'guns/vim-clojure-static'
Bundle 'tpope/vim-fireplace'
Bundle 'tpope/vim-classpath'
Bundle 'editorconfig/editorconfig-vim'

" Theme settings
syntax on
set t_Co=256
set encoding=utf-8
set laststatus=2
" colorscheme solarized 
let g:airline_powerline_fonts = 1
let g:airline_theme="bubblegum"
execute "set colorcolumn=" . join(range(81,335), ',')
let g:solarized_termtrans=1
set background=dark 
highlight ColorColumn ctermbg=235 guibg=#2c2d27


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
set mouse=a

" NerdTree
map <C-e> :NERDTreeToggle<CR>
" autocmd vimenter * NERDTree
nnoremap <CR> :noh<CR><CR>

" Clang
let g:clang_c_options = '-std=gnull'
let g:clang_cpp_options = '-std=c++ll -stdlib=libc++'

" Extra settings
set noswapfile
inoremap jk <ESC>
" let mapleader = ","

" Spellcheck
" set spell spelllang=en_us

filetype plugin indent on
