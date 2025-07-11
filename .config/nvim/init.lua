vim.cmd[[
set nu rnu cursorline nowrap ignorecase smartcase tabstop=2 shiftwidth=2 expandtab wildoptions=pum showcmd noswapfile incsearch foldmethod=indent undofile undolevels=10000 clipboard+=unnamed,unnamedplus nohlsearch linebreak

let mapleader="\ "  

let g:netrw_banner = 0

nmap <silent> <leader>w <C-w>

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

nmap <silent> [b :bp!<Cr>
nmap <silent> ]b :bn!<Cr>

nmap <silent> <leader><Cr> :Ex<Cr>

imap <silent> <C-a> <Home>
imap <silent> <C-f> <Right>
imap <silent> <C-p> <Up>
imap <silent> <C-n> <Down>
imap <silent> <C-b> <Left>
imap <silent> <C-e> <End>
imap <silent> <C-d> <Del>
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

call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
call plug#end()

let g:fzf_colors =
\  { 'fg':      ['fg', 'Normal'],
\  'bg':      ['bg', 'Normal'],
\  'query':   ['fg', 'Normal'],
\  'hl':      ['fg', 'Comment'],
\  'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
\  'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
\  'hl+':     ['fg', 'Statement'],
\  'info':    ['fg', 'PreProc'],
\  'border':  ['fg', 'Comment'],
\  'prompt':  ['fg', 'Conditional'],
\  'pointer': ['fg', 'Exception'],
\  'marker':  ['fg', 'Keyword'],
\  'spinner': ['fg', 'Label'],
\  'header':  ['fg', 'Comment'] } 

nmap <silent> <leader><space> :Files<Cr>
nmap <silent> <leader>/ :RG<Cr>
nmap <silent> <leader>, :Buffers<Cr>
nmap <silent> <leader>uC :Colors<Cr>

nmap <silent> <leader>G :Git<Cr>:only<Cr>

set termguicolors
set background=dark
colorscheme gruvbox
]]
