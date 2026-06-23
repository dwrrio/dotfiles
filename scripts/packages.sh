#!/usr/bin/env bash
source "$(dirname "$0")/utils.sh"

sudo apt-get update -qq

PACKAGES=(
    # Shell & terminal
    zsh
    alacritty
    tmux
    curl
    wget
    git

    # Nerd font deps
    fontconfig
    unzip

    # macOS-like utilities
    exa          # modern ls (alias to match macOS ls colors)
    bat          # better cat (alias as cat)
    fd-find      # fd (alias find)
    ripgrep      # rg
    fzf
    neofetch
    htop
    tree
    jq
    lf           # terminal file manager (like Finder, kind of)

    # GTK theme dependencies
    gtk2-engines-murrine
    gtk2-engines-pixbuf
    sassc
    libglib2.0-dev-bin

    # Compositor (picom — for subtle transparency like Terminal.app)
    picom
)

for pkg in "${PACKAGES[@]}"; do
    if dpkg -s "$pkg" &>/dev/null; then
        ok "$pkg already installed"
    else
        sudo apt-get install -y "$pkg" && ok "Installed $pkg"
    fi
done

# bat is installed as batcat on Ubuntu — fix alias
if command -v batcat &>/dev/null && ! command -v bat &>/dev/null; then
    sudo ln -sf "$(command -v batcat)" /usr/local/bin/bat
    ok "Aliased batcat → bat"
fi

# fd is installed as fdfind on Ubuntu
if command -v fdfind &>/dev/null && ! command -v fd &>/dev/null; then
    sudo ln -sf "$(command -v fdfind)" /usr/local/bin/fd
    ok "Aliased fdfind → fd"
fi
