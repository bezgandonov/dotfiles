"sets
if &compatible
  set nocompatible
endif

set ttimeout
set ttimeoutlen=100

set ruler
set showcmd

set nowrap
set nu
set numberwidth=1
set scrolloff=5

set nohlsearch
set incsearch

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

set undofile
set mouse=a

syntax on
filetype plugin indent on
colorscheme pablo

"maps
let mapleader=" "

map <C-j> 5j
map <C-k> 5k
vmap <C-j> 5j
vmap <C-k> 5k

map <C-d> <C-d>zz
map <C-u> <C-u>zz

imap <C-c> <Esc>

nnoremap n nzzzv
nnoremap N Nzzzv

if has("clipboard")
  xnoremap <Leader>y "*y
elseif executable("xclip") 
  xnoremap <Leader>y y:YankToXclip<CR>
endif

"TODO: piss your pants!
"commands
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
    \ | wincmd p | diffthis
endif

if executable("xclip") && !exists(":YankToXclip") && !has("clipboard")
  command! YankToXclip call s:YankToXclip()
  function! s:YankToXclip()
    let tmpfile=tempname()
    execute 'vsp' tmpfile
    normal! "0P
    write
    call system('xclip -selection clipboard -r < ' . shellescape(tmpfile))
    bdelete!
    call delete(tmpfile)
  endfunction
endif
