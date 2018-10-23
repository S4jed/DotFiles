#!/bin/sh

echo [+] Installing lxappearance
sudo pacman -S lxappearance --noconfirm --needed

echo [+] Installing Adwaita, Adwaita-Dark, HighConstrant Themes
trizen -S gnome-themes-extra --noconfirm --needed

echo [+] Installing Numix-Round-Icons
trizen -S numix-circle-icon-theme-git --noconfirm --needed

echo [+] Components have been installed. You may run lxappearance to customize your appearance
