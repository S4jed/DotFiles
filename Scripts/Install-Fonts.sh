#!/bin/bash

cp ../.local/share/fonts ~/.local/share -r
fc-cache -fv

echo [+] Succesfully Generated Cache for Fonts
