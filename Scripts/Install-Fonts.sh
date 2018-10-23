#!/bin/sh

# Colors
CYAN=`tput setaf 6`
BOLD=`tput bold`
RESET=`tput sgr0`

cp ../.local/share/fonts ~/.local/share -r
fc-cache -fv

echo ${BOLD}${CYAN}[+] Succesfully Generated Cache for Fonts${RESET}
