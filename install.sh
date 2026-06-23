#!/usr/bin/env bash
# =============================================================================
# dotfiles/install.sh — macOS-like environment on Lubuntu
# =============================================================================
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$DOTFILES_DIR/scripts/utils.sh"

# ─── Steps ────────────────────────────────────────────────────────────────────
step "1/8  Installing system packages..."
bash "$DOTFILES_DIR/scripts/packages.sh"

step "2/8  Installing fonts (SF Mono / JetBrains Mono Nerd)..."
bash "$DOTFILES_DIR/scripts/fonts.sh"

step "3/8  Symlinking config files..."
bash "$DOTFILES_DIR/scripts/symlinks.sh"

step "4/8  Setting up Zsh + Oh-My-Zsh..."
bash "$DOTFILES_DIR/scripts/zsh.sh"

step "5/8  Applying macOS color theme (GTK + Qt)..."
bash "$DOTFILES_DIR/scripts/theme.sh"

step "6/8  Configuring Alacritty terminal..."
bash "$DOTFILES_DIR/scripts/alacritty_setup.sh"

step "7/8  Setting up Neofetch..."
bash "$DOTFILES_DIR/scripts/neofetch_setup.sh"

step "8/8  Final touches (aliases, paths, env)..."
bash "$DOTFILES_DIR/scripts/finalize.sh"

ok "All done! Please log out and back in (or run: exec zsh)"
