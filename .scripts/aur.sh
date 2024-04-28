#!/bin/bash
# AUR Helper/Program Install Script
PS3="Select Which AUR Helper to install: "
options=("Yay" "Paru" "None")
select aur in "${options[@]}"; do
	case $aur in
		"Yay")
			aur="YAY"
			git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
			break
			;;
		"Paru")
			aur="PARU"
			git clone https://aur.archlinux.org/paru.git && cd paru && makepkg -si
			break
			;;
		"None")
			exit 0
			;;
		*)
			echo "Invalid choice."
			::
	esac
done

git clone https://aur.archlinux.org/nerd-fonts-git.git && cd nerd-fonts-git && makepkg -si && cd ..
git clone https://github.com/redkittty/shell-color-scripts.git && cd shell-color-scripts && makepkg -si && cd ..
chmod +x ./gitsetup.sh
source ./gitsetup.sh
