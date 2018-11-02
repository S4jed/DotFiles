#!/bin/sh

# Colors
CYAN=`tput setaf 6`
BOLD=`tput bold`
RESET=`tput sgr0`

echo ${BOLD}${CYAN}[+] Changing directory to Scripts${RESET}
cd ./Scripts/

./Install-Trizen.sh
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

echo ${BOLD}${CYAN}[+] Installing CMake${RESET}
sudo pacman -S cmake --noconfirm --needed

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

I3-Backup()
{
    echo ${BOLD}${CYAN}[+] Making a backup from previous i3 config${RESET}
    mv ~/.config/i3 ~/.config/i3.$(date +%s).bak
}

[ -d ~/.config/i3 ] && I3-Backup

echo ${BOLD}${CYAN}[+] Copying i3 Config${RESET}
sudo cp ../.config/i3 ~/.config -r

BatteryScript-Backup()
{
    echo ${BOLD}${CYAN}[+] Making a backup from previous i3blocks battery script${RESET}
    mv ~/.config/i3blocks ~/.config/i3blocks.$(date +%s).bak
}

[ -f /usr/lib/i3blocks/battery ] && BatteryScript-Backup

echo ${BOLD}${CYAN}[+] Copying i3blocks battery script${RESET}
sudo cp ./battery /usr/lib/i3blocks

I3Blocks-Backup()
{
    echo ${BOLD}${CYAN}[+] Making a backup from previous i3blocks config${RESET}
    mv ~/.config/i3blocks ~/.config/i3blocks.$(date +%s).bak
}

[ -d ~/.config/i3blocks ] && I3Blocks-Backup

echo ${BOLD}${CYAN}[+] Copying i3blocks Config${RESET}
sudo cp ../.config/i3blocks ~/.config -r

Pictures-Backup()
{
    echo ${BOLD}${CYAN}[+] Making a backup from previous ~/Pictures${RESET}
    mv ~/Pictures ~/Pictures.$(date +%s).bak
}

[ -d ~/Pictures ] && Pictures-Backup

echo ${BOLD}${CYAN}[+] Copying Pictures to ~/Pictures${RESET}
sudo cp ./Pictures ~ -r
