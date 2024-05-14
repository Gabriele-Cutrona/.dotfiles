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

Configurations are managed by [home-manager](https://github.com/nix-community/home-manager):
- Waybar configuration from [morrolinux](https://github.com/morrolinux/LinuxRices)

> A little note, the `script.sh` is just for reference, so it's probably not a good idea to try to run it [since i don't even know bash (yet)], and even if you want to run it, make sure you're using Arch Linux or an Arch based distro

## Tree
- **Dotfiles**, where (most) configurations belong
   - **hypr**, Hyprland configurations (~/.config/hypr)
      - **img.png**, Hyprlock photo, change it with whatever you like
      - **bg.png**, a background i made on canva, change it with whatever you like
      - **hyprland.conf - hyprlock.conf - hyprpaper.conf**, Hyprland!
   - **themes**, catppuccin-mocha for gtk (~/.themes)
   - **waybar**, waybar configuration (~/.config/waybar)
   - **wofi**, wofi configuration (~/.config/wofi)
   - **Catppuccin-Mocha.json**, BlackBox terminal theme
   - **zshrc**, zsh configuration (oh-my-zsh) (~/.zshrc)
- **README.md**, this file
- **flake.lock - flake.nix - home.nix**, home-manager files
- **init.lua**, neovim configuration (i know, i should use more than one .lua file)
- **script.sh**, bash list of all programs and things installed

## todo
- [x] Neovim (~~nixvim?~~ standalone)
   - [ ] Split init.lua in more files
- [ ] My own waybar config
- [x] My own wofi config
