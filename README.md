# dotFiles
|General|Specific|
|:------------:|:--------:|
|Terminal|Blackbox|
|Shell|zsh (oh-my-zsh)|
|Shell theme|powerlevel10k|
|Editor|Neovim + VSCode|
|Compositor|[Hyprland](https://hyprland.org/)|
|App Launcher|Wofi|
|Theme|[Catppuccin](https://github.com/catppuccin/)|
|Screen Lock|Hyprlock|

Configurations are managed by [home-manager](https://github.com/nix-community/home-manager):
- Various themes by [catppuccin](https://github.com/catppuccin)
- Wofi configuration from [here](https://github.com/nabakdev/dotfiles/tree/main/.config/wofi)
- Waybar configuration from [morrolinux](https://github.com/morrolinux/LinuxRices)

> A little note, the `script.sh` is just for reference, so it's probably not a good idea to try to run it [since i don't even know bash (yet)]

## todo
- [x] Neovim (~~nixvim?~~ standalone)
   - [ ] Split init.lua in more files
- [ ] My own waybar config
- [ ] My own wofi config
