#!/usr/bin/env bash
source "$(dirname "$0")/utils.sh"

THEMES_DIR="$HOME/.themes"
ICONS_DIR="$HOME/.local/share/icons"
mkdir -p "$THEMES_DIR" "$ICONS_DIR"

# ── WhiteSur GTK theme (macOS Big Sur look) ───────────────────────────────────
WHITESUR_DIR="/tmp/WhiteSur-gtk-theme"
if [[ -d "$THEMES_DIR/WhiteSur-Light" ]]; then
    ok "WhiteSur GTK theme already installed"
else
    step "Cloning WhiteSur GTK theme..."
    git clone --depth=1 https://github.com/vinceliuice/WhiteSur-gtk-theme.git "$WHITESUR_DIR"
    cd "$WHITESUR_DIR"
    # Install Light and Dark variants, with macOS-style tweaks
    ./install.sh \
        --dest "$THEMES_DIR" \
        --color Light Dark \
        --nautilus-style mojave \
        --background monterey
    ok "WhiteSur GTK theme installed"
fi

# ── WhiteSur icon theme ───────────────────────────────────────────────────────
WHITESUR_ICONS="/tmp/WhiteSur-icon-theme"
if [[ -d "$ICONS_DIR/WhiteSur" ]]; then
    ok "WhiteSur icon theme already installed"
else
    step "Cloning WhiteSur icon theme..."
    git clone --depth=1 https://github.com/vinceliuice/WhiteSur-icon-theme.git "$WHITESUR_ICONS"
    cd "$WHITESUR_ICONS"
    ./install.sh --dest "$ICONS_DIR"
    ok "WhiteSur icon theme installed"
fi

# ── Apply via xfconf (LXDE/XFCE-compatible) ───────────────────────────────────
if command -v xfconf-query &>/dev/null; then
    xfconf-query -c xsettings -p /Net/ThemeName      -s "WhiteSur-Light" 2>/dev/null || true
    xfconf-query -c xsettings -p /Net/IconThemeName  -s "WhiteSur"        2>/dev/null || true
    ok "Applied theme via xfconf"
fi

# ── Write GTK 2 settings ──────────────────────────────────────────────────────
cat > "$HOME/.gtkrc-2.0" <<'EOF'
gtk-theme-name="WhiteSur-Light"
gtk-icon-theme-name="WhiteSur"
gtk-font-name="SF Pro Display 11"
gtk-cursor-theme-size=0
gtk-toolbar-style=GTK_TOOLBAR_ICONS
gtk-toolbar-icon-size=GTK_ICON_SIZE_LARGE_TOOLBAR
gtk-button-images=0
gtk-menu-images=0
gtk-enable-event-sounds=1
gtk-enable-input-feedback-sounds=0
gtk-xft-antialias=1
gtk-xft-hinting=1
gtk-xft-hintstyle="hintfull"
gtk-xft-rgba="rgb"
EOF
ok "GTK2 settings written"

# ── Write GTK 3 settings ──────────────────────────────────────────────────────
mkdir -p "$HOME/.config/gtk-3.0"
cat > "$HOME/.config/gtk-3.0/settings.ini" <<'EOF'
[Settings]
gtk-theme-name=WhiteSur-Light
gtk-icon-theme-name=WhiteSur
gtk-font-name=SF Pro Display 11
gtk-cursor-theme-name=macOS
gtk-cursor-theme-size=24
gtk-toolbar-style=GTK_TOOLBAR_ICONS
gtk-toolbar-icon-size=GTK_ICON_SIZE_LARGE_TOOLBAR
gtk-button-images=0
gtk-menu-images=0
gtk-enable-event-sounds=1
gtk-enable-input-feedback-sounds=0
gtk-xft-antialias=1
gtk-xft-hinting=1
gtk-xft-hintstyle=hintfull
gtk-xft-rgba=rgb
gtk-application-prefer-dark-theme=0
EOF
ok "GTK3 settings written"

# ── macOS cursor theme ────────────────────────────────────────────────────────
CURSOR_DIR="/tmp/macOS-cursors"
if [[ -d "$ICONS_DIR/macOS" ]]; then
    ok "macOS cursor theme already installed"
else
    git clone --depth=1 https://github.com/ful1e5/apple_cursor.git "$CURSOR_DIR" 2>/dev/null || \
        warn "Could not clone cursor theme — install manually from https://github.com/ful1e5/apple_cursor"
    if [[ -d "$CURSOR_DIR/dist" ]]; then
        cp -r "$CURSOR_DIR/dist/macOS" "$ICONS_DIR/"
        ok "macOS cursor theme installed"
    fi
fi
