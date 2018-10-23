#!/bin/sh

echo [+] Installing Flameshot
sudo pacman -S flameshot --noconfirm --needed

echo [+] Making a backup from previous Flameshot config if exists
[ -d ~/.config/Dharkael ] && mv ~/.config/Dharkael ~/.config/Dharkael.$(date +%s).bak

echo [+] Copying Flameshot config
cp ../.config/Dharkael ~/.config -r
