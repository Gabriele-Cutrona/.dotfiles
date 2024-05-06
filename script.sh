sudo pacman -S hyprland

### Chaotic AUR ###
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
sudo echo "[chaotic-aur]" >> /etc/pacman.conf
sudo echo "Include = /etc/pacman.d/chaotic-mirrorlist" >> /etc/pacman.conf
### End Chaotic AUR ###

sh <(curl -L https://nixos.org/nix/install) --daemon
sudo echo "experimental-features = nix-command flakes" >> /etc/nix/nix.conf
sudo pacman -S blackbox-terminal
