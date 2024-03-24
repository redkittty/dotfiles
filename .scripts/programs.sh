#!/bin/sh
# Distro selection prompt
PS3="Select your Linux distribution: "
options=("Debian/Ubuntu" "Fedora" "Arch/Manjaro" "None")
select distro in "${options[@]}"; do
  case $distro in
    "Debian/Ubuntu")
      DISTRO="DEBIAN_UBUNTU"
      sudo apt update -y && sudo apt install -y zsh git steam vlc rust rust-analyzer ninja-build gettext cmake unzip curl build-essential python3 alacritty
      # Neovim
      git clone https://github.com/neovim/neovim && cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo && sudo make install 
      chsh -s /bin/zsh
      break
      ;;
    "Fedora")
      DISTRO="FEDORA"
      sudo dnf update -y && sudo dnf install -y zsh git steam vlc rust rust-analyzer neovim python3 alacritty
      chsh -s /bin/zsh
      break
      ;;
    "Arch/Manjaro")
      DISTRO="ARCH"  # Assuming Manjaro uses Arch package manager (pacman)
      sudo pacman -Syy zsh git steam vlc rust rust-analyzer neovim python3 alacritty
      chsh -s /bin/zsh
      break
      ;;
    "None")
      exit 0
      ;;
    *)
      echo "Invalid choice."
      ;;
  esac
done
