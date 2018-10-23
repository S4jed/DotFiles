#!/bin/sh

# Colors
CYAN=`tput setaf 6`
BOLD=`tput bold`
RESET=`tput sgr0`

echo ${BOLD}${CYAN}[+] Installing ZSH${RESET}
sudo pacman -S zsh --noconfirm --needed

echo ${BOLD}${CYAN}[+] Installing Oh-My-ZSH${RESET}
trizen -S oh-my-zsh-git --noconfirm --needed

echo ${BOLD}${CYAN}[+] Copying theme to ZSH\'s custom themes directory${RESET}
sudo cp ../.oh-my-zsh/custom/themes $ZSH_CUSTOM/ -r

echo ${BOLD}${CYAN}[+] Cloning zsh-completions to ZSH\'s plugins directory${RESET}
[ -d $ZSH/plugins/zsh-completions ] || sudo git clone https://github.com/zsh-users/zsh-completions.git $ZSH/plugins/zsh-completions

echo ${BOLD}${CYAN}[+] Cloning zsh-autosuggestions to ZSH\'s plugins directory${RESET}
[ -d $ZSH/plugins/zsh-autosuggestions ] || sudo git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH/plugins/zsh-autosuggestions

echo ${BOLD}${CYAN}[+] Making a backup from previous ZSH resource if exists${RESET}
[ -f ~/.zshrc ] && mv ~/.zshrc ~/.zshrc.$(date +%s).bak

echo ${BOLD}${CYAN}[+] Copying zsh resource to home directory${RESET}
cp ../.zshrc ~
