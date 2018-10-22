#!/bin/bash

echo [+] Installing NeoFetch
sudo pacman -S neofetch --noconfirm --needed

echo [+] Making a backup from previous NeoFetch config if exists
[ -d ~/.config/neofetch ] && mv ~/.config/neofetch ~/.config/neofetch.$(date +%s).bak

echo [+] Copying NeoFetch config
cp ../.config/neofetch ~/.config -r
