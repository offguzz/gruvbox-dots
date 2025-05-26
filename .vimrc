set nu rnu cursorline nowrap ignorecase smartcase tabstop=2 shiftwidth=2 expandtab path=** showcmd nocompatible noswapfile incsearch
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo")
    call mkdir($HOME."/.vim/undo", "", 0700)
endif
set undodir=~/.vim/undo
set undofile
set undolevels=10000

let mapleader="\ "  

let g:netrw_banner = 0
let g:netrw_liststyle = 0

nmap g<leader> `
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

nmap <leader>sg :grep -R  .<Left><Left>
nmap <leader>sG :grep

nmap [b :bp!<Cr>
nmap ]b :bn!<Cr>
nmap <leader>sb :ls<Cr> :b! 

nmap <leader><Cr> :Ex<Cr>

vmap <S-k> :m '<-2<CR>gv=gv
vmap <S-j> :m '>+1<CR>gv=gv

nmap <leader>s/ :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>
nmap <leader>s. :s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

nmap <C-d> <C-d>zz
nmap <C-u> <C-u>zz
nmap j gj
vmap j gj
vmap k gk
nmap k gk

nmap n nzz 
nmap N Nzz 

imap <C-a> <Home>
imap <C-f> <Right>
imap <C-b> <Left>
imap <C-e> <End>
imap <C-d> <Del>
execute "set <M-char-102>=\ef"
imap <M-char-102> <C-Right>
execute "set <M-char-98>=\eb"
imap <M-char-98> <C-Left>
execute "set <M-char-100>=\ed"
imap <M-char-100> <C-o>dw

nmap <leader>tn :ter<Cr><C-w>j:w<Cr><C-w>c
tmap <Esc><Esc> <C-\><C-n>
tmap <C-h> <C-w>h
tmap <C-j> <C-w>j
tmap <C-k> <C-w>k
tmap <C-l> <C-w>l

nmap ]q :cnext<Cr>
nmap ]Q :clast<Cr>
nmap [q :cprev<Cr>
nmap [Q :cfirst<Cr>
function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        copen
    else
        cclose
    endif
endfunction
nnoremap <silent> <leader>xq :call ToggleQuickFix()<cr>

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif 

call plug#begin()
Plug 'ghifarit53/tokyonight-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

nmap <leader>sw :RG <C-r><C-w><Cr>
nmap <leader>/ :RG<Cr>
nmap <leader><space> :Files<Cr>
nmap <leader>, :Buffers<Cr>
nmap <leader>uC :Colors<Cr>

"set termguicolors
set background=dark
colorscheme retrobox
