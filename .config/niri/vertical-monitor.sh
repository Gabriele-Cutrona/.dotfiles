#!/usr/bin/env sh

# this file switches between two configs, I use this to switch my secondary monitor from vertical to horizontal mode

notify-send changed!

cp ~/.dotfiles/.config/niri/monitor.kdl ~/.dotfiles/.config/niri/monitor.tmp.kdl
mv ~/.dotfiles/.config/niri/monitor.off.kdl ~/.dotfiles/.config/niri/monitor.kdl
mv ~/.dotfiles/.config/niri/monitor.tmp.kdl ~/.dotfiles/.config/niri/monitor.off.kdl
