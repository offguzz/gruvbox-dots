set nu rnu cursorline nowrap ignorecase smartcase tabstop=2 shiftwidth=2 expandtab wildoptions=pum showcmd nocompatible noswapfile incsearch foldmethod=indent undofile undolevels=10000 clipboard+=unnamed,unnamedplus guicursor = ""
"let g:netrw_banner = 0
"let g:netrw_liststyle = 0

colorscheme retrobox
nmap <space><Cr> :Ex<Cr>
nmap <space>q :copen<Cr>
nmap <space>Q :cclose<Cr>
nmap ]q :cnext<Cr>
nmap [q :cprev<Cr>
imap <C-h> <BS>
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-b> <Left>
imap <C-f> <Right>
imap <C-a> <Home>
imap <C-e> <End>
imap <C-d> <Delete>
cmap <C-h> <BS>
cmap <C-j> <Down>
cmap <C-k> <Up>
cmap <C-b> <Left>
cmap <C-f> <Right>
cmap <C-a> <Home>
cmap <C-e> <End>
cmap <C-d> <Delete>
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
    let input = input('Find for > ')
    if empty(input)
        return
    endif
    let escaped_input = shellescape('*' . input . '*')
    let find_output = systemlist('find . -type f -not -path ''*/.git/*'' -iname ' . escaped_input)
    if v:shell_error != 0
        echohl ErrorMsg
        echo "Erro ao executar 'find'"
        echohl None
        return
    endif
    let match_count = len(find_output)
    if match_count == 0
        echohl WarningMsg
        echo "No File Found."
        echohl None
        return
    endif
    let qf_entries = []
    for file in find_output
        call add(qf_entries, {'filename': file, 'lnum': 1, 'col': 1, 'text': file})
    endfor
    call setqflist([], ' ', {
        \ 'title': 'Find Results for "' .. input .. '"' ,
        \ 'items': qf_entries
        \ })
    if match_count == 1
        execute 'edit ' . fnameescape(find_output[0])
    else
        copen
    endif
endfunction
noremap <silent> <space><space> :call Find()<CR>


function! FzfSelectFile()
  let l:command = 'find . -type f -not -path ''*/.git/*'' | fzf --tmux'
  let l:file = system(l:command)
  if v:shell_error == 0 && !empty(l:file)
    execute 'edit ' . fnameescape(trim(l:file))
  endif
endfunction

nnoremap <silent> <Space>ff :call FzfSelectFile()<CR>
