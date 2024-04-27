#!/bin/bash

# Dotfiles directory (current directory)
dotfiles_dir="./"

# Blacklist of files and directories to exclude from copying
blacklist=(
    .git
    .gitignore
    .DS_Store
    LICENSE
    README.md
    CONFIGS.md
    bootstrap.sh
    .scripts
    root
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

# Copies Scripts over to the bin directory
chmod +x root/usr/local/bin/powermenu.sh && sudo cp -r root/usr/local/bin/powermenu.sh /usr/local/bin
# Add more scripts here as needed

echo "Copy process complete."
echo "Now installing Programs"
cd .scripts
chmod +x ./programs.sh
source ./programs.sh
