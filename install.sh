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

mkdir -p ~/.fonts

cd /tmp

wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip

unzip JetBrainsMono.zip -d ~/.fonts

fc-cache -fv

echo "Installing pynvim..."

sudo apt install -y python3-pynvim

echo "Applying dotfiles..."

cd "$(dirname "$0")"

stow nvim
stow zsh
stow kitty
stow starship

echo "Changing shell..."

chsh -s $(which zsh)

echo "Done."
echo "Restart terminal."
