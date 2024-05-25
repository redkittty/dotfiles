#!/bin/fish
set -e fish_user_paths
set -U fish_user_paths $HOME/.local/bin $HOME/.config/emacs/bin /var/lib/flatpak/app $fish_user_paths

set fish_greeting                                 # Supresses fish's intro message
set TERM "xterm-256color"                         # Sets the terminal type
set EDITOR "emacsclient -nw        "              # $EDITOR use Emacs in terminal
set VISUAL "emacsclient -c -a emacs"              # $VISUAL use Emacs in GUI mode

### "nvim" as manpager ###
set -x MANPAGER "nvim +Man!"

### Vi-Keybindings ###
fish_vi_key_bindings

set fish_color_normal gray
set fish_color_autosuggestion '545454'
set fish_color_command green
set fish_color_error 'fc0000'
set fish_color_param gray

function backup --argument filename
    cp $filename $filename.bak
end

function ex
    if [ -z "$argv" ]
        # Display usage if no parameters given
        echo "Usage: ex <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
        echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
    else
        for n in $argv
            if test -f "$n"
                switch "$n"
                    case '*.cbt' '*.tar.bz2' '*.tar.gz' '*.tar.xz' '*.tbz2' '*.tgz' '*.txz' '*.tar'
                        tar xvf "$n"
                    case '*.lzma'
                        unlzma ./"$n"
                    case '*.bz2'
                        bunzip2 ./"$n"
                    case '*.cbr' '*.rar'
                        unrar x -ad ./"$n"
                    case '*.gz'
                        gunzip ./"$n"
                    case '*.cbz' '*.epub' '*.zip'
                        unzip ./"$n"
                    case '*.z'
                        uncompress ./"$n"
                    case '*.7z' '*.arj' '*.cab' '*.cb7' '*.chm' '*.deb' '*.dmg' '*.iso' '*.lzh' '*.msi' '*.pkg' '*.rpm' '*.udf' '*.wim' '*.xar'
                        7z x ./"$n"
                    case '*.xz'
                        unxz ./"$n"
                    case '*.exe'
                        cabextract ./"$n"
                    case '*.cpio'
                        cpio -id < ./"$n"
                    case '*.cba' '*.ace'
                        unace x ./"$n"
                    case '*'
                        echo "ex: '$n' - unknown archive method"
                        return 1
                end
            else
                echo "'$n' - file does not exist"
                return 1
            end
        end
    end
end

# Neofetch to Neowofetch
alias neofetch="neowofetch"

# Sudo to Doas
alias sudo="doas"

# Doas
alias doas="doas --"

# Icat
alias icat="kitten icat"

# The Terminal Rickroll
alias rr="curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash"

# ls to exa
alias ls="eza -al --color=always --group-directories-first --icons" # my preferred listing
alias la="eza -a --color=always --group-directories-first --icons"  # all files and dirs
alias ll="eza -l --color=always --group-directories-first --icons"  # long format
alias lt="eza -aT --color=always --group-directories-first --icons" # tree listing
alias l1="eza -al --color=always --group-directories-first --icons ../" # ls on the PARENT directory
alias l2="eza -al --color=always --group-directories-first --icons ../../" # ls on directory 2 levels up
alias l3="eza -al --color=always --group-directories-first --icons ../../../" # ls on directory 3 levels up
alias l4="eza -al --color=always --group-directories-first --icons ../../../../" # ls on directory 4 levels up
alias l5="eza -al --color=always --group-directories-first --icons ../../../../../" # ls on directory 5 levels up
alias l6="eza -al --color=always --group-directories-first --icons ../../../../../../" # ls on directory 6 levels up
alias l7="eza -al --color=always --group-directories-first --icons ../../../../../../../" # ls on directory 7 levels up
alias l8="eza -al --color=always --group-directories-first --icons ../../../../../../../../" # ls on directory 8 levels up
alias l9="eza -al --color=always --group-directories-first --icons ../../../../../../../../../" # ls on directory 9 levels up

# E and F grep aliases
alias egrep="grep -E"
alias fgrep="grep -F"

# Interactive cp command
# Asks to overwrite
alias cp="cp -i"

# Parent Directory alias
alias 1.="cd .."
alias 2.="cd ../.."
alias 3.="cd ../../.."
alias 4.="cd ../../../.."
alias 5.="cd ../../../../.."
alias 6.="cd ../../../../../.."
alias 7.="cd ../../../../../../.."
alias 8.="cd ../../../../../../../.."
alias 9.="cd ../../../../../../../../.."

# Home Folder alias
alias c~="cd ~"

# Previous Directory
alias c-="cd -"

alias pacsyu="doas pacman -Syyu"
alias pacs="doas pacman -S"
alias pacsy="doas pacman -Syy"
alias pacrem="doas pacman -R"
alias pacrems="doas pacman -Rs"
alias pacun="doas rm /var/lib/pacman/db.lck"

alias parusyu="paru -Sua --noconfirm"
alias parus="paru -S"
alias yays="yay -S"
alias yaysyu="yay -Syu"

alias vi="nvim"
alias vim="nvim"

alias em="emacs -nw"

alias rs="cd ~/Documents/Code/Rust"
alias co="cd ~/Documents/Code"

alias rbr="cargo build --release"
alias rbd="cargo build"
alias rcr="cargo run"
alias rpr="cd target/release"
alias rpd="cd target/debug"

colorscript -r

starship init fish | source
