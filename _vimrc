set nocompatible
set background=light
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
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab  
set cindent

autocmd BufRead,BufNewFile *.ejs setfiletype html
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd l
autocmd BufNew * NERDTreeMirror
autocmd BufNew * wincmd l
autocmd WinEnter * call NERDTreeQuit()

"make CTRL + T switch tabs
nmap <C-i> :tabnext<CR>
map <C-S-tab> :tabprevious<CR>
map <C-tab> :tabnext<CR>
imap <C-S-tab> <Esc>:tabprevious<CR>i
imap <C-tab> <Esc>:tabnext<CR>i
nmap <C-t> :tabnew<CR>
imap <C-t> <Esc>:tabnew<CR>

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


