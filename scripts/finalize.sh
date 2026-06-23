#!/usr/bin/env bash
source "$(dirname "$0")/utils.sh"

# ── Picom (compositor) autostart ──────────────────────────────────────────────
AUTOSTART="$HOME/.config/lxsession/Lubuntu/autostart"
mkdir -p "$(dirname "$AUTOSTART")"
touch "$AUTOSTART"
if ! grep -q "picom" "$AUTOSTART"; then
    echo "@picom --config $HOME/.config/picom.conf -b" >> "$AUTOSTART"
    ok "Picom added to autostart"
fi
link "$DOTFILES_DIR/config/picom.conf" "$HOME/.config/picom.conf"

# ── Make scripts executable ───────────────────────────────────────────────────
chmod +x "$DOTFILES_DIR/bin/"* 2>/dev/null || true

ok "Finalize complete"
