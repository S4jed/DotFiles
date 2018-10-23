#!/bin/sh

# Colors
CYAN=`tput setaf 6`
BOLD=`tput bold`
RESET=`tput sgr0`

echo ${BOLD}${CYAN}[+] Installing Rofi${RESET}
sudo pacman -S rofi --noconfirm --needed

echo ${BOLD}${CYAN}[+] Making a backup from previous Rofi config if exists${RESET}
[ -d ~/.config/rofi ] && mv ~/.config/rofi ~/.config/rofi.$(date +%s).bak

echo ${BOLD}${CYAN}[+] Copying Rofi config${RESET}
cp ../.config/rofi ~/.config -r
