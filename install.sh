#!/bin/bash

packages=("git" "nvim" "zsh" "fonts" "i3" "rofi" "alacritty")

echo "Running stow commands"
for package in "${packages[@]}"; do
    echo "Managing dotfiles for $package..."
    # Example Stow commands for managing dotfiles
    # Replace <package_name> with the actual package name
    stow -v "$package"
    echo "Stow commands completed for $package."
done

# Update package lists
sudo apt update

# Install
sudo apt install curl wget git stow zsh i3-wm i3blocks rofi gcc pavucontrol alacritty -y
echo "Installed packages"

# Change the default shell to Zsh
chsh -s $(which zsh)

# Install Oh My Zsh (Optional, but highly recommended)
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Zsh set up successfully. Please restart your terminal to apply changes."


echo "All tasks completed successfully."



