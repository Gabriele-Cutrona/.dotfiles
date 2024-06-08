# dotFiles

## Tools
| General          | Specific                            | General      | Specific                                    |
|:----------------:|:-----------------------------------:|:------------:|:-------------------------------------------:|
| Operating System | [Arch Linux](https://archlinux.org) | Compositor   | [Hyprland](https://hyprland.org)            |
| Terminal         | Blackbox                            | App Launcher | Wofi                                        |
| Shell            | zsh (oh-my-zsh)                     | Theme        | [Catppuccin](https://github.com/catppuccin) |
| Shell theme      | powerlevel10k                       | Screen Lock  | Hyprlock                                    |
| Editor           | Neovim                              | Wallpaper    | Hyprpaper                                   |

<div>
   <img width="100" src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/archlinux/archlinux-original.svg" />
   <img width="100" src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/bash/bash-original.svg" />
   <img width="100" src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/neovim/neovim-original.svg" />
   <img width="100" src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/lua/lua-original.svg" />
</div>
<br />

Configurations are managed with [GNU Stow](https://www.gnu.org/software/stow):

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
- [x] My own waybar config
- [x] My own wofi config
- [ ] Catppuccin themes should be installed better (e.g. not copied from `/usr`)
   - [ ] Is there a way to install kvantum themes automatically?
     
### Credits
The icons up there are from [devicon.dev](https://devicon.dev)

<details>
    <summary>Logos</summary>
    All logos are property of their respective owners
</details>
