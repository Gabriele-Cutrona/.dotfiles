#!/usr/bin/env sh

echo "Enabling systemd-timesyncd and systemd-resolved"
sudo ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf
sudo systemctl enable --now systemd-timesyncd systemd-resolved

sudo pacman -S git git-lfs --noconfirm
echo "Insert here your git user.name"
read -r GIT_USERNAME
echo "Insert here your git user.email"
read -r GIT_EMAIL
git config --global user.name "$GIT_USERNAME" --replace-all
git config --global user.email "$GIT_EMAIL" --replace-all
git config --global color.ui auto
git config --global init.defaultBranch main

sudo pacman -S git-delta git-cliff --noconfirm
git config --global core.pager delta
git config --global interactive.diffFilter 'delta --color-only'
git config --global delta.navigate true
git config --global merge.conflictStyle zdiff3

echo "Do you want to run the following? y/n"
echo "git config --global gpg.format ssh"
echo "git config --global user.signingkey ~/.ssh/id_ed25519.pub"
read -r GIT_SIGNING

if [[ $GIT_SIGNING == "y" ]]; then
	git config --global gpg.format ssh
	git config --global user.signingkey ~/.ssh/id_ed25519.pub
fi

echo "Do you want to enable automatic gpg signing? y/n"
echo "(git config --global commit.gpgsign true)"
read -r GIT_AUTOSIGN

if [[ $GIT_AUTOSIGN == "y" ]]; then
	git config --global commit.gpgsign true
fi

sudo pacman -S rustup --noconfirm
rustup default stable
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ..

# echo "Installing hyprland"
# sudo pacman -Sy hyprland xdg-desktop-portal-hyprland

sudo pacman -Sy hyprpaper hyprlock hypridle hyprpolkitagent xdg-desktop-portal xdg-desktop-portal-gtk xdg-desktop-portal-gnome --noconfirm

paru -S wlogout --noconfirm

echo "Installing niri"
sudo pacman -Sy niri xwayland-satellite --noconfirm

echo "Installing plasma (base, no apps)"
sudo pacman -S plasma ark

echo "Installing papirus-icon-theme swaync fastfetch (hyfetch) eza bat sl zoxide fzf cava neovim yazi wl-clipboard lazygit pamixer playerctl brightnessctl"
sudo pacman -S papirus-icon-theme --noconfirm
sudo pacman -S swaync --noconfirm
sudo pacman -Sy fastfetch onefetch hyfetch eza bat jq less sl lolcat toilet zoxide fzf neovim yazi ripgrep fd duf wl-clipboard lazygit pamixer playerctl brightnessctl --noconfirm
sudo pacman -S sshfs prettier --noconfirm
sudo pacman -S just uv python --noconfirm
cargo install cargo-update
cargo install rsmoji # my project :3

sudo pacman -S cava --noconfirm

echo "Do you want to install timeshift for btrfs? y/n"
read -r TIMESHIFT

if [[ $TIMESHIFT == "y" ]]; then
	echo "Installing timeshift for btrfs"
	sudo pacman -Sy timeshift btrfs-progs grub-btrfs xorg-xhost --noconfirm
fi

echo "Configuring the terminal (ghostty zsh)"
sudo pacman -S ghostty unzip unarchiver zip zsh --noconfirm
sudo pacman -S zsh-autosuggestions zsh-syntax-highlighting --noconfirm
sudo pacman -S ttf-jetbrains-mono-nerd noto-fonts-cjk noto-fonts-emoji otf-font-awesome --noconfirm
sudo pacman -S vivid starship --noconfirm
chsh -s $(which zsh)

echo "Do you want to install wezterm-git? (needs compiling from AUR)"
read -r WEZTERM

if [[ $WEZTERM == "y" ]]; then
	paru -Syu wezterm-git --noconfirm
fi

echo "Installing libnotify nautilus waybar gnome-keyring seahorse"
sudo pacman -S libnotify nautilus waybar nwg-drawer network-manager-applet python --noconfirm
paru -S anyrun --noconfirm
sudo pacman -S gnome-keyring seahorse --noconfirm

sudo pacman -S pavucontrol --noconfirm

echo "Do you want bluetooth? y/n"
read -r BLUETOOTH

if [[ $BLUETOOTH == "y" ]]; then
	sudo pacman -S bluez bluez-utils blueman --noconfirm
	sudo systemctl enable --now bluetooth
fi

echo "Installing and enabling pipewire"
sudo pacman -S pipewire pipewire-pulse pipewire-jack pipewire-alsa wireplumber alsa-utils --noconfirm

systemctl enable --now pipewire --user
systemctl enable --now pipewire-pulse --user
systemctl enable --now wireplumber --user

sudo pacman -S nwg-look wget --noconfirm
wget https://github.com/catppuccin/cursors/releases/download/v2.0.0/catppuccin-mocha-mauve-cursors.zip
unzip catppuccin-mocha-mauve-cursors.zip -d ~/.icons

git clone https://github.com/vinceliuice/Colloid-gtk-theme.git
cd Colloid-gtk-theme
./install.sh --theme purple --color dark --tweaks catppuccin black
cd ..

sudo pacman -S qt6ct kvantum --noconfirm

echo "do you want to install sddm and set its theme to catppuccin? (y/n)"
read -r SDDM

if [[ $SDDM == "y" ]]; then
	sudo pacman -S sddm --noconfirm
	wget https://github.com/catppuccin/sddm/releases/download/v1.0.0/catppuccin-mocha.zip
	sudo unzip catppuccin-mocha.zip -d /usr/share/sddm/themes
	sudo sh -c "echo \"[Theme]\" > /etc/sddm.conf"
	sudo sh -c "echo \"Current=catppuccin-mocha\" >> /etc/sddm.conf"

	sudo sh -c "echo \"[IconTheme]\" > /usr/share/icons/default/index.theme"
	sudo sh -c "echo \"Inherits=catppuccin-mocha-mauve-cursors\" >> /usr/share/icons/default/index.theme"
	sudo systemctl enable sddm
fi

echo "do you want to set GRUB catppuccin theme? (y/n)"
read -r GRUB

if [[ $GRUB == "y" ]]; then
	git clone https://github.com/catppuccin/grub.git
	sudo cp -r grub/src/catppuccin-mocha-grub-theme /boot
	sudo sh -c "echo \"GRUB_THEME=\"/boot/catppuccin-mocha-grub-theme/theme.txt\"\" >> /etc/default/grub"
	sudo grub-mkconfig -o /boot/grub/grub.cfg
fi

echo "Do you need opentabletdriver? y/n"
read -r OPENTABLETDRIVER

if [[ $OPENTABLETDRIVER == "y" ]]; then
	paru -S aur/opentabletdriver --noconfirm
	systemctl --user enable --now opentabletdriver.service
fi

echo "Do you want to install fcitx5-im and fcitx5-mozc? y/n"
read -r FCITX5

if [[ $FCITX5 == "y" ]]; then
	sudo pacman -S fcitx5-im fcitx5-mozc --noconfirm
	git clone https://github.com/catppuccin/fcitx5.git
	mkdir -p ~/.local/share/fcitx5/themes/
	cp -r ./fcitx5/src/* ~/.local/share/fcitx5/themes
fi

sudo pacman -S stow --noconfirm

echo "Keyd with my config? (caps lock = esc if pressed, ctrl if hold / alt + hjkl = arrows, alt+shift+h/l = backspace/delete) y/n"
read -r KEYD
if [[ $KEYD == "y" ]]; then
	sudo pacman -S keyd --noconfirm
	sudo systemctl enable keyd
	sudo cp ./.keyd.conf /etc/keyd/default.conf
	sudo systemctl start keyd
fi

echo "Do you want to install some apps I use? y/n"
read -r APPS

if [[ $APPS == "y" ]]; then
	sudo pacman -S resources --noconfirm
	sudo pacman -S anki --noconfirm
	flatpak install flathub org.localsend.localsend_app
	sudo pacman -S obsidian telegram-desktop signal-desktop discord --noconfirm
	sudo pacman -S proton-vpn-gtk-app --noconfirm
	flatpak install flathub app.zen_browser.zen
	paru -S proton-authenticator-bin --noconfirm
	sudo pacman -S rnote xournalpp --noconfirm
	
	sudo pacman -S loupe mpv vlc vlc-plugin-x264 gnome-sound-recorder qbittorrent --noconfirm
	sudo pacman -S dua-cli ncdu rsync yt-dlp tealdeer trash-cli --noconfirm
	sudo pacman -S android-tools --noconfirm
	paru -S topgrade-bin mpvpaper --noconfirm

	sudo pacman -S hyperfine --noconfirm

	sudo pacman -S steam prismlauncher gamemode gamescope --noconfirm
	flatpak install flathub com.vysp3r.ProtonPlus
	flatpak install flathub sh.ppy.osu

	sudo pacman -S flatpak --noconfirm
	paru -S heroic-games-launcher-bin --noconfirm
	flatpak install flathub org.vinegarhq.Sober

	flatpak install flathub com.super_productivity.SuperProductivity

	flatpak install flathub io.github.wivrn.wivrn
	
	sudo pacman -S torbrowser-launcher calibre --noconfirm

	sudo pacman -S hyprpicker --noconfirm
	sudo pacman -S audacity blender lmms gimp krita kdenlive obs-studio --noconfirm
	sudo pacman -S godot --noconfirm
	flatpak install flathub com.orama_interactive.Pixelorama

	sudo pacman -S gparted exfatprogs htop btop --noconfirm
	
	sudo pacman -S qemu-full virt-manager swtpm --noconfirm
	paru -S quickemu --noconfirm
	sudo systemctl enable --now libvirtd

	sudo pacman -S docker docker-compose docker-buildx rclone --noconfirm
	sudo systemctl enable --now docker
	sudo usermod -aG docker $USER

	sudo pacman -S tailscale --noconfirm
	sudo systemctl enable --now tailscaled
	sudo pacman -S nextcloud-client cifs-utils nautilus-share gvfs-smb veracrypt --noconfirm
	
	sudo pacman -S zed --noconfirm
	paru -S visual-studio-code-bin --noconfirm

	wget https://github.com/OrcaSlicer/OrcaSlicer/releases/download/v2.3.2/OrcaSlicer-Linux-flatpak_V2.3.2_x86_64.flatpak
	flatpak install OrcaSlicer-Linux-flatpak_V2.3.2_x86_64.flatpak

	rm *.flatpak
fi

rm -rfv catppuccin-mocha-mauve-cursors.zip catppuccin-mocha.zip
rm -rfv  Colloid-gtk-theme fcitx5 grub paru
echo "Do you want to run stow .? y/n"
read -r STOW

if [[ $STOW == "y" ]]; then
	rm -rf ~/.config/hypr
	rm -rf ~/.config/niri
	rm -rf ~/.config/cava
	rm -rf ~/.config/fcitx5
	rm -rf ~/.config/nushell
	rm -rf ~/.config/ghostty
	rm -rf ~/.config/wezterm
	rm -rf ~/.config/qt6ct
	rm -rf ~/.config/fastfetch/config.jsonc
	rm ~/.zshrc
	rm ~/.bashrc
	stow .
	bat cache --build
fi

echo "Do you want printing (cups + hplip)? y/n"
read -r CUPS

if [[ $CUPS == "y" ]]; then
	sudo pacman -S cups cups-pdf hplip --noconfirm
	sudo systemctl enable --now cups
	sudo pacman -S system-config-printer --noconfirm
fi

echo "The end! Here's a list of thing you have to do manually: (because i'm lazy)"
echo "1. If you want to catppuccin your tty, https://github.com/catppuccin/tty"
echo "2. Apply the correct cursor, icon theme, font and dark mode preference in nwg-look and qt6ct"
