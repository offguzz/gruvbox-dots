"My Simple config
" Options 
set nu
set rnu
set cursorline 
set nowrap
set ignorecase
set smartcase
set tabstop=2
set shiftwidth=2
set expandtab
set wildoptions=pum
set showcmd
set nocompatible
set noswapfile
set incsearch
set foldmethod=indent
set undofile
set undolevels=10000
set clipboard+=unnamed,unnamedplus
set nohlsearch

" Leader Key
let mapleader="\ "  

" Netrw Config
let g:netrw_banner = 0

" Windows
nmap <leader>w <C-w>

" Harpoon
nmap <leader>1 `1
nmap <leader>2 `2
nmap <leader>3 `3
nmap <leader>4 `4
nmap <leader>5 `5
nmap <leader>6 `6
nmap <leader>7 `7
nmap <leader>8 `8
nmap <leader>9 `9
nmap <leader>0 `0

" Buffers 
nmap [b :bp!<Cr>
nmap ]b :bn!<Cr>

" Vim File Explorer
nmap <leader><Cr> :Ex<Cr>

" Insert Mode - Emacs Readline
imap <C-a> <Home>
imap <C-f> <Right>
imap <C-p> <Up>
imap <C-n> <Down>
imap <C-b> <Left>
imap <C-e> <End>
imap <C-d> <Del>
imap <C-/> <C-o>u
imap <C-x><C-s> <C-o>:w<Cr>
imap <C-x><C-c> <Esc>:wq<Cr>

" Command Mode - Emacs Readline
cnoremap <C-h> <BS>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Delete>
cnoremap <C-o> <C-f>

" Quick Fix
nmap ]q :cnext<Cr>
nmap ]Q :clast<Cr>
nmap [q :cprev<Cr>
nmap [Q :cfirst<Cr>
nmap <leader>q :copen<Cr>
nmap <leader>Q :cclose<Cr>

call plug#begin()
" List your plugins here
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
call plug#end()

" FZF Settings
let g:fzf_vim = {} 
let g:fzf_colors =
  \ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'query':   ['fg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Comment'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] } 

" Ffz Find Files
nmap <leader><space> :Files<Cr>
" Fzf Grep 
nmap <leader>/ :RG<Cr>
" Fzf Buffers
nmap <leader>, :Buffers<Cr>

" Git 
nmap <leader>G :Git<Cr>

" Theme Settings
set termguicolors
set background=dark
colorscheme gruvbox
