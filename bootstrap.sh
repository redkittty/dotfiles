#!/bin/bash

# Dotfiles directory (current directory)
dotfiles_dir="./"

# Blacklist of files and directories to exclude from copying
blacklist=(
    .git
    .config/awesome
    .gitignore
    .DS_Store
    LICENSE
    README.md
    bootstrap.sh
    programs.sh
    aur.sh
    # Add more files and directories to exclude as needed
)

# Copy all files and directories except those in the blacklist
shopt -s dotglob # Include hidden files in the globbing
for item in "$dotfiles_dir"*; do
    # Extract basename of item
    item_basename=$(basename "$item")

    # Check if the item is not in the blacklist
    if ! [[ " ${blacklist[@]} " =~ " ${item_basename} " ]]; then
        # If it's a directory, recursively copy it
        if [ -d "$item" ]; then
            cp -r "$item" "$HOME/"
        else
            cp "$item" "$HOME/"
        fi
        echo "Copied $item_basename to $HOME/"
    else
        echo "$item_basename is in the blacklist and will not be copied."
    fi
done

echo "Copy process complete."
echo "Now installing Programs"
chmod +x ./programs.sh
source ./programs.sh
