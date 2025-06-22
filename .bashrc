[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

export PATH="$HOME/scripts:$PATH"

export EDITOR=nvim

alias vim=nvim

alias :d='git add . && git commit -m "commit"'
