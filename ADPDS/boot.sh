#!/bin/bash
# ADPDS (AUTOMATED DOTFILES AND PROGRAMS DEPLOYMENT SCRIPT)
# NERD FONTS ARE RECOMMENDED
# Color definitions (optional)
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
reset='\033[0m'

# Function to display the main menu
function main_menu() {
  clear
  echo -e "${yellow}Welcome to the ADPDS (Automated Dotfiles and Programs Deployment Script)!${reset}"
  echo -e "${yellow}Select Operating System! ${reset}"
  echo "---------------"
  echo "1)   Arch Linux"
  echo ""
  #echo "2)   Debian"
  #echo ""
  echo "---------------"
  echo -e "${yellow}Or another option ${reset}"
  echo "---------------"
  echo ""
  echo "3) Backup Dotfiles (~)"
  echo ""
  echo "4) Exit"
  echo ""
  echo "---------------"
  echo ""
  echo -n "Enter your choice: "
  read choice
  case $choice in
    1) chmod +x os/arch.sh && source os/arch.sh || sleep 3.5; main_menu ;;
#    2) chmod +x os/debia.sh && source debian.sh ;;  # Add this function if desired
    3) backup_dotfiles ;;
    4) exit 0 ;;
    *) echo -e "${red}Invalid choice!${reset}"; sleep 3.5; main_menu ;;
  esac
}

# Function to backup existing dotfiles (optional)
function backup_dotfiles() {
  echo -e "${yellow}Backing up existing dotfiles...${reset}"
  cp -r ~ dotfiles_backup || echo -e "${red}DOTFILES BACKUP FAILED!${reset}"; sleep 3.5; main_menu
  echo -e "${green}Backup of Home complete!${reset}"
}

# Call the main menu only once
main_menu
