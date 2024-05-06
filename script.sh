sudo pacman -S hyprland
sh <(curl -L https://nixos.org/nix/install) --daemon
sudo echo "experimental-features = nix-command flakes" >> /etc/nix/nix.conf
