sudo pacman -S hyprland polkit-kde-agent
sudo systemctl enable --now systemd-timesyncd

sudo pacman -S noto-fonts-cjk

### Chaotic AUR ###
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
sudo sh -c "echo \"[chaotic-aur]\" >> /etc/pacman.conf"
sudo sh -c "echo \"Include = /etc/pacman.d/chaotic-mirrorlist\" >> /etc/pacman.conf"
### End Chaotic AUR ###
sudo pacman -Sy timeshift btrfs-progs grub-btrfs timeshift-autosnap xorg-xhost

sh <(curl -L https://nixos.org/nix/install) --daemon
sudo sh -c "echo \"experimental-features = nix-command flakes\" >> /etc/nix/nix.conf"

nix run home-manager/master -- init --switch

bash

sudo pacman -S blackbox-terminal
sudo pacman -S zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo pacman -S extra/ttf-jetbrains-mono-nerd # Set this font into blackbox
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sudo chsh gabriele-cutrona
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

sudo pacman -S flatpak # https://github.com/catppuccin/gtk
flatpak install net.nokyan.Resources
flatpak install flathub io.github.shiftey.Desktop
flatpak install WareHouse
flatpak install flatseal
sudo pacman -S libnotify

sudo pacman -S topgrade floorp

sudo pacman -S nautilus
sudo pacman -S wofi waybar

sudo pacman -S xwaylandvideobridge
sudo pacman -S gnome-keyring seahorse

sudo pacman -S rustup
rustup default stable
git clone https://aur.archlinux.org/paru-git.git
cd paru-git
makepkg -si

sudo pacman -S distrobox podman
distrobox create -i ubuntu:24.04 -n Ubuntu-24.04 --home ~/Ubuntu
distrobox enter Ubuntu-24.04
sudo apt install nala
exit
