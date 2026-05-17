# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/nolawz/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=9000
SAVEHIST=9000
setopt autocd extendedglob
bindkey -e
# End of lines configured by zsh-newuser-install

ZSH=~/.config/zsh

for file in $ZSH/lib/*;
do
    source $file
done

for plugin in $ZSH/plugins/*;
do
    source $plugin
done

source $ZSH/aliases.zsh
source $ZSH/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
# source $ZSH/prompt.zsh

complete -F _complete_alias dots
complete -F _complete_alias ls

eval "$(starship init zsh)"
