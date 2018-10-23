#!/bin/sh

# Colors
CYAN=`tput setaf 6`
BOLD=`tput bold`
RESET=`tput sgr0`

echo ${BOLD}${CYAN}[+] Installing NeoFetch${RESET}
sudo pacman -S neofetch --noconfirm --needed

echo ${BOLD}${CYAN}[+] Making a backup from previous NeoFetch config if exists${RESET}
[ -d ~/.config/neofetch ] && mv ~/.config/neofetch ~/.config/neofetch.$(date +%s).bak

echo ${BOLD}${CYAN}[+] Copying NeoFetch config${RESET}
cp ../.config/neofetch ~/.config -r
