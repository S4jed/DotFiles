#!/bin/sh

# Colors
CYAN=`tput setaf 6`
BOLD=`tput bold`
RESET=`tput sgr0`

echo ${BOLD}${CYAN}[+] Installing Variety${RESET}
sudo pacman -S variety --noconfirm --needed

echo ${BOLD}${CYAN}[+] Making a backup from previous Variety config if exists${RESET}
[ -d ~/.config/variety ] && mv ~/.config/variety ~/.config/variety.$(date +%s).bak

echo ${BOLD}${CYAN}[+] Copying Variety config${RESET}
cp ../.config/variety ~/.config -r
