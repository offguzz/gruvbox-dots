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

" Leader Key
let mapleader="\ "  

" Netrw Config
let g:netrw_banner = 0
let g:netrw_liststyle = 0

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

".config/nvim/init.vim
nmap <leader>rr :so ~/.config/nvim/init.vim<Cr>
nmap <leader>fc :e ~/.config/nvim/init.vim<Cr>

" Grep
nmap <leader>sg :grep -r --exclude-dir=.git --exclude-dir=node_modules  .<Left><Left>
nmap <leader>sG :grep

"Buffers 
nmap [b :bp!<Cr>
nmap ]b :bn!<Cr>
nmap <leader>sb :ls<Cr> :b! 

" Vim File Explorer
nmap <leader><Cr> :Ex<Cr>

" Text Managment
vmap <S-k> :m '<-2<CR>gv=gv
vmap <S-j> :m '>+1<CR>gv=gv

" Word Substitution
nmap <leader>s/ :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>
nmap <leader>s. :s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

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

" Fzf Find Word
nmap <leader>sw :RG <C-r><C-w><Cr>
" Fzf Grep 
nmap <leader>/ :RG<Cr>
" Ffz Find Files
nmap <leader><space> :Files<Cr>
" Fzf Buffers
nmap <leader>, :Buffers<Cr>
" Fzf Colors
nmap <leader>uC :Colors<Cr>

" Git 
nmap <leader>G :Git<Cr>

" Theme Settings
set termguicolors
set background=dark
colorscheme gruvbox
