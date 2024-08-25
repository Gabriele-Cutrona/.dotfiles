#!/usr/bin/bash

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
echo "git config --global user.signingkey ~/.ssh/id_ed25519.pub"
read -r GIT_SIGNING

if [[ $GIT_SIGNING == "y" ]]; then
   git config --global gpg.format ssh
   git config --global user.signingkey ~/.ssh/id_ed25519.pub
fi

echo "Enabling Chaotic Aur"
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
sudo sh -c "echo \"[chaotic-aur]\" >> /etc/pacman.conf"
sudo sh -c "echo \"Include = /etc/pacman.d/chaotic-mirrorlist\" >> /etc/pacman.conf"

echo "Installing hyprland"
sudo pacman -Sy hyprland hyprpaper hyprlock polkit-gnome xdg-desktop-portal xdg-desktop-portal-hyprland xdg-desktop-portal-gtk
echo "Installing plasma-workspace and konsole (as fallback)"
sudo pacman -S plasma-workspace konsole

echo "Installing papirus-icon-theme mako fastfetch eza bat sl zoxide fzf cava neovim yazi wl-clipboard lazygit pamixer brightnessctl grimblast"
sudo pacman -S papirus-icon-theme mako
sudo pacman -Sy fastfetch eza bat less sl lolcat zoxide fzf cava neovim yazi ripgrep fd wl-clipboard lazygit pamixer brightnessctl grimblast

echo "Do you want to install timeshift for btrfs? y/n"
read -r TIMESHIFT

if [[ $TIMESHIFT == "y" ]]; then
   echo "Installing timeshift for btrfs"
   sudo pacman -Sy timeshift btrfs-progs grub-btrfs timeshift-autosnap xorg-xhost
fi

echo "Configuring the terminal (kitty/alacritty zsh)"
### Terminal ###
sudo pacman -S kitty alacritty zsh
echo "\n\n!!! When oh-my-zsh finished installing, it will drop you in a new shell, run exit to get back to the script !!!\n\n"
sleep 10
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo pacman -S ttf-jetbrains-mono-nerd noto-fonts-cjk noto-fonts-emoji
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
   flatpak -u override --env=GTK_THEME=Colloid-Purple-Dark-Catppuccin
   flatpak -u override --env=XCURSOR_PATH=~/.icons
   flatpak install kvantum # All of them
   flatpak install org.kde.PlatformTheme.QGnomePlatform # All of them
   flatpak override -u --filesystem=xdg-config/Kvantum:ro
   flatpak override -u --env=QT_STYLE_OVERRIDE=kvantum
   flatpak override -u --env=XCURSOR_THEME=Catppuccin-Mocha-Lavender-Cursors
fi

echo "Installing libnotify nautilus waybar xwaylandvideobridge gnome-keyring seahorse"
sudo pacman -S libnotify nautilus waybar nwg-drawer rofi-wayland network-manager-applet
sudo pacman -S xwaylandvideobridge gnome-keyring seahorse

echo "Do you want to install paru? (and rustup) y/n"
read -r PARU

if [[ $PARU == "y" ]]; then
   sudo pacman -S rustup
   rustup default stable
   git clone https://aur.archlinux.org/paru-bin.git
   cd paru-bin
   makepkg -si
   cd ..
fi

sudo pacman -S pavucontrol

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

sudo pacman -S catppuccin-cursors-mocha nwg-look unzip
wget https://github.com/catppuccin/cursors/releases/download/v0.3.1/catppuccin-mocha-lavender-cursors.zip
unzip catppuccin-mocha-lavender-cursors.zip -d ~/.icons

git clone https://github.com/vinceliuice/Colloid-gtk-theme.git
cd Colloid-gtk-theme
./install.sh --theme purple --color dark --tweaks catppuccin black
cd ..

sudo pacman -S kvantum # Manually configure it with https://github.com/catppuccin/kvantum

echo "sddm and GRUB catppuccin theme"
### sddm and GRUB catppuccin ###
wget https://github.com/catppuccin/sddm/releases/download/v1.0.0/catppuccin-mocha.zip
sudo unzip catppuccin-mocha.zip -d /usr/share/sddm/themes
sudo sh -c "echo \"[Theme]\" > /etc/sddm.conf"
sudo sh -c "echo \"Current=catppuccin-mocha\" >> /etc/sddm.conf"

sudo sh -c "echo \"[IconTheme]\" > /usr/share/icons/default/index.theme"
sudo sh -c "echo \"Inherits=catppuccin-mocha-lavender-cursors\" >> /usr/share/icons/default/index.theme"

git clone https://github.com/catppuccin/grub.git
sudo cp -r grub/src/catppuccin-mocha-grub-theme /boot
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
   git clone https://github.com/catppuccin/fcitx5.git
   mkdir -p ~/.local/share/fcitx5/themes/
   cp -r ./fcitx5/src/* ~/.local/share/fcitx5/themes
fi

echo "Do you want to install fnm? (nodejs) y/n"
read -r FNM

if [[ $FNM == "y" ]]; then
   curl -fsSL https://fnm.vercel.app/install | bash
   fnm use 20
fi

sudo pacman -S tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

sudo pacman -S stow

echo "Do you want to install some apps I use? y/n"
echo "resources flatseal anki telegram localsend onlyoffice osu obsidian appimagelauncher protonvpn topgrade zen browser..."
read -r APPS

if [[ $APPS == "y" ]]; then
   flatpak install flathub net.nokyan.Resources
   flatpak install flathub com.github.tchx84.Flatseal
   flatpak install flathub net.ankiweb.Anki
   flatpak install flathub org.telegram.desktop
   flatpak install flathub sh.ppy.osu
   flatpak install flathub org.localsend.localsend_app
   flatpak install flathub org.onlyoffice.desktopeditors
   flatpak install flathub md.obsidian.Obsidian
   flatpak install flathub org.cryptomator.Cryptomator
   flatpak install flathub com.protonvpn.www
   flatpak install flathub nz.mega.MEGAsync
   flatpak install flathub org.upscayl.Upscayl
   flatpak install flathub io.github.zen_browser.zen
   flatpak install flathub com.github.xournalpp.xournalpp
   flatpak install flathub com.google.ChromeDev
   
   sudo pacman -S loupe gnome-sound-recorder
   flatpak install flathub io.github.peazip.PeaZip
   sudo pacman -S ncdu grsync yt-dlp tldr trash-cli
   sudo pacman -S android-tools
   paru -S aur/topgrade-bin

   # curl -fsSL https://bun.sh/install | bash
   # sudo pacman -S ngrok quickemu
   sudo systemctl enable --now sshd

   sudo pacman -S hyperfine

   flatpak install flathub com.valvesoftware.Steam
   flatpak install flathub com.modrinth.ModrinthApp
   
   sudo pacman -S torbrowser-launcher calibre
   sudo pacman -S syncthing # upterm
   flatpak install flathub tv.kodi.Kodi

   paru -S aur/hyprpicker
   flatpak install flathub org.kde.krita
   flatpak install flathub com.obsproject.Studio
   flatpak install https://nightly.gnome.org/repo/appstream/org.gimp.GIMP.flatpakref
   sudo pacman -S audacity blender lmms tracktion-waveform

   sudo pacman -S distrobox podman
   flatpak install flathub io.github.dvlv.boxbuddyrs

   sudo pacman -S geekbench gparted
   flatpak install flathub com.usebottles.bottles

   flatpak install flathub de.haeckerfelix.Fragments
   flatpak install flathub io.github.gamingdoom.Datcord
fi

echo "Do you want to run stow .? y/n"
read -r STOW

if [[ $STOW == "y" ]]; then
   rm -rf ~/.config/hypr
   rm ~/.zshrc
   rm -rf ~/.config/cava
   stow .
   bat cache --build
fi

echo "Do you want cups (printing)? y/n"
read -r CUPS

if [[ $CUPS == "y" ]]; then
   sudo pacman -S cups cups-pdf hplip
   sudo systemctl enable --now cups
   sudo pacman -S system-config-printer
fi

echo "The end! Here's a list of thing you have to do manually: (because i'm lazy)"
echo "If you want to theme qt apps with catppuccin, go to https://github.com/catppuccin/kvantum and install it into kvantummanager"
echo "If you want to theme qt apps in flatpak, install kvantum and org.kde.PlatformTheme.QGnomePlatform, every version (ok, maybe not the unsupported ones)"
if [[ $APPS == "y" ]]; then
   echo "Run \`corepack enable pnpm\` and/or \`corepack enable yarn\` in a new shell if you need them"
fi
echo "If you want to catppuccin your tty, https://github.com/catppuccin/tty"

