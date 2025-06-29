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
map <C-j> 5j
map <C-k> 5k
vmap <C-j> 5j
vmap <C-k> 5k

map <C-d> <C-d>zz
map <C-u> <C-u>zz

imap <C-c> <Esc>

map n nzzzv
map N Nzzzv

"TODO: piss your pants!
"commands
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
    \ | wincmd p | diffthis
endif
