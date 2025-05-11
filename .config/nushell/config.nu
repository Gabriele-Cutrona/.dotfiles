$env.TERM = "xterm-256color"

source ./catppuccin_mocha.nu
source ~/.cache/.zoxide.nu
source ~/.cache/.mise.nu

$env.LS_COLORS = (vivid generate catppuccin-mocha)
$env.config.show_banner = false
$env.editor = "nvim"
$env.config.edit_mode = 'vi'
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

hyfetch # This uses fastfetch as a backend, specified in ~/.config/hyfetch.json
python ~/.dotfiles/.shtart/splash.py

alias s = ssh-add

def l [folder?] { ls -la ($folder | default ".") | select mode name target user group size }
alias la = ls -a
alias cat = bat
alias z = zoxide
alias vi = nvim
alias vim = nvim
alias lg = lazygit
alias rm = rm -v
alias cp = cp -v
alias mv = mv -v
alias trash = trash -v

$env.PATH = ($env.PATH | split row (char esep) | append "~/.local/bin")
$env.PATH = ($env.PATH | split row (char esep) | append "~/.cargo/bin")

$env.PNPM_HOME = $"/home/($env.user)/.local/share/pnpm"
$env.PATH = ($env.PATH | split row (char esep) | append "~/.local/share/pnpm")

$env.PATH = ($env.PATH | split row (char esep) | append "~/.bun/bin")
