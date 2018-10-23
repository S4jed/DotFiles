#!/bin/sh

# Colors
CYAN=`tput setaf 6`
BOLD=`tput bold`
RESET=`tput sgr0`

echo ${BOLD}${CYAN}[+] Installing Development Tools${RESET}
sudo pacman -S git cmake --noconfirm --needed

Trizen()
{
    echo ${BOLD}${CYAN}[+] Installing Trizen for Aur Packages${RESET}
    git clone https://aur.archlinux.org/trizen.git && cd trizen && makepkg -si --noconfirm --needed

    echo ${BOLD}${CYAN}[+] Cleaning up Trizen\'s Cloned directory${RESET}
    cd ../ && sudo rm -rf trizen
}

[ -f /usr/bin/trizen ] || Trizen

echo ${BOLD}${CYAN}[+] Making a backup from previous ~/Pictures if exists${RESET}
[ -d ~/Pictures ] && sudo mv ~/Pictures ~/Pictures.$(date +%s).bak

echo ${BOLD}${CYAN}[+] Copying Pictures to ~/Pictures${RESET}
sudo cp ./Pictures ~ -r

echo ${BOLD}${CYAN}[+] Changing directory to Scripts${RESET}
cd ./Scripts/

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

echo ${BOLD}${CYAN}[+] Installing Tor Service${RESET}
sudo pacman -S tor --noconfirm --needed

echo ${BOLD}${CYAN}[+] Adding Tor to Startup Daemon${RESET}
sudo systemctl enable tor

echo ${BOLD}${CYAN}[+] Installing Telegram Desktop${RESET}
sudo pacman -S telegram-desktop --noconfirm --needed

echo ${BOLD}${CYAN}[+] Installing Firefox${RESET}
sudo pacman -S firefox --noconfirm --needed

echo ${BOLD}${CYAN}[+] Installing Gnome Calculator${RESET}
sudo pacman -S gnome-calculator --noconfirm --needed

echo ${BOLD}${CYAN}[+] Installing Pamixer${RESET}
sudo pacman -S pamixer --noconfirm --needed

echo ${BOLD}${CYAN}[+] Installing udiskie${RESET}
sudo pacman -S udiskie --noconfirm --needed

echo ${BOLD}${CYAN}[+] Installing Necessary Packages for i3blocks${RESET}
sudo pacman -S sysstat acpi --noconfirm --needed

echo ${BOLD}${CYAN}[+] Making a backup from previous i3 config if exists${RESET}
[ -d ~/.config/i3 ] && sudo mv ~/.config/i3 ~/.config/i3.$(date +%s).bak

echo ${BOLD}${CYAN}[+] Copying i3 Config${RESET}
sudo cp ../.config/i3 ~/.config -r

echo ${BOLD}${CYAN}[+] Making a backup from previous i3blocks battery script if exists${RESET}
[ -f /usr/lib/i3blocks/battery ] && sudo mv /usr/lib/i3blocks/battery /usr/lib/i3blocks/battery.$(date +%s).bak

echo ${BOLD}${CYAN}[+] Copying i3blocks battery script${RESET}
sudo cp ./battery /usr/lib/i3blocks

echo ${BOLD}${CYAN}[+] Making a backup from previous i3blocks config if exists${RESET}
[ -d ~/.config/i3blocks ] && mv ~/.config/i3blocks ~/.config/i3blocks.$(date +%s).bak

echo ${BOLD}${CYAN}[+] Copying i3blocks Config${RESET}
sudo cp ../.config/i3blocks ~/.config -r
