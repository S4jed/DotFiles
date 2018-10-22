#!/bin/bash

echo [+] Installing Compton compositor
sudo pacman -S compton --noconfirm --needed

echo [+] Making a backup from previous Compton config if exists
[ -d ~/.config/compton ] && mv ~/.config/compton ~/.config/compton.$(date +%s).bak

echo [+] Copying Compton config
cp ../.config/compton ~/.config -r
