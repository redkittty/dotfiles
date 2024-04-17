# Made by Envixty (redkittty on Github)
# This is my .zshrc
# For the Rust Shortcuts, Modify the path for your own rust folder

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
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
# Ls Colors
alias ls="ls -lAh --color=auto"

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
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
