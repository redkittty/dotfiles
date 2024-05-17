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
  echo -e "${yellow}Which WM/DE would you like: ${reset}"
  echo "---------------"
  echo "1) AwesomeWM"
  echo ""
  echo "2) Hyprland"
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
    1) awesomewm ;;
    2) hyprland ;;
    3) exit 0 ;;
    *) echo -e "${red}Invalid choice!${reset}"; sleep 3.5; main_menu ;;
  esac
}

# Function for AwesomeWM
function awesomewm() {
  echo -e "${yellow}Installing AwesomeWM and related software...${reset}"
  sudo pacman -S awesome rofi rofi-emoji rofi-calc flameshot conky
  echo -e "${green}Done installing Awesomewm!${reset}"; sleep 3.5; chmod +x dotfiles.sh; source dotfiles.sh
}

# Function for Hyprland
function hyprland() {
    echo -e "${yellow}Installing Hyprland and related software...${reset}"
    sudo pacman -S hyprland hyprpaper waybar wl-clipboard
    git clone https://aur.archlinux.org/hyprpicker-git.git && cd hyprpicker-git && makepkg -si && cd ..
    echo -e "${green}Done installing Hyprland!${reset}"; sleep 3.5; chmod +x dotfiles.sh; source dotfiles.sh
}

# Call the main menu only once
main_menu
