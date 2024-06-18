# Made by Envixty (redkittty on Github)
# This is my .zshrc
# For the Rust Shortcuts, Modify the path for your own rust folder

### EXPORTS ###
# Makes PATH ~/.local/bin
export PATH="$PATH:$HOME/.local/bin:$HOME/.config/emacs/bin"

# Default Programs
export EDITOR="emacsclient -c -a 'emacs'"
export TERMINAL="kitty"
export TERM="kitty"
export BROWSER="brave"
export WM="qtile"

# ~/Cleanup
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# History
HISTFILE=~/.config/zsh/.zsh_history
HISTSIZE=3000
SAVEHIST=3000
setopt appendhistory

# Use my zsh prompt
autoload -U colors && colors
#PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

### Keybinds ###
# Delete previous word with ctrl+backspace
bindkey '^H' backward-kill-word

# Undo with Shift+Tab
bindkey '^[[Z' undo

# Beginning of line with HOME
bindkey '^[[H' beginning-of-line

# Substring History Search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# End of line with END
bindkey '^[[F' end-of-line

# Navigate Words with Ctrl+Arrows
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

### Aliases ###
### GENERAL ###
# Neofetch to Neowofetch
alias neofetch="neowofetch"

# Sudo to Doas
alias sudo="doas"

# Doas
alias doas="doas --"

# Pacman Aliases
alias pacsyu="doas pacman -Syyu"
alias pacs="doas pacman -S"
alias pacsy="doas pacman -Syy"
alias pacrem="doas pacman -R"
alias pacrems="doas pacman -Rs"

# Aur Helper Aliases
alias parusyu="paru -Sua --noconfirm"
alias parus="paru -S"
alias yays="yay -S"
alias yaysyu="yay -Syu"

# ls to exa
alias ls='eza -al --color=always --group-directories-first --icons' # my preferred listing
alias la='eza -a --color=always --group-directories-first --icons'  # all files and dirs
alias ll='eza -l --color=always --group-directories-first --icons'  # long format
alias lt='eza -aT --color=always --group-directories-first --icons' # tree listing
alias l1='eza -al --color=always --group-directories-first --icons ../' # ls on the PARENT directory
alias l2='eza -al --color=always --group-directories-first --icons ../../' # ls on directory 2 levels up
alias l3='eza -al --color=always --group-directories-first --icons ../../../' # ls on directory 3 levels up
alias l4='eza -al --color=always --group-directories-first --icons ../../../../' # ls on directory 4 levels up
alias l5='eza -al --color=always --group-directories-first --icons ../../../../../' # ls on directory 5 levels up
alias l6='eza -al --color=always --group-directories-first --icons ../../../../../../' # ls on directory 6 levels up
alias l7='eza -al --color=always --group-directories-first --icons ../../../../../../../' # ls on directory 7 levels up
alias l8='eza -al --color=always --group-directories-first --icons ../../../../../../../../' # ls on directory 8 levels up
alias l9='eza -al --color=always --group-directories-first --icons ../../../../../../../../../' # ls on directory 9 levels up

# the terminal rickroll
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'

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

# E and F grep aliases
alias egrep="grep -E"
alias fgrep="grep -F"

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

### TEXT EDITORS ###

# Neovim
alias vi="nvim"
alias vim="nvim"

# Emacs
# GUI EMACS
alias em="emacsclient -c -a 'emacs'"
# TERM Emacs
alias emt="emacs -nw"

### CODE ###

# Rust Folder
alias rs="cd ~/Documents/Code/Rust"

# Code Folder
alias co="cd ~/Documents/Code"

# Rust Build
alias rbr="cargo build --release"
alias rbd="cargo build"
alias rcr="cargo run"
alias rpr="cd target/release"
alias rpd="cd target/debug"

# Clear and Color Script
clear
colorscript -r

# Loads Plugins
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh
source ~/.config/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
eval "$(starship init zsh)"
