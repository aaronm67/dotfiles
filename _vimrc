set nocompatible
set backspace=start,indent,eol
set history=500
set undolevels=5000
syntax enable
set title
set number
set ruler
set showcmd
set showmode
set laststatus=2
set ignorecase
set smartcase
set hlsearch
set incsearch
set showmatch
set matchtime=2
set lazyredraw
set noerrorbells
set wildmenu
set scrolloff=5
set hidden
set autoread
set tabstop=4                " width of a tab character in spaces
set softtabstop=4            " defines number of spaces for when adding/removing tabs
set shiftwidth=4             " number of spaces to use for autoindent
set expandtab                " use spaces instead of tab characters; to insert real tab, use <C-v><Tab>
set cindent                  " automatic indenting; see ':h C-indenting' for comparison

nnoremap <C-j> i<CR><Esc>
filetype plugin indent on
