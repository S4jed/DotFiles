#!/bin/sh

# Colors
CYAN=`tput setaf 6`
BOLD=`tput bold`
RESET=`tput sgr0`

echo ${BOLD}${CYAN}[+] Installing lxappearance${RESET}
sudo pacman -S lxappearance --noconfirm --needed

echo ${BOLD}${CYAN}[+] Installing Adwaita, Adwaita-Dark, HighConstrant Themes${RESET}
trizen -S gnome-themes-extra --noconfirm --needed

echo ${BOLD}${CYAN}[+] Installing Numix-Round-Icons${RESET}
trizen -S numix-circle-icon-theme-git --noconfirm --needed

echo ${BOLD}${CYAN}[+] Components have been installed. You may run lxappearance to customize your appearance${RESET}
