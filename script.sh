sudo pacman -S hyprland polkit-kde-agent xdg-desktop-portal xdg-desktop-portal-hyprland xdg-desktop-portal-gtk
sudo systemctl enable --now systemd-timesyncd

### Chaotic AUR ###
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
sudo sh -c "echo \"[chaotic-aur]\" >> /etc/pacman.conf"
sudo sh -c "echo \"Include = /etc/pacman.d/chaotic-mirrorlist\" >> /etc/pacman.conf"
### End Chaotic AUR ###
sudo pacman -Sy timeshift btrfs-progs grub-btrfs timeshift-autosnap xorg-xhost

### Nix ###
sh <(curl -L https://nixos.org/nix/install) --daemon
sudo sh -c "echo \"experimental-features = nix-command flakes\" >> /etc/nix/nix.conf"

bash
nix run home-manager/master -- init --switch
### End Nix ###

### Terminal ###
sudo pacman -S blackbox-terminal zsh github-desktop
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo pacman -S ttf-jetbrains-mono-nerd noto-fonts-cjk noto-fonts-emoji # Set this font into blackbox
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
### End Terminal ###

sudo pacman -S flatpak
### Flatpak User Theming ###
flatpak -u override --filesystem=/usr/share/icons/:ro
flatpak -u override --filesystem=/home/$USER/.icons/:ro 
flatpak -u override --filesystem=xdg-config/gtk-3.0:ro
flatpak -u override --filesystem=$HOME/.themes
flatpak -u override --env=GTK_THEME=Catppuccin-Mocha-Standard-Lavender-Dark
flatpak -u override --env=XCURSOR_PATH=~/.icons
### End Flatpak User Theming ###

flatpak install net.nokyan.Resources
flatpak install WareHouse
flatpak install flatseal
flatpak install anki

sudo pacman -S libnotify

sudo pacman -S topgrade floorp

sudo pacman -S nautilus wofi waybar
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

sudo pacman -S gedit pavucontrol
sudo pacman -S bluez bluez-utils blueman
sudo systemctl enable --now bluetooth

systemctl enable --now pipewire --user
systemctl enable --now pipewire-pulse --user

paru -S proton-vpn-gtk-app network-manager-applet appimagelauncher

sudo pacman -S catppuccin-cursors-mocha nwg-look
sudo cp /usr/share/icons ~/.icons -r

sudo pacman -S kvantum
sudo pacman -S qt5ct qt6ct

wget https://github.com/catppuccin/sddm/releases/download/v1.0.0/catppuccin-mocha.zip
sudo mv catppuccin-mocha.zip /usr/share/sddm/themes/
cd /usr/share/sddm/themes/
sudo unzip /usr/share/sddm/themes/catppuccin-mocha.zip
sudo sh -c "echo \"[Theme]\" >> /etc/sddm.conf"
sudo sh -c "echo \"Current=catppuccin-mocha\" >> /etc/sddm.conf"

git clone https://github.com/catppuccin/grub.git && cd grub
sudo cp -r src/catppuccin-mocha-grub-theme /boot
sudo sh -c "echo \"GRUB_THEME=\"/boot/catppuccin-mocha-grub-theme/theme.txt\"\" >> /etc/default/grub"
sudo grub-mkconfig -o /boot/grub/grub.cfg

sudo pacman -S waydroid python-pyclip
sudo waydroid init

wget https://github.com/ppy/osu/releases/latest/download/osu.AppImage
AppImageLauncher osu.AppImage

wget https://github.com/obsidianmd/obsidian-releases/releases/download/v1.5.12/Obsidian-1.5.12.AppImage
AppImageLauncher Obsidian-1.5.12.AppImage
