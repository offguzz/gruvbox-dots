vim.cmd('set nu rnu cursorline nowrap ignorecase smartcase tabstop=2 shiftwidth=2 expandtab wildoptions=pum showcmd nocompatible noswapfile incsearch foldmethod=indent undofile undolevels=10000')

vim.opt.clipboard = "unnamedplus"

vim.g.netrw_banner = 0       
vim.g.netrw_liststyle = 0    

vim.cmd('colorscheme retrobox')

vim.cmd([[
nmap <space>w <C-w>
nmap <space>g :!git add . && git commit -m "commit" && git push<CR>
nmap <space><Cr> :Ex<Cr> 
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
cnoremap <C-h> <BS>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Delete>
cnoremap <C-o> <C-f>
nmap <space>t :term<Cr>i
nmap <Esc> :nohl<Cr>
tmap <Esc><Esc> <C-\><C-n>
nmap [q :cprev<Cr>
nmap ]q :cnext<Cr>
nmap [Q :cfirst<Cr>
nmap ]Q :clast<Cr>
nmap <space>q :copen<Cr>
nmap <space>Q :cclose<Cr>
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
]])

local function FZFSelectFile()
  local handle = io.popen("find . -type f | fzf --preview 'cat {}'")
  if not handle then
    vim.notify("Erro ao executar fzf", vim.log.levels.ERROR)
    return
  end

  local result = handle:read("*a")
  handle:close()

  result = result:gsub("%s+$", "")

  if result ~= "" then
    vim.cmd("edit " .. vim.fn.fnameescape(result))
  end
end

vim.api.nvim_create_user_command("FZFOpen", FZFSelectFile, {})

vim.keymap.set("n", "<space><space>", ":FZFOpen<CR>", { noremap = true, silent = true })


local function GrepSearch()
  local input = vim.fn.input("Grep for > ")
  if input == "" then
    return
  end

  local cmd = string.format("grep -rnI --exclude-dir=.git --exclude-dir=node_modules --color=never '%s' .", input)

  local tmp = vim.fn.tempname()
  vim.fn.system(cmd .. " > " .. vim.fn.fnameescape(tmp))

  vim.cmd("cfile " .. tmp)
  vim.cmd("copen")
  os.remove(tmp)
end

vim.api.nvim_create_user_command("Grep", GrepSearch, {})

vim.keymap.set("n", "<space>/", ":Grep<CR>", { noremap = true, silent = true })

