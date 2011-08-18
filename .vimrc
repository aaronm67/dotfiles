set nocompatible
set background=dark
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
filetype plugin indent on
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

"disable auto comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"make CTRL + J the opposite of shift + J
nnoremap <C-j> i<CR><Esc>   
"ctrl + n toggles file explorer
nmap <silent> <c-n> :NERDTreeToggle<CR>

function! NERDTreeQuit()
  redir => buffersoutput
  silent buffers
  redir END
"                     1BufNo  2Mods.     3File           4LineNo
  let pattern = '^\s*\(\d\+\)\(.....\) "\(.*\)"\s\+line \(\d\+\)$'
  let windowfound = 0

  for bline in split(buffersoutput, "\n")
    let m = matchlist(bline, pattern)

    if (len(m) > 0)
      if (m[2] =~ '..a..')
        let windowfound = 1
      endif
    endif
  endfor

  if (!windowfound)
    quitall
  endif
endfunction
autocmd WinEnter * call NERDTreeQuit()


