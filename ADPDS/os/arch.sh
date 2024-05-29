#!/bin/bash
# ARCH
# NERD FONTS ARE RECOMMENDED
# Color definitions (optional)
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
reset='\033[0m'

# Function to display the main menu
function main_menu() {
  clear
  echo -e "${yellow}Would You like to install Additional Software: ${reset}"
  echo "---------------"
  echo "1) Yes"
  echo ""
  echo "2) No"
  echo ""
  echo "---------------"
  echo -e "${yellow}Or another option ${reset}"
  echo "---------------"
  echo ""
  echo "3) Exit"
  echo ""
  echo "---------------"
  echo ""
  echo -n "Enter your choice: "
  read choice
  case $choice in
    1) install_software ;;
    2) exit 0 ;;
    3) exit 0 ;;
    *) echo -e "${red}Invalid choice!${reset}"; sleep 3.5; main_menu ;;
  esac
}

# Function for installing Software
function install_software() {
  echo -e "${yellow}Updating Software and Repos...${reset}"
  sudo pacman -Syyu
  echo -e "${yellow}Now installing packages!${reset}"
  sudo pacman -S emacs fish eza doas dash pcmanfm htop zsh alacritty tmux git steam flatpak mpv unzip rust rust-analyzer blueman neovim python3 kitty qbittorrent bluez bluez-utils base-devel man-db ttf-font-awesome pyright noto-fonts-emoji hyfetch || echo -e "${red}This script only supports Arch-based Distros${reset}"; sleep 3.5; exit 1
  echo -e "${green}Done installing software!${reset}"
  echo -e "${yellow}Now installing AUR packages!${reset}"
  git clone https://aur.archlinux.org/paru.git && cd paru && makepkg -si && cd ..
  git clone https://aur.archlinux.org/brave-bin.git && cd brave-bin && makepkg -si && cd ..
  git clone https://aur.archlinux.org/nerd-fonts-git.git && cd nerd-fonts-git && makepkg -si && cd ..
  git clone https://aur.archlinux.org/rofi-wifi-menu-git.git && cd rofi-wifi-menu-git && makepkg -si && cd ..
  git clone https://aur.archlinux.org/shell-color-scripts.git && cd shell-color-scripts && makepkg -si && cd ..
  git clone https://github.com/redkittty/st-envixty.git && cd st-envixty && makepkg -si && cd ,,
  echo -e "${green}Done installing AUR Packages!${reset}"
  echo -e "${yellow}Now tweaking the system${reset}"
  # Dash Setup
  mkdir ~/bin && sudo mv /bin/sh ~/bin/sh.bak && sudo ln -s /usr/bin/dash /bin/sh

  # DOOM EMACS Setup
  git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs

  # Fish Setup
  chsh -s /bin/fish

  # Dash-bin/sh hook
  cd ../.. && sudo cp root/usr/share/libalpm/hooks/dash-binsh.hook /usr/share/libalpm/hooks && cd ADPDS/os

  # Plugin Setup
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.config/zsh/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/zsh/plugins/zsh-syntax-highlighting/

  # Bluetooth Setup
  sudo systemctl start bluetooth.service
  sudo systemctl enable bluetooth.service
  echo -e "${green}Tweaks done, Now tweak based on WM!${reset}"; sleep 3.5; chmod+X archwm.sh; source archwm.sh
}

# Call the main menu only once
main_menu
