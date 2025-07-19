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
set showcmdloc=statusline
set nocompatible
set noswapfile
set incsearch
set foldmethod=indent
set splitkeep=cursor

if has('nvim')
    let s:undodir = stdpath('state') . '/undo'
else
    let s:undodir = $HOME . '/.vim/undo'
endif

if !isdirectory(s:undodir)
    call mkdir(s:undodir, "p", 0700)
endif

if has('nvim')
    execute 'set undodir=' . fnameescape(s:undodir) . '//'
else
    execute 'set undodir=' . fnameescape(s:undodir)
endif

set undofile
set undolevels=10000
set clipboard+=unnamed,unnamedplus

let mapleader="\ "  

let g:netrw_banner = 0

nmap <silent> <leader>1 `1
nmap <silent> <leader>2 `2
nmap <silent> <leader>3 `3
nmap <silent> <leader>4 `4
nmap <silent> <leader>5 `5
nmap <silent> <leader>6 `6
nmap <silent> <leader>7 `7
nmap <silent> <leader>8 `8
nmap <silent> <leader>9 `9
nmap <silent> <leader>0 `0

nmap <silent> <leader>rr :so ~/.vimrc<Cr>
nmap <silent> <leader>fc :e ~/.vimrc<Cr>

nmap <silent> <C-h> <C-w>h
nmap <silent> <C-j> <C-w>j
nmap <silent> <C-k> <C-w>k
nmap <silent> <C-l> <C-w>l
nmap <silent> <leader>w <C-w>

nmap <silent> <leader>sg :grep -r --exclude-dir=.git --exclude-dir=node_modules  .<Left><Left>

nmap <silent> [b :bp!<Cr>
nmap <silent> ]b :bn!<Cr>
nmap <silent> <leader>sb :ls<Cr>:b! 
nmap <silent> <leader>bb :b #<cr>

nmap <silent> <leader><Cr> :Ex<Cr>

vmap <silent> <S-k> :m '<-2<CR>gv=gv
vmap <silent> <S-j> :m '>+1<CR>gv=gv

nmap <silent> <leader>s/ :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>
nmap <silent> <leader>s. :s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

nmap <silent> <C-d> <C-d>zz
nmap <silent> <C-u> <C-u>zz
nmap <silent> j gj
nmap <silent> k gk
vmap <silent> j gj
vmap <silent> k gk

nmap <silent> n nzz 
nmap <silent> N Nzz 

imap <silent> <C-a> <Home>
imap <silent> <C-f> <Right>
imap <silent> <C-p> <Up>
imap <silent> <C-n> <Down>
imap <silent> <C-b> <Left>
imap <silent> <C-e> <End>
imap <silent> <C-d> <Del>
execute "set <M-char-102>=\ef"
imap <silent> <M-char-102> <C-o>w
execute "set <M-char-98>=\eb"
imap <silent> <M-char-98> <C-o>b
execute "set <M-char-100>=\ed"
imap <silent> <M-char-100> <C-o>dw
imap <silent> <C-/> <C-o>u
imap <silent> <C-x><C-s> <C-o>:w<Cr>

cnoremap <silent> <C-h> <BS>
cnoremap <silent> <C-j> <Down>
cnoremap <silent> <C-k> <Up>
cnoremap <silent> <C-b> <Left>
cnoremap <silent> <C-f> <Right>
cnoremap <silent> <C-a> <Home>
cnoremap <silent> <C-e> <End>
cnoremap <silent> <C-d> <Delete>
cnoremap <silent> <C-o> <C-f>

nmap <silent> ]q :cnext<Cr>
nmap <silent> ]Q :clast<Cr>
nmap <silent> [q :cprev<Cr>
nmap <silent> [Q :cfirst<Cr>
nmap <silent> <leader>q :copen<Cr>
nmap <silent> <leader>Q :cclose<Cr>

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif 

autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif 

call plug#begin()
Plug 'ghifarit53/tokyonight-vim'
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
call plug#end()

set termguicolors
set background=dark
colorscheme gruvbox

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

let g:fzf_vim.preview_window = ['right,50%,<50(up,60%)', 'ctrl-o']
let g:fzf_vim.preview_window = ['up,60%', 'ctrl-o']
let g:fzf_vim.colors_options = ['--style', 'minimal', '--no-preview']
let g:fzf_vim.command_prefix = 'Fzf'

nmap <silent> <leader><space> :FzfFiles<Cr>
nmap <silent> <leader>/ :FzfRG<Cr>
nmap <silent> <leader>, :FzfBuffers<Cr>
nmap <silent> <leader>uC :FzfColors<Cr>
nmap <silent> <leader>G :Git<Cr>:only<Cr>
