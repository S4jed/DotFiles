#!/bin/bash

echo [+] Installing ZSH
sudo pacman -S zsh --noconfirm --needed

echo [+] Installing Oh-My-ZSH
trizen -S oh-my-zsh-git --noconfirm --needed

echo [+] Copying theme to ZSH\'s custom themes directory
sudo cp ../.oh-my-zsh/custom/themes $ZSH_CUSTOM/ -r

echo [+] Cloning zsh-completions to ZSH\'s plugins directory
[ -d $ZSH/plugins/zsh-completions ] || sudo git clone https://github.com/zsh-users/zsh-completions.git $ZSH/plugins/zsh-completions

echo [+] Cloning zsh-autosuggestions to ZSH\'s plugins directory
[ -d $ZSH/plugins/zsh-autosuggestions ] || sudo git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH/plugins/zsh-autosuggestions

echo [+] Making a backup from previous ZSH resource if exists
[ -f ~/.zshrc ] && mv ~/.zshrc ~/.zshrc.$(date +%s).bak

echo [+] Copying zsh resource to home directory
cp ../.zshrc ~
