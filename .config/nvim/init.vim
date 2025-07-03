set nu rnu cursorline nowrap ignorecase smartcase tabstop=2 shiftwidth=2 expandtab wildoptions=pum showcmd nocompatible noswapfile incsearch foldmethod=indent undofile undolevels=10000 clipboard+=unnamed,unnamedplus guicursor = ""

colorscheme retrobox
nmap <space><Cr> :Ex<Cr>

function! FuzzyFindFiles()
  let tmpfile = tempname()
  let cmd = printf("sh -c 'fzf > %s'", shellescape(tmpfile))

  if has('nvim')
    " Neovim: janela flutuante com termopen
    let width = float2nr(&columns * 0.6)
    let height = float2nr(&lines * 0.4)
    let row = float2nr((&lines - height) / 2)
    let col = float2nr((&columns - width) / 2)

    let buf = nvim_create_buf(v:false, v:true)
    let win = nvim_open_win(buf, v:true, {
          \ 'relative': 'editor',
          \ 'width': width,
          \ 'height': height,
          \ 'row': row,
          \ 'col': col,
          \ 'style': 'minimal',
          \ 'border': 'single',
          \ })

    call termopen(cmd, {
          \ 'on_exit': {-> execute('call s:HandleResult("'.tmpfile.'", '.buf.', '.win.')') }
          \ })

    startinsert
  else
    " Vim: apenas executa o fzf e pega o resultado diretamente
    silent execute '!fzf > ' . shellescape(tmpfile)
    call s:HandleResult(tmpfile, -1, -1)
  endif
endfunction

function! s:HandleResult(tmpfile, buf, win)
  if has('nvim') && a:win != -1 && nvim_win_is_valid(a:win)
    call nvim_win_close(a:win, v:true)
  endif

  if has('nvim') && a:buf != -1
    call nvim_buf_delete(a:buf, {'force': v:true})
  endif

  if filereadable(a:tmpfile)
    let lines = readfile(a:tmpfile)
    call delete(a:tmpfile)

    if !empty(lines)
      execute 'edit ' . fnameescape(lines[0])
    endif
  endif
endfunction

nnoremap <silent> <space><space> :call FuzzyFindFiles()<CR>
