# dotFiles

## Tools
| General          | Specific                            | General      | Specific                                    |
|:----------------:|:-----------------------------------:|:------------:|:-------------------------------------------:|
| Operating System | [Arch Linux](https://archlinux.org) | Compositor   | [Hyprland](https://hyprland.org)            |
| Terminal         | Alacritty                           | App Launcher | rofi-wayland                                |
| Shell            | zsh (oh-my-zsh)                     | Theme        | [Catppuccin](https://github.com/catppuccin) |
| Shell theme      | powerlevel10k                       | Screen Lock  | Hyprlock                                    |
| Editor           | Neovim                              | Wallpaper    | Hyprpaper                                   |

<div>
   <img width="100" src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/archlinux/archlinux-original.svg" />
   <img width="100" height="100" src="https://wiki.hyprland.org/favicon.svg" />
   <img width="100" src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/bash/bash-original.svg" />
   <img width="100" src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/neovim/neovim-original.svg" />
   <img width="100" src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/lua/lua-original.svg" />
   <img width="100" src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/css3/css3-original.svg" />
   <img width="100" src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/logos/exports/1544x1544_circle.png" />
</div>
<br />

Configurations are managed with [GNU Stow](https://www.gnu.org/software/stow)

> The script.sh is very basic, it asks you some questions but I think you should read it before executing it (and if you want to run it, make sure you're on Arch Linux, or an Arch based distro with systemd)

## Custom
- To use your own wallpaper:
   - Make sure it's named bg.png
   - Put it under .config/hypr
- To use your own hyprlock image:
   - Make sure it's named img.png
   - Put it under .config/hypr

## Other
I don't know where to put this things:
- Anki addons: [ReColor](https://ankiweb.net/shared/info/688199788) with [Catppuccin](https://github.com/catppuccin/anki), [Review Heatmap](https://ankiweb.net/shared/info/1771074083), [AnkiConnect](https://ankiweb.net/shared/info/2055492159)
- All catppuccin [userstyles](https://github.com/catppuccin/userstyles)
- [Catppuccin Firefox Colors](https://github.com/catppuccin/firefox)

## todo
- [x] Neovim (~~nixvim?~~ standalone)
   - [x] Split init.lua in more files
   - [ ] Use `$NVIM_APPNAME` to switch between nvim configs
- [x] My own waybar config
- [x] Rofi config
- [x] Themes should be installed better (e.g. not copied from `/usr`)
   - [ ] Is there a way to install kvantum themes automatically?
     
### Credits
The icons up there are from [devicon.dev](https://devicon.dev) (except for the Hyprland and Catppuccin logos)

<sup>All logos are property of their respective owners</sup>
