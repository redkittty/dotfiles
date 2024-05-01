#
# ~/.bashrc
# Made by Envixty for root shell

# Prompt
PS1='\[\e[38;5;196;1m\][\[\e[38;5;202m\]\u\[\e[38;5;70m\]@\[\e[38;5;33m\]\H\[\e[0m\] \[\e[38;5;213;1m\]\w\[\e[38;5;196m\]]\[\e[0m\]\\$ '

# Keybindings
# Delete Previous Word with ctrl+backspace
bind '"\C-H": backward-kill-word'

# Aliases
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
