#!/bin/sh

# Colors
CYAN=`tput setaf 6`
BOLD=`tput bold`
RESET=`tput sgr0`

echo ${BOLD}${CYAN}[+] Installing Feh${RESET}
sudo pacman -S feh --noconfirm --needed

echo ${BOLD}${CYAN}[+] Making a backup from previous Feh config if exists${RESET}
[ -d ~/.config/feh ] && mv ~/.config/feh ~/.config/feh.$(date +%s).bak

echo ${BOLD}${CYAN}[+] Copying Feh config${RESET}
cp ../.config/feh ~/.config -r
