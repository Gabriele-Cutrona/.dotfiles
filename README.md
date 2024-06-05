# dotFiles
|General|Specific|
|:------------:|:--------:|
|Operating System|[Arch Linux](https://archlinux.org)|
|Terminal|Blackbox|
|Shell|zsh (oh-my-zsh)|
|Shell theme|powerlevel10k|
|Editor|Neovim + VSCode|
|Compositor|[Hyprland](https://hyprland.org)|
|App Launcher|Wofi|
|Theme|[Catppuccin](https://github.com/catppuccin)|
|Screen Lock|Hyprlock|
|Wallpaper|Hyprpaper|

Configurations are managed with [GNU Stow](https://www.gnu.org/software/stow):
- Waybar configuration from [morrolinux](https://github.com/morrolinux/LinuxRices)

> The script.sh is very basic, it asks you some questions but I think you should read it before executing it (and if you want to run it, make sure you're on Arch Linux, or an Arch based distro with systemd)

## Custom
- To use your own wallpaper:
   - Make sure it's named bg.png
   - Put it under .config/hypr
- To use your own hyprlock image:
   - Make sure it's named img.png
   - Put it under .config/hypr

## todo
- [x] Neovim (~~nixvim?~~ standalone)
   - [ ] Split init.lua in more files
   - [ ] Use `$NVIM_APPNAME` to switch between nvim configs
- [ ] My own waybar config
- [x] My own wofi config
- [ ] Catppuccin themes should be installed better (e.g. not copied from `/usr`)
   - [ ] Is there a way to install kvantum themes automatically?
