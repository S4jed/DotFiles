#!/bin/bash

echo [+] Installing Ranger
sudo pacman -S ranger --noconfirm --needed

echo [+] Installing archive tools for Ranger
sudo pacman -S p7zip zip unzip unrar --noconfirm --needed

echo [+] Making a backup from previous Ranger config if exists
[ -d ~/.config/ranger ] && mv ~/.config/ranger ~/.config/ranger.$(date +%s).bak

echo [+] Copying Ranger Config
cp ../.config/ranger ~/.config -r

