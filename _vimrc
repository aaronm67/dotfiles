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
autocmd VimEnter * silent NERDTree
autocmd VimEnter * silent wincmd l
autocmd BufWinEnter * silent loadview
autocmd TabEnter * silent NERDTreeMirror
autocmd TabEnter * silent wincmd l
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

map <C-left> :tabp<cr>
map <C-right> :tabn<cr>
map <C-l> :tabn<cr>
map <C-h> :tabp<cr>
map <C-n> :tabclose<CR>

"make CTRL + J the opposite of shift + J
nnoremap <C-j> i<CR><Esc>   
"ctrl + n toggles file explorer
nmap <silent> <c-n> :NERDTreeToggle<CR>


" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction
"function! NERDTreeQuit()
"  redir => buffersoutput
"  silent buffers
"  redir END
""                     1BufNo  2Mods.     3File           4LineNo
"  let pattern = '^\s*\(\d\+\)\(.....\) "\(.*\)"\s\+line \(\d\+\)$'
"  let windowfound = 0
"
"  for bline in split(buffersoutput, "\n")
"    let m = matchlist(bline, pattern)
"
"    if (len(m) > 0)
"      if (m[2] =~ '..a..')
"        let windowfound = 1
"      endif
"    endif
"  endfor
"
"  if (!windowfound)
"    quitall
"  endif
"endfunction


