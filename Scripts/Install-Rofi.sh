#!/bin/sh

echo [+] Installing Rofi
sudo pacman -S rofi --noconfirm --needed

echo [+] Making a backup from previous Rofi config if exists
[ -d ~/.config/rofi ] && mv ~/.config/rofi ~/.config/rofi.$(date +%s).bak

echo [+] Copying Rofi config
cp ../.config/rofi ~/.config -r
