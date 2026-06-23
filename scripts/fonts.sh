#!/usr/bin/env bash
source "$(dirname "$0")/utils.sh"

FONT_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONT_DIR"

# ── JetBrainsMono Nerd Font (closest free substitute for SF Mono) ──────────────
JBMONO_VERSION="3.2.1"
JBMONO_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v${JBMONO_VERSION}/JetBrainsMono.zip"
JBMONO_ZIP="/tmp/JetBrainsMono.zip"

if fc-list | grep -qi "JetBrainsMono Nerd"; then
    ok "JetBrainsMono Nerd Font already installed"
else
    step "Downloading JetBrainsMono Nerd Font v${JBMONO_VERSION}..."
    wget -q --show-progress "$JBMONO_URL" -O "$JBMONO_ZIP"
    unzip -oq "$JBMONO_ZIP" -d "$FONT_DIR/JetBrainsMonoNF"
    ok "Extracted JetBrainsMono Nerd Font"
fi

# ── SF Pro (macOS system font — legal if already licensed) ────────────────────
# We ship a note instead of redistributing Apple's font.
SF_NOTE="$DOTFILES_DIR/fonts/SF_FONT_NOTE.md"
if [[ ! -f "$SF_NOTE" ]]; then
    cat > "$SF_NOTE" <<'EOF'
# SF Pro / SF Mono

Apple's San Francisco fonts can be downloaded legally from:
  https://developer.apple.com/fonts/

After downloading, copy the .otf files here and re-run fonts.sh.
They will be installed into ~/.local/share/fonts/SFPro/

The GTK and Alacritty configs in this repo are already pre-configured
to use SF Pro when present, falling back to JetBrainsMono Nerd Font.
EOF
fi

# Install SF Pro if the user already placed fonts in dotfiles/fonts/
if ls "$DOTFILES_DIR/fonts/"*.otf &>/dev/null 2>&1; then
    mkdir -p "$FONT_DIR/SFPro"
    cp "$DOTFILES_DIR/fonts/"*.otf "$FONT_DIR/SFPro/"
    ok "Installed SF Pro from dotfiles/fonts/"
else
    warn "SF Pro not found in dotfiles/fonts/ — see fonts/SF_FONT_NOTE.md"
fi

fc-cache -fv "$FONT_DIR" &>/dev/null
ok "Font cache refreshed"
