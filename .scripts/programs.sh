#!/bin/bash
# Distro selection prompt
echo "Would you like to install Additional Software: "
options=("Yes" "No")
select choice in "${options[@]}"; do
  case $choice in
    "Yes")
      CHOICE="YES"  # Assuming Manjaro uses Arch package manager (pacman)
      sudo pacman -Syy doas dash pcmanfm htop zsh git steam mpv rust rust-analyzer neovim python3 kitty qbittorrent firefox bluez bluez-utils base-devel man-db ttf-font-awesome noto-fonts-emoji hyfetch

      # Dash Setup
      mkdir ~/bin && sudo mv /bin/sh ~/bin/sh.bak && sudo ln -s /usr/bin/dash /bin/sh

      # ZSH Setup
      chsh -s /bin/zsh
      # Plugin Setup
      git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
      git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting/

      # Bluetooth Setup
      sudo systemctl start bluetooth.service
      sudo systemctl enable bluetooth.service

      # Sources ArchWM/.sh
      chmod +x ./archwm.sh
      source ./archwm.sh
      ;;
    "No")
      chmod +x ./gitsetup.sh
      source ./gitsetup.sh
      ;;
    *)
      echo "Invalid choice."
      ;;
  esac
done
