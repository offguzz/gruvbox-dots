set nu rnu cursorline nowrap ignorecase smartcase tabstop=2 shiftwidth=2 expandtab wildoptions=pum showcmd nocompatible noswapfile incsearch foldmethod=indent undofile undolevels=10000 clipboard+=unnamed,unnamedplus

let g:netrw_banner = 0
let g:netrw_liststyle = 0
set guicursor = ""

colorscheme retrobox

nmap <space><Cr> :Ex<Cr>
lmap <C-h> <BS>
lmap <C-j> <Down>
lmap <C-k> <Up>
lmap <C-b> <Left>
lmap <C-f> <Right>
lmap <C-a> <Home>
lmap <C-e> <End>
lmap <C-d> <Delete>
cmap <C-o> <C-f>
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
    let match_count = len(filtered)
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
