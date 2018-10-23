#!/bin/sh

# Colors
CYAN=`tput setaf 6`
BOLD=`tput bold`
RESET=`tput sgr0`

echo ${BOLD}${CYAN}[+] Installing VLC Player${RESET}
sudo pacman -S vlc --noconfirm --needed

echo ${BOLD}${CYAN}[+] Making a backup from previous VLC config if exists${RESET}
[ -d ~/.config/vlc ] && mv ~/.config/vlc ~/.config/vlc.$(date +%s).bak

echo ${BOLD}${CYAN}[+] Copying VLC Config${RESET}
cp ../.config/vlc ~/.config -r

