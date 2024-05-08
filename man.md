# Manual for my Dotfiles

![Screenshot of my dotfiles](https://github.com/redkittty/dotfiles/blob/main/.screenshots/dotfiles1.png)

# Prerequisites

1. You need Arch Linux to use these dotfiles

2. These dotfiles, while having a hyprland config, The wm being updated in this repo is AwesomeWM

# Starting up my dotfiles

After you git clone my dotfiles, you will want to cd into the dotfiles directory and then run this:

```zsh
bash bootstrap.sh
```


What this script does is automate installing packages and setting up the system so you can do something else

This script after the initial copying of dotfiles sources other dotfiles in the .scripts directory

# AwesomeWM

After you applyied my dotfiles, you want to restart AwesomeWM by doing

SUPER + CTRL + R

Here are some of the changes I made to my config:

1. I have removed titlebars from the config

2. I added the Rofi run launcher

3. I added a calendar widget

4. SUPER + B = Launches Firefox

5. SUPER + G = Launches Steam

6. SUPER + E = Launches Emoji Picker (Rofi)

7. SUPER + = = Launches Calculator (Rofi)

8. SUPER + P = Launches Power Menu Script (Rofi)

9. SUPER + W = Launches Wifi-Menu (Rofi)

10. SUPER + TAB = Launches Window List Menu (Rofi)

11. Clock Displays AM/PM instead of 24-hour

12. Default layout is set to tiling instead of floating

# ZSH

After you apply my dotfiles, log out and back in again

Here are some changes I made to my config:

1. Custom Prompt

2. ls = eza (more modern ls)

3. sudo = doas (less bloated way of running things as root)

4. Added several Pacman aliases:

    pacsyu="doas pacman -Syyu"

    pacs="doas pacman -S"

    pacsy="doas pacman -Syy"

    pacrem="doas pacman -R"

5. Added AUR Helper Aliases:

    parsyu="paru -Sua --noconfirm"

    yaysyu="yay -Syu"

6. Added ex function to extract files from an archival file

7. egrep = grep -E and fgrep = grep -F

8. ~ = cd ~ (goes to home folder)

9. c- = cd - (goes to previous directory)

10. <1-9>. = cd .. (goes to parent and subsequent directories

11. vi and vim = nvim (alias to use neovim)

12. icat = kitten icat (runs the kitten in the kitty terminal called icat which allows you to see images in the terminal)

13. Various Rust related Aliases:

    rbr="cargo build --release"

    rbd="cargo build"

    rcr="cargo run"

    rpr="cd target/release"

    rpd="cd target/debug"

14. Added zsh-syntax-highlighting and zsh-autosuggestions

15. Added several Keybindings:

    Ctrl+Backspace (Deletes previous word

    Shift+Tab (Undo's a change)

    Ctrl+Arrows (Moves between Words)

    HOME (Moves to beginning of line)

    END (Moves to end of line)

16. Made it so that a random colorscript is used on shell startup

17. Also made ~/.local/bin the PATH as well as the default

18. ~/.zshrc is stored inside of ~/.config/zsh instead of in the home directory

