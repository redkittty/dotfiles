# envixty-dotfiles

Download:

1. Do Git clone https://github.com/redkittty/envixty-dotfiles.git

2. Make bootstrap.sh executable
  
3. Run bootstrap.sh 

3. (Optional) Modify the Rust Alias to match your Rust Project Directory

4. Your Done (As when the .zshrc is run, the plugins will automatically install)


My dotfiles

.zshrc:

Plugins:
- [ZSH Syntax Highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [ZSH Auto-Suggestions](https://github.com/zsh-users/zsh-autosuggestions)

Commands:
- rs: Rust Folder
- rbr: cargo build --release
- rbd: cargo build
- rcr: cargo run
- rpr: cd target/release
- rpd: cd target/debug
- vi: nvim
- vim: nvim

Shortcuts:
- Ctrl+Backspace: Deletes word cursor is on
- Shift+Tab: Undo
- HOME: Beginning of Line
- END: End of Line
- Ctrl+Arroews: Go back or forward a word

For the rust aliases, you will have to manually modify it to go to your home directory.

This is tested on gnome-terminal

Dependencies:
- ZSH v4.3.11 or later (only tested on ZSH 5.9)
- Git
