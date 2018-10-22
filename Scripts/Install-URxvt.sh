#!/bin/bash

echo [+] Installing URxvt Terminal and Perl Modules for URxvt
sudo pacman -S rxvt-unicode urxvt-perls --noconfirm --needed

echo [+] Making a backup from previous URxvt resource if exists
[ -f ~/.Xdefaults ] && mv ~/.Xdefaults ~/.Xdefaults.$(date +%s).bak

echo [+] Copying URxvt resource to home directory
cp ../.Xdefaults ~/.Xdefaults
