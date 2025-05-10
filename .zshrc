if [ -n "$PS1" ] && [ -z "$TMUX" ]; then
   tmux
fi

export TERM=xterm-256color

HISTFILE=/home/$USER/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
autoload -Uz +X compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(ssh-agent -s)" > /tmp/sshagentpid
alias s="ssh-add"

hyfetch # This uses fastfetch as a backend, specified in ~/.config/hyfetch.json

alias ls="eza --icons"
alias l="eza --icons -lah"
alias la="eza --icons -a"
alias exa="eza --icons"
alias eza="eza --icons"
alias cat="bat"
alias z="zoxide"

alias vi="nvim"
alias vim="nvim"
alias lg="lazygit"
bindkey -v
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
KEYTIMEOUT=10

alias cp="cp -v"
alias mv="mv -v"
alias rm="rm -v"
alias trash="trash -v"

alias xit="exit"
alias it="exit"
alias t="exit"

eval "$(zoxide init --cmd cd zsh)"
source <(fzf --zsh)

export PATH=$HOME/.local/bin:$HOME/.cargo/bin:$PATH

export EDITOR="nvim"

eval "$(starship init zsh)"

export PNPM_HOME="/home/$USER/.local/share/pnpm"
case ":$PATH:" in
   *":$PNPM_HOME:"*) ;;
   *) export PATH="$PNPM_HOME:$PATH" ;;
esac

eval "$(mise activate zsh)"

[ -s "/home/gabriele-cutrona/.bun/_bun" ] && source "/home/gabriele-cutrona/.bun/_bun"
