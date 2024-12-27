# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

eval "$(oh-my-posh init bash --config ~/.config/oh-my-posh/config.json)"

alias ls="eza --icons"
alias l="eza --icons -lah"
alias la="eza --icons -a"
alias exa="eza --icons"
alias eza="eza --icons"
alias cat="bat"
alias z="zoxide"

alias vi="nvim"
alias vim="nvim"

alias cp="cp -v"
alias mv="mv -v"
alias rm="rm -v"
alias trash="trash -v"

eval "$(zoxide init --cmd cd bash)"
source <(fzf --bash)

export PATH=$HOME/.local/bin:$PATH
export EDITOR="nvim"

eval "`fnm env`"
