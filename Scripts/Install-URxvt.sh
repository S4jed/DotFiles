#!/bin/sh

# Colors
CYAN=`tput setaf 6`
BOLD=`tput bold`
RESET=`tput sgr0`

# FixMe
./Install-Trizen.sh

echo ${BOLD}${CYAN}[+] Installing URxvt Terminal${RESET}
trizen -S rxvt-unicode-pixbuf --noconfirm --needed

echo ${BOLD}${CYAN}[+] Installing Perl Modules for URxvt${RESET}
sudo pacman -S urxvt-perls --noconfirm --needed

echo ${BOLD}${CYAN}[+] Making a backup from previous URxvt resource if exists${RESET}
[ -f ~/.Xdefaults ] && mv ~/.Xdefaults ~/.Xdefaults.$(date +%s).bak

echo ${BOLD}${CYAN}[+] Copying URxvt resource to home directory${RESET}
cp ../.Xdefaults ~/.Xdefaults
