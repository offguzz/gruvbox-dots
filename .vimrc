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

nmap <leader>rr :so ~/.vimrc<Cr>
nmap <leader>fc :e ~/.vimrc<Cr>

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <leader>w <C-w>

nmap <leader>sg :grep -r --exclude-dir=.git --exclude-dir=node_modules  .<Left><Left>

nmap [b :bp!<Cr>
nmap ]b :bn!<Cr>
nmap <leader>sb :b! 

nmap <leader><Cr> :Ex<Cr>

vmap <S-k> :m '<-2<CR>gv=gv
vmap <S-j> :m '>+1<CR>gv=gv

nmap <leader>s/ :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>
nmap <leader>s. :s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

nmap <C-d> <C-d>zz
nmap <C-u> <C-u>zz
nmap j gj
nmap k gk
vmap j gj
vmap k gk

nmap n nzz 
nmap N Nzz 

imap <C-a> <Home>
imap <C-f> <Right>
imap <C-p> <Up>
imap <C-n> <Down>
imap <C-b> <Left>
imap <C-e> <End>
imap <C-d> <Del>
execute "set <M-char-102>=\ef"
imap <M-char-102> <C-o>w
execute "set <M-char-98>=\eb"
imap <M-char-98> <C-o>b
execute "set <M-char-100>=\ed"
imap <M-char-100> <C-o>dw
imap <C-/> <C-o>u
imap <C-x><C-s> <C-o>:w<Cr>

cnoremap <C-h> <BS>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Delete>
cnoremap <C-o> <C-f>

nmap ]q :cnext<Cr>
nmap ]Q :clast<Cr>
nmap [q :cprev<Cr>
nmap [Q :cfirst<Cr>
nmap <leader>q :copen<Cr>
nmap <leader>Q :cclose<Cr>

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

let g:fzf_vim.buffers_jump = 1
let g:fzf_vim.preview_window = ['right,50%,<50(up,60%)', 'ctrl-o']
let g:fzf_vim.preview_window = ['up,60%', 'ctrl-o']
let g:fzf_vim.colors_options =      ['--style', 'minimal', '--no-preview']
let g:fzf_vim.command_prefix = 'Fzf'

nmap <silent> <leader><space> :FzfFiles<Cr>
nmap <silent> <leader>sw :FzfRG <C-r><C-w><Cr>
nmap <silent> <leader>/ :FzfRG<Cr>
nmap <silent> <leader>, :FzfBuffers<Cr>
nmap <silent> <leader>uC :FzfColors<Cr>

nmap <silent> <leader>G :Git<Cr>:only<Cr>
nmap <silent> <leader>gg :!lazygit<Cr>
nmap <leader>gp :!git pull<Cr>
nmap <leader>gP :!git push<Cr>
nmap <silent> <leader>gl :Git log<Cr>
