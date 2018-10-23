#!/bin/sh

# Colors
CYAN=`tput setaf 6`
BOLD=`tput bold`
RESET=`tput sgr0`

echo ${BOLD}${CYAN}[+] Installing URxvt Terminal and Perl Modules for URxvt${RESET}
sudo pacman -S rxvt-unicode urxvt-perls --noconfirm --needed

echo ${BOLD}${CYAN}[+] Making a backup from previous URxvt resource if exists${RESET}
[ -f ~/.Xdefaults ] && mv ~/.Xdefaults ~/.Xdefaults.$(date +%s).bak

echo ${BOLD}${CYAN}[+] Copying URxvt resource to home directory${RESET}
cp ../.Xdefaults ~/.Xdefaults
