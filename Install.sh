#!/bin/bash

echo [+] Installing Development Tools
sudo pacman -S git cmake --noconfirm --needed

echo [+] Installing Trizen for UnOfficial Packages
git clone https://aur.archlinux.org/trizen.git && cd trizen && makepkg -si --noconfirm --needed

echo [+] Cleaning up Trizen\'s Cloned directory
cd ../ && sudo rm -rf trizen

echo [+] Making a backup from previous ~/Pictures if exists
[ -d ~/Pictures ] && sudo mv ~/Pictures ~/Pictures.$(date +%s).bak

echo [+] Copying Pictures to ~/Pictures
sudo cp ./Pictures ~ -r

echo [+] Changing directory to Scripts
cd ./Scripts

./Install-Appearance.sh
./Install-Fonts.sh
./Install-ZSH.sh
./Install-URxvt.sh
./Install-Compton.sh
./Install-Feh.sh
./Install-Rofi.sh
./Install-Ranger.sh
./Install-Variety.sh
./Install-Flameshot.sh
./Install-NeoFetch.sh
./Install-VLC.sh

echo [+] Installing Tor Service
sudo pacman -S tor --noconfirm --needed

echo [+] Adding Tor to Startup Daemon
sudo systemctl enable tor

echo [+] Installing Telegram Desktop
sudo pacman -S telegram-desktop --noconfirm --needed

echo [+] Installing Firefox
sudo pacman -S firefox --noconfirm --needed

echo [+] Installing Gnome Calculator
sudo pacman -S gnome-calculator --noconfirm --needed

echo [+] Installing Pamixer
sudo pacman -S pamixer --noconfirm --needed

echo [+] Installing udiskie
sudo pacman -S udiskie --noconfirm --needed

echo [+] Installing Necessary Packages for i3blocks
sudo pacman -S sysstat acpi --noconfirm --needed

echo [+] Making a backup from previous i3 config if exists
[ -d ~/.config/i3 ] && sudo mv ~/.config/i3 ~/.config/i3.$(date +%s).bak

echo [+] Copying i3 Config
sudo cp ../.config/i3 ~/.config -r

echo [+] Making a backup from previous i3blocks battery script if exists
[ -f /usr/lib/i3blocks/battery ] && sudo mv /usr/lib/i3blocks/battery /usr/lib/i3blocks/battery.$(date +%s).bak

echo [+] Copying i3blocks battery script
sudo cp ./battery /usr/lib/i3blocks

echo [+] Making a backup from previous i3blocks config if exists
[ -d ~/.config/i3blocks ] && mv ~/.config/i3blocks ~/.config/i3blocks.$(date +%s).bak

echo [+] Copying i3blocks Config
sudo cp ../.config/i3blocks ~/.config -r
