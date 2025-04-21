if [ -n "$PS1" ] && [ -z "$TMUX" ]; then
   TERM=xterm-256color tmux
fi

echo
hyfetch # This uses fastfetch as a backend, specified in ~/.config/hyfetch.json
python ~/.dotfiles/.shtart/splash.py

export ZSH="$HOME/.oh-my-zsh"
export NIXPKGS_ALLOW_UNFREE=1

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="agnoster"
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(sudo zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

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

# bun completions
[ -s "/home/gabriele-cutrona/.bun/_bun" ] && source "/home/gabriele-cutrona/.bun/_bun"

# pnpm
export PNPM_HOME="/home/gabriele-cutrona/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
