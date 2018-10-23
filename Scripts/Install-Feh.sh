#!/bin/sh

echo [+] Installing Feh
sudo pacman -S feh --noconfirm --needed

echo [+] Making a backup from previous Feh config if exists
[ -d ~/.config/feh ] && mv ~/.config/feh ~/.config/feh.$(date +%s).bak

echo [+] Copying Feh config
cp ../.config/feh ~/.config -r
