#!/bin/sh

echo [+] Installing VLC Player
sudo pacman -S vlc --noconfirm --needed

echo [+] Making a backup from previous VLC config if exists
[ -d ~/.config/vlc ] && mv ~/.config/vlc ~/.config/vlc.$(date +%s).bak

echo [+] Copying VLC Config
cp ../.config/vlc ~/.config -r

