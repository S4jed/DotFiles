#!/bin/sh

# Colors
CYAN=`tput setaf 6`
BOLD=`tput bold`
RESET=`tput sgr0`

echo ${BOLD}${CYAN}[+] Installing Compton compositor${RESET}
sudo pacman -S compton --noconfirm --needed

echo ${BOLD}${CYAN}[+] Making a backup from previous Compton config if exists${RESET}
[ -d ~/.config/compton ] && mv ~/.config/compton ~/.config/compton.$(date +%s).bak

echo ${BOLD}${CYAN}[+] Copying Compton config${RESET}
cp ../.config/compton ~/.config -r
