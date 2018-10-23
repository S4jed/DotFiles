#!/bin/sh

# Colors
CYAN=`tput setaf 6`
BOLD=`tput bold`
RESET=`tput sgr0`

echo ${BOLD}${CYAN}[+] Installing Ranger${RESET}
sudo pacman -S ranger --noconfirm --needed

echo ${BOLD}${CYAN}[+] Installing archive tools for Ranger${RESET}
sudo pacman -S p7zip zip unzip unrar --noconfirm --needed

echo ${BOLD}${CYAN}[+] Making a backup from previous Ranger config if exists${RESET}
[ -d ~/.config/ranger ] && mv ~/.config/ranger ~/.config/ranger.$(date +%s).bak

echo ${BOLD}${CYAN}[+] Copying Ranger Config${RESET}
cp ../.config/ranger ~/.config -r

