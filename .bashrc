[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# set -o vi

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' --color=fg:#ebdbb2,bg:#282828,hl:#b16286 --color=fg+:#689d6a,bg+:#32302f,hl+:#d3869b --color=info:#d65d0e,prompt:#458588,pointer:#fe8019 --color=marker:#8ec07c,spinner:#cc241d,header:#fabd2f'

export PATH="$HOME/scripts:$PATH"

export EDITOR=nvim
alias vim=nvim
