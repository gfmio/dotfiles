#!/bin/bash

# pacman update && upgrade
pacman -Syu

# install pikaur
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/pikaur.git
cd pikaur
makepkg -fsri
