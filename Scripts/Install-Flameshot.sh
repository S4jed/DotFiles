#!/bin/sh

# Colors
CYAN=`tput setaf 6`
BOLD=`tput bold`
RESET=`tput sgr0`

echo ${BOLD}${CYAN}[+] Installing Flameshot${RESET}
sudo pacman -S flameshot --noconfirm --needed

echo ${BOLD}${CYAN}[+] Making a backup from previous Flameshot config if exists${RESET}
[ -d ~/.config/Dharkael ] && mv ~/.config/Dharkael ~/.config/Dharkael.$(date +%s).bak

echo ${BOLD}${CYAN}[+] Copying Flameshot config${RESET}
cp ../.config/Dharkael ~/.config -r
