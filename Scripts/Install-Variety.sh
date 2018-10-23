#!/bin/sh

echo [+] Installing Variety
sudo pacman -S variety --noconfirm --needed

echo [+] Making a backup from previous Variety config if exists
[ -d ~/.config/variety ] && mv ~/.config/variety ~/.config/variety.$(date +%s).bak

echo [+] Copying Variety config
cp ../.config/variety ~/.config -r
