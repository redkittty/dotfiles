# Made by Envixty (redkittty on Github)
# This is my .zshrc
# For the Rust Shortcuts, Modify the path for your own rust folder

# History
HISTFILE=~/.zsh_history
HISTSIZE=3000
SAVEHIST=3000
setopt appendhistory

# Use my zsh prompt
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# Keybinds
# Delete previous word with ctrl+backspace
bindkey '^H' backward-kill-word

# Undo with Shift+Tab
bindkey '^[[Z' undo

# Beginning of line with HOME
bindkey '^[[H' beginning-of-line

# End of line with END
bindkey '^[[F' end-of-line

# Navigate Words with Ctrl+Arrows
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

# Aliases
# Neofetch to Neowofetch
alias neofetch="neowofetch"
# Sudo to Doas
alias sudo="doas"

# Doas
alias doas="doas --"

# Pacman Aliases
alias pacsyu="doas pacman -Syyu"
alias pacrem="doas pacman -R"
alias parsya="paru -Sua --noconfirm"
alias yaysyu="yay -Syu"

# Ls Colors
alias ls="ls -lAh --color=auto"

# Kitty kitten aliases
alias icat="kitten icat"

# Htop alias
alias top="htop"

# ARCHIVE EXTRACTION
# usage: ex <file>
function ex {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: ex <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
 else
    for n in "$@"
    do
      if [ -f "$n" ] ; then
          case "${n%,}" in
            *.cbt|*.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar)
                         tar xvf "$n"       ;;
            *.lzma)      unlzma ./"$n"      ;;
            *.bz2)       bunzip2 ./"$n"     ;;
            *.cbr|*.rar)       unrar x -ad ./"$n" ;;
            *.gz)        gunzip ./"$n"      ;;
            *.cbz|*.epub|*.zip)       unzip ./"$n"       ;;
            *.z)         uncompress ./"$n"  ;;
            *.7z|*.arj|*.cab|*.cb7|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.pkg|*.rpm|*.udf|*.wim|*.xar)
                         7z x ./"$n"        ;;
            *.xz)        unxz ./"$n"        ;;
            *.exe)       cabextract ./"$n"  ;;
            *.cpio)      cpio -id < ./"$n"  ;;
            *.cba|*.ace)      unace x ./"$n"      ;;
            *)
                         echo "ex: '$n' - unknown archive method"
                         return 1
                         ;;
          esac
      else
          echo "'$n' - file does not exist"
          return 1
      fi
    done
fi
}

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
alias ~="cd ~"

# Previous Directory
alias c-="cd -"

# Rust Folder
alias rs="cd ~/Documents/Code/Rust"

# Code Folder
alias co="cd ~/Documents/Code"

# Neovim
alias vi="nvim"
alias vim="nvim"

# Rust Build
alias rbr="cargo build --release"
alias rbd="cargo build"
alias rcr="cargo run"
alias rpr="cd target/release"
alias rpd="cd target/debug"

# Plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting/
clear
colorscript -r
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
