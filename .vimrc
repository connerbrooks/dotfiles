set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'gmarik/vundle'

" My bundles here:
Plugin 'spolu/dwm.vim'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'scrooloose/nerdtree'
Plugin 'jiangmiao/auto-pairs'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-easymotion'

" Language specific bundles
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
" Plugin 'Rip-Rip/clang_complete'
Plugin 'fatih/vim-go'

" Theme bundles
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'

Plugin 'editorconfig/editorconfig-vim'
Plugin 'tpope/vim-fugitive'

call vundle#end()
filetype plugin indent on

" Vim settings
" Theme settings
syntax on
set t_Co=256
set encoding=utf-8
set laststatus=2
colorscheme solarized 
let g:airline_powerline_fonts = 1
let g:airline_theme="solarized"
execute "set colorcolumn=" . join(range(81,335), ',')
" let g:solarized_termtrans=1
set background=dark 
call togglebg#map("<F5>")

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
set backspace=indent,eol,start

set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif
