#!/usr/bin/env bash
source "$(dirname "$0")/utils.sh"

# Config is handled via symlinks.sh — this script sets Alacritty as default terminal
if command -v alacritty &>/dev/null; then
    if command -v update-alternatives &>/dev/null; then
        sudo update-alternatives --set x-terminal-emulator "$(command -v alacritty)" 2>/dev/null || true
    fi
    # LXDE: write to lxsession autostart & openbox
    mkdir -p "$HOME/.config/lxsession/Lubuntu"
    CONF="$HOME/.config/lxsession/Lubuntu/desktop.conf"
    if [[ -f "$CONF" ]]; then
        sed -i 's|^window_manager=.*|window_manager=openbox|' "$CONF" 2>/dev/null || true
    fi
    ok "Alacritty set as default terminal"
fi
