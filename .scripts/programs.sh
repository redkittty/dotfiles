#!/bin/sh
# Distro selection prompt
echo "Would you like to install Additional Software: "
options=("Yes" "No")
select choice in "${options[@]}"; do
  case $choice in
    "Yes")
      CHOICE="YES"  # Assuming Manjaro uses Arch package manager (pacman)
      sudo pacman -Syy pcmanfm htop zsh git steam mpv rust rust-analyzer neovim python3 kitty qbittorrent firefox bluez bluez-utils base-devel man-db ttf-font-awesome noto-fonts-emoji neofetch
      chsh -s /bin/zsh
      sudo systemctl start bluetooth.service
      sudo systemctl enable bluetooth.service
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
