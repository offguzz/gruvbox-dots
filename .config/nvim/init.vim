set nu rnu cursorline nowrap ignorecase smartcase tabstop=2 shiftwidth=2 expandtab wildoptions=pum showcmd nocompatible noswapfile incsearch foldmethod=indent undofile undolevels=10000
set clipboard+=unnamed,unnamedplus

let g:netrw_banner = 0
let g:netrw_liststyle = 0

colorscheme retrobox

nmap <C-c> <Esc>
vmap <C-c> <Esc>
nmap <space>w <C-w>
nmap <space>gp :!git add ~/gruvbox-dots/ && git commit -m "commit" && git push<CR>
nmap <space>rr :so ~/.config/nvim/init.vim<Cr>
nmap <space>fc :e ~/.config/nvim/init.vim<Cr>
nmap <space><Cr> :Ex<Cr> 
nmap <space>, :ls<Cr>:b! 
nmap <space>1 `1
nmap <space>2 `2
nmap <space>3 `3
nmap <space>4 `4
nmap <space>5 `5
nmap <space>6 `6
nmap <space>7 `7
nmap <space>8 `8
nmap <space>9 `9
nmap <space>0 `0
cmap <C-h> <BS>
cmap <C-j> <Down>
cmap <C-k> <Up>
cmap <C-b> <Left>
cmap <C-f> <Right>
cmap <C-a> <Home>
cmap <C-e> <End>
cmap <C-d> <Delete>
cmap <C-o> <C-f>
nmap <space>t :term<Cr>i
nmap <Esc> :nohl<Cr>
tmap <Esc><Esc> <C-\><C-n>
nmap <space>q :copen<Cr>
nmap <space>Q :cclose<Cr>
nmap [q :cprev<Cr>
nmap ]q :cnext<Cr>
nmap [Q :cfirst<Cr>
nmap ]Q :clast<Cr>
vmap <S-k> :m '<-2<CR>gv=gv
vmap <S-j> :m '>+1<CR>gv=gv
nmap <space>s/ :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>
nmap <space>s. :s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>
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
execute "set <M-char-60>=\e<"
imap <M-char-60> <C-o>gg
execute "set <M-char-62>=\e>"
imap <M-char-62> <C-o>G
execute "set <M-char-125>=\e}"
imap <M-char-125> <C-o>}
execute "set <M-char-123>=\e{"
imap <M-char-123> <C-o>{
imap <C-/> <C-o>u
nmap <leader>/ :grep -r --exclude-dir=.git --exclude-dir=node_modules  .<Left><Left>
nmap <leader>? :grep

function! Find()
    let files = []
    let find_output = systemlist('find . -type f -not -path ''*/.git/*''')
    if v:shell_error != 0
        echohl ErrorMsg
        echo "Erro ao executar 'find'"
        echohl None
        return
    endif

    let files = find_output

    let input = input('Find for > ')
    if empty(input)
        return
    endif
    let input = tolower(input)

    let filtered = []
    for file in files
        if tolower(file) =~ input
            call add(filtered, file)
        endif
    endfor

    let match_count = len(filtered)  " Changed from 'count' to 'match_count'

    if match_count == 0
        echohl WarningMsg
        echo "No File Found."
        echohl None
        return
    endif

    let qf_entries = []
    for file in filtered
        call add(qf_entries, {'filename': file, 'lnum': 1, 'col': 1, 'text': file})
    endfor

    call setqflist([], ' ', {
        \ 'title': 'Find Results for "' .. input .. '"' ,
        \ 'items': qf_entries
        \ })

    if match_count == 1
        execute 'edit ' . fnameescape(filtered[0])
    else
        copen
    endif
endfunction
noremap <silent> <space><space> :call Find()<CR>
