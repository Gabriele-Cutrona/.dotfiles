# dotFiles

## Tools
| General          | Specific                                                                                         | General      | Specific                                       |
|:----------------:|:------------------------------------------------------------------------------------------------:|:------------:|:----------------------------------------------:|
| Operating System | [Arch Linux](https://archlinux.org)                                                              | Compositor   | [Hyprland](https://hyprland.org)               |
| Terminal         | [Ghostty](https://ghostty.org)                                                                   | App Launcher | [anyrun](https://github.com/anyrun-org/anyrun) |
| Shell            | [nu](https://www.nushell.sh)                                                                     | Theme        | [Catppuccin](https://github.com/catppuccin)    |
| Shell theme      | [starship](https://starship.rs) ([catppuccin](https://starship.rs/presets/catppuccin-powerline)) | Screen Lock  | Hyprlock                                       |
| Editor           | [Neovim](https://neovim.io)                                                                      | Wallpaper    | Hyprpaper                                      |
<div>
   <img width="100" src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/archlinux/archlinux-original.svg" />
   <img width="100" height="100" src="https://wiki.hyprland.org/favicon.svg" />
   <img width="100" src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/bash/bash-original.svg" />
   <img width="100" src="https://github.com/user-attachments/assets/fe853809-ba8b-400b-83ab-a9a0da25be8a" />
   <img width="100" src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/python/python-original.svg" />
   <img width="100" src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/neovim/neovim-original.svg" />
   <img width="100" src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/lua/lua-original.svg" />
   <img width="100" src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/css3/css3-original.svg" />
   <img width="100" src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/logos/exports/1544x1544_circle.png" />
</div>
<br />

Configurations are managed with [GNU Stow](https://www.gnu.org/software/stow), so to apply everything (the script should do it automatically if you say so) you can just `cd ~/.dotfiles` (clone the repo there) and then run `stow .`

> The script.sh is very basic, it asks you some questions but I think you should read it before executing it (and if you want to run it, make sure you're on Arch Linux, or an Arch based distro)

## Custom
- To use your own wallpaper (with hyprpaper) put it in .config/hypr/bg.png
- To use your own hyprlock image put it in .config/hypr/img.png
- If you want to play a video as background, you can use [mpvpaper](https://github.com/GhostNaN/mpvpaper)

## Other
I don't know where to put these things:
- Anki addons: [ReColor](https://ankiweb.net/shared/info/688199788) with [Catppuccin](https://github.com/catppuccin/anki), [Review Heatmap](https://ankiweb.net/shared/info/1771074083), [AnkiConnect](https://ankiweb.net/shared/info/2055492159)
- All catppuccin [userstyles](https://github.com/catppuccin/userstyles)

### Credits
The icons up there are from [devicon.dev](https://devicon.dev) (except for the Hyprland, Catppuccin and Kitty logos, which are from the official websites/repos)

<sup>All logos are property of their respective owners. This repo is not endorsed by any of them.</sup>
