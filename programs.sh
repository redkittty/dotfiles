#!/bin/sh
# Distro selection prompt
PS3="Select your Linux distribution: "
options=("Debian/Ubuntu" "Fedora" "Arch/Manjaro" "None")
select distro in "${options[@]}"; do
  case $distro in
    "Debian/Ubuntu")
      DISTRO="DEBIAN_UBUNTU"
      sudo apt update -y && sudo apt install -y kitty 
      sudo apt install -y zsh 
      sudo apt install -y steam 
      sudo apt install -y vlc 
      sudo apt install -y rustc 
      sudo apt install -y ninja-build 
      sudo apt install -y gettext 
      sudo apt install -y cmake 
      sudo apt install -y unzip 
      sudo apt install -y curl 
      sudo apt install -y build-essential 
      sudo apt install -y python3 
      sudo apt install -y qbittorrent
      # Neovim
      git clone https://github.com/neovim/neovim && cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo && sudo make install 
      chsh -s /bin/zsh
      # Git login script
      chmod +x ./gitsetup.sh
      source ./gitsetup.sh
      ;;
    "Fedora")
      DISTRO="FEDORA"
      sudo dnf update -y && sudo dnf install -y kitty zsh git steam vlc rust rust-analyzer neovim python3 qbittorrent
      chsh -s /bin/zsh
      chmod +x ./gitsetup.sh
      source ./gitsetup.sh
      ;;
    "Arch/Manjaro")
      DISTRO="ARCH"  # Assuming Manjaro uses Arch package manager (pacman)
      sudo pacman -Syy pcmanfm htop zsh git steam vlc rust rust-analyzer neovim python3 kitty qbittorrent firefox bluez bluez-utils base-devel waybar hyprpaper ttf-font-awesome
      chsh -s /bin/zsh
      sudo systemctl start bluetooth.service
      sudo systemctl enable bluetooth.service
      chmod +x ./aur.sh
      source ./aur.sh
      ;;
    "None")
      exit 0
      ;;
    *)
      echo "Invalid choice."
      ;;
  esac
done
