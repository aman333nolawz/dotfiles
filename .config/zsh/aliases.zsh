alias man="batman"
alias cat="bat"
alias grep="rg"
alias find="fd"
alias ls="lsd"
alias vim="nvim"
alias v="nvim"
alias wget="aria2c"

# Colored output
export LESS='-R --use-color -Dd+r$Du+b'
alias ip='ip -color=auto'
alias grep='grep --color=auto'
alias diff='diff --color=auto'

# Dotfiles config
alias dots='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias reload="exec zsh"
