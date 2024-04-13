#!/bin/sh
# AUR Helper selection prompt
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
