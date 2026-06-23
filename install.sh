#!/bin/bash

set -e

echo "Updating packages..."

sudo apt update

sudo apt install -y \
git \
curl \
stow \
zsh \
kitty \
neovim \
python3 \
python3-pip \
g++ \
clangd \
unzip

echo "Installing Starship..."

curl -sS https://starship.rs/install.sh | sh -s -- -y

echo "Installing Nerd Font..."

FONT_DIR="$HOME/.local/share/fonts/JetBrainsMono"
ZIP_FILE="/tmp/JetBrainsMono.zip"

if [ -d "$FONT_DIR" ]; then
    echo "JetBrainsMono already installed, skipping..."
else
    echo "Downloading JetBrainsMono..."

    mkdir -p "$FONT_DIR"

    wget -q https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip -O "$ZIP_FILE"

    unzip -o "$ZIP_FILE" -d "$FONT_DIR"

    rm -f "$ZIP_FILE"

    echo "Updating font cache..."
    fc-cache -fv
fi

echo "Installing pynvim..."

sudo apt install -y python3-pynvim

echo "Applying dotfiles..."

cd "$(dirname "$0")"

stow -t ~ -v nvim
stow -t ~ -v zsh
stow -t ~ -v kitty
stow -t ~ -v starship

echo "Changing shell..."

chsh -s $(which zsh)

echo "Done."
echo "Restart terminal."
