#!/usr/bin/bash

echo "Installing hyprland"
sudo pacman -S hyprland hyprpaper hyprlock hyprpicker polkit-gnome xdg-desktop-portal xdg-desktop-portal-hyprland xdg-desktop-portal-gtk
echo "Enabling systemd-timesyncd"
sudo systemctl enable --now systemd-timesyncd

sudo pacman -S git
echo "Insert here your git user.name"
read -r GIT_USERNAME
echo "Insert here your git user.email"
read -r GIT_EMAIL
git config --global user.name $GIT_USERNAME --replace-all
git config --global user.email $GIT_EMAIL --replace-all
git config --global color.ui auto
git config --global init.defaultBranch main

echo "Installing papirus-icon-theme mako fastfetch eza bat sl zoxide fzf cava neovim wl-clipboard lazygit pamixer brightnessctl grimblast"
sudo pacman -S papirus-icon-theme mako
sudo pacman -S fastfetch eza bat sl zoxide fzf cava neovim wl-clipboard lazygit pamixer brightnessctl grimblast

echo "Do you want to enable chaotic aur? (https://aur.chaotic.cx) y/n"
read -r $CHAOTIC_AUR

if [[ $CHAOTIC_AUR == "y" ]]; then
   echo "Enabling Chaotic Aur"
   sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
   sudo pacman-key --lsign-key 3056513887B78AEB
   sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
   sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
   sudo sh -c "echo \"[chaotic-aur]\" >> /etc/pacman.conf"
   sudo sh -c "echo \"Include = /etc/pacman.d/chaotic-mirrorlist\" >> /etc/pacman.conf"
fi

echo "Do you want to install timeshift for btrfs? y/n"
read -r TIMESHIFT

if [[ $TIMESHIFT == "y" ]]; then
   echo "Installing timeshift for btrfs"
   sudo pacman -Sy timeshift btrfs-progs grub-btrfs timeshift-autosnap xorg-xhost
fi

echo "Configuring the terminal (blackbox zsh)"
### Terminal ###
sudo pacman -S blackbox-terminal zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo pacman -S ttf-jetbrains-mono-nerd noto-fonts-cjk noto-fonts-emoji # Set this font into blackbox
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
### End Terminal ###

echo "Do you want flatpak? y/n"
read -r FLATPAK

if [[ $FLATPAK == "y" ]]; then
   sudo pacman -S flatpak
   flatpak -u override --filesystem=/usr/share/icons/:ro
   flatpak -u override --filesystem=/home/$USER/.icons/:ro 
   flatpak -u override --filesystem=xdg-config/gtk-3.0:ro
   flatpak -u override --filesystem=$HOME/.themes
   flatpak -u override --env=GTK_THEME=Catppuccin-Mocha-Standard-Lavender-Dark
   flatpak -u override --env=XCURSOR_PATH=~/.icons
   flatpak install kvantum # All of them
   flatpak install org.kde.PlatformTheme.QGnomePlatform # All of them
   flatpak override -u --filesystem=xdg-config/Kvantum:ro
   flatpak override -u --env=QT_STYLE_OVERRIDE=kvantum
fi

echo "Installing libnotify nautilus wofi waybar xwaylandvideobridge gnome-keyring seahorse"
sudo pacman -S libnotify nautilus wofi waybar
sudo pacman -S xwaylandvideobridge gnome-keyring seahorse

echo "Do you want to install paru? (and rustup) y/n"
read -r PARU

if [[ $PARU == "y" ]]; then
   sudo pacman -S rustup
   rustup default stable
   git clone https://aur.archlinux.org/paru-git.git
   cd paru-git
   makepkg -si
fi

sudo pacman -S gedit pavucontrol

echo "Do you want bluetooth? y/n"
read -r BLUETOOTH

if [[ $BLUETOOTH == "y" ]]; then
   sudo pacman -S bluez bluez-utils blueman
   sudo systemctl enable --now bluetooth
fi

echo "Installing and enabling pipewire"
sudo pacman -S pipewire pipewire-pulse pipewire-jack pipewire-alsa wireplumber

systemctl enable --now pipewire --user
systemctl enable --now pipewire-pulse --user
systemctl enable --now wireplumber --user

sudo pacman -S catppuccin-cursors-mocha nwg-look
sudo cp /usr/share/icons ~/.icons -r

sudo pacman -S kvantum # Manually configure it with https://github.com/catppuccin/kvantum

echo "sddm and GRUB catppuccin theme"
### sddm and GRUB catppuccin ###
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
### End sddm and GRUB catppuccin ###

echo "Do you want waydroid? y/n"
read -r WAYDROID

if [[ $WAYDROID == "y" ]]; then
   sudo pacman -S waydroid python-pyclip
   sudo waydroid init
fi


sudo pacman -S otf-font-awesome

echo "Do you need opentabletdriver? y/n"
read -r OPENTABLETDRIVER

if [[ $OPENTABLETDRIVER == "y" ]]; then
   paru -S aur/opentabletdriver-git
   systemctl --user enable --now opentabletdriver.service
fi

echo "Do you want to install fcitx5-im and fcitx5-mozc? y/n"
read -r FCITX5

if [[ $FCITX5 == "y" ]]; then
   sudo pacman -S fcitx5-im fcitx5-mozc
fi

sudo pacman -S stow

echo "Do you want to install some apps I use? y/n"
echo "resources warehouse flatseal anki telegram localsend onlyoffice osu obsidian appimagelauncher protonvpn topgrade floorp"
read -r APPS

if [[ $APPS == "y" ]]; then
   flatpak install net.nokyan.Resources
   flatpak install WareHouse
   flatpak install flatseal
   flatpak install anki
   flatpak install telegram
   paru -S aur/localsend-bin
   sudo pacman -S onlyoffice-bin
   wget https://github.com/ppy/osu/releases/latest/download/osu.AppImage
   AppImageLauncher osu.AppImage
   wget https://github.com/obsidianmd/obsidian-releases/releases/download/v1.5.12/Obsidian-1.5.12.AppImage
   AppImageLauncher Obsidian-1.5.12.AppImage
   paru -S proton-vpn-gtk-app network-manager-applet appimagelauncher
   sudo pacman -S topgrade floorp
fi


echo "The end! Here's a list of thing you have to do manually: (because i'm lazy)"
echo "If you want to theme qt apps with catppuccin, go to https://github.com/catppuccin/kvantum and install it into kvantummanager"
echo "If you want to theme qt apps in flatpak, install kvantum and org.kde.PlatformTheme.QGnomePlatform, every version (ok, maybe not the unsupported ones)"
echo "If you want to use blackbox as your terminal, configure the Jetbrain Nerd Font into the settings, and set catppuccin-mocha as coloscheme"
