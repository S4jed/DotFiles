#!/bin/sh

# Colors
CYAN=`tput setaf 6`
BOLD=`tput bold`
RESET=`tput sgr0`

Trizen()
{

    echo ${BOLD}${CYAN}[+] Installing Trizen for Aur Packages${RESET}
    git clone https://aur.archlinux.org/trizen.git && cd trizen && makepkg -si --noconfirm --needed

    echo ${BOLD}${CYAN}[+] Cleaning up Trizen\'s Cloned directory${RESET}
    cd ../ && sudo rm -rf trizen
}

Git()
{
    echo ${BOLD}${CYAN}[+] Installing Git${RESET}
    sudo pacman -S git --noconfirm --needed
}

pacman -Qs git > /dev/null
[ "$?" != "0" ] && Git

pacman -Qs trizen > /dev/null
[ "$?" != "0" ] && Trizen
