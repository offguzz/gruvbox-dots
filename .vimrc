" My Simple config

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

" Let's save undo info!
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo")
    call mkdir($HOME."/.vim/undo", "", 0700)
endif
set undodir=~/.vim/undo
set undofile
set undolevels=10000
set clipboard+=unnamed,unnamedplus

" Netrw Config
let g:netrw_banner = 0
let g:netrw_liststyle = 0

let mapleader="\ " 

nmap Q <nop>

" Better Marks
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

" vimrc
nmap <leader>rr :so ~/.vimrc<Cr>
nmap <leader>fc :e ~/.vimrc<Cr>

" Window Control 
nmap <leader>w <C-w>

" Terminal
nmap <leader>tn :term<Cr><C-w>j:close<Cr>i
tmap <Esc><Esc> <C-\><C-n>

" Grep
nmap <leader>/ :grep -R  .<Left><Left>
nmap <leader>? :grep 

" QuickFix List
nmap [q :cprev<Cr>
nmap ]q :cnext<Cr>
nmap [Q :cfirst<Cr>
nmap ]Q :clast<Cr>

" Buffers 
nmap [b :bp!<Cr>
nmap ]b :bn!<Cr>
nmap <leader>, :ls<Cr> :b! 

" Vim File Explorer
nmap <leader><Cr> :Ex<Cr>

" Text Managment
vmap <S-k> :m '<-2<CR>gv=gv
vmap <S-j> :m '>+1<CR>gv=gv

" Word Substitution
nmap <leader>s/ :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>
nmap <leader>s. :s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

" Text Movement 
nmap <C-d> <C-d>zz
nmap <C-u> <C-u>zz
nmap j gj
vmap j gj
vmap k gk
nmap k gk

" Search Movement
nmap n nzz 
nmap N Nzz 

" Insert Mode - Emacs Readline
imap <C-a> <Home>
imap <C-f> <Right>
" imap <C-p> <Up>
" imap <C-n> <Down>
imap <C-b> <Left>
imap <C-e> <End>
imap <C-d> <Del>
" M-f
execute "set <M-char-102>=\ef"
imap <M-char-102> <C-Right>
" M-b
execute "set <M-char-98>=\eb"
imap <M-char-98> <C-Left>
" M-d
execute "set <M-char-100>=\ed"
imap <M-char-100> <C-o>dw
" M-<
execute "set <M-char-60>=\e<"
imap <M-char-60> <C-o>gg
" M->
execute "set <M-char-62>=\e>"
imap <M-char-62> <C-o>G
" M-} 
execute "set <M-char-125>=\e}"
imap <M-char-125> <C-o>}
" M-{
execute "set <M-char-123>=\e{"
imap <M-char-123> <C-o>{
" Undo
imap <C-/> <C-o>u

" Command Mode
cnoremap <C-h> <BS>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Delete>
cnoremap <C-o> <C-f>
 
" Theme Settings
set termguicolors
set background=dark
colorscheme retrobox

" Turn Off Syntax
" syntax off

" POST: https://www.reddit.com/r/vim/comments/orfpbd/interactive_fuzzy_finder_in_vim_without_plugins/
function! FZF() abort
    let l:tempname = tempname()
    " fzf | awk '{ print $1":1:0" }' > file
    execute 'silent !fzf --style minimal --no-border --margin 5 --preview "if [ -d {} ]; then tree {}; else cat {}; fi" --multi ' . '| awk ''{ print $1":1:0" }'' > ' . fnameescape(l:tempname)
    try
        execute 'cfile ' . l:tempname
        redraw!
    finally
        call delete(l:tempname)
    endtry
endfunction

" :Files
command! -nargs=* Files call FZF()

" \ff
nnoremap <leader><space> :Files<cr>
