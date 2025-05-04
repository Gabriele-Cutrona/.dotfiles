if [ -n "$PS1" ] && [ -z "$TMUX" ]; then
   tmux
fi

export TERM=xterm-256color

HISTFILE=/home/$USER/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(ssh-agent -s)" > /tmp/sshagentpid
alias s="ssh-add"

hyfetch # This uses fastfetch as a backend, specified in ~/.config/hyfetch.json
python ~/.dotfiles/.shtart/splash.py

alias ls="eza --icons"
alias l="eza --icons -lah"
alias la="eza --icons -a"
alias exa="eza --icons"
alias eza="eza --icons"
alias cat="bat"
alias z="zoxide"

alias vi="nvim"
alias vim="nvim"
bindkey -v
bindkey -M viins 'jk' vi-cmd-mode
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

export PATH=$HOME/.local/bin:$PATH
export EDITOR="nvim"

eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/config.json)"

# pnpm
export PNPM_HOME="/home/$USER/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

eval "$(mise activate zsh)"

# bun completions
[ -s "/home/gabriele-cutrona/.bun/_bun" ] && source "/home/gabriele-cutrona/.bun/_bun"
