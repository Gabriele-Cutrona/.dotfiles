#!/bin/sh

echo "Enabling systemd-timesyncd"
sudo systemctl enable --now systemd-timesyncd

sudo pacman -S git
echo "Insert here your git user.name"
read -r GIT_USERNAME
echo "Insert here your git user.email"
read -r GIT_EMAIL
git config --global user.name "$GIT_USERNAME" --replace-all
git config --global user.email "$GIT_EMAIL" --replace-all
git config --global color.ui auto
git config --global init.defaultBranch main

echo "Do you want to run the following? y/n"
echo "git config --global gpg.format ssh"
echo "git config --global user.signingkey ~/.ssh/id_rsa.pub"
read -r GIT_SIGNING

if [[ $GIT_SIGNING == "y" ]]; then
   git config --global gpg.format ssh
   git config --global user.signingkey ~/.ssh/id_rsa.pub
fi

echo "Do you want to enable automatic gpg signing? y/n"
echo "(git config --global commit.gpgsign true)"
read -r GIT_AUTOSIGN

if [[ $GIT_AUTOSIGN == "y" ]]; then
   git config --global commit.gpgsign true
fi

git clone https://aur.archlinux.org/paru-bin.git
cd paru-bin
makepkg -si
cd ..

echo "Installing hyprland"
sudo pacman -Sy hyprland hyprpaper hyprlock hypridle polkit-gnome xdg-desktop-portal xdg-desktop-portal-hyprland xdg-desktop-portal-gtk
paru -S wlogout

echo "Installing papirus-icon-theme swaync fastfetch (hyfetch) eza bat sl zoxide fzf cava neovim yazi wl-clipboard lazygit pamixer brightnessctl grimblast"
sudo pacman -S papirus-icon-theme swaync
sudo pacman -Sy fastfetch onefetch hyfetch eza bat less sl lolcat toilet zoxide fzf neovim yazi ripgrep fd duf wl-clipboard lazygit pamixer brightnessctl
sudo pacman -S mise sshfs
mise use -g node@latest
mise use -g pnpm@latest
mise use -g rust@latest
cargo install cargo-update
cargo install rsmoji

paru -S cava grimblast

echo "Do you want to install timeshift for btrfs? y/n"
read -r TIMESHIFT

if [[ $TIMESHIFT == "y" ]]; then
   echo "Installing timeshift for btrfs"
   sudo pacman -Sy timeshift btrfs-progs grub-btrfs xorg-xhost
   paru -S timeshift-autosnap
fi

echo "Configuring the terminal (kitty zsh)"
### Terminal ###
sudo pacman -S kitty zsh unzip zip
sudo pacman -S ttf-jetbrains-mono-nerd extra/ttf-cascadia-code-nerd noto-fonts-cjk noto-fonts-emoji otf-font-awesome
sudo pacman -S zsh-autosuggestions zsh-syntax-highlighting
curl -s https://ohmyposh.dev/install.sh | bash -s
### End Terminal ###

echo "Do you want flatpak? y/n"
read -r FLATPAK

if [[ $FLATPAK == "y" ]]; then
   sudo pacman -S flatpak
   flatpak -u override --filesystem=/usr/share/icons/:ro
   flatpak -u override --filesystem=/home/$USER/.icons/:ro 
   flatpak -u override --filesystem=xdg-config/gtk-3.0:ro
   flatpak -u override --filesystem=$HOME/.themes
   flatpak -u override --env=GTK_THEME=Colloid-Green-Light-Catppuccin
   flatpak -u override --env=XCURSOR_PATH=~/.icons
   flatpak install kvantum # All of them
   flatpak install org.kde.PlatformTheme.QGnomePlatform # All of them
   flatpak override -u --filesystem=xdg-config/Kvantum:ro
   flatpak override -u --env=QT_STYLE_OVERRIDE=kvantum
   flatpak override -u --env=XCURSOR_THEME=Catppuccin-Latte-Green-Cursors
fi

echo "Installing libnotify nautilus waybar gnome-keyring seahorse"
sudo pacman -S libnotify nautilus waybar nwg-drawer network-manager-applet python
paru -S ulauncher
python3 <(curl https://raw.githubusercontent.com/catppuccin/ulauncher/main/install.py -fsSL) -f latte -a green
sudo pacman -S gnome-keyring seahorse

sudo pacman -S pavucontrol

echo "Do you want bluetooth? y/n"
read -r BLUETOOTH

if [[ $BLUETOOTH == "y" ]]; then
   sudo pacman -S bluez bluez-utils blueman
   sudo systemctl enable --now bluetooth
fi

echo "Installing and enabling pipewire"
sudo pacman -S pipewire pipewire-pulse pipewire-jack pipewire-alsa wireplumber alsa-utils

systemctl enable --now pipewire --user
systemctl enable --now pipewire-pulse --user
systemctl enable --now wireplumber --user

sudo pacman -S nwg-look wget
wget https://github.com/catppuccin/cursors/releases/download/v0.4.0/catppuccin-latte-green-cursors.zip
unzip catppuccin-latte-green-cursors.zip -d ~/.icons

git clone https://github.com/vinceliuice/Colloid-gtk-theme.git
cd Colloid-gtk-theme
./install.sh --theme green --color light --tweaks catppuccin
cd ..

sudo pacman -S kvantum qt5ct qt6ct # Manually configure it with https://github.com/catppuccin/kvantum

echo "sddm and GRUB catppuccin theme"
### sddm and GRUB catppuccin ###
sudo pacman -S sddm
wget https://github.com/catppuccin/sddm/releases/download/v1.0.0/catppuccin-latte.zip
sudo unzip catppuccin-latte.zip -d /usr/share/sddm/themes
sudo sh -c "echo \"[Theme]\" > /etc/sddm.conf"
sudo sh -c "echo \"Current=catppuccin-latte\" >> /etc/sddm.conf"

sudo sh -c "echo \"[IconTheme]\" > /usr/share/icons/default/index.theme"
sudo sh -c "echo \"Inherits=catppuccin-latte-green-cursors\" >> /usr/share/icons/default/index.theme"
sudo systemctl enable sddm

git clone https://github.com/catppuccin/grub.git
sudo cp -r grub/src/catppuccin-latte-grub-theme /boot
sudo sh -c "echo \"GRUB_THEME=\"/boot/catppuccin-latte-grub-theme/theme.txt\"\" >> /etc/default/grub"
sudo grub-mkconfig -o /boot/grub/grub.cfg
### End sddm and GRUB catppuccin ###

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
   git clone https://github.com/catppuccin/fcitx5.git
   mkdir -p ~/.local/share/fcitx5/themes/
   cp -r ./fcitx5/src/* ~/.local/share/fcitx5/themes
fi

sudo pacman -S tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

sudo pacman -S stow

echo "Keyd with my config? y/n"
read -r KEYD
if [[ $KEYD == "y" ]]; then
   sudo pacman -S keyd
   sudo systemctl enable keyd
   sudo cp ./.keyd.conf /etc/keyd/default.conf
   sudo systemctl start keyd
fi

echo "Do you want to install some apps I use? y/n"
echo "resources flatseal anki telegram localsend onlyoffice osu obsidian protonvpn topgrade zen browser..."
read -r APPS

if [[ $APPS == "y" ]]; then
   flatpak install flathub com.github.tchx84.Flatseal
   flatpak install flathub org.onlyoffice.desktopeditors
   sudo pacman -S obsidian telegram-desktop signal-desktop discord
   flatpak install flathub org.cryptomator.Cryptomator
   flatpak install flathub io.github.zen_browser.zen
   
   sudo pacman -S loupe mpv gnome-sound-recorder qbittorrent
   sudo pacman -S dua-cli grsync yt-dlp tealdeer trash-cli
   sudo pacman -S android-tools
   paru -S topgrade-bin mpvpaper

   flatpak install flathub com.valvesoftware.Steam
   
   sudo pacman -S torbrowser-launcher calibre

   sudo pacman -S hyprpicker

   sudo pacman -S gparted exfatprogs btop
   
   sudo pacman -S docker docker-compose docker-buildx rclone
   sudo systemctl enable --now docker

   sudo pacman -S tailscale
   sudo systemctl enable --now tailscaled
   sudo pacman -S cifs-utils
   
   paru -S notion-app-electron
   paru -S visual-studio-code-bin
fi

rm -rfv catppuccin-latte-green-cursors.zip catppuccin-latte.zip Colloid-gtk-theme fcitx5 grub paru-bin
echo "Do you want to run stow .? y/n"
read -r STOW

if [[ $STOW == "y" ]]; then
   rm -rf ~/.config/hypr
   rm -rf ~/.config/cava
   rm -rf ~/.config/fcitx5
   rm ~/.zshrc
   rm ~/.bashrc
   stow .
   bat cache --build
fi

echo "Do you want cups (printing + hplip)? y/n"
read -r CUPS

if [[ $CUPS == "y" ]]; then
   sudo pacman -S cups cups-pdf hplip
   sudo systemctl enable --now cups
   sudo pacman -S system-config-printer
fi

echo "The end! Here's a list of thing you have to do manually: (because i'm lazy)"
echo "1. If you want to theme qt apps with catppuccin, go to https://github.com/catppuccin/kvantum and install it into kvantummanager"
echo "2. If you want to theme qt apps in flatpak, install kvantum and org.kde.PlatformTheme.QGnomePlatform, every version (maybe not the unsupported ones)"
echo "3. If you want to catppuccin your tty, https://github.com/catppuccin/tty"
echo "4. Apply the correct cursor, icon theme, font and dark mode preference in nwg-look and qt5ct/qt6ct"
echo "5. Set the ulauncher theme from the settings (already installed, just select it)"
